
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 23/09/2022 09:09:24 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[ID] [int] /*IDENTITY(1,1) NOT FOR REPLICATION*/ NOT NULL,
	[Empresa] [varchar](5) NOT NULL,
	[Mov] [varchar](20) NOT NULL,
	[MovID] [varchar](20) NULL,
	[FechaEmision] [datetime] NULL,
	[UltimoCambio] [datetime] NULL,
	[Concepto] [varchar](50) NULL,
	[Proyecto] [varchar](50) NULL,
	[UEN] [int] NULL,
	[Moneda] [varchar](10) NOT NULL,
	[TipoCambio] [float] NULL,
	[Usuario] [varchar](10) NULL,
	[Autorizacion] [varchar](10) NULL,
	[Referencia] [varchar](50) NULL,
	[DocFuente] [int] NULL,
	[Observaciones] [varchar](255) NULL,
	[Estatus] [varchar](15) NULL,
	[Situacion] [varchar](50) NULL,
	[SituacionFecha] [datetime] NULL,
	[SituacionUsuario] [varchar](10) NULL,
	[SituacionNota] [varchar](100) NULL,
	[Directo] [bit] NOT NULL,
	[Prioridad] [varchar](10) NULL,
	[RenglonID] [int] NULL,
	[FechaOriginal] [datetime] NULL,
	[Codigo] [varchar](30) NULL,
	[Cliente] [varchar](10) NOT NULL,
	[EnviarA] [int] NULL,
	[Almacen] [varchar](10) NOT NULL,
	[AlmacenDestino] [varchar](10) NULL,
	[Agente] [varchar](10) NULL,
	[AgenteServicio] [varchar](10) NULL,
	[AgenteComision] [float] NULL,
	[FormaEnvio] [varchar](50) NULL,
	[FechaRequerida] [datetime] NULL,
	[HoraRequerida] [varchar](5) NULL,
	[FechaProgramadaEnvio] [datetime] NULL,
	[FechaOrdenCompra] [datetime] NULL,
	[ReferenciaOrdenCompra] [varchar](50) NULL,
	[OrdenCompra] [varchar](50) NULL,
	[Condicion] [varchar](50) NULL,
	[Vencimiento] [datetime] NULL,
	[CtaDinero] [varchar](10) NULL,
	[Descuento] [varchar](30) NULL,
	[DescuentoGlobal] [float] NULL,
	[Importe] [money] NULL,
	[Impuestos] [money] NULL,
	[Saldo] [money] NULL,
	[AnticiposFacturados] [money] NULL,
	[AnticiposImpuestos] [money] NULL,
	[Retencion] [money] NULL,
	[DescuentoLineal] [money] NULL,
	[ComisionTotal] [money] NULL,
	[CostoTotal] [money] NULL,
	[PrecioTotal] [money] NULL,
	[Paquetes] [int] NULL,
	[ServicioTipo] [varchar](50) NULL,
	[ServicioArticulo] [varchar](20) NULL,
	[ServicioSerie] [varchar](50) NULL,
	[ServicioContrato] [varchar](20) NULL,
	[ServicioContratoID] [varchar](20) NULL,
	[ServicioContratoTipo] [varchar](50) NULL,
	[ServicioGarantia] [bit] NOT NULL,
	[ServicioDescripcion] [varchar](100) NULL,
	[ServicioFecha] [datetime] NULL,
	[ServicioFlotilla] [bit] NULL,
	[ServicioRampa] [bit] NULL,
	[ServicioIdentificador] [varchar](20) NULL,
	[ServicioPlacas] [varchar](20) NULL,
	[ServicioKms] [int] NULL,
	[ServicioTipoOrden] [varchar](20) NULL,
	[ServicioTipoOperacion] [varchar](50) NULL,
	[ServicioSiniestro] [varchar](20) NULL,
	[ServicioExpress] [bit] NOT NULL,
	[ServicioDemerito] [bit] NOT NULL,
	[ServicioDeducible] [bit] NOT NULL,
	[ServicioDeducibleImporte] [money] NULL,
	[ServicioNumero] [float] NULL,
	[ServicioNumeroEconomico] [varchar](20) NULL,
	[ServicioAseguradora] [varchar](10) NULL,
	[ServicioPuntual] [bit] NULL,
	[ServicioPoliza] [varchar](20) NULL,
	[OrigenTipo] [varchar](10) NULL,
	[Origen] [varchar](20) NULL,
	[OrigenID] [varchar](20) NULL,
	[Poliza] [varchar](20) NULL,
	[PolizaID] [varchar](20) NULL,
	[GenerarPoliza] [bit] NOT NULL,
	[ContID] [int] NULL,
	[Ejercicio] [int] NULL,
	[Periodo] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaConclusion] [datetime] NULL,
	[FechaCancelacion] [datetime] NULL,
	[FechaEntrega] [datetime] NULL,
	[EmbarqueEstado] [varchar](50) NULL,
	[EmbarqueGastos] [money] NULL,
	[Peso] [float] NULL,
	[Volumen] [float] NULL,
	[Causa] [varchar](50) NULL,
	[Atencion] [varchar](50) NULL,
	[AtencionTelefono] [varchar](50) NULL,
	[ListaPreciosEsp] [varchar](20) NULL,
	[ZonaImpuesto] [varchar](30) NULL,
	[Extra] [bit] NOT NULL,
	[CancelacionID] [int] NULL,
	[Mensaje] [int] NULL,
	[Departamento] [int] NULL,
	[Sucursal] [int] NOT NULL,
	[GenerarOP] [bit] NULL,
	[DesglosarImpuestos] [bit] NULL,
	[DesglosarImpuesto2] [bit] NULL,
	[ExcluirPlaneacion] [bit] NULL,
	[ConVigencia] [bit] NULL,
	[VigenciaDesde] [datetime] NULL,
	[VigenciaHasta] [datetime] NULL,
	[Enganche] [money] NULL,
	[Bonificacion] [float] NULL,
	[IVAFiscal] [float] NULL,
	[IEPSFiscal] [float] NULL,
	[EstaImpreso] [bit] NULL,
	[Periodicidad] [varchar](20) NULL,
	[SubModulo] [varchar](5) NULL,
	[ContUso] [varchar](20) NULL,
	[Espacio] [varchar](10) NULL,
	[AutoCorrida] [varchar](20) NULL,
	[AutoCorridaHora] [varchar](5) NULL,
	[AutoCorridaServicio] [varchar](50) NULL,
	[AutoCorridaRol] [varchar](50) NULL,
	[AutoCorridaOrigen] [varchar](5) NULL,
	[AutoCorridaDestino] [varchar](5) NULL,
	[AutoCorridaKms] [int] NULL,
	[AutoCorridaLts] [int] NULL,
	[AutoCorridaRuta] [varchar](5) NULL,
	[AutoOperador2] [varchar](10) NULL,
	[AutoBoleto] [varchar](11) NULL,
	[AutoKms] [int] NULL,
	[AutoKmsActuales] [int] NULL,
	[AutoBomba] [varchar](10) NULL,
	[AutoBombaContador] [int] NULL,
	[Logico1] [bit] NOT NULL,
	[Logico2] [bit] NOT NULL,
	[Logico3] [bit] NOT NULL,
	[Logico4] [bit] NOT NULL,
	[DifCredito] [money] NULL,
	[EspacioResultado] [bit] NULL,
	[Clase] [varchar](50) NULL,
	[Subclase] [varchar](50) NULL,
	[GastoAcreedor] [varchar](10) NULL,
	[GastoConcepto] [varchar](50) NULL,
	[Comentarios] [text] NULL,
	[Pagado] [float] NULL,
	[GenerarDinero] [bit] NULL,
	[Dinero] [varchar](20) NULL,
	[DineroID] [varchar](20) NULL,
	[DineroCtaDinero] [varchar](10) NULL,
	[DineroConciliado] [bit] NULL,
	[DineroFechaConciliacion] [datetime] NULL,
	[Extra1] [bit] NOT NULL,
	[Extra2] [bit] NOT NULL,
	[Extra3] [bit] NOT NULL,
	[Reabastecido] [bit] NULL,
	[SucursalVenta] [int] NULL,
	[AF] [bit] NULL,
	[AFArticulo] [varchar](20) NULL,
	[AFSerie] [varchar](50) NULL,
	[ContratoTipo] [varchar](50) NULL,
	[ContratoDescripcion] [varchar](100) NULL,
	[ContratoSerie] [varchar](20) NULL,
	[ContratoValor] [money] NULL,
	[ContratoValorMoneda] [varchar](10) NULL,
	[ContratoSeguro] [varchar](20) NULL,
	[ContratoVencimiento] [datetime] NULL,
	[ContratoResponsable] [varchar](10) NULL,
	[Incentivo] [money] NULL,
	[IncentivoConcepto] [varchar](50) NULL,
	[EndosarA] [varchar](10) NULL,
	[InteresTasa] [float] NULL,
	[InteresIVA] [float] NULL,
	[AnexoID] [int] NULL,
	[FordVisitoOASIS] [bit] NULL,
	[LineaCredito] [varchar](20) NULL,
	[TipoAmortizacion] [varchar](20) NULL,
	[TipoTasa] [varchar](20) NULL,
	[Comisiones] [money] NULL,
	[ComisionesIVA] [money] NULL,
	[CompraID] [int] NULL,
	[OperacionRelevante] [bit] NULL,
	[TieneTasaEsp] [bit] NULL,
	[TasaEsp] [float] NULL,
	[FormaPagoTipo] [varchar](50) NULL,
	[SobrePrecio] [float] NULL,
	[SincroID] [timestamp] NULL,
	[SincroC] [int] NULL,
	[SucursalOrigen] [int] NOT NULL,
	[SucursalDestino] [int] NULL,
	[MaviTipoVenta] [varchar](5) NULL,
	[EsCredilana] [bit] NULL,
	[Mayor12Meses] [bit] NULL,
	[IDIngresoMAVI] [int] NULL,
	[AfectaComisionMavi] [bit] NULL,
	[SucJuego] [char](50) NULL,
	[OrigenSucursal] [int] NULL,
	[FacDesgloseIVA] [bit] NULL,
	[EsModVenta] [bit] NULL,
	[ContImpSimp] [int] NULL,
	[ContImpCiego] [int] NULL,
	[ContImpCFD] [int] NULL,
	[FormaCobro] [varchar](50) NULL,
	[NoCtaPago] [varchar](25) NULL,
	[RedimePtos] [bit] NULL,
	[ComLibera] [varchar](100) NULL,
	[CteFinal] [varchar](10) NULL,
	[Band402] [bit] NULL,
	[FechaEnvioSID] [datetime] NULL,
	[Liberado] [int] NULL,
	[Autoriza] [varchar](12) NULL,
	[ArtQ] [bit] NOT NULL,
	[HuellaLiberacion] [int] NULL,
	[IDEcommerce] [varchar](20) NULL,
	[ReporteServicio] [int] NULL,
	[PagoDie] [bit] NULL,
	[FolioFIADE] [int] NULL,
	[AgenteVtaCruzada] [varchar](10) NULL,
	[ReporteDescuento] [int] NULL,
	[VtaDIMANuevo] [bit] NOT NULL,
	[CRCFDSerie] [varchar](20) NULL,
	[CRCFDFolio] [varchar](20) NULL,
	[ContUso2] [varchar](20) NULL,
	[ContUso3] [varchar](20) NULL,
	[Actividad] [varchar](50) NULL,
	[ContratoID] [int] NULL,
	[ContratoMov] [varchar](20) NULL,
	[ContratoMovID] [varchar](20) NULL,
	[MAFCiclo] [int] NULL,
	[TipoComprobante]  AS (CONVERT([varchar](20),NULL)),
	[SustentoComprobante]  AS (CONVERT([varchar](20),NULL)),
	[TipoIdentificacion]  AS (CONVERT([varchar](20),NULL)),
	[DerechoDevolucion]  AS (CONVERT([bit],(0))),
	[Establecimiento]  AS (CONVERT([varchar](20),NULL)),
	[PuntoEmision]  AS (CONVERT([varchar](50),NULL)),
	[SecuencialSRI]  AS (CONVERT([varchar](50),NULL)),
	[AutorizacionSRI]  AS (CONVERT([varchar](50),NULL)),
	[VigenteA]  AS (CONVERT([datetime],NULL)),
	[SecuenciaRetencion]  AS (CONVERT([varchar](50),NULL)),
	[Comprobante]  AS (CONVERT([bit],(0))),
	[FechaContableMov]  AS (CONVERT([datetime],NULL)),
	[AnticipoFacturadoTipoServicio] [bit] NULL,
	[Retencion1] [float] NULL,
	[Retencion2] [float] NULL,
	[Retencion3] [float] NULL,
	[CFDFlexEstatus] [varchar](15) NULL,
	[CFDTimbrado] [bit] NULL,
	[RecargaTelefono] [varchar](10) NULL,
	[EmidaControlNo] [varchar](20) NULL,
	[EmidaTransactionId] [varchar](20) NULL,
	[EmidaResponseMessage] [varchar](500) NULL,
	[EmidaTransactionDateTime] [datetime] NULL,
	[EmidaResponseCode] [varchar](2) NULL,
	[EmidaCarrierControlNo] [varchar](20) NULL,
	[PosicionWMS] [varchar](10) NULL,
	[CRMID] [uniqueidentifier] NULL,
	[OpportunityId] [varchar](36) NULL,
	[IDOPORT] [int] NULL,
	[PedidoReferencia] [varchar](50) NULL,
	[POSDescuento] [varchar](30) NULL,
	[PedidoReferenciaID] [int] NULL,
	[Refacturado] [bit] NULL,
	[Monedero] [varchar](20) NULL,
	[EmidaTelefono] [varchar](10) NULL,
	[Ubicacion] [varchar](1000) NULL,
	[MapaLatitud] [float] NULL,
	[MapaLongitud] [float] NULL,
	[IDProyecto] [int] NULL,
	[CrossDocking] [bit] NULL,
	[NombreDF] [varchar](30) NULL,
	[ApellidosDF] [varchar](60) NULL,
	[PasaporteDF] [varchar](30) NULL,
	[NacionalidadDF] [varchar](30) NULL,
	[NoVueloDF] [varchar](20) NULL,
	[AerolineaDF] [varchar](50) NULL,
	[OrigenDF] [varchar](100) NULL,
	[DestinoDF] [varchar](100) NULL,
	[POSRedondeoVerif] [bit] NOT NULL,
	[MesLanzamiento] [varchar](100) NULL,
	[FolioCRM] [varchar](50) NULL,
	[CRMObjectId] [uniqueidentifier] NULL,
	[RedimePuntos] [bit] NULL,
	[Posicion] [varchar](20) NULL,
	[TipoEntrega] [varchar](25) NULL,
	[Prerastreo] [float] NULL,
	[IDUnico] [varchar](20) NULL,
	[IDCxc] [int] NULL,
	[EsSaldoInicial] [bit] NULL,
	[SaldoOriginal] [money] NULL,
	[vicReferenciaExtra] [varchar](800) NULL,
	[vicVentaDepRefdo] [varchar](50) NULL,
	[vicPNFecha] [datetime] NULL,
	[vicGeneradoPorPN] [bit] NULL,
	[vicPNOk] [int] NULL,
	[vicPNOkRef] [varchar](255) NULL,
	[vicPNLlave] [uniqueidentifier] NULL,
	[GFAEscrituracion] [int] NULL,
	[Embarcado] [bit] NOT NULL,
	[TransferenciaSTP] [bit] NOT NULL,
 CONSTRAINT [priVenta] PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((1)) FOR [Directo]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ServicioGarantia]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ServicioFlotilla]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ServicioRampa]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ServicioExpress]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ServicioDemerito]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ServicioDeducible]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ServicioPuntual]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [GenerarPoliza]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Extra]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Sucursal]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [GenerarOP]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((1)) FOR [DesglosarImpuestos]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [DesglosarImpuesto2]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ExcluirPlaneacion]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ConVigencia]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [EstaImpreso]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ('VTAS') FOR [SubModulo]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Logico1]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Logico2]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Logico3]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Logico4]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [EspacioResultado]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [GenerarDinero]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [DineroConciliado]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Extra1]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Extra2]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Extra3]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Reabastecido]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [AF]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [FordVisitoOASIS]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [TieneTasaEsp]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((1)) FOR [SincroC]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [SucursalOrigen]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [AfectaComisionMavi]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [FacDesgloseIVA]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [EsModVenta]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [RedimePtos]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [CteFinal]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [ArtQ]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [IDEcommerce]
