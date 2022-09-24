
GO
/****** Object:  Table [dbo].[TablaNumD]    Script Date: 23/09/2022 02:32:10 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaNumD](
	[TablaNum] [varchar](50) NOT NULL,
	[Numero] [money] NOT NULL,
	[Valor] [money] NULL,
 CONSTRAINT [priTablaNumD] PRIMARY KEY CLUSTERED 
(
	[TablaNum] ASC,
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 1.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 12.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 13.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 14.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 15.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 16.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 17.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 18.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 19.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 20.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 21.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 22.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 23.0000, 1.0000)
INSERT [dbo].[TablaNumD] ([TablaNum], [Numero], [Valor]) VALUES (N'SUCURSALES PRELIMINAR COBRO', 25.0000, 1.0000)
