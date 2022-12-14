
GO
/****** Object:  Table [dbo].[EmpresaCfg2]    Script Date: 23/09/2022 06:57:06 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpresaCfg2](
	[Empresa] [varchar](5) NOT NULL,
	[CxcPosfechados] [bit] NOT NULL,
	[CxpPosfechados] [bit] NOT NULL,
	[MultiUnidades] [bit] NOT NULL,
	[VentaInstrucciones] [bit] NOT NULL,
	[FacturaCobroIntegrado] [bit] NOT NULL,
	[PrecioNivelUnidad] [bit] NULL,
	[Logico1] [bit] NOT NULL,
	[Logico2] [bit] NOT NULL,
	[Logico3] [bit] NOT NULL,
	[Logico4] [bit] NOT NULL,
	[Logico5] [bit] NOT NULL,
	[VentaMultiDepartamento] [bit] NOT NULL,
	[VentaMultiAgente] [bit] NOT NULL,
	[VentaDMultiAgente] [bit] NOT NULL,
	[VentaDMultiAgenteSugerir] [bit] NULL,
	[InvVerPuntoOrden] [bit] NOT NULL,
	[ProdDesglosarGrupoSolicitud] [bit] NOT NULL,
	[GastoSolicitudAnticipoImpuesto] [bit] NOT NULL,
	[GastoCopiarImporte] [bit] NOT NULL,
	[ProdMermaIncluida] [bit] NOT NULL,
	[ProdDesperdicioIncluido] [bit] NOT NULL,
	[ValidarLotesCostoDif] [bit] NOT NULL,
	[CxpAplicaDif] [bit] NOT NULL,
	[CxcAplicaDif] [bit] NOT NULL,
	[ProdDesglosarDestinoCompra] [bit] NOT NULL,
	[ProdDesglosarDestinoProducto] [bit] NOT NULL,
	[ProdDesglosarDestinoSolicitud] [bit] NOT NULL,
	[GastoCantidades] [bit] NOT NULL,
	[ProdAutoReservar] [bit] NOT NULL,
	[VentaDevSinAntecedente] [bit] NOT NULL,
	[VentaDevSeriesSinAntecedente] [bit] NOT NULL,
	[VIN] [bit] NOT NULL,
	[VINAccesorioArt] [bit] NULL,
	[VINCostoSumaAccesorios] [bit] NULL,
	[CxcTramites] [bit] NOT NULL,
	[InvMultiAlmacen] [bit] NOT NULL,
	[VentaMultiAlmacen] [bit] NOT NULL,
	[AutoAsignarBackOrders] [bit] NOT NULL,
	[VentaAutoBloqueo] [bit] NOT NULL,
	[AgentMonedaCont] [bit] NOT NULL,
	[CxpMonedaCont] [bit] NOT NULL,
	[CxcMonedaCont] [bit] NOT NULL,
	[FacturasPendientesSerieLote] [bit] NOT NULL,
	[CompraBonifConsecutivoIndep] [bit] NOT NULL,
	[CompraDevConsecutivoIndep] [bit] NOT NULL,
	[VentaDevConsecutivoIndep] [bit] NOT NULL,
	[VentaBonifConsecutivoIndep] [bit] NOT NULL,
	[CxcComisionCreditos] [bit] NOT NULL,
	[CxcComisionCreditoDiverso] [bit] NOT NULL,
	[ProdFactorDinamico] [bit] NOT NULL,
	[InvFactorDinamico] [bit] NOT NULL,
	[VentaFactorDinamico] [bit] NOT NULL,
	[CompraFactorDinamico] [bit] NOT NULL,
	[AutoAjustarArtUnidadFactor] [bit] NULL,
	[Gasto2Retenciones] [bit] NOT NULL,
	[Gasto3Retenciones] [bit] NOT NULL,
	[CompraRecibirDemas] [bit] NOT NULL,
	[CompraRecibirDemasTolerancia] [float] NULL,
	[VentaDFechaRequerida] [bit] NOT NULL,
	[VentaDHoraRequerida] [bit] NOT NULL,
	[CxpAplicaManualDef] [bit] NOT NULL,
	[CxcAplicaManualDef] [bit] NOT NULL,
	[CxcAnticiposFacturados] [bit] NOT NULL,
	[Logico51] [bit] NOT NULL,
	[Logico52] [bit] NOT NULL,
	[ProdAlmacenMP] [varchar](10) NULL,
	[ProdAlmacenProcesoDef] [varchar](10) NULL,
	[ProdTipoOpcionDef] [varchar](20) NULL,
	[Logico53] [bit] NOT NULL,
	[Logico54] [bit] NOT NULL,
	[NivelFactorMultiUnidad] [varchar](20) NULL,
	[ProdAutoLote] [varchar](20) NULL,
	[ProdAutoCB] [varchar](20) NULL,
	[PlanAfectarOrdenesDistribucion] [bit] NULL,
	[ProdLoteOrdenar] [varchar](30) NULL,
	[ProdAccionOrdenar] [varchar](50) NULL,
	[ProdGenerarConsumo] [bit] NOT NULL,
	[ProdAfectarConsumo] [bit] NULL,
	[OpcionMatriz] [bit] NULL,
	[ProdProgramar] [bit] NULL,
	[ProdDiasFestivos] [bit] NULL,
	[Mermas] [bit] NULL,
	[Desperdicios] [bit] NULL,
	[RetencionAlPago] [bit] NULL,
	[RetencionAlPagoMovImpuesto] [bit] NULL,
	[GastoRetencionAcreedor] [varchar](10) NULL,
	[GastoRetencionConcepto] [varchar](50) NULL,
	[GastoRetencion2Acreedor] [varchar](10) NULL,
	[GastoRetencion2Concepto] [varchar](50) NULL,
	[GastoRetencion3Acreedor] [varchar](10) NULL,
	[GastoRetencion3Concepto] [varchar](50) NULL,
	[VentaArtAlmacenEspecifico] [bit] NULL,
	[RutaDistribucion] [varchar](50) NULL,
	[RutaDistribucionNivelArticulo] [bit] NULL,
	[CodigoCliente] [bit] NULL,
	[CxcDescuentoRecargos] [bit] NULL,
	[CxpDescuentoRecargos] [bit] NULL,
	[CompraMultiAlmacen] [bit] NOT NULL,
	[PlanNivelAlmacen] [bit] NULL,
	[CompraAutoCargos] [bit] NULL,
	[GastoAutoCargos] [bit] NULL,
	[PlanSinDemanda] [bit] NULL,
	[PlanISDemanda] [bit] NULL,
	[ProdTipoMerma] [varchar](1) NULL,
	[PlanMetodo] [varchar](20) NULL,
	[PlanTESeguridad] [bit] NULL,
	[PlanIgnorarZonaCongelada] [bit] NULL,
	[ComisionAnticipos] [varchar](20) NULL,
	[VentaDescuentoImporte] [bit] NULL,
	[CompraDescuentoImporte] [bit] NULL,
	[PlanLiberarCompra] [varchar](30) NULL,
	[PlanLiberarProduccion] [varchar](30) NULL,
	[PlanLiberarDistribucion] [varchar](30) NULL,
	[VentaBonificacionAuto] [bit] NULL,
	[PlanInvSeguridadDias] [int] NULL,
	[PlanInvSeguridadFactor] [float] NULL,
	[CxpAplicacionPagos] [bit] NULL,
	[VentaSolicitarPrecios] [bit] NULL,
	[CxcDegloseDef] [bit] NULL,
	[CxpAfectarPagosAutomaticos] [bit] NULL,
	[GastoValidarPresupuesto] [bit] NULL,
	[GastoValidarPresupuestoCC] [bit] NULL,
	[GastoValidarPresupuestoFR] [bit] NULL,
	[ProvPresupuesto] [varchar](10) NULL,
	[CxcDiasMorosidad] [int] NULL,
	[CxpDiasMorosidad] [int] NULL,
	[ProdTransferenciaConcentrada] [bit] NULL,
	[GastoActividad] [bit] NULL,
	[GastoProyectoDetalle] [bit] NULL,
	[CxcCobroImpuestos] [bit] NULL,
	[CompraSugerirUltimoCostoProv] [bit] NULL,
	[ProdPeriodosCorrida] [int] NULL,
	[PlanCalcATP] [bit] NULL,
	[PlanAbortarPrimerError] [bit] NULL,
	[FiscalVerIVA] [bit] NULL,
	[FiscalVerIEPS] [bit] NULL,
	[FiscalVentaImpuesto3] [varchar](255) NULL,
	[FiscalCompraImpuesto3] [varchar](255) NULL,
	[FiscalInicioIVA] [datetime] NULL,
	[ProdAfectarConsumoParcial] [bit] NULL,
	[PlanEstadoOmision] [varchar](20) NULL,
	[PlanCorridaOrden] [varchar](50) NULL,
	[VentaLimiteNivelSucursal] [bit] NULL,
	[InvRegistrarPrecios] [bit] NULL,
	[CxcAutoAplicarAnticiposPedidos] [bit] NULL,
	[PlanUnidadDistribucion] [varchar](20) NULL,
	[MargenNivelListaPrecios] [bit] NULL,
	[FacturarSustitutos] [bit] NULL,
	[FacturarSustitutosOpciones] [bit] NULL,
	[FacturarSustitutosPrecios] [bit] NULL,
	[GastoUENDetalle] [bit] NULL,
	[VentaUENDetalle] [bit] NULL,
	[PlanTipoPeriodo] [varchar](20) NULL,
	[AutoAutorizacionFacturas] [bit] NULL,
	[VentaEspacioDetalle] [bit] NULL,
	[CompraCostosImpuestoIncluido] [bit] NULL,
	[CompraRetenciones] [bit] NULL,
	[ComisionesCobranza] [bit] NULL,
	[VentaRenCompletosFactRapida] [bit] NULL,
	[BloquearOpcionesArtConMovs] [bit] NULL,
	[CxcVerRetencion] [bit] NULL,
	[DecimalesCantidadPendiente] [int] NULL,
	[GastoClaseRequerida] [bit] NOT NULL,
	[GastoAFDetalle] [bit] NULL,
	[AutoOperadorMaxDescuento] [float] NULL,
	[AutoArtComision] [varchar](20) NULL,
	[AutoArtPension] [varchar](20) NULL,
	[AutoMovPension] [varchar](20) NULL,
	[AutoArtMantExterno] [varchar](20) NULL,
	[AutoArtBA] [varchar](20) NULL,
	[AutoArtBT] [varchar](20) NULL,
	[AutoArtBX] [varchar](20) NULL,
	[AutoMultiplesPapeletas] [bit] NULL,
	[AutoAlmacenBX] [varchar](10) NULL,
	[AutoOperadorComision] [float] NULL,
	[AutoKmsMaximos] [int] NULL,
	[AutoCANAPAT] [bit] NULL,
	[GastoAyudaConceptos] [varchar](20) NULL,
	[CompraSugerirArtR] [bit] NULL,
	[CompraSugerirUnidadDemanda] [bit] NULL,
	[PCParcial] [bit] NULL,
	[PCBaja] [bit] NULL,
	[PCRecalcPrecioFinVigencia] [bit] NULL,
	[PlanIgnorarDemandaDirecta] [bit] NULL,
	[VentaSubMovimientos] [bit] NULL,
	[VentaAnexarMov] [bit] NULL,
	[VentaAnexarOrdenes] [bit] NULL,
	[VentaVerImpuesto1] [bit] NULL,
	[VentaVerImpuesto2] [bit] NULL,
	[VentaVerImpuesto3] [bit] NULL,
	[VentaPresupuestosPendientes] [bit] NULL,
	[CxcSugerirProntoPago] [bit] NULL,
	[ProdVerPersonal] [bit] NULL,
	[ProdVerTurno] [bit] NULL,
	[ProdVerTiempo] [bit] NULL,
	[ProdVerTiempoMuerto] [bit] NULL,
	[ProdVerManoObra] [bit] NULL,
	[ProdVerMaquila] [bit] NULL,
	[ProdVerIndirectos] [bit] NULL,
	[CxcEnviarABeneficiario] [bit] NULL,
	[GastoDiversoReferenciaCxp] [bit] NULL,
	[GastoBorradorComprobantes] [bit] NULL,
	[GastoBorradorCajaChica] [bit] NULL,
	[GastoGenerarAnticiposBorrador] [bit] NULL,
	[AgentAfectarGastos] [bit] NULL,
	[AgentConceptoGastos] [varchar](50) NULL,
	[AgentImpRetencionConcepto] [bit] NULL,
	[VentaAFDetalle] [bit] NULL,
	[VentaRestringida] [bit] NULL,
	[VentaExcluirPlaneacionDetalle] [bit] NULL,
	[ProdVolumen] [bit] NULL,
	[PlanAutoGuardarHist] [bit] NULL,
	[CompraCaducidad] [bit] NULL,
	[BloquearCantidadInventario] [bit] NULL,
	[VentaValidarFechaRequerida] [bit] NULL,
	[CompraValidarFechaRequerida] [bit] NULL,
	[VentaDevAutoAplicar] [bit] NULL,
	[CompraDevAutoAplicar] [bit] NULL,
	[InvFrecuenciaABCDiasHabiles] [bit] NULL,
	[GastoCxc] [bit] NULL,
	[PlanBasePresupuesto] [bit] NULL,
	[VentaEnviarADetalle] [bit] NULL,
	[VentaMonedero] [bit] NULL,
	[VentaPuntosEnVales] [bit] NULL,
	[VentaPuntosArtCat] [bit] NULL,
	[AlmacenOrigenOT] [varchar](30) NULL,
	[GastoDiversoSinProrratear] [varchar](20) NULL,
	[FacturaCobroIntegradoParcial] [bit] NULL,
	[CxcRecorrerVenceRevisionPago] [bit] NULL,
	[PlanRecorrerLiberacion] [bit] NULL,
	[PeruRetenciones] [bit] NULL,
	[PeruRetencionesTopeExcento] [money] NULL,
	[CompraDescuentoCascadaDetalle] [bit] NULL,
	[ArtDescuentoCompraCascada] [bit] NULL,
	[InvAjusteCargoAgente] [varchar](20) NULL,
	[GastoConceptoCxp] [bit] NULL,
	[InvVerDescripcionExtra] [bit] NULL,
	[GastoPersonal] [bit] NULL,
	[GastoProvisionTolerancia] [float] NULL,
	[InvAjusteSaldosMenores] [float] NULL,
	[CompraGastoDiversoCxc] [bit] NULL,
	[GastoAnticipoCxp] [bit] NULL,
	[PlanInicio] [varchar](20) NULL,
	[CBSugerir] [varchar](20) NULL,
	[CxcDocAutoBorrador] [bit] NULL,
	[CxpDocAutoBorrador] [bit] NULL,
	[PlanNivelArtAutoRecalc] [bit] NULL,
	[CompraPresupuestosPendientes] [bit] NULL,
	[ConcToleranciaDec] [int] NULL,
	[ConcGastosAuto] [bit] NULL,
	[ConcGastosAutoConceptoFijo] [varchar](50) NULL,
	[ConcRepetirFecha] [bit] NULL,
	[ConcDiasCargos] [int] NULL,
	[ConcDiasAbonos] [int] NULL,
	[PCListaModificarDetalle] [bit] NULL,
	[PCPrecioNuevoForma] [varchar](20) NULL,
	[PCSugerir] [bit] NULL,
	[ArtProvSucursalCompra] [bit] NULL,
	[OfertaFechaHora] [varchar](20) NULL,
	[OfertaModificarTipo] [bit] NULL,
	[VentaVerCosto] [bit] NULL,
	[PC_H1] [bit] NULL,
	[PC_H2] [bit] NULL,
	[VentaArtEstatus] [bit] NULL,
	[VentaArtSituacion] [bit] NULL,
	[GastoClienteRef] [bit] NULL,
	[GastoArticuloRef] [bit] NULL,
	[ConcNoSugerirImportesDup] [bit] NULL,
	[ConcSugerirDespuesPeriodo] [bit] NULL,
	[GastoSugerirCostoEstandar] [bit] NULL,
	[CxpPagarEnLoteEvaluacion] [varchar](50) NULL,
	[FiscalSugerirCxc] [bit] NULL,
	[MontoMinCobTelMavi] [money] NULL,
	[MontoMinMoratorioMAVI] [float] NULL,
	[CxcSaldoCero] [int] NULL,
	[VentaEspacioCantidadMetros] [bit] NULL,
	[GastoConceptosInventariables] [bit] NULL,
	[GastoAlmacen] [varchar](10) NULL,
	[GastoInvCopiarMov] [bit] NULL,
	[CxpPagoTasa] [bit] NULL,
	[GastoPresupuestoPendiente] [bit] NULL,
	[FiscalOmitirDepositoAntCxc] [bit] NULL,
	[FiscalOmitirChAntCxp] [bit] NULL,
	[FiscalOmitirCobrosChDevCxc] [bit] NULL,
	[FiscalOmitirPagosChDevCxp] [bit] NULL,
	[FiscalOmitirPagosEndosoCxp] [bit] NULL,
	[FiscalRegAplicaAnticipoCxc] [bit] NULL,
	[FiscalRegAplicaFacturaCxc] [bit] NULL,
	[FiscalRegAplicaAnticipoCxp] [bit] NULL,
	[FiscalRegAplicaFacturaCxp] [bit] NULL,
	[ConcImportesLejanos] [bit] NULL,
	[ConcTraslaparFecha] [bit] NULL,
	[GastoRecurso] [bit] NULL,
	[MAFInspeccionUsuario] [varchar](10) NULL,
	[MAFServicioTaller] [varchar](10) NULL,
	[MAFServicioUsuario] [varchar](10) NULL,
	[MAFServicioMov] [varchar](20) NULL,
	[MAFServicioConcepto] [varchar](50) NULL,
	[MAFServicioCliente] [varchar](10) NULL,
	[ProdSerieloteIndicarArrastre] [bit] NULL,
	[ProdValidarSLEntradaProduccion] [bit] NULL,
	[CXPReferenciaEnAnticiposCP] [bit] NULL,
	[CxcGenerarEnBorrador] [bit] NULL,
	[CxpGenerarEnBorrador] [bit] NULL,
	[CompraMultiEmpresas] [bit] NULL,
	[CompraPresupuestosCategoria] [bit] NULL,
	[CompraABC] [bit] NULL,
	[GastoABC] [bit] NULL,
	[VentaABC] [bit] NULL,
	[ConcPolizaGenerar] [bit] NULL,
	[CompraAutoCancelaCotizacion] [bit] NULL,
	[PlanPlanearServicios] [bit] NULL,
	[VentaCteArtEmpaqueCorrugado] [bit] NULL,
	[VentaVerPesoVolumen] [bit] NULL,
	[OfertaNivelOpcion] [bit] NULL,
	[InvCostearTransferencias] [bit] NULL,
	[CompraVerImpuesto1] [bit] NULL,
	[CompraVerImpuesto2] [bit] NULL,
	[CompraVerImpuesto3] [bit] NULL,
	[CompraVerImpuesto4] [bit] NULL,
	[CompraVerImpuesto5] [bit] NULL,
	[CompraVerRetencion1] [bit] NULL,
	[CompraVerRetencion2] [bit] NULL,
	[CompraVerRetencion3] [bit] NULL,
	[GastoVerImpuesto1] [bit] NULL,
	[GastoVerImpuesto2] [bit] NULL,
	[GastoVerImpuesto3] [bit] NULL,
	[GastoVerImpuesto4] [bit] NULL,
	[GastoVerImpuesto5] [bit] NULL,
	[GastoVerRetencion1] [bit] NULL,
	[GastoVerRetencion2] [bit] NULL,
	[GastoVerRetencion3] [bit] NULL,
	[GastoImporteConImpuesto] [bit] NULL,
	[ProdSerieLoteDesdeOrden] [bit] NULL,
	[FiscalGenerarRetenciones] [bit] NULL,
	[EmbarqueSumaArtJuego] [varchar](20) NOT NULL,
	[GASCIMovEntrada] [varchar](20) NULL,
	[GASCIMovSalida] [varchar](20) NULL,
	[GasConceptoMultiple] [bit] NULL,
	[CxcAnticipoTipoServicio] [bit] NULL,
	[CxcAnticipoArticuloServicio] [varchar](20) NULL,
	[VentaVerRetencion1] [bit] NULL,
	[VentaVerRetencion2] [bit] NULL,
	[VentaVerRetencion3] [bit] NULL,
	[CxcVerRetencion2] [bit] NULL,
	[CxcVerRetencion3] [bit] NULL,
	[BloquearFacturaOtraSucursal] [bit] NULL,
	[InvValuacionOtraMoneda] [varchar](10) NULL,
	[GASRetencion3Independiente] [bit] NULL,
	[CXCDTotalizarRedondeo] [bit] NOT NULL,
	[CXPDTotalizarRedondeo] [bit] NOT NULL,
	[VTASValidarFechaAplicacion] [varchar](10) NULL,
	[COMSValidarFechaAplicacion] [varchar](10) NULL,
	[INVValidarFechaAplicacion] [varchar](10) NULL,
	[CXCValidarFechaAplicacion] [varchar](10) NULL,
	[CXPValidarFechaAplicacion] [varchar](10) NULL,
	[DINValidarFechaAplicacion] [varchar](10) NULL,
	[GASValidarFechaAplicacion] [varchar](10) NULL,
	[PRODValidarFechaAplicacion] [varchar](10) NULL,
	[OPORTTareaEstado] [varchar](30) NULL,
	[CONTPConcluirPaquete] [bit] NOT NULL,
	[CONTPMaximoDiasPaquete] [int] NOT NULL,
	[CONTPConcluirPolizas] [bit] NOT NULL,
	[CONTPEnLinea] [bit] NOT NULL,
	[OfertaAplicaLog] [bit] NULL,
	[OfertaAplicaLogPOS] [bit] NULL,
	[OfertaPorPartidaPOS] [bit] NULL,
	[AgruparConceptoSATRetenciones] [bit] NULL,
	[VentaMonederoA] [bit] NULL,
	[ProdTextil] [bit] NULL,
	[ProdAvanzada] [bit] NULL,
	[ProdRutaSecuencial] [bit] NULL,
	[ProdAvanceCompleto] [bit] NULL,
	[ProdControlTiempos] [bit] NULL,
	[ProdDetallada] [bit] NULL,
	[ProdDirectorioVertical] [bit] NULL,
	[ProdDestajo] [bit] NOT NULL,
	[ProdDestajoMetodo] [varchar](15) NULL,
	[ProdDestajoSueldoBase] [money] NULL,
	[ProdDestajoEficienciaMaxima] [int] NULL,
	[ProdDestajoEficienciaSustituye] [int] NULL,
	[EntImportTipoCambioEncabezado] [bit] NULL,
	[vicMontoBaseMoratorios] [varchar](20) NULL,
	[vicGenFacturaAlCompletar] [bit] NULL,
	[vicGenFacturaMovGenerar] [varchar](20) NULL,
	[vicGenFacturaMovCobro] [varchar](max) NULL,
 CONSTRAINT [priEmpresaCfg2] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcPosfechados]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpPosfechados]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [MultiUnidades]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaInstrucciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FacturaCobroIntegrado]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PrecioNivelUnidad]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico4]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico5]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaMultiDepartamento]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaMultiAgente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDMultiAgente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDMultiAgenteSugerir]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [InvVerPuntoOrden]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDesglosarGrupoSolicitud]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [GastoSolicitudAnticipoImpuesto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [GastoCopiarImporte]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdMermaIncluida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDesperdicioIncluido]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ValidarLotesCostoDif]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpAplicaDif]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcAplicaDif]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDesglosarDestinoCompra]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDesglosarDestinoProducto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDesglosarDestinoSolicitud]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [GastoCantidades]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdAutoReservar]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDevSinAntecedente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [VentaDevSeriesSinAntecedente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VIN]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VINAccesorioArt]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VINCostoSumaAccesorios]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcTramites]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [InvMultiAlmacen]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaMultiAlmacen]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [AutoAsignarBackOrders]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaAutoBloqueo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [AgentMonedaCont]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpMonedaCont]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcMonedaCont]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FacturasPendientesSerieLote]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraBonifConsecutivoIndep]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraDevConsecutivoIndep]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDevConsecutivoIndep]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaBonifConsecutivoIndep]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcComisionCreditos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcComisionCreditoDiverso]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdFactorDinamico]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [InvFactorDinamico]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaFactorDinamico]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraFactorDinamico]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [AutoAjustarArtUnidadFactor]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Gasto2Retenciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Gasto3Retenciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraRecibirDemas]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDFechaRequerida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDHoraRequerida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpAplicaManualDef]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcAplicaManualDef]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcAnticiposFacturados]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico51]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico52]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico53]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [Logico54]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  CONSTRAINT [DF_EmpresaCfg2_NivelFactorMultiUnidad_72]  DEFAULT ('Unidad') FOR [NivelFactorMultiUnidad]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanAfectarOrdenesDistribucion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdGenerarConsumo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdAfectarConsumo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [OpcionMatriz]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdProgramar]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdDiasFestivos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [Mermas]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [Desperdicios]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [RetencionAlPago]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [RetencionAlPagoMovImpuesto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaArtAlmacenEspecifico]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [RutaDistribucionNivelArticulo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CodigoCliente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcDescuentoRecargos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpDescuentoRecargos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [CompraMultiAlmacen]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanNivelAlmacen]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraAutoCargos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoAutoCargos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [PlanSinDemanda]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanISDemanda]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  CONSTRAINT [DF_EmpresaCfg2_ProdTipoMerma_105]  DEFAULT ('%') FOR [ProdTipoMerma]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  CONSTRAINT [DF_EmpresaCfg2_PlanMetodo_106]  DEFAULT ('MRP') FOR [PlanMetodo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanTESeguridad]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanIgnorarZonaCongelada]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  CONSTRAINT [DF_EmpresaCfg2_ComisionAnticipos_109]  DEFAULT ('Aplicacion') FOR [ComisionAnticipos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDescuentoImporte]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraDescuentoImporte]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Orden por Proveedor') FOR [PlanLiberarCompra]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Orden por Seleccion') FOR [PlanLiberarProduccion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Orden por Almacen') FOR [PlanLiberarDistribucion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaBonificacionAuto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((7)) FOR [PlanInvSeguridadDias]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [PlanInvSeguridadFactor]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpAplicacionPagos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaSolicitarPrecios]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcDegloseDef]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpAfectarPagosAutomaticos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoValidarPresupuesto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoValidarPresupuestoCC]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoValidarPresupuestoFR]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  CONSTRAINT [DF_EmpresaCfg2_ProvPresupuesto_125]  DEFAULT ('PRESUP') FOR [ProvPresupuesto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((60)) FOR [CxcDiasMorosidad]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((60)) FOR [CxpDiasMorosidad]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdTransferenciaConcentrada]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoActividad]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoProyectoDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcCobroImpuestos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraSugerirUltimoCostoProv]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((10)) FOR [ProdPeriodosCorrida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [PlanCalcATP]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [PlanAbortarPrimerError]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalVerIVA]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalVerIEPS]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('0') FOR [FiscalVentaImpuesto3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('0') FOR [FiscalCompraImpuesto3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdAfectarConsumoParcial]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Plan') FOR [PlanEstadoOmision]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Articulo') FOR [PlanCorridaOrden]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaLimiteNivelSucursal]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [InvRegistrarPrecios]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcAutoAplicarAnticiposPedidos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Compra/Produccion') FOR [PlanUnidadDistribucion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [MargenNivelListaPrecios]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FacturarSustitutos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FacturarSustitutosOpciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FacturarSustitutosPrecios]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoUENDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaUENDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Semana') FOR [PlanTipoPeriodo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [AutoAutorizacionFacturas]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [VentaEspacioDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraCostosImpuestoIncluido]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraRetenciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ComisionesCobranza]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaRenCompletosFactRapida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [BloquearOpcionesArtConMovs]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcVerRetencion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((2)) FOR [DecimalesCantidadPendiente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoClaseRequerida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoAFDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((30)) FOR [AutoOperadorMaxDescuento]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('COMISION') FOR [AutoArtComision]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('BA') FOR [AutoArtBA]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('BT') FOR [AutoArtBT]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('BX') FOR [AutoArtBX]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [AutoMultiplesPapeletas]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('BX') FOR [AutoAlmacenBX]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [AutoCANAPAT]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Clasificacion') FOR [GastoAyudaConceptos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraSugerirArtR]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraSugerirUnidadDemanda]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PCParcial]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PCBaja]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PCRecalcPrecioFinVigencia]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanIgnorarDemandaDirecta]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaSubMovimientos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaAnexarMov]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaAnexarOrdenes]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerImpuesto1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerImpuesto2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerImpuesto3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaPresupuestosPendientes]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcSugerirProntoPago]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdVerPersonal]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdVerTurno]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdVerTiempo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdVerTiempoMuerto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdVerManoObra]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdVerMaquila]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ProdVerIndirectos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcEnviarABeneficiario]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoDiversoReferenciaCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoBorradorComprobantes]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoBorradorCajaChica]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoGenerarAnticiposBorrador]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [AgentAfectarGastos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [AgentImpRetencionConcepto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaAFDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaRestringida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaExcluirPlaneacionDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdVolumen]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanAutoGuardarHist]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraCaducidad]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [BloquearCantidadInventario]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaValidarFechaRequerida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraValidarFechaRequerida]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaDevAutoAplicar]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraDevAutoAplicar]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [InvFrecuenciaABCDiasHabiles]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoCxc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanBasePresupuesto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaEnviarADetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaMonedero]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaPuntosEnVales]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaPuntosArtCat]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Ruta Distribucion') FOR [AlmacenOrigenOT]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Gastos') FOR [GastoDiversoSinProrratear]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FacturaCobroIntegradoParcial]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcRecorrerVenceRevisionPago]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanRecorrerLiberacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PeruRetenciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraDescuentoCascadaDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ArtDescuentoCompraCascada]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [InvAjusteCargoAgente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoConceptoCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [InvVerDescripcionExtra]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoPersonal]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((10)) FOR [GastoProvisionTolerancia]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0.01)) FOR [InvAjusteSaldosMenores]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraGastoDiversoCxc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoAnticipoCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Hoy') FOR [PlanInicio]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [CBSugerir]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcDocAutoBorrador]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpDocAutoBorrador]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PlanNivelArtAutoRecalc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraPresupuestosPendientes]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((2)) FOR [ConcToleranciaDec]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ConcGastosAuto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ConcRepetirFecha]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PCListaModificarDetalle]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Metodos') FOR [PCPrecioNuevoForma]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PCSugerir]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ArtProvSucursalCompra]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Fecha Servidor') FOR [OfertaFechaHora]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [OfertaModificarTipo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerCosto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PC_H1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [PC_H2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaArtEstatus]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaArtSituacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoClienteRef]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoArticuloRef]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ConcNoSugerirImportesDup]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ConcSugerirDespuesPeriodo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoSugerirCostoEstandar]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalSugerirCxc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaEspacioCantidadMetros]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoConceptosInventariables]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoInvCopiarMov]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpPagoTasa]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoPresupuestoPendiente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalOmitirDepositoAntCxc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalOmitirChAntCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalOmitirCobrosChDevCxc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalOmitirPagosChDevCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalOmitirPagosEndosoCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalRegAplicaAnticipoCxc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalRegAplicaFacturaCxc]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalRegAplicaAnticipoCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalRegAplicaFacturaCxp]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [ConcImportesLejanos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ConcTraslaparFecha]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoRecurso]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdSerieloteIndicarArrastre]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdValidarSLEntradaProduccion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CXPReferenciaEnAnticiposCP]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcGenerarEnBorrador]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxpGenerarEnBorrador]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraMultiEmpresas]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraPresupuestosCategoria]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraABC]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoABC]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaABC]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ConcPolizaGenerar]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraAutoCancelaCotizacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [PlanPlanearServicios]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaCteArtEmpaqueCorrugado]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerPesoVolumen]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [OfertaNivelOpcion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [InvCostearTransferencias]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerImpuesto1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerImpuesto2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerImpuesto3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerImpuesto4]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerImpuesto5]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerRetencion1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerRetencion2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CompraVerRetencion3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerImpuesto1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerImpuesto2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerImpuesto3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerImpuesto4]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerImpuesto5]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerRetencion1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerRetencion2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoVerRetencion3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GastoImporteConImpuesto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdSerieLoteDesdeOrden]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [FiscalGenerarRetenciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('Articulo Juego') FOR [EmbarqueSumaArtJuego]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GasConceptoMultiple]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcAnticipoTipoServicio]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerRetencion1]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerRetencion2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaVerRetencion3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcVerRetencion2]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CxcVerRetencion3]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [BloquearFacturaOtraSucursal]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [GASRetencion3Independiente]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [CXCDTotalizarRedondeo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [CXPDTotalizarRedondeo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [VTASValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [COMSValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [INVValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [CXCValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [CXPValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [DINValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [GASValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No') FOR [PRODValidarFechaAplicacion]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ('No comenzada') FOR [OPORTTareaEstado]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CONTPConcluirPaquete]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((1)) FOR [CONTPMaximoDiasPaquete]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CONTPConcluirPolizas]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [CONTPEnLinea]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [AgruparConceptoSATRetenciones]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [VentaMonederoA]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdTextil]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdAvanzada]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdRutaSecuencial]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdAvanceCompleto]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdControlTiempos]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDetallada]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDirectorioVertical]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [ProdDestajo]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [EntImportTipoCambioEncabezado]
GO
ALTER TABLE [dbo].[EmpresaCfg2] ADD  DEFAULT ((0)) FOR [vicGenFacturaAlCompletar]
GO

INSERT INTO EmpresaCfg2(Empresa) VALUES('MAVI')
