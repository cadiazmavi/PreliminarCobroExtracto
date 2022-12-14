
GO
/****** Object:  Table [dbo].[CxcD]    Script Date: 23/09/2022 08:18:28 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CxcD](
	[ID] [int] NOT NULL,
	[Renglon] [float] NOT NULL,
	[RenglonSub] [int] NOT NULL,
	[Importe] [money] NULL,
	[Aplica] [varchar](20) NULL,
	[AplicaID] [varchar](20) NULL,
	[Fecha] [datetime] NULL,
	[FechaAnterior] [datetime] NULL,
	[Comision] [money] NULL,
	[InteresesOrdinarios] [money] NULL,
	[InteresesOrdinariosQuita] [float] NULL,
	[InteresesMoratorios] [money] NULL,
	[InteresesMoratoriosQuita] [float] NULL,
	[ImpuestoAdicional] [float] NULL,
	[OtrosCargos] [money] NULL,
	[Retencion] [money] NULL,
	[Ligado] [bit] NOT NULL,
	[Sucursal] [int] NOT NULL,
	[LigadoDR] [bit] NOT NULL,
	[EsReferencia] [bit] NULL,
	[Logico1] [bit] NOT NULL,
	[DescuentoRecargos] [money] NULL,
	[SucursalOrigen] [int] NOT NULL,
	[Retencion2] [float] NULL,
	[Retencion3] [float] NULL,
	[InteresesOrdinariosIVA] [float] NULL,
	[InteresesOrdinariosTasaDia] [float] NULL,
	[InteresesOrdinariosTasaRealDia] [float] NULL,
	[InteresesMoratoriosIVA] [float] NULL,
	[InteresesMoratoriosTasaDia] [float] NULL,
	[InteresesMoratoriosTasaRealDia] [float] NULL,
	[InteresesOrdinariosIVADescInfl] [float] NULL,
 CONSTRAINT [priCxcD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Renglon] ASC,
	[RenglonSub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CxcD] ADD  DEFAULT ((0)) FOR [RenglonSub]
GO
ALTER TABLE [dbo].[CxcD] ADD  DEFAULT ((0)) FOR [Ligado]
GO
ALTER TABLE [dbo].[CxcD] ADD  DEFAULT ((0)) FOR [Sucursal]
GO
ALTER TABLE [dbo].[CxcD] ADD  DEFAULT ((0)) FOR [LigadoDR]
GO
ALTER TABLE [dbo].[CxcD] ADD  DEFAULT ((0)) FOR [EsReferencia]
GO
ALTER TABLE [dbo].[CxcD] ADD  DEFAULT ((0)) FOR [Logico1]
GO
ALTER TABLE [dbo].[CxcD] ADD  DEFAULT ((0)) FOR [SucursalOrigen]
GO
