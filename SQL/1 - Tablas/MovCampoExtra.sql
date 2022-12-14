
GO
/****** Object:  Table [dbo].[MovCampoExtra]    Script Date: 23/09/2022 06:39:02 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovCampoExtra](
	[Modulo] [varchar](5) NOT NULL,
	[Mov] [varchar](20) NOT NULL,
	[ID] [int] NOT NULL,
	[CampoExtra] [varchar](50) NOT NULL,
	[Valor] [varchar](255) NULL,
	[ValorAnterior] [varchar](255) NULL,
	[Puntos] [float] NULL,
	[PuntosAnteriores] [float] NULL,
 CONSTRAINT [priMovCampoExtra] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Modulo] ASC,
	[Mov] ASC,
	[CampoExtra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
