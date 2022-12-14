
GO
/****** Object:  Table [dbo].[Cxc]    Script Date: 23/09/2022 05:43:29 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cxc](
	[ID] [int] /*IDENTITY(1,1) NOT FOR REPLICATION*/ NOT NULL,
	[Empresa] [varchar](5) NOT NULL,
	[Mov] [varchar](20) NOT NULL,
	[MovID] [varchar](20) NULL,
	[FechaEmision] [datetime] NULL,
	--[UltimoCambio] [datetime] NULL,
	[Concepto] [varchar](50) NULL,
	--[Proyecto] [varchar](50) NULL,
	--[UEN] [int] NULL,
	--[Moneda] [varchar](10) NOT NULL,
	--[TipoCambio] [float] NULL,
	--[Usuario] [varchar](10) NULL,
	--[Autorizacion] [varchar](10) NULL,
	--[Referencia] [varchar](255) NULL,
	--[DocFuente] [int] NULL,
	--[Observaciones] [varchar](255) NULL,
	[Estatus] [varchar](15) NULL,
	--[Situacion] [varchar](50) NULL,
	--[SituacionFecha] [datetime] NULL,
	--[SituacionUsuario] [varchar](10) NULL,
	--[SituacionNota] [varchar](100) NULL,
	--[Codigo] [varchar](30) NULL,
	[Cliente] [varchar](10) NOT NULL,
	[ClienteEnviarA] [int] NULL,
	--[ClienteMoneda] [varchar](10) NULL,
	--[ClienteTipoCambio] [float] NULL,
	--[CtaDinero] [varchar](10) NULL,
	--[Cobrador] [varchar](50) NULL,
	[Condicion] [varchar](50) NULL,
	[Vencimiento] [datetime] NULL,
	--[FormaCobro] [varchar](50) NULL,
	[Importe] [money] NULL,
	[Impuestos] [money] NULL,
	[Retencion] [money] NULL,
	--[AplicaManual] [bit] NOT NULL,
	--[ConDesglose] [bit] NOT NULL,
	--[FormaCobro1] [varchar](50) NULL,
	--[FormaCobro2] [varchar](50) NULL,
	--[FormaCobro3] [varchar](50) NULL,
	--[FormaCobro4] [varchar](50) NULL,
	--[FormaCobro5] [varchar](50) NULL,
	--[Importe1] [float] NULL,
	--[Importe2] [float] NULL,
	--[Importe3] [float] NULL,
	--[Importe4] [float] NULL,
	--[Importe5] [float] NULL,
	--[Referencia1] [varchar](50) NULL,
	--[Referencia2] [varchar](50) NULL,
	--[Referencia3] [varchar](50) NULL,
	--[Referencia4] [varchar](50) NULL,
	--[Referencia5] [varchar](50) NULL,
	--[Cambio] [money] NULL,
	--[DelEfectivo] [money] NULL,
	--[Agente] [varchar](10) NULL,
	--[ComisionTotal] [money] NULL,
	--[ComisionPendiente] [money] NULL,
	--[ComisionGenerada] [money] NULL,
	--[ComisionCorte] [datetime] NULL,
	--[MovAplica] [varchar](20) NULL,
	--[MovAplicaID] [varchar](20) NULL,
	[Saldo] [money] NULL,
	--[AutoAjuste] [money] NULL,
	--[OrigenTipo] [varchar](10) NULL,
	--[Origen] [varchar](20) NULL,
	--[OrigenID] [varchar](20) NULL,
	--[Poliza] [varchar](20) NULL,
	--[PolizaID] [varchar](20) NULL,
	--[GenerarPoliza] [bit] NOT NULL,
	--[ContID] [int] NULL,
	--[Ejercicio] [int] NULL,
	--[Periodo] [int] NULL,
	--[FechaRegistro] [datetime] NULL,
	--[FechaConclusion] [datetime] NULL,
	--[FechaCancelacion] [datetime] NULL,
	--[FechaProntoPago] [datetime] NULL,
	--[DescuentoProntoPago] [float] NULL,
	--[Indirecto] [bit] NOT NULL,
	--[GenerarDinero] [bit] NOT NULL,
	--[Dinero] [varchar](20) NULL,
	--[DineroID] [varchar](20) NULL,
	--[DineroCtaDinero] [varchar](10) NULL,
	--[DineroConciliado] [bit] NULL,
	--[DineroFechaConciliacion] [datetime] NULL,
	--[VIN] [varchar](20) NULL,
	--[FechaEntrega] [datetime] NULL,
	--[EmbarqueEstado] [varchar](50) NULL,
	--[Sucursal] [int] NOT NULL,
	--[Logico1] [bit] NOT NULL,
	--[Logico2] [bit] NOT NULL,
	--[Logico3] [bit] NOT NULL,
	--[Logico4] [bit] NOT NULL,
	--[Logico5] [bit] NOT NULL,
	--[Logico6] [bit] NOT NULL,
	--[ConTramites] [bit] NOT NULL,
	--[Cajero] [varchar](10) NULL,
	--[IVAFiscal] [float] NULL,
	--[IEPSFiscal] [float] NULL,
	--[DiferenciaCambiaria] [money] NULL,
	--[EstaImpreso] [bit] NULL,
	--[AnticipoAplicar] [money] NULL,
	--[AnticipoAplicaModulo] [varchar](5) NULL,
	--[AnticipoAplicaID] [int] NULL,
	--[AnticipoSaldo] [money] NULL,
	--[PersonalCobrador] [varchar](10) NULL,
	[FechaOriginal] [datetime] NULL,
	--[Comentarios] [text] NULL,
	--[Nota] [varchar](100) NULL,
	--[RamaID] [int] NULL,
	--[Tasa] [varchar](50) NULL,
	--[TasaDiaria] [float] NULL,
	--[LineaCredito] [varchar](20) NULL,
	--[TipoTasa] [varchar](20) NULL,
	--[TieneTasaEsp] [bit] NULL,
	--[TasaEsp] [float] NULL,
	--[TipoAmortizacion] [varchar](20) NULL,
	--[Amortizaciones] [int] NULL,
	--[InteresesAnticipados] [money] NULL,
	--[InteresesFijos] [money] NULL,
	--[InteresesOrdinarios] [money] NULL,
	--[InteresesMoratorios] [money] NULL,
	--[Comisiones] [money] NULL,
	--[ComisionesIVA] [money] NULL,
	--[CarteraVencidaCNBV] [bit] NULL,
	--[FechaRevision] [datetime] NULL,
	--[OperacionRelevante] [bit] NULL,
	--[ContUso] [varchar](20) NULL,
	--[SincroID] [timestamp] NULL,
	--[SincroC] [int] NULL,
	[SucursalOrigen] [int] NOT NULL,
	--[SucursalDestino] [int] NULL,
	--[Financiamiento] [money] NULL,
	--[EsCredilana] [bit] NULL,
	--[Mayor12Meses] [bit] NULL,
	--[Depositado] [varchar](1) NULL,
	--[MaxDiasVencidosMAVI] [float] NULL,
	--[MaxDiasInactivosMAVI] [float] NULL,
	--[CalificacionMAVI] [float] NULL,
	--[MOPMAVI] [int] NULL,
	--[PonderacionCalifMAVI] [varchar](15) NULL,
	--[MOPAnteriorMAVI] [int] NULL,
	--[SeEnviaBuroCreditoMavi] [bit] NULL,
	--[SaldoDevueltoMAVI] [money] NULL,
	--[SaldoAplicadoMAVI] [money] NULL,
	--[RefAnticipoMAVI] [varchar](50) NULL,
	--[CondRef] [varchar](50) NULL,
	--[CoincideMavi] [int] NULL,
	--[FechaOriginalAnt] [datetime] NULL,
	--[InteresMoratorioAnt] [money] NULL,
	[InteresesMoratoriosMAVI] [money] NULL,
	--[EjercicioInst] [int] NULL,
	--[PeriodoInst] [int] NULL,
	--[HerramientaInst] [int] NULL,
	--[Existe] [bit] NULL,
	--[IDCobroBonifMAVI] [int] NULL,
	--[ReferenciaMAVI] [varchar](50) NULL,
	--[FacDesgloseIVA] [bit] NULL,
	[PadreMAVI] [varchar](20) NULL,
	[PadreIDMAVI] [varchar](20) NULL,
	--[ValorAfectar] [bit] NULL,
	--[MaviImpresionCobro] [bit] NULL,
	--[InteresXPolitica] [bit] NULL,
	[IDPadreMAVI] [int] NULL,
	--[NoCtaPago] [varchar](25) NULL,
	--[NoParcialidad] [int] NULL,
	[CteFinal] [varchar](10) NULL,
	--[CobroTicket] [int] NULL,
	[IDBonifCC] [int] NULL,
	[BonifCC] [money] NULL,
	--[IDBonifPP] [int] NULL,
	--[BonifPP] [money] NULL,
	--[BonifPPExt] [money] NULL,
	--[IDBonifAP] [int] NULL,
	[CobroCteFinal] [int] NULL,
	[ImpApoyoDIMA] [money] NULL,
	[SaldoApoyoDIMA] [money] NULL
	--[FechaApoyo] [datetime] NULL,
	--[Intervencion] [bit] NULL,
	--[SaldoInteresesOrdinarios] [money] NULL,
	--[SaldoInteresesMoratorios] [money] NULL,
	--[SubModulo] [varchar](5) NULL,
	--[ContratoID] [int] NULL,
	--[ContratoMov] [varchar](20) NULL,
	--[ContratoMovID] [varchar](20) NULL,
	--[NoAutoAjustar] [bit] NULL,
	--[NoAutoAplicar] [bit] NULL,
	--[Retencion2] [float] NULL,
	--[Retencion3] [float] NULL,
	--[ContUso2] [varchar](20) NULL,
	--[ContUso3] [varchar](20) NULL,
	--[CFDFlexEstatus] [varchar](15) NULL,
	--[CFDTimbrado] [bit] NULL,
	--[TasaRealDiaria] [float] NULL,
	--[InteresesOrdinariosIVA] [float] NULL,
	--[InteresesMoratoriosIVA] [float] NULL,
	--[SaldoInteresesOrdinariosIVA] [float] NULL,
	--[SaldoInteresesMoratoriosIVA] [float] NULL,
	--[IVAInteresPorcentaje] [float] NULL,
	--[EsInteresFijo] [bit] NULL,
	--[TarjetaBancariaAutorizacion] [varchar](255) NULL,
	--[PedidoReferencia] [varchar](50) NULL,
	--[PedidoReferenciaID] [int] NULL,
	--[POSGUID] [varchar](50) NULL,
	--[Actividad] [varchar](50) NULL,
	--[FechaRealPago] [datetime] NULL,
	--[GeneroIntMor] [bit] NULL,
	--[GeneroIntMorMens] [bit] NULL,
 CONSTRAINT [priCxc] PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] --TEXTIMAGE_ON [PRIMARY]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [AplicaManual]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [ConDesglose]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [GenerarPoliza]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Indirecto]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [GenerarDinero]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [DineroConciliado]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Sucursal]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Logico1]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Logico2]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Logico3]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Logico4]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Logico5]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Logico6]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [ConTramites]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [EstaImpreso]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ('VTAS') FOR [AnticipoAplicaModulo]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [TieneTasaEsp]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [CarteraVencidaCNBV]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [OperacionRelevante]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((1)) FOR [SincroC]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [SucursalOrigen]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [Depositado]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [MaxDiasVencidosMAVI]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [MaxDiasInactivosMAVI]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [CalificacionMAVI]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [CoincideMavi]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [FacDesgloseIVA]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [ValorAfectar]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [MaviImpresionCobro]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [InteresXPolitica]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [CteFinal]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  CONSTRAINT [DF_CXC_Intervencion]  DEFAULT ((0)) FOR [Intervencion]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ('CXC') FOR [SubModulo]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [NoAutoAjustar]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [NoAutoAplicar]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [CFDTimbrado]
