using PreliminarCobro.Controllers;
using PreliminarCobro.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PreliminarCobro.Views
{
    public partial class frmPreliminarCobro : Form
    {


        #region "Variables"
        internal static List<Models.DoctosPadres> listDoctosPadres;
        internal static List<Models.DoctosHijos> listDoctosHijos;



        internal DM0312_Loading_ frmLoading = new DM0312_Loading_();

        internal List<TabPage> tabPagesCliente = new List<TabPage>();
        //internal List<string> CtasCtesGenericos = Controllers.FuncionesGlobalesSQL.GetCtesGenericos();

        private static int NumCategorias = 0;
        private static bool promesasPago = false;
        private static bool aplicaRD = false;

        //Variables para la generación del cobro.

        private bool PermisoGenerarCobros
        {
            get
            {
                return Global.usuarioInfo.DefCtaDinero != null &&
                       Global.usuarioInfo.DefCtaDinero != "" &&
                       Global.usuarioInfo.SucursalGeneraCobro &&
                       Global.BaseDatos.ToUpper() != Properties.Settings.Default.BaseDatosM.ToUpper();
            }
        }

        #endregion

        #region "Procesos y Funciones"
        /// <summary>
        /// Carga los datos iniciales necesarios para la aplicación.
        /// </summary>
        private void CargarDatosIniciales()
        {
            try
            {
                if (!Controllers.FuncionesGlobalesSQL.ExisteSucursalTablaImplementacion(Global.usuarioInfo.Sucursal))
                {
                    MessageBox.Show("La sucursal no puede usar la aplicación.", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
                    frmPreliminarCobro_FormClosing(this, new FormClosingEventArgs(CloseReason.ApplicationExitCall, false));
                }

                //Timer validaciones que cierran la aplicación.
                ValidarSesion(true);
                lblUsuario.Text = Global.usuarioInfo.Usuario;
                lblNombre.Text = Global.usuarioInfo.Nombre;
                lblSucTrabajo.Text = Global.usuarioInfo.Sucursal.ToString();
                dgvPadres.AutoGenerateColumns = false;
                dgvHijos.AutoGenerateColumns = false;
                cbFormaPago.DataSource = Controllers.FuncionesGlobalesSQL.GetFormasPago();
                if (cbFormaPago.Items.Contains("EFECTIVO")) cbFormaPago.Text = "EFECTIVO";
                if (Global.estacionTrabajo > 0)
                    lblEstTrabajo.Text = Global.estacionTrabajo.ToString();
                else
                {
                    MessageBox.Show("Usuario no cuenta con Estación de Trabajo.", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                lblVersionApp.Text = "V. " + Application.ProductVersion;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("CargarDatosIniciales!! " + Environment.NewLine + ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Valida la sesión por usuario de intelisis.
        /// </summary>
        /// <param name="permiteTomarSesion">Permite tomar la sesión en caso de que exista.</param>
        private void ValidarSesion(bool permiteTomarSesion)
        {
            try
            {
                if (!Global.isDebugger && Global.configPreliminar.ValidaSesion && PermisoGenerarCobros)
                {

                        MessageBox.Show("Se detecto un cierre de sesión del usuario " + Global.UsuarioIntelisis + ".", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Question);
                        frmPreliminarCobro_FormClosing(this, new FormClosingEventArgs(CloseReason.ApplicationExitCall, false));

                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ValidarSesion!! " + Environment.NewLine + ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Carga los permisos de los usuarios.
        /// </summary>
        private void CargarPermisosUsuario()
        {
            lblServerBase.Text = Global.conexionSql.GetServidorConexion() + ":" + Global.conexionSql.GetBaseDatosConexion();
            if (Global.BaseDatos.ToUpper() == Properties.Settings.Default.BaseDatosM.ToUpper())
            {
                //Cuando se abre con mavicob

            }
            btnVerGenerarCobro.Visible = PermisoGenerarCobros;

            pFiltros.BackColor = ColoresApp.FiltrosBackColor;
            scGeneral.Panel1.BackColor = ColoresApp.DatosClienteBackColor;
            gbInfoCte.BackColor = ColoresApp.DatosClienteBackColor;
            dgvPadres.ColumnHeadersDefaultCellStyle.BackColor = ColoresApp.HeaderGridBackColor;
            dgvPadres.RowsDefaultCellStyle.SelectionBackColor = ColoresApp.CellSelectionBackColor;
            dgvHijos.ColumnHeadersDefaultCellStyle.BackColor = ColoresApp.HeaderGridBackColor;
            dgvHijos.RowsDefaultCellStyle.SelectionBackColor = ColoresApp.CellSelectionBackColor;
        }

        /// <summary>
        /// Limpia los campos referentes a la información del cliente y sus saldos.
        /// </summary>
        private void LimpiarCampos()
        {
            if (pGeneraCobro.Visible)
                btnSalirCobro.PerformClick();




            txtTiempoConsulta.Text = "00:00.000";
            lblHuellaSHM.Visible = false;
            lblConvLCT.Visible = false;
            lblConvRD.Visible = false;
            lblCobXPolitica.Visible = false;
            lblCtaAsignada.Visible = false;
            promesasPago = false;
            aplicaRD = false;
            Global.clienteInfo = null;
            foreach (var lbl in (from ctrl in gbInfoCte.Controls.OfType<Label>() where !ctrl.AutoSize select ctrl))
            {
                lbl.Text = "";
            }
            lblBFCteN.Visible = lblBFCte.Text != "";
            lblBFCte.Visible = lblBFCte.Text != "";
            txtFiltrosPadres.Text = "";
            txtFiltrosPadres.Enabled = false;
            LimpiaCamposDoctos();
            LimpiaInfoPadre();
            pTotalesCte.Visible = false;
            ActiveControl = txtCteBusca;
        }

        /// <summary>
        /// Limpia los campos referentes a los documentos.
        /// </summary>
        private void LimpiaCamposDoctos()
        {
            if (dgvPadres.IsCurrentCellInEditMode)
            {
                dgvPadres.CancelEdit();
                dgvPadres.EndEdit();
            }
            listDoctosPadres = null;
            dgvPadres.DataSource = listDoctosPadres;
            listDoctosHijos = null;
            dgvHijos.DataSource = listDoctosHijos;
            tcDoctos.TabPages.Clear();


        }

        /// <summary>
        /// Limpia los campos de informacion de un documento padre.
        /// </summary>
        private void LimpiaInfoPadre()
        {
            foreach (var txt in (from ctrl in scGeneral.Panel1.Controls.OfType<TextBox>() where ctrl.Name.StartsWith("txtPadre") select ctrl))
            {
                txt.Text = "";
            }
        }

        /// <summary>
        /// Muestra la ventana de Loading.
        /// </summary>
        private void VerLoading()
        {
            if (!frmLoading.Visible)
            {
                this.Cursor = Cursors.WaitCursor;
                pFiltros.Enabled = false;
                scGeneral.Visible = false;
                frmLoading.Show(this);
            }
        }

        /// <summary>
        /// Oculta la ventana de Loading.
        /// </summary>
        private void CerrarLoading()
        {
            if (frmLoading.Visible)
            {
                pFiltros.Enabled = true;
                scGeneral.Visible = true;
                this.Focus();
                frmLoading.Hide();
                this.Cursor = Cursors.Default;
            }
        }

        /// <summary>
        /// Valida el campo en el que se captura la tarjeta o la cuenta.
        /// </summary>
        /// <returns>Retorna los errores encontrados.</returns>
        private string ValidaCuentaTarjeta()
        {
            string errores = "";

            if (txtCteBusca.Text != "") cbBF.Checked = txtCteBusca.Text.StartsWith("F");

            if (errores == "" && txtCteBusca.Text != "" && !Controllers.FuncionesGlobales.EsEntero(txtCteBusca.Text))
            {
                if (errores == "" && txtCteBusca.Text != "" && !System.Text.RegularExpressions.Regex.IsMatch(txtCteBusca.Text, @"^[" + (cbBF.Checked ? "F" : "C") + @"]{1}\d{8}$"))
                    errores += "La cuenta no es valida." + Environment.NewLine;

                if (errores == "" && txtCteBusca.Text != "" && Convert.ToInt64(txtCteBusca.Text.Substring(1, 8)) == 0)
                    errores += "La cuenta no es valida." + Environment.NewLine;
            }
            else
            {
                if (errores == "" && txtCteBusca.Text != "" && Controllers.FuncionesGlobales.EsEntero(txtCteBusca.Text) && Convert.ToInt64(txtCteBusca.Text) == 0)
                    errores += "La tarjeta no es valida." + Environment.NewLine;
            }

            return errores;
        }

        /// <summary>
        /// Busca y carga la información del cliente.
        /// </summary>
        private async void BuscarCliente()
        {
            ValidarSesion(false);
            try
            {

                txtCteBusca.Text = txtCteBusca.Text.Trim();
                txtCteNomBusca.Text = txtCteNomBusca.Text.Trim();
                txtCteDirBusca.Text = txtCteDirBusca.Text.Trim();
                txtCteTelBusca.Text = txtCteTelBusca.Text.Trim();
                txtCteCPBusca.Text = txtCteCPBusca.Text.Trim();

                TimeSpan start = new TimeSpan(DateTime.Now.Ticks);
                TimeSpan stop;
                //Validar filtros
                string errores = "";

                if (txtCteBusca.Text == "" && txtCteNomBusca.Text == "" && txtCteDirBusca.Text == "" && txtCteTelBusca.Text == "" && txtCteCPBusca.Text == "")
                    errores += "Capture la información del cliente que desea buscar." + Environment.NewLine;

                if (errores == "" && txtCteBusca.Text != "" && txtCteBusca.Text.Length <= 16)
                    errores = ValidaCuentaTarjeta();

                if (errores == "" && txtCteTelBusca.Text != "" && !System.Text.RegularExpressions.Regex.IsMatch(txtCteTelBusca.Text, @"^\d{10}$"))
                    errores += "Teléfono no valido." + Environment.NewLine;

                if (errores == "" && txtCteCPBusca.Text != "" && !System.Text.RegularExpressions.Regex.IsMatch(txtCteCPBusca.Text, @"^\d{5,}$"))
                    errores += "Codigo Postal no valido." + Environment.NewLine;
                

                
                VerLoading();
                LimpiarCampos();
                Global.fechaServer = Controllers.FuncionesGlobalesSQL.FechaServer();
                lblFechaServer.Text = Global.fechaServer.ToString("dddd, dd \\de MMMM \\de yyyy");

                //Buscar el cliente.
                bool buscoPorCteOTajeta = txtCteBusca.Text != "" && txtCteNomBusca.Text == "" && txtCteDirBusca.Text == "" && txtCteTelBusca.Text == "" && txtCteCPBusca.Text == "" && !cbBF.Checked;
                bool esTarjeta = Controllers.FuncionesGlobales.EsEntero(txtCteBusca.Text);

                List<Models.ClienteInfo> listClienteInfo;
                if (buscoPorCteOTajeta)
                    listClienteInfo = await Task.Run(() => Controllers.ClienteInfoController.GetInfoCte(txtCteBusca.Text, esTarjeta));
                else
                    listClienteInfo = await Task.Run(() => Controllers.ClienteInfoController.BuscaCte(txtCteBusca.Text, txtCteNomBusca.Text, txtCteDirBusca.Text, txtCteTelBusca.Text, txtCteCPBusca.Text, cbBF.Checked));

                if (listClienteInfo != null && listClienteInfo.Count > 0)
                {
                    if (listClienteInfo.Count == 1)
                        Global.clienteInfo = listClienteInfo[0];
                    else
                    {
                        MessageBox.Show("Se elimino el formulario donde se seleccina el cliente cuando hay mas de una coincidencia");
                    }
                }

                //Traer los datos del cliente.
                if (Global.clienteInfo != null)
                {
                    if (cbBF.Checked)
                        txtCteBusca.Text = Global.clienteInfo.CteFinal;
                    else
                        txtCteBusca.Text = Global.clienteInfo.Cliente;

                    txtCteNomBusca.Text = "";
                    txtCteDirBusca.Text = "";
                    txtCteTelBusca.Text = "";
                    txtCteCPBusca.Text = "";

                    if (Global.clienteInfo.Rfc == null || Global.clienteInfo.Rfc == "")
                    {
                        listClienteInfo = await Task.Run(() => Controllers.ClienteInfoController.GetInfoCte(Global.clienteInfo.Cliente, false));
                        listClienteInfo[0].CteFinal = Global.clienteInfo.CteFinal;
                        listClienteInfo[0].NombreFinal = Global.clienteInfo.NombreFinal;
                    }
                    Global.clienteInfo = listClienteInfo[0];
                    await LlenaInfoDoctos();
                    LlenaInfoCliente();
                    CerrarLoading();

                    
                }
                else
                {
                    LimpiarCampos();
                    CerrarLoading();
                    if (buscoPorCteOTajeta && esTarjeta)
                        MessageBox.Show("Tarjeta no asignada...", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
                    else
                        MessageBox.Show("Cuenta sin adeudo", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                stop = new TimeSpan(DateTime.Now.Ticks);
                txtTiempoConsulta.Text = ((new DateTime(1900, 1, 1)).AddMilliseconds(stop.Subtract(start).TotalMilliseconds)).ToString("mm:ss.fff");


            }
            catch (Exception ex)
            {
                LimpiarCampos();
                CerrarLoading();
                MessageBox.Show("BuscarCliente!! " + Environment.NewLine + ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Llena los campos con la información del cliente.
        /// </summary>
        private async void LlenaInfoCliente()
        {
            try
            {

                dgvPadres.ReadOnly = false;
                lblCte2.Text = Global.clienteInfo.Cliente;
                lblBFCte.Text = (Global.clienteInfo.CteFinal != "" && Global.clienteInfo.CteFinal != null ? Global.clienteInfo.NombreFinal + " (" + Global.clienteInfo.CteFinal + ")" : "");
                lblBFCteN.Visible = lblBFCte.Text != "";
                lblBFCte.Visible = lblBFCte.Text != "";
                lblNomCte.Text = Global.clienteInfo.Nombre;
                lblCGlobalCte.Text = Global.clienteInfo.CalificacionGlobal.ToString();
                lblDomCte.Text = Global.clienteInfo.Domicilio;
                lblDelegacionCte.Text = Global.clienteInfo.Delegacion;
                lblColCte.Text = Global.clienteInfo.Colonia;
                lblPoblacionCte.Text = Global.clienteInfo.Poblacion;
                lblEstadoCte.Text = Global.clienteInfo.Estado;
                lblCPCte.Text = Global.clienteInfo.CodigoPostal;
                try
                {
                    if (!string.IsNullOrEmpty(Global.clienteInfo.TelefonoPart))
                        lblTelPartCte.Text = Global.clienteInfo.TelefonoPart.StartsWith("55") ||
                                             Global.clienteInfo.TelefonoPart.StartsWith("33") ||
                                             Global.clienteInfo.TelefonoPart.StartsWith("81") ?
                                             "(" + Global.clienteInfo.TelefonoPart.Substring(0, 2) + ") - " + Global.clienteInfo.TelefonoPart.Substring(2, Global.clienteInfo.TelefonoPart.Length - 2) :
                                             "(" + Global.clienteInfo.TelefonoPart.Substring(0, 3) + ") - " + Global.clienteInfo.TelefonoPart.Substring(3, Global.clienteInfo.TelefonoPart.Length - 3);
                }
                catch
                {
                    lblTelPartCte.Text = Global.clienteInfo.TelefonoPart;
                }
                try
                {
                    if (!string.IsNullOrEmpty(Global.clienteInfo.TelefonoMov))
                        lblTelMovCte.Text = Global.clienteInfo.TelefonoMov.StartsWith("55") ||
                                            Global.clienteInfo.TelefonoMov.StartsWith("33") ||
                                            Global.clienteInfo.TelefonoMov.StartsWith("81") ?
                                            "(" + Global.clienteInfo.TelefonoMov.Substring(0, 2) + ") - " + Global.clienteInfo.TelefonoMov.Substring(2, Global.clienteInfo.TelefonoMov.Length - 2) :
                                            "(" + Global.clienteInfo.TelefonoMov.Substring(0, 3) + ") - " + Global.clienteInfo.TelefonoMov.Substring(3, Global.clienteInfo.TelefonoMov.Length - 3);
                }
                catch
                {
                    lblTelMovCte.Text = Global.clienteInfo.TelefonoMov;
                }
                lblRCobCte.Text = Global.clienteInfo.RutaCobro;
                lblComMayCte.Text = Global.clienteInfo.CompraMay.ToString("C2");
                lblSaldoFavorCte.Text = (Global.clienteInfo.SaldoNC + Global.clienteInfo.SaldoFavor).ToString("C2");
            }
            catch (Exception ex)
            {
                MessageBox.Show("LlenaInfoCliente!! " + Environment.NewLine + ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Llena los campos y datos con la información de los documentos.
        /// </summary>
        /// <returns></returns>
        private async Task LlenaInfoDoctos()
        {
            try
            {
                LimpiaCamposDoctos();
                lblSaldoGlobalCte.Text = "$0.00";
                listDoctosPadres = new List<Models.DoctosPadres>();
                listDoctosHijos = new List<Models.DoctosHijos>();


                if (Controllers.FuncionesGlobalesSQL.ExisteDeudaCte(Global.clienteInfo.Cliente))
                {
                    //Traer la información de los documentos.
                    await Task.Run(() => Controllers.DoctosController.LlenaInfoPadres(Global.conexionSql.GetBaseDatosConexion(), Global.clienteInfo, Global.clienteInfo.CteFinal, listDoctosPadres, listDoctosHijos));

                    //Agregar las pestañas de canales con los que cuenta el cliente.
                    tabPagesCliente.Clear();
                    NumCategorias = 0;
                    if (listDoctosPadres.Exists(padre => padre.IdTagPestaña.Contains(tpMenudeo.Tag.ToString().ToInt())))
                    {
                        tabPagesCliente.Add(tpMenudeo);
                        NumCategorias++;
                    }
                    if (listDoctosPadres.Exists(padre => padre.IdTagPestaña.Contains(tpDima.Tag.ToString().ToInt())))
                    {
                        tabPagesCliente.Add(tpDima);
                        NumCategorias++;
                    }
                    if (listDoctosPadres.Exists(padre => padre.IdTagPestaña.Contains(tpInstituciones.Tag.ToString().ToInt())))
                    {
                        tabPagesCliente.Add(tpInstituciones);
                        NumCategorias++;
                    }
                    if (listDoctosPadres.Exists(padre => padre.IdTagPestaña.Contains(tpMayoreo.Tag.ToString().ToInt())))
                    {
                        tabPagesCliente.Add(tpMayoreo);
                        NumCategorias++;
                    }
                    if (listDoctosPadres.Exists(padre => padre.IdTagPestaña.Contains(tpApoyoCobDima.Tag.ToString().ToInt())))
                    {
                        tabPagesCliente.Add(tpApoyoCobDima);
                        NumCategorias++;
                    }
                    if (listDoctosPadres.Exists(padre => padre.IdTagPestaña.Contains(tpDineralia.Tag.ToString().ToInt())))
                    {
                        //if (Controllers.GestorCobranzaController.ExisteAsignacion(Global.clienteInfo.Cliente) || RefDineralia != null || !PermisoGenerarCobros)
                        tabPagesCliente.Add(tpDineralia);
                        NumCategorias++;
                    }
                    if (listDoctosPadres.Exists(padre => padre.IdTagPestaña.Contains(tpCreditoEmpresario.Tag.ToString().ToInt())))
                    {
                        tabPagesCliente.Add(tpCreditoEmpresario);
                        NumCategorias++;
                    }
                    foreach (TabPage tab in tabPagesCliente)
                    {
                        tcDoctos.TabPages.Insert(tcDoctos.TabPages.Count, tab);
                    }

                    //Totalizadores por cliente.
                    pTotalesCte.Visible = tabPagesCliente.Count > 1;
                    lblTotDoctos.Text = "# Mov " + (listDoctosPadres.Count + listDoctosPadres.FindAll(item => item.CheckApoyo > 0 && item.SaldoTotal == 0).Count).ToString();
                    lblTotImpVta.Text = listDoctosPadres.FindAll(padre => padre.PadreMAVI != "Seguro Vida").Sum(padre => padre.ImporteVta).ToString("C2");
                    lblTotSaldoCapital.Text = listDoctosPadres.FindAll(padre => padre.PadreMAVI != "Seguro Vida").Sum(padre => padre.SaldoCapital).ToString("C2");
                    lblTotMoratorios.Text = listDoctosPadres.Sum(padre => padre.Moratorios).ToString("C2");
                    lblTotSaldoVencido.Text = listDoctosPadres.Sum(padre => padre.SaldoVencido).ToString("C2");
                    lblTotSaldoTotal.Text = (listDoctosPadres.FindAll(padre => padre.PadreMAVI != "Seguro Vida").Sum(padre => padre.SaldoTotal) +
                                             listDoctosPadres.FindAll(padre => padre.PadreMAVI == "Seguro Vida").Sum(padre => padre.SaldoVencido)).ToString("C2");
                }
                lblSaldoGlobalCte.Text = ((listDoctosPadres != null && listDoctosPadres.Count > 0 ? listDoctosPadres.Sum(padre => padre.SaldoTotal) : 0) - (Global.clienteInfo.SaldoNC + Global.clienteInfo.SaldoFavor)).ToString("C2");

                

                MostrarOcultarColumnas();
                LlenaDoctosPadres(calculoTotal: true, soloImportesAPagar: pGeneraCobro.Visible);
                if (!(listDoctosPadres != null && listDoctosPadres.Count > 0))
                    MessageBox.Show("Cuenta sin adeudo.", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("LlenaInfoDoctos!! " + Environment.NewLine + ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        
        /// <summary>
        /// Llena la pestaña actual del control tcDoctos, ademas de trabajar con los filtros por documentos padres.
        /// </summary>
        /// <param name="calculoTotal">Parametro para ver si calcula los totalizadores</param>
        /// <param name="soloImportesAPagar">Parametro para ver si solo muestra los registros con importes a pagar</param>
        private void LlenaDoctosPadres(bool calculoTotal, bool soloImportesAPagar)
        {
            if (listDoctosPadres != null && tcDoctos.SelectedTab != null)
            {
                if (calculoTotal)
                {
                    dgvPadres.DataSource = null;
                    dgvHijos.DataSource = null;
                    ssTotalesTab.Visible = false;
                    tcDoctos.SelectedTab.Controls.Add(pPadres);
                    LimpiaInfoPadre();
                    txtFiltrosPadres.Enabled = false;
                    lblTabCteFinal.Visible = false;
                    lblTabCteFinalN.Visible = false;
                }

                List<Models.DoctosPadres> listDoctosPadresTMP = null;
                if (soloImportesAPagar)
                    listDoctosPadresTMP = listDoctosPadres.FindAll(padre => padre.ImportePagar > 0);
                else
                    listDoctosPadresTMP = listDoctosPadres;

                //Validar la pestaña en la que actualmente esta el control.
                int idTagPestaña = Convert.ToInt32(tcDoctos.SelectedTab.Tag);
                if (tcDoctos.SelectedTab == tpDima)
                {
                    //Validar si necesita el nip de cobro para ver la información de los finales.
                    bool mostrarDocsDIMA = !Global.usuarioInfo.SolicitaNIPDIMA ||
                                           Global.clienteInfo.SinBonifDIMA;
                    bool DimaBF = Controllers.FuncionesGlobalesSQL.GetBF(Global.clienteInfo.Cliente);

                    if (!mostrarDocsDIMA)
                    {
                        if (DimaBF)
                        {
                            mostrarDocsDIMA = true;
                        }
                    }

                    if (!DimaBF)
                    {
                        mostrarDocsDIMA = true;
                    }

                    //Eliminar  mostrarDocsDIMA = true;
                    if (mostrarDocsDIMA)
                        listDoctosPadresTMP = listDoctosPadresTMP.FindAll(padre => padre.IdTagPestaña.Contains(idTagPestaña)).ToList();
                    else
                        listDoctosPadresTMP = null;
                }
                else
                {
                    listDoctosPadresTMP = listDoctosPadresTMP.FindAll(padre => padre.IdTagPestaña.Contains(idTagPestaña)).ToList();
                }

                if (listDoctosPadresTMP != null)
                {
                    //Filtros de movimientos por PadreIDMAVI, NomCteFinal o DescripcionArt
                    txtFiltrosPadres.Enabled = true;
                    if (txtFiltrosPadres.Text != null && txtFiltrosPadres.Text != "")
                        dgvPadres.DataSource = listDoctosPadresTMP.FindAll(padre => (padre.Movimiento != null && padre.PadreIDMAVI.Contains(txtFiltrosPadres.Text)) ||
                                                                                    (padre.NomCteFinal != null && padre.NomCteFinal.Contains(txtFiltrosPadres.Text)) ||
                                                                                    (padre.DescripcionArt != null && padre.DescripcionArt.Contains(txtFiltrosPadres.Text))).ToList();
                    else
                        dgvPadres.DataSource = listDoctosPadresTMP;

                    //Totalizadores por pestaña
                    if (calculoTotal)
                    {
                        lblTabCteFinal.Visible = tcDoctos.SelectedTab == tpDima;
                        lblTabCteFinalN.Visible = tcDoctos.SelectedTab == tpDima;
                        lblTabMoratorios.Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
                        lblTabMoratoriosN.Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
                        lblTabSaldoTotal.Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
                        lblTabSaldoTotalN.Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
                        lblTabSaldoVencido.Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
                        lblTabSaldoVencidoN.Visible = tcDoctos.SelectedTab != tpApoyoCobDima;

                        ssTotalesTab.Visible = true;
                        lblTotalesCatCte.Text = "TOTAL " + tcDoctos.SelectedTab.Text;
                        lblTabDoctos.Text = "# Mov " + listDoctosPadresTMP.Count.ToString("N0");
                        lblTabCteFinal.Text = listDoctosPadresTMP.Select(item => item.CteFinal).Distinct().Count().ToString("N0");

                        if (tcDoctos.SelectedTab == tpApoyoCobDima)
                        {
                            lblTabImpVtaN.Text = "Importe Apoyo";
                            lblTabImpVta.Text = listDoctosPadresTMP.Sum(padre => padre.ImpApoyo).ToString("C2");
                            lblTabSaldoCapitalN.Text = "Saldo Apoyo";
                            lblTabSaldoCapital.Text = listDoctosPadresTMP.Sum(padre => padre.SaldoApoyo).ToString("C2");
                        }
                        else
                        {
                            lblTabImpVtaN.Text = "Importe Venta";
                            lblTabImpVta.Text = listDoctosPadresTMP.FindAll(padre => padre.PadreMAVI != "Seguro Vida").Sum(padre => padre.ImporteVta).ToString("C2");
                            lblTabSaldoCapitalN.Text = "Saldo Capital";
                            lblTabSaldoCapital.Text = listDoctosPadresTMP.FindAll(padre => padre.PadreMAVI != "Seguro Vida").Sum(padre => padre.SaldoCapital).ToString("C2");
                            lblTabMoratorios.Text = listDoctosPadresTMP.Sum(padre => padre.Moratorios).ToString("C2");
                            lblTabSaldoVencido.Text = listDoctosPadresTMP.Sum(padre => padre.SaldoVencido).ToString("C2");
                            lblTabSaldoTotal.Text = (listDoctosPadresTMP.FindAll(padre => padre.PadreMAVI != "Seguro Vida").Sum(padre => padre.SaldoTotal) +
                                                     listDoctosPadresTMP.FindAll(padre => padre.PadreMAVI == "Seguro Vida").Sum(padre => padre.SaldoVencido)).ToString("C2");
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Muestra u oculta las pestañas dependiendo de la pestaña en la que se encuentre.
        /// </summary>
        private void MostrarOcultarColumnas()
        {
            int idTagPestaña = 0;
            if (tcDoctos.SelectedTab != null)
                idTagPestaña = Convert.ToInt32(tcDoctos.SelectedTab.Tag);

            //Grid movimientos padre
            if (dgvPadres.Columns["NombreBeneficiarioFinal"] != null)
                dgvPadres.Columns["NombreBeneficiarioFinal"].Visible = tcDoctos.SelectedTab == tpDima || tcDoctos.SelectedTab == tpApoyoCobDima;
            if (dgvPadres.Columns["DiaPago"] != null)
                dgvPadres.Columns["DiaPago"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
            if (dgvPadres.Columns["LiquidaCon"] != null)
                dgvPadres.Columns["LiquidaCon"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
            if (dgvPadres.Columns["PagoParaEstaralCorriente"] != null)
                dgvPadres.Columns["PagoParaEstaralCorriente"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
            if (dgvPadres.Columns["ImporteApoyo"] != null)
                dgvPadres.Columns["ImporteApoyo"].Visible = tcDoctos.SelectedTab == tpApoyoCobDima;
            if (dgvPadres.Columns["SaldoApoyo"] != null)
                dgvPadres.Columns["SaldoApoyo"].Visible = tcDoctos.SelectedTab == tpApoyoCobDima;
            if (dgvPadres.Columns["ImporteaPagar"] != null)
            {
                dgvPadres.Columns["ImporteaPagar"].Visible = PermisoGenerarCobros;
                dgvPadres.Columns["ImporteaPagar"].HeaderCell.Style.BackColor = ColorTranslator.FromHtml("#9b0000");
            }
            if (dgvPadres.Columns["ACondonar"] != null)
                dgvPadres.Columns["ACondonar"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima &&
                                                         PermisoGenerarCobros &&
                                                         pGeneraCobro.Visible &&
                                                         listDoctosPadres.Exists(item => item.IdTagPestaña.Contains(idTagPestaña) && item.Moratorios > 0);
            if (dgvPadres.Columns["SolicitarApoyo"] != null)
                dgvPadres.Columns["SolicitarApoyo"].Visible = tcDoctos.SelectedTab == tpDima &&
                                                              PermisoGenerarCobros &&
                                                              pGeneraCobro.Visible;

            //Grid movimientos hijo
            if (dgvHijos.Columns["Movimiento"] != null)
                dgvHijos.Columns["Movimiento"].Visible = true;
            if (dgvHijos.Columns["Vencimiento"] != null)
                dgvHijos.Columns["Vencimiento"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
            if (dgvHijos.Columns["Importe"] != null)
                dgvHijos.Columns["Importe"].Visible = true;
            if (dgvHijos.Columns["ImporteCPP"] != null)
                dgvHijos.Columns["ImporteCPP"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
            if (dgvHijos.Columns["Saldo"] != null)
                dgvHijos.Columns["Saldo"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
            if (dgvHijos.Columns["DiasVencidos"] != null)
                dgvHijos.Columns["DiasVencidos"].Visible = tcDoctos.SelectedTab != tpApoyoCobDima;
            if (dgvHijos.Columns["Origen"] != null)
                dgvHijos.Columns["Origen"].Visible = true;
            if (dgvHijos.Columns["SaldoApoyoDIMA"] != null)
                dgvHijos.Columns["SaldoApoyoDIMA"].Visible = tcDoctos.SelectedTab == tpApoyoCobDima;
        }

        /// <summary>
        /// Llena los campos con la información del movimiento padre.
        /// </summary>
        /// <param name="padreMavi"></param>
        /// <param name="padreIdMavi"></param>
        private void LlenaInfoPadre(string padreMavi, string padreIdMavi)
        {
            LimpiaInfoPadre();

            var docPadre = listDoctosPadres.Find(padre => padre.PadreMAVI == padreMavi && padre.PadreIDMAVI == padreIdMavi);
            if (docPadre != null)
            {
                txtPadreFechaEmision.Text = docPadre.FechaEmision.ToString("d");
                txtPadreCondicion.Text = docPadre.Condicion;
                txtPadreUltPago.Text = docPadre.UltimoPago == new DateTime(0001, 01, 01) ? "NA" : docPadre.UltimoPago.ToString("d");
                txtPadre1erVenc.Text = docPadre.PrimerVencimiento.ToString("d");
                txtPadreSucursal.Text = docPadre.SucursalOrigen.ToString();
                txtPadreDiasInactivo.Text = docPadre.DiasInactivos.ToString("n0");
                txtPadreCanalVenta.Text = docPadre.ClienteEnviarA.ToString();
                txtPadreConvLCT.Text = docPadre.TieneLCT;
                txtPadreImpVta.Text = docPadre.ImporteVta.ToString("C2");
                txtPadreSaldoCapital.Text = docPadre.SaldoCapital.ToString("C2");
                txtPadreMoratorios.Text = docPadre.Moratorios.ToString("C2");
                if (docPadre.SaldoVencido > 0)
                    txtPadreSaldoVencido.ForeColor = Color.Red;
                else
                    txtPadreSaldoVencido.ForeColor = Color.Black;
                txtPadreSaldoVencido.Text = docPadre.SaldoVencido.ToString("C2");
                txtPadreSaldoTotal.Text = docPadre.SaldoTotal.ToString("C2");
                txtPadrePago.Text = docPadre.MontoPago;
                txtPadreCobXPolitica.Text = docPadre.CobroXPolitica;
                txtPadreDiasVencido.Text = docPadre.DiasVencidos.ToString("n0");

                if (docPadre.PadreMAVI == "Seguro Vida")
                {
                    txtPadreCondicion.Text = "";
                    txtPadreUltPago.Text = "";
                    txtPadreImpVta.Text = "";
                    txtPadreSaldoCapital.Text = "";
                    txtPadreSaldoTotal.Text = txtPadreSaldoVencido.Text;
                }

                //Llenar la información de los movimientos hijo.
                List<Models.DoctosHijos> listDoctosHijosTMP = null;
                if (tcDoctos.SelectedTab == tpApoyoCobDima)
                {
                    listDoctosHijosTMP = listDoctosHijos.FindAll(item => item.CobroCteFinal > 0 && item.PadreMAVI == padreMavi && item.PadreIDMAVI == padreIdMavi).ToList();
                }
                else
                {
                    listDoctosHijosTMP = listDoctosHijos.FindAll(item => item.Estatus == "PENDIENTE" && item.PadreMAVI == padreMavi && item.PadreIDMAVI == padreIdMavi).ToList();
                }
                txtPadreNHijos.Text = listDoctosHijosTMP.Count.ToString();
                if (!scDoctos.Panel2Collapsed)
                    dgvHijos.DataSource = listDoctosHijosTMP.OrderBy(item => item.Vencimiento).ThenBy(item => item.ID).ToList();
                txtPadreBonificacion.Text = docPadre.TieneBonificacion;
            }
        }


        /// <summary>
        /// Valida los importes de a pagar.
        /// </summary>
        /// <param name="padreMavi"></param>
        /// <param name="padreIdMavi"></param>
        private void CambiosEnImportesCobro(string padreMavi, string padreIdMavi)
        {

        }


        /// <summary>
        /// Oculta las pestañas a las que no se les va a pagar nada.
        /// </summary>
        private void OcultarPestañasCobro()
        {
            if (tabPagesCliente.Count > 1)
            {
                if (listDoctosPadres.Exists(padre => padre.ImportePagar > 0 || padre.ACondonar > 0 || padre.SolicitarApoyo))
                {
                    //Quitar TabControl no compatibles.
                    foreach (TabPage tab in tcDoctos.TabPages)
                    {
                        if (tab != tcDoctos.SelectedTab)
                            tcDoctos.TabPages.Remove(tab);
                    }
                }
                else
                {
                    if (!pGeneraCobro.Visible)
                    {
                        int idx = 0;
                        foreach (TabPage tab in tabPagesCliente)
                        {
                            if (!tcDoctos.TabPages.Contains(tab))
                                tcDoctos.TabPages.Insert(idx, tab);
                            idx += 1;
                        }
                    }
                }
            }
        }





        


        
        #endregion

        #region "Eventos"
        public frmPreliminarCobro()
        {
            InitializeComponent();
            CargarDatosIniciales();
        }

        private void frmPrincipal_Load(object sender, EventArgs e)
        {
            scDoctos.Panel2Collapsed = true;
            CargarPermisosUsuario();
            LimpiarCampos();
            btnHerramientas.PerformClick();
        }

        private void frmPreliminarCobro_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
                e.Cancel = MessageBox.Show("¿Está seguro de salir de la aplicación?", this.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No;

            if (!e.Cancel)
            {
                
                this.Hide();
                if (frmLoading != null) frmLoading.Dispose();
                Environment.Exit(Environment.ExitCode);
            }
        }

        private void frmPreliminarCobro_KeyDown(object sender, KeyEventArgs e)
        {
            
        }

        private void txt_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;

                if (e.KeyChar == (char)13)
                {
                    if (txt == txtCteBusca ||
                       txt == txtCteNomBusca ||
                       txt == txtCteDirBusca ||
                       txt == txtCteTelBusca ||
                       txt == txtCteCPBusca)
                        BuscarCliente();
                }

                if (txt == txtCteBusca)
                {
                    Controllers.FuncionesGlobales.TextBox_SoloLetraNum(txt, e);
                }
                else if (txt == txtCteNomBusca)
                {
                    Controllers.FuncionesGlobales.TextBox_SoloLetra(txt, e);
                }
                else if (txt == txtCteDirBusca)
                {
                    if (e.KeyChar != 35)
                        Controllers.FuncionesGlobales.TextBox_SoloLetraNum(txt, e);
                }
                else if (txt == txtCteTelBusca || txt == txtCteCPBusca)
                {
                    Controllers.FuncionesGlobales.TextBox_SoloNum(txt, e);
                }


            }
        }

        private void txt_Enter(object sender, EventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;

                if (txt == txtCteBusca ||
                     txt == txtCteNomBusca ||
                     txt == txtCteDirBusca ||
                     txt == txtCteTelBusca ||
                     txt == txtCteCPBusca)
                    txt.SelectAll();
            }
        }

        private void txt_Leave(object sender, EventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;

                if (txt == txtCteBusca)
                {
                    string errores = ValidaCuentaTarjeta();
                    if (errores != "")
                    {
                        MessageBox.Show(errores, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
                        txtCteBusca.Focus();
                    }
                }
            }
        }

        private void txt_KeyUp(object sender, KeyEventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;

                if (txt == txtFiltrosPadres)
                {
                    LlenaDoctosPadres(calculoTotal: false, soloImportesAPagar: pGeneraCobro.Visible);
                    txtFiltrosPadres.Focus();
                }

            }
        }

        private void txt_Validated(object sender, EventArgs e)
        {

        }

        private void txt_TextChanged(object sender, EventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;

                if (txt == txtCteBusca)
                {
                    txtCteNomBusca.Enabled = txtCteBusca.Text.Trim() == "";
                    txtCteDirBusca.Enabled = txtCteBusca.Text.Trim() == "";
                    txtCteTelBusca.Enabled = txtCteBusca.Text.Trim() == "";
                    txtCteCPBusca.Enabled = txtCteBusca.Text.Trim() == "";
                    txtCteBusca.MaxLength = Controllers.FuncionesGlobales.EsEntero(txtCteBusca.Text) || txtCteBusca.Text == "" ? 16 : 22;
                }
                else if (txt == txtCteNomBusca || txt == txtCteDirBusca || txt == txtCteTelBusca || txt == txtCteCPBusca)
                {
                    txtCteBusca.Enabled = txtCteNomBusca.Text.Trim() == "" && txtCteDirBusca.Text.Trim() == "" && txtCteTelBusca.Text.Trim() == "" && txtCteCPBusca.Text.Trim() == "";
                }
            }
        }

        private void btnConCte_Click(object sender, EventArgs e)
        {
            if (sender is Button)
            {
                if (Global.clienteInfo != null)
                {
                    var btn = (Button)sender;

                    if (btn == btnVerGenerarCobro)
                    {
                        MessageBox.Show("btnVerGenerarCobro eliminado para mantener simple el ejercicio");
                    }
                    else if (btn == btnGenerarCobros)
                    {
                        MessageBox.Show("btnGenerarCobros eliminado para mantener simple el ejercicio");
                    }
                    else if (btn == btnSalirCobro)
                    {
                        MessageBox.Show("btnSalirCobro eliminado para mantener simple el ejercicio");
                    }
                    
                }
                else
                {
                    MessageBox.Show("Debe consular un cliente.", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    this.ActiveControl = txtCteBusca;
                }
            }
        }

        private void btn_Click(object sender, EventArgs e)
        {
            
        }

        private void tcDoctos_SelectedIndexChanged(object sender, EventArgs e)
        {
            MostrarOcultarColumnas();
            LlenaDoctosPadres(calculoTotal: true, soloImportesAPagar: false);
        }

        private void tcDoctos_Selecting(object sender, TabControlCancelEventArgs e)
        {
            if (tcDoctos.TabCount - 1 < e.TabPageIndex)
                e.Cancel = true;
        }

        private void dgvPadres_KeyDown(object sender, KeyEventArgs e)
        {
            DataGridViewCell cell = dgvPadres.CurrentCell;
            if (cell != null &&
                (dgvPadres.Columns[cell.ColumnIndex].Name == "ImporteaPagar" ||
                 dgvPadres.Columns[cell.ColumnIndex].Name == "ACondonar"))
            {
                if (e.KeyCode == Keys.Delete || e.KeyCode == Keys.Back)
                {
                    dgvPadres.BeginEdit(true);
                    SendKeys.Send("{DELETE}");
                }
            }
        }

        private void dgvPadres_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            string padreMAVI = dgvPadres.Rows[e.RowIndex].Cells["PadreMAVI"].Value.ToString();
            string padreIDMAVI = dgvPadres.Rows[e.RowIndex].Cells["PadreIDMAVI"].Value.ToString();
            var padre = listDoctosPadres.Find(item => item.PadreMAVI == padreMAVI && item.PadreIDMAVI == padreIDMAVI);

            if (pGeneraCobro.Visible && !dgvPadres.Rows[e.RowIndex].Cells["SolicitarApoyo"].ReadOnly)
                dgvPadres.Rows[e.RowIndex].Cells["SolicitarApoyo"].ReadOnly = (padre.RfcCteFinal != null && padre.RfcCteFinal.Length > 10 ? padre.RfcCteFinal.Substring(0, 10) : padre.RfcCteFinal) == (Global.clienteInfo.Rfc != null && Global.clienteInfo.Rfc.Length > 10 ? Global.clienteInfo.Rfc.Substring(0, 10) : Global.clienteInfo.Rfc);
            LlenaInfoPadre(padreMAVI, padreIDMAVI);
        }

        private void dgvPadres_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvPadres.CurrentCell != null)
            {
                dgvPadres.Rows[e.RowIndex].ErrorText = string.Empty;
                string padreMavi = dgvPadres.CurrentRow.Cells["PadreMAVI"].Value.ToString();
                string padreIdMavi = dgvPadres.CurrentRow.Cells["PadreIDMAVI"].Value.ToString();

                OcultarPestañasCobro();
                CambiosEnImportesCobro(padreMavi, padreIdMavi);
            }
        }

        private void dgvPadres_ColumnHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (!dgvPadres.IsInEditMode())
            {
                if (((DataGridView)sender).Columns[e.ColumnIndex].SortMode != DataGridViewColumnSortMode.NotSortable)
                {
                    DataGridViewCell currentCell = ((DataGridView)sender).CurrentCell;
                    SortOrder direccion = ((DataGridView)sender).Columns[e.ColumnIndex].HeaderCell.SortGlyphDirection;
                    if (direccion == SortOrder.Ascending)
                        direccion = SortOrder.Descending;
                    else
                        direccion = SortOrder.Ascending;

                    Controllers.FuncionesGlobales.OrdenarDatos(ref listDoctosPadres, ((DataGridView)sender).Columns[e.ColumnIndex].DataPropertyName, direccion);
                    LlenaDoctosPadres(calculoTotal: false, soloImportesAPagar: pGeneraCobro.Visible);
                    ((DataGridView)sender).Columns[e.ColumnIndex].HeaderCell.SortGlyphDirection = direccion;
                    if (((DataGridView)sender).Rows.Count > 0) ((DataGridView)sender).CurrentCell = ((DataGridView)sender).Rows[0].Cells[e.ColumnIndex];
                }
            }
        }

        private void dgvPadres_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {
            if (dgvPadres.Columns[dgvPadres.CurrentCell.ColumnIndex].Name == "ImporteaPagar" || dgvPadres.Columns[dgvPadres.CurrentCell.ColumnIndex].Name == "ACondonar")
            {
                e.Control.Name = dgvPadres.Columns[dgvPadres.CurrentCell.ColumnIndex].Name;
                e.Control.KeyPress += new KeyPressEventHandler(dgvPadresTextBox_KeyPress);
                e.Control.KeyDown += new KeyEventHandler(dgvPadresTextBox_KeyDown);
            }
        }

        private void dgvPadres_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            foreach (DataGridViewRow row in dgvPadres.Rows)
            {
                if (dgvPadres.Columns["ImporteaPagar"] != null && dgvPadres.Columns["ImporteaPagar"].Visible)
                    row.Cells["ImporteaPagar"].Style.BackColor = ColorTranslator.FromHtml("#E1E2E1");
                if (dgvPadres.Columns["ACondonar"] != null && dgvPadres.Columns["ACondonar"].Visible)
                    row.Cells["ACondonar"].Style.BackColor = ColorTranslator.FromHtml("#E1E2E1");
            }
        }

        private void dgvPadres_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            if (dgvPadres.Columns[e.ColumnIndex].Name == "ImporteaPagar" || dgvPadres.Columns[e.ColumnIndex].Name == "ACondonar")
                e.Cancel = true;
        }

        private void dgvPadresTextBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;
                Controllers.FuncionesGlobales.TextBox_Decimales(txt, e);
            }
        }

        private void dgvPadresTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;

                if (e.Control && e.KeyCode == Keys.V)
                    e.SuppressKeyPress = true;
            }
        }

        private void cmsMenuPadres_Opening(object sender, CancelEventArgs e)
        {
            if (dgvPadres.CurrentRow != null)
            {
                string padreMAVI = dgvPadres.CurrentRow.Cells["PadreMAVI"].Value.ToString();
                string padreIDMAVI = dgvPadres.CurrentRow.Cells["PadreIDMAVI"].Value.ToString();
                var padre = listDoctosPadres.Find(item => item.PadreMAVI == padreMAVI && item.PadreIDMAVI == padreIDMAVI);


                btnVerDetalle.Visible = scDoctos.Panel2Collapsed;
                btnOcultaDetalle.Visible = !scDoctos.Panel2Collapsed;

            }
        }

        private void cmsMenuPadres_btn_ClickAsync(object sender, EventArgs e)
        {
            if (sender is ToolStripMenuItem && dgvPadres.CurrentRow != null)
            {
                var btn = (ToolStripMenuItem)sender;
                string padreMavi = dgvPadres.CurrentRow.Cells["PadreMAVI"].Value.ToString();
                string padreIdMavi = dgvPadres.CurrentRow.Cells["PadreIDMAVI"].Value.ToString();
 

                if (btn == btnVerDetalle)
                {
                    scDoctos.Panel2Collapsed = false;
                    LlenaInfoPadre(padreMavi, padreIdMavi);
                }
                else if (btn == btnOcultaDetalle)
                {
                    scDoctos.Panel2Collapsed = true;
                    dgvHijos.DataSource = null;
                }
 


            }
        }

        

        #endregion
    }
}