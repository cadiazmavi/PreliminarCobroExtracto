
GO
/****** Object:  Table [dbo].[MaviRecuperacion]    Script Date: 23/09/2022 07:51:04 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaviRecuperacion](
	[Cliente] [varchar](15) NOT NULL,
	[CanalVenta] [varchar](50) NOT NULL,
	[IDMov] [int] NOT NULL,
	[Documento] [varchar](50) NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[FechaUltimoCambio] [datetime] NULL,
	[FechaVencimiento] [datetime] NULL,
	[SubTotal] [money] NULL,
	[IVA] [money] NULL,
	[Total] [money] NULL,
	[DiasInactivos] [int] NULL,
	[DiasVencidos] [int] NULL,
	[NivelCobranza] [varchar](100) NULL,
	[RutaCobranza] [varchar](50) NULL,
	[AgenteCobrador] [varchar](10) NULL,
	[Quincena] [int] NOT NULL,
	[Ejercicio] [int] NOT NULL,
	[Calculado] [bit] NULL,
	[Colonia] [varchar](100) NULL,
	[CodigoPostal] [varchar](15) NULL,
	[categoria] [varchar](50) NULL,
	[division] [varchar](30) NULL,
	[zona] [varchar](15) NULL,
	[AsigDiaria] [int] NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AsigDiaria', @value=N'Identificador de AsignacionDiaria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaviRecuperacion', @level2type=N'COLUMN',@level2name=N'AsigDiaria'
GO
