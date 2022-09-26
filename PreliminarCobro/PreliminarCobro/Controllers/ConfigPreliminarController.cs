using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PreliminarCobro.Controllers
{
    internal class ConfigPreliminarController
    {

        public static Models.ConfigPreliminar GetConfig()
        {
            Models.ConfigPreliminar configPreliminar = new Models.ConfigPreliminar();

            ActivoLimiteCreditoCobro(configPreliminar);
            TablaStCfgPreliminarCobro(configPreliminar);

            return configPreliminar;
        }

        private static void ActivoLimiteCreditoCobro(Models.ConfigPreliminar configPreliminar)
        {
            bool result = false;
            using (DataTable tbl = Global.conexionSql.GetDataTable("SELECT ISNULL(Valor, 0) Valor FROM TablaStD WITH(NOLOCK) WHERE TablaSt = 'LIMITE CREDITO COBRO'", null, false))
            {
                if (tbl.Rows.Count > 0)
                    result = Convert.ToInt32(tbl.Rows[0]["Valor"]) > 0;
            }
            configPreliminar.LimiteCreditoCobro = result;
        }

        private static void TablaStCfgPreliminarCobro(Models.ConfigPreliminar configPreliminar)
        {
            DataTable tbl = Global.conexionSql.GetDataTable("SELECT TablaSt, Nombre, Valor FROM TablaStD WHERE TablaSt = 'CFG PRELIMINAR COBRO'", null, false);
            if (tbl != null && tbl.Rows.Count > 0)
            {
                var tablaSt = (from DataRow row in tbl.Rows
                               select new
                               {
                                   Nombre = row["Nombre"].ToString().Trim(),
                                   Valor = row["Valor"].ToString().Trim()
                               }).ToList();
                configPreliminar.LiquidaCompleto = tablaSt.Exists(item => item.Nombre == "LIQUIDA COMPLETO" && item.Valor == "1");
                configPreliminar.ValidaSesion = tablaSt.Exists(item => item.Nombre == "VALIDA SESIÓN" && item.Valor == "1");
                configPreliminar.ValidaTarjeta = tablaSt.Exists(item => item.Nombre == "VALIDA TARJETA" && item.Valor == "1");
            }

            DataTable tblNip = Global.conexionSql.GetDataTable("SELECT TablaSt, Nombre, Valor FROM TablaStD WHERE TablaSt = 'ACD00001SHMRECORDATORIONIP' AND Nombre = 'PCOBRO' AND Valor = 'SI' ", null, false);
            configPreliminar.ValidaNipCompra = tblNip != null && tblNip.Rows.Count > 0;
            

        }

    }

}
