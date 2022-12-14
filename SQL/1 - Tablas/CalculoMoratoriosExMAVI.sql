
GO
/****** Object:  Table [dbo].[CalculoMoratoriosExMAVI]    Script Date: 23/09/2022 07:05:53 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalculoMoratoriosExMAVI](
	[Mov] [varchar](20) NOT NULL,
	[Concepto] [varchar](50) NOT NULL,
 CONSTRAINT [priCalculoMoratoriosExMAVI] PRIMARY KEY CLUSTERED 
(
	[Mov] ASC,
	[Concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo', N'CANC COBRO SEG AUTO')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo VIU', N'CANC COBRO SEG AUTO')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo', N'CANC COBRO SEG VIDA')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo VIU', N'CANC COBRO SEG VIDA')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Documento', N'GTOS DE LOCALIZACION')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo', N'GTOS DE LOCALIZACION')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo VIU', N'GTOS DE LOCALIZACION')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo', N'MORATORIOS MENUDEO')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo VIU', N'MORATORIOS MENUDEO')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Documento', N'SALDOS INICIALES')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo', N'SALDOS INICIALES')
INSERT [dbo].[CalculoMoratoriosExMAVI] ([Mov], [Concepto]) VALUES (N'Nota Cargo VIU', N'SALDOS INICIALES')
GO