GO
ALTER TABLE [dbo].[Venta] ADD  CONSTRAINT [DF_Venta_PagoDie]  DEFAULT ((0)) FOR [PagoDie]
GO
ALTER TABLE [dbo].[Venta] ADD  CONSTRAINT [DF_Venta_VtaDIMANuevo]  DEFAULT ((0)) FOR [VtaDIMANuevo]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [AnticipoFacturadoTipoServicio]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [CFDTimbrado]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [Refacturado]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [CrossDocking]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [POSRedondeoVerif]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [RedimePuntos]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [EsSaldoInicial]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (NULL) FOR [vicVentaDepRefdo]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [vicGeneradoPorPN]
GO
ALTER TABLE [dbo].[Venta] ADD  CONSTRAINT [DF_Venta_Embarcado]  DEFAULT ((0)) FOR [Embarcado]
GO
ALTER TABLE [dbo].[Venta] ADD  CONSTRAINT [DF_Venta_TransferenciaSTP]  DEFAULT ((0)) FOR [TransferenciaSTP]
GO
EXEC sys.sp_addextendedproperty @name=N'PagoDie', @value=N'Campo para identificar si la entrega de efectivo sera mediante DIE (1) o en Sucursal (0)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'PagoDie'
GO
EXEC sys.sp_addextendedproperty @name=N'FolioFIADE', @value=N'Campo que guarda el folio asignado de la tabla TrAAea00030_RegistroPeticiones de Android' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'FolioFIADE'
GO
EXEC sys.sp_addextendedproperty @name=N'AgenteVtaCruzada', @value=N'Campo donde se almacena el agente que superviso la venta cruzada desde la aplicacion en android' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'AgenteVtaCruzada'
GO
EXEC sys.sp_addextendedproperty @name=N'VtaDIMANuevo', @value=N'Campo donde se guardara si la venta del DIMA esta dentro del Periodo de Consolidación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'VtaDIMANuevo'
GO
EXEC sys.sp_addextendedproperty @name=N'TipoEntrega', @value=N'Campo encargado de almacenar el tipo de entra del pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'TipoEntrega'
GO
EXEC sys.sp_addextendedproperty @name=N'Prerastreo', @value=N'Campo donde se guardara el bit de prerrastreo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'Prerastreo'
GO
EXEC sys.sp_addextendedproperty @name=N'Embarcado', @value=N'guardara si el movimiento se embarco o no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'Embarcado'
GO
EXEC sys.sp_addextendedproperty @name=N'TransferenciaSTP', @value=N'Campo encargado de validar si el pago del prestamo se realizara por transeferencia stp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'TransferenciaSTP'
GO
