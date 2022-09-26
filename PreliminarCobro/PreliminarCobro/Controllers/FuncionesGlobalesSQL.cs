using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PreliminarCobro.Controllers
{
    internal class FuncionesGlobalesSQL
    {
        #region "Por Consulta"

        /// <summary>
        /// Verifica si el cliente tiene algun documento pendiente en Cxc.
        /// </summary>
        /// <param name="cliente">Cuenta de cliente.</param>
        /// <returns></returns>
        public static bool ExisteDeudaCte(string cliente)
        {
            bool result = false;
            if (cliente != null && cliente != "")
            {
                List<SqlParameter> param = new List<SqlParameter>();
                param.Add(Global.conexionSql.NewSqlParameter("@CLIENTE", SqlDbType.VarChar, cliente, ParameterDirection.Input));
                using (DataTable tbl = Global.conexionSql.GetDataTable("SELECT TOP 1 ID FROM Cxc WITH(NOLOCK) WHERE Cliente = @CLIENTE AND (Estatus = 'PENDIENTE' OR (Estatus = 'CONCLUIDO' AND ISNULL(CobroCteFinal, 0) IN(1,2,4)))", param, false))
                {
                    result = tbl.Rows.Count > 0;
                }
            }

            return result;
        }

        public static DateTime FechaServer()
        {
            DateTime fechaServer = DateTime.Parse("01/01/1900");
            using (DataTable tbl = Global.conexionSql.GetDataTable("SELECT GETDATE() FechaServer", null, false))
            {
                if (tbl.Rows.Count > 0)
                    fechaServer = (DateTime)tbl.Rows[0][0];
            }
            return fechaServer;
        }


        public static List<string> GetFormasPago()
        {
            List<string> formasPago = new List<string>();
            using (DataTable tbl = Global.conexionSql.GetDataTable("SELECT FormaPago FROM FormaPago WITH(NOLOCK) WHERE PV = 1 ORDER BY Orden", null, false))
            {
                if (tbl.Rows.Count > 0)
                    foreach (DataRow row in tbl.Rows)
                    {
                        formasPago.Add(row["FormaPago"].ToString());
                    }
            }
            return formasPago;
        }


        public static List<string> GetCtesGenericos()
        {
            List<string> ctesGenericos = new List<string>();
            using (DataTable tbl = Global.conexionSql.GetDataTable("SELECT Cuenta FROM ListaD WITH(NOLOCK) WHERE Rama = 'Cxc' AND Lista = 'Ctes Genericos'", null, false))
            {
                if (tbl.Rows.Count > 0)
                    foreach (DataRow row in tbl.Rows)
                    {
                        ctesGenericos.Add(row["Cuenta"].ToString());
                    }
            }
            return ctesGenericos;
        }


        public static bool ExisteSucursalTablaImplementacion(int sucursal)
        {
            bool result = false;
            List<SqlParameter> param = new List<SqlParameter>();
            param.Add(Global.conexionSql.NewSqlParameter("@Sucursal", SqlDbType.Int, sucursal, ParameterDirection.Input));
            using (DataTable tbl = Global.conexionSql.GetDataTable("SELECT Numero, Valor FROM TablaNumD WHERE TablaNum = 'SUCURSALES PRELIMINAR COBRO' AND Numero = @Sucursal AND Valor = 1", param, false))
            {
                result = tbl.Rows.Count > 0;
            }

            return result;
        }
        public static bool GetBF(string Cliente)
        {
            bool res = false;
            if (Cliente != null && Cliente != "")
            {
                List<SqlParameter> param = new List<SqlParameter>();
                param.Add(Global.conexionSql.NewSqlParameter("@Cliente", SqlDbType.VarChar, Cliente, ParameterDirection.Input));
                using (DataTable tbl = Global.conexionSql.GetDataTable(@"SELECT c.Nombre
                                                                         FROM Cxc WITH(NOLOCK)                                                                    
                                                                         INNER JOIN Cte C WITH(NOLOCK) ON cxc.Estatus = 'Pendiente'                                                                 
                                                                         AND CXC.ClienteEnviarA = 76
                                                                         AND Cxc.Cliente = C.Cliente
                                                                         INNER JOIN Cte_Final CF WITH(NOLOCK)
                                                                         ON Cxc.CteFinal = CF.ClienteF
                                                                         WHERE Cxc.Cliente = @Cliente
                                                                        AND (c.Nombre != cf.ApellidoPaterno+' '+cf.ApellidoMaterno+' '+cf.Nombre  OR substring(c.RFC,1,10) != substring(cf.RFC,1,10))
                                                                        group by c.Nombre", param, false))
                {

                    res = tbl.Rows.Count > 0;
                }
            }

            return res;
        }



        #endregion

        #region "Stored Procedure ó Funciones"




        #region "Usados para la creación de cobros"
   

 

        #endregion

        #endregion

    }

}
