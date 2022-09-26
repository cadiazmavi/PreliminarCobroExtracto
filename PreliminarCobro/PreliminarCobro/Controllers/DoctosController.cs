using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace PreliminarCobro.Controllers
{
  internal class DoctosController
  {

    /// <summary>
    /// Información de los documentos padres de un cliente.
    /// </summary>
    /// <param name="baseDatos">Base de datos que se consulta.</param>
    /// <param name="cliente">Cuenta de cliente.</param>
    /// <returns></returns>
    public async static Task LlenaInfoPadres(string baseDatos, Models.ClienteInfo cliente, string cteFinal,
                                             List<Models.DoctosPadres> listDoctosPadres,
                                             List<Models.DoctosHijos> listDoctosHijos)
    {

      List<Models.DoctosPadres> listDoctosPadresTMP = new List<Models.DoctosPadres>();
      List<SqlParameter> param = new List<SqlParameter>();
      param.Add(Global.conexionSql.NewSqlParameter("@BaseDatos", SqlDbType.VarChar, baseDatos, ParameterDirection.Input));
      param.Add(Global.conexionSql.NewSqlParameter("@Cliente", SqlDbType.VarChar, cliente.Cliente, ParameterDirection.Input));
      param.Add(Global.conexionSql.NewSqlParameter("@Opcion", SqlDbType.Int, 1, ParameterDirection.Input));
      param.Add(Global.conexionSql.NewSqlParameter("@CteFinal", SqlDbType.VarChar, cteFinal == "" || cteFinal == null ? (object)DBNull.Value : cteFinal, ParameterDirection.Input));
      DataSet ds = Global.conexionSql.GetDataSet("SpCXCPreliminarDoctos", param, false);
      DataTableCollection tbls = ds.Tables;
      if (tbls.Count == 2)
      {
        listDoctosPadresTMP.AddRange(FuncionesGlobales.GetDatosDataTable<Models.DoctosPadres>(tbls[0]));
        listDoctosHijos.AddRange(FuncionesGlobales.GetDatosDataTable<Models.DoctosHijos>(tbls[1]));

        //Llenar los saldos de los movimientos padres con la información de los hijos.
        foreach (var padre in listDoctosPadresTMP)
        {
          var hijos = listDoctosHijos.FindAll(hijo => hijo.PadreMAVI == padre.PadreMAVI && hijo.PadreIDMAVI == padre.PadreIDMAVI).OrderBy(hijo => hijo.Vencimiento).ToList();
          if (hijos != null)
          {
            //Actualiza datos del padre tomados de los hijos.
            padre.SaldoCapital = hijos.Sum(hijo => hijo.Saldo);
            padre.Moratorios = hijos.Sum(hijo => hijo.Moratorios);
            padre.SaldoVencido = hijos.FindAll(hijo => hijo.Vencimiento.Date < Global.fechaServer.Date).Sum(hijo => hijo.BonifPP) + hijos.Sum(hijo => hijo.Moratorios);
            padre.SaldoTotal = padre.SaldoCapital + padre.Moratorios;
            padre.DiasVencidos = hijos.Max(hijo => hijo.DiasVencidos);
            padre.TieneBonificacion = !cliente.SinBonifDIMA && hijos.Exists(hijo => hijo.Estatus == "PENDIENTE" && (hijo.BonifPP < hijo.Saldo || hijo.BonifCC > 0)) ? "SI" : "NO";

            //Revisa si el movimiento cuenta con un convenio LCT.
            padre.TieneLCT = "NO";
            //Traer el numero de folio para los convenios
            padre.TieneRD = 0;                   

            if (hijos.Exists(hijo => hijo.Estatus == "PENDIENTE")) padre.DiaPago = hijos.FindAll(hijo => hijo.Estatus == "PENDIENTE").Min(hijo => hijo.Vencimiento);
            decimal impHijoVenceDia = 0;
            // Para calculo de pago para estar al corriente
            var hijosProxVenc = (from item in hijos
                                 orderby item.Vencimiento, item.ID
                                 where item.Vencimiento.Date >= Global.fechaServer.Date
                                 select item).ToList();
            if (padre.Categoria == "ASOCIADOS")
            {
              // Determinar la fecha del siguiente corte en DIMAS
              DateTime fechaCorteDima = Global.fechaServer.Date;

              if (Global.fechaServer.Day <= 2)
                fechaCorteDima = new DateTime(Global.fechaServer.Year, Global.fechaServer.Month, 2);
              else if (Global.fechaServer.Day > 17)
                fechaCorteDima = new DateTime(Global.fechaServer.Year, Global.fechaServer.Month, 2).AddMonths(1);
              else
                fechaCorteDima = new DateTime(Global.fechaServer.Year, Global.fechaServer.Month, 17);

              impHijoVenceDia = hijosProxVenc.FindAll(hijo => hijo.Vencimiento.Date <= fechaCorteDima.Date).Select(hijo => hijo.BonifPP).Sum();
            }
            else //Para lo que no es DIMA es lo que vence en el mismo mes y año
              impHijoVenceDia = hijosProxVenc.FindAll(hijo => hijo.Vencimiento.Month == Global.fechaServer.Month && hijo.Vencimiento.Year == Global.fechaServer.Year).Select(hijo => hijo.BonifPP).Sum();

            padre.PagoParaEstaralCorriente = padre.SaldoVencido + impHijoVenceDia;
            if (padre.PagoParaEstaralCorriente > 0) padre.PagoParaEstaralCorriente = Math.Ceiling(padre.PagoParaEstaralCorriente) + 1;

            //Actualiza los datos del apoyo.
            var hijosApoyo = hijos.FindAll(hijo => hijo.CobroCteFinal > 0);
            if (hijosApoyo != null && hijosApoyo.Count > 0)
            {
              padre.SaldoApoyo = hijosApoyo.Sum(hijo => hijo.SaldoApoyoDima);
              padre.ImpApoyo = hijosApoyo.Sum(hijo => hijo.ImpApoyoDima);
              padre.CheckApoyo = hijosApoyo.Min(hijo => hijo.CobroCteFinal);
            }
          }

          //Validar la pestaña en la que deben aparecer
          padre.IdTagPestaña = new List<int>();
          if (padre.Categoria == "CREDITO MENUDEO" || padre.Categoria == "CONTADO")
            padre.IdTagPestaña.Add(1);
          else if (padre.Categoria == "ASOCIADOS")
          {
            if (padre.SaldoTotal > 0)
              padre.IdTagPestaña.Add(2);

            if (padre.CheckApoyo > 0 &&
                  (padre.RfcCteFinal != null && padre.RfcCteFinal.Length > 10 ? padre.RfcCteFinal.Substring(0, 10) : padre.RfcCteFinal) != (cliente.Rfc != null && cliente.Rfc.Length > 10 ? cliente.Rfc.Substring(0, 10) : cliente.Rfc) &&
                  (padre.PadreMAVI == "Factura" || padre.PadreMAVI == "Credilana"))
              padre.IdTagPestaña.Add(5);
          }
          else if (padre.Categoria == "INSTITUCIONES")
            padre.IdTagPestaña.Add(3);
          else if (padre.Categoria == "MAYOREO")
            padre.IdTagPestaña.Add(4);
          else if (padre.Categoria == "DINERALIA")
            padre.IdTagPestaña.Add(6);
          else if (padre.Categoria == "CREDILANA EMPRESARIO")
            padre.IdTagPestaña.Add(7);
        }
        listDoctosPadres.AddRange((from item in listDoctosPadresTMP orderby item.NomCteFinal, item.DiaPago select item).ToList());
      }
    }

  }
}
