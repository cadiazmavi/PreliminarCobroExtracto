using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows.Forms;

namespace PreliminarCobro
{
    static class Program
    {
        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        static extern bool CheckRemoteDebuggerPresent(IntPtr hProcess, ref bool isDebuggerPresent);

        #region "Procesos y Funciones"
        private static bool PrimeraEjecucion
        {
            get
            {
                bool crear = true;
                string exe = Assembly.GetExecutingAssembly().GetName().Name;

                Process[] process = Process.GetProcessesByName(exe);
                crear = !(process.ToList().FindAll(p => p.SessionId == Process.GetCurrentProcess().SessionId).Count > 1);
                return crear;
            }
        }

        private static bool CargarDatosIniciales()
        {
            try
            {
                CheckRemoteDebuggerPresent(Process.GetCurrentProcess().Handle, ref Global.isDebugger);

                //Conexión a SQL
                Global.CargarConexionSql("SERVIDOR", "NombreBaseDatos", "Usuario", "Password");

                //Configuraciones del preliminar
                Global.configPreliminar = Controllers.ConfigPreliminarController.GetConfig();

                //Cuentas de clientes genericos
                //Global.ctesGenericos = Controllers.FuncionesGlobalesSQL.GetCtesGenericos();

                //Información del usuario.
                List<Models.UsuarioInfo> listUsuarioInfo = Controllers.UsuarioInfoController.GetInfoUsuario(Global.UsuarioIntelisis);
                if (listUsuarioInfo != null && listUsuarioInfo.Count() > 0)
                    Global.usuarioInfo = listUsuarioInfo[0];
                else
                    return false;




                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al abrir. " + Global.BaseDatos, MessageBoxButtons.OK, MessageBoxIcon.Error);
                Application.Exit();
                return false;
            }
        }

        #endregion

        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        /// <param name="parametros">Parametros que recibe la aplicación</param>
        /// <param[0]>Usuario de intelisis</param[0]>
        /// <param[1]>Base de datos</param[1]>
        [STAThread]
        static void Main(string[] parametros)
        {
            if (PrimeraEjecucion && parametros != null && parametros.Count() == 3)
            {
                Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo("es-MX");
                Thread.CurrentThread.CurrentUICulture = CultureInfo.GetCultureInfo("es-MX");
                Global.UsuarioIntelisis = parametros[0].Replace("'", "");
                Global.UsuarioIntelisis = "VENTP00740";
                Global.BaseDatos = parametros[1].Replace("'", "").ToUpper();
                Global.estacionTrabajo = Convert.ToInt32(parametros[2].Replace("'", ""));
                if (CargarDatosIniciales())
                {
                    Application.EnableVisualStyles();
                    Application.SetCompatibleTextRenderingDefault(false);
                    Application.Run(new Views.frmPreliminarCobro());
                }
            }
        }

    }
}
