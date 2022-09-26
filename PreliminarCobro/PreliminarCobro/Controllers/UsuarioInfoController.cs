using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace PreliminarCobro.Controllers
{
  internal class UsuarioInfoController
  {
    /// <summary>
    /// Informacion del usuario.
    /// </summary>
    /// <param name="usuario"></param>
    /// <returns></returns>
    public static List<Models.UsuarioInfo> GetInfoUsuario(string usuario)
    {
      List<SqlParameter> param = new List<SqlParameter>();
      param.Add(Global.conexionSql.NewSqlParameter("@Usuario", System.Data.SqlDbType.VarChar, usuario, System.Data.ParameterDirection.Input));
      return FuncionesGlobales.GetDatosDataTable<Models.UsuarioInfo>(Global.conexionSql.GetDataTable("SpCXCPreliminarAccesoUsuario", param, false));
    }

  }
}