--GO
--ALTER TABLE [dbo].[Cxc] ADD  DEFAULT ((0)) FOR [EsInteresFijo]
--GO
--EXEC sys.sp_addextendedproperty @name=N'CobroCteFinal', @value=N'Check para indicar el estatus de Cobro al Cliente Final' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cxc', @level2type=N'COLUMN',@level2name=N'CobroCteFinal'
--GO
--EXEC sys.sp_addextendedproperty @name=N'ImpApoyoDIMA', @value=N'Importe del que se solicito Apoyo Cobranza a DIMAS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cxc', @level2type=N'COLUMN',@level2name=N'ImpApoyoDIMA'
--GO
--EXEC sys.sp_addextendedproperty @name=N'SaldoApoyoDIMA', @value=N'Saldo del Apoyo Cobranza a DIMAS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cxc', @level2type=N'COLUMN',@level2name=N'SaldoApoyoDIMA'
--GO
--EXEC sys.sp_addextendedproperty @name=N'FechaApoyo', @value=N'Campo en donde almacenara la fecha en la que fue solicitado el apoyo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cxc', @level2type=N'COLUMN',@level2name=N'FechaApoyo'
--GO
--EXEC sys.sp_addextendedproperty @name=N'Intervencion', @value=N'Este campo almacenara el estado de los documentos que estan intervenidos de un beneficiario final' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cxc', @level2type=N'COLUMN',@level2name=N'Intervencion'
--GO
--EXEC sys.sp_addextendedproperty @name=N'FechaRealPago', @value=N'Columna saber la fecha de pago por transferencia ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cxc', @level2type=N'COLUMN',@level2name=N'FechaRealPago'
--GO
