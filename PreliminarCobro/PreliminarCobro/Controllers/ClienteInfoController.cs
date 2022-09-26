using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Reflection;
using System.Threading.Tasks;
using System.Data;

namespace PreliminarCobro.Controllers
{
    internal class ClienteInfoController
    {
        /// <summary>
        /// Función que busca coincidencias de clientes de acuerdo a los parametros enviados.
        /// Nota:
        /// Solo llena las propiedades necesarias para identificar al cliente, si necesita todos los datos usar la función GetInfoCte
        /// </summary>
        /// <param name="cliente">Cuenta de cliente</param>
        /// <param name="nombre">Nombre o parte del nombre del cliente</param>
        /// <param name="direccion">Dirección o parte de la dirección</param>
        /// <param name="telefono">Telefono</param>
        /// <param name="codigoPostal">Codigo postal</param>
        /// <param name="buscarFinal">Si los datos los debe buscar en las tablas de clientes finales</param>
        /// <returns>Task<List<Models.ClienteInfo>></returns>
        public async static Task<List<Models.ClienteInfo>> BuscaCte(string cliente, string nombre, string direccion, string telefono, string codigoPostal, bool buscarFinal)
        {
            List<SqlParameter> param = new List<SqlParameter>();
            param.Add(Global.conexionSql.NewSqlParameter("@Cliente", System.Data.SqlDbType.VarChar, cliente == "" ? (object)DBNull.Value : cliente, System.Data.ParameterDirection.Input));
            param.Add(Global.conexionSql.NewSqlParameter("@Opcion", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input));
            param.Add(Global.conexionSql.NewSqlParameter("@Nombre", System.Data.SqlDbType.VarChar, nombre.Trim() == "" ? (object)DBNull.Value : nombre, System.Data.ParameterDirection.Input));
            param.Add(Global.conexionSql.NewSqlParameter("@Direccion", System.Data.SqlDbType.VarChar, direccion.Trim() == "" ? (object)DBNull.Value : direccion, System.Data.ParameterDirection.Input));
            param.Add(Global.conexionSql.NewSqlParameter("@Telefono", System.Data.SqlDbType.VarChar, telefono == "" ? (object)DBNull.Value : telefono, System.Data.ParameterDirection.Input));
            param.Add(Global.conexionSql.NewSqlParameter("@Codigo_Postal", System.Data.SqlDbType.VarChar, codigoPostal == "" ? (object)DBNull.Value : codigoPostal, System.Data.ParameterDirection.Input));
            param.Add(Global.conexionSql.NewSqlParameter("@Buscar_Final", System.Data.SqlDbType.Bit, buscarFinal, System.Data.ParameterDirection.Input));
            return FuncionesGlobales.GetDatosDataTable<Models.ClienteInfo>(Global.conexionSql.GetDataTable("SpCXCPreliminarCteCto", param, false));
        }

        /// <summary>
        /// Función que trae la información de un cliente.
        /// </summary>
        /// <param name="valor">Numero de cuenta o de tarjeta</param>
        /// <param name="esTarjeta">Verdadero para busqueda de tarjeta falso para busqueda de cliente</param>
        /// <returns>List<Models.ClienteInfo></returns>
        public async static Task<List<Models.ClienteInfo>> GetInfoCte(string valor, bool esTarjeta)
        {
                List<SqlParameter> param = new List<SqlParameter>();
                param.Add(Global.conexionSql.NewSqlParameter("@Cliente", System.Data.SqlDbType.VarChar, esTarjeta ? (object)DBNull.Value : valor, System.Data.ParameterDirection.Input));
                param.Add(Global.conexionSql.NewSqlParameter("@IdCatalogoTarjetas", System.Data.SqlDbType.VarChar, !esTarjeta ? (object)DBNull.Value : valor, System.Data.ParameterDirection.Input));
                param.Add(Global.conexionSql.NewSqlParameter("@Opcion", System.Data.SqlDbType.Int, 1, System.Data.ParameterDirection.Input));
                return FuncionesGlobales.GetDatosDataTable<Models.ClienteInfo>(Global.conexionSql.GetDataTable("SpCXCPreliminarCteCto", param, false));
        }



    }
}
