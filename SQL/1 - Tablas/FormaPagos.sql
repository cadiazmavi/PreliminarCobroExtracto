
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 23/09/2022 02:35:11 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPago](
	[FormaPago] [varchar](50) NOT NULL,
	[MovIngresos] [char](20) NULL,
	[MovEgresos] [char](20) NULL,
	[Comision] [float] NULL,
	[Comision2] [float] NULL,
	[Impuestos] [float] NULL,
	[Moneda] [char](10) NULL,
	[RequiereReferencia] [bit] NULL,
	[Orden] [int] NULL,
	[Restringida] [bit] NULL,
	[PermiteCambio] [bit] NULL,
	[PV] [bit] NULL,
	[TarjetaBandaMagnetica] [bit] NULL,
	[Cuenta] [varchar](20) NULL,
	[Grupo] [varchar](50) NULL,
	[DefCtaDinero] [varchar](10) NULL,
	[Importacion] [bit] NULL,
	[MetodoPagoSAT] [int] NULL,
	[IdFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[VentaLinea] [varchar](4) NULL,
	[CobroIntegrado] [bit] NULL,
	[LDI] [bit] NOT NULL,
	[LDIServicio] [varchar](20) NULL,
	[POSForma] [varchar](50) NULL,
	[TCActivarInterfaz] [bit] NULL,
	[TCTipoPlan] [varchar](20) NULL,
	[TCNoMeses] [int] NULL,
	[Recoleccion] [bit] NULL,
	[POSDenominacion] [bit] NULL,
	[AbreCajon] [bit] NULL,
	[TCDiferirMeses] [int] NULL,
	[ClaveSAT] [varchar](10) NULL,
	[POSMoneda] [varchar](10) NULL,
	[Comision3] [float] NULL,
	[POSValidaPromocion] [bit] NULL,
	[FiltrarBeneficiario] [bit] NOT NULL,
 CONSTRAINT [priFormaPago] PRIMARY KEY CLUSTERED 
(
	[FormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FormaPago] ON 

INSERT [dbo].[FormaPago] ([FormaPago], [MovIngresos], [MovEgresos], [Comision], [Comision2], [Impuestos], [Moneda], [RequiereReferencia], [Orden], [Restringida], [PermiteCambio], [PV], [TarjetaBandaMagnetica], [Cuenta], [Grupo], [DefCtaDinero], [Importacion], [MetodoPagoSAT], [IdFormaPago], [VentaLinea], [CobroIntegrado], [LDI], [LDIServicio], [POSForma], [TCActivarInterfaz], [TCTipoPlan], [TCNoMeses], [Recoleccion], [POSDenominacion], [AbreCajon], [TCDiferirMeses], [ClaveSAT], [POSMoneda], [Comision3], [POSValidaPromocion], [FiltrarBeneficiario]) VALUES (N'EFECTIVO', NULL, NULL, NULL, NULL, NULL, N'Pesos', 0, 10, 0, 1, 1, 0, NULL, N'EFECTIVO', NULL, 0, 1, 9, NULL, 1, 0, NULL, NULL, 0, N'Regular', 1, 0, 0, 0, NULL, N'01', NULL, NULL, 0, 0)
INSERT [dbo].[FormaPago] ([FormaPago], [MovIngresos], [MovEgresos], [Comision], [Comision2], [Impuestos], [Moneda], [RequiereReferencia], [Orden], [Restringida], [PermiteCambio], [PV], [TarjetaBandaMagnetica], [Cuenta], [Grupo], [DefCtaDinero], [Importacion], [MetodoPagoSAT], [IdFormaPago], [VentaLinea], [CobroIntegrado], [LDI], [LDIServicio], [POSForma], [TCActivarInterfaz], [TCTipoPlan], [TCNoMeses], [Recoleccion], [POSDenominacion], [AbreCajon], [TCDiferirMeses], [ClaveSAT], [POSMoneda], [Comision3], [POSValidaPromocion], [FiltrarBeneficiario]) VALUES (N'LINIO PU', NULL, NULL, NULL, NULL, 16, N'Pesos', 0, 11, 0, 0, 0, 0, NULL, N'LINIO', NULL, 0, 3, 10, NULL, 1, 0, NULL, NULL, 0, N'Regular', 1, 0, 0, 0, NULL, N'28', NULL, NULL, 0, 0)

GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [RequiereReferencia]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [Restringida]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((1)) FOR [PermiteCambio]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((1)) FOR [PV]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [TarjetaBandaMagnetica]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [Importacion]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((1)) FOR [CobroIntegrado]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [LDI]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [Recoleccion]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [POSDenominacion]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [AbreCajon]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [POSValidaPromocion]
GO
ALTER TABLE [dbo].[FormaPago] ADD  DEFAULT ((0)) FOR [FiltrarBeneficiario]
GO
EXEC sys.sp_addextendedproperty @name=N'IDFormaPago', @value=N'Se Agrega el id auto incremementable para poder unirlo con la tabla  Condicion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FormaPago', @level2type=N'COLUMN',@level2name=N'IdFormaPago'
GO
EXEC sys.sp_addextendedproperty @name=N'VentaLinea', @value=N'Permite etiquetar aquellos registros que se crearon para las operacciones generadas en las tiendas virtuales' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FormaPago', @level2type=N'COLUMN',@level2name=N'VentaLinea'
GO
