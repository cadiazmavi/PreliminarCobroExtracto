
GO
/****** Object:  Table [dbo].[Auxiliar]    Script Date: 23/09/2022 06:13:16 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auxiliar](
	[ID] [int] /*IDENTITY(1,1) NOT FOR REPLICATION*/ NOT NULL,
	[Empresa] [char](5) NULL,
	[Rama] [char](5) NULL,
	[Mov] [char](20) NULL,
	[MovID] [varchar](20) NULL,
	[Modulo] [char](5) NULL,
	[ModuloID] [int] NULL,
	[Moneda] [char](10) NULL,
	[TipoCambio] [float] NULL,
	[Grupo] [char](10) NULL,
	[Cuenta] [char](20) NULL,
	[SubCuenta] [varchar](50) NULL,
	[Ejercicio] [int] NULL,
	[Periodo] [int] NULL,
	[Fecha] [datetime] NULL,
	[Cargo] [money] NULL,
	[Abono] [money] NULL,
	[Aplica] [varchar](20) NULL,
	[AplicaID] [varchar](20) NULL,
	--[Acumulado] [bit] NOT NULL,
	--[Conciliado] [bit] NOT NULL,
	--[EsCancelacion] [bit] NOT NULL,
	[FechaConciliacion] [datetime] NULL,
	--[Sucursal] [int] NOT NULL,
	[Renglon] [float] NULL,
	[RenglonSub] [int] NULL,
 CONSTRAINT [priAuxiliar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
--GO
--ALTER TABLE [dbo].[Auxiliar] ADD  DEFAULT ((0)) FOR [Acumulado]
--GO
--ALTER TABLE [dbo].[Auxiliar] ADD  DEFAULT ((0)) FOR [Conciliado]
--GO
--ALTER TABLE [dbo].[Auxiliar] ADD  DEFAULT ((0)) FOR [EsCancelacion]
--GO
--ALTER TABLE [dbo].[Auxiliar] ADD  DEFAULT ((0)) FOR [Sucursal]
--GO
