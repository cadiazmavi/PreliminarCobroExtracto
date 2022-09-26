using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PreliminarCobro
{
  internal class Global
  {
    #region "Variables informativas"
    internal static bool isDebugger;
    internal static string rutaPlugIns = new DirectoryInfo(Application.StartupPath).Parent.FullName;

    internal static string UsuarioIntelisis;
    internal static string BaseDatos;
    internal static int estacionTrabajo;
    internal static Models.ConfigPreliminar configPreliminar;

    internal static Models.UsuarioInfo usuarioInfo;
    internal static Models.ClienteInfo clienteInfo;
    internal static DateTime fechaServer;
    internal static List<string> ctesGenericos;

    #endregion

    #region "Conexiones"
    internal static ConectaSql.ConectaSqlFn conexionSql;
    public static void CargarConexionSql(string servidor, string baseDatos, string usuario, string password)
    {
      conexionSql = new ConectaSql.ConectaSqlFn(servidor, baseDatos, usuario, password);
    }

    #endregion

  }
}
