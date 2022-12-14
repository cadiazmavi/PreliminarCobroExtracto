
GO
/****** Object:  Table [dbo].[BonifSIMavi]    Script Date: 23/09/2022 08:36:55 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BonifSIMavi](
	[IDCxc] [int] NOT NULL,
	[Linea] [varchar](50) NOT NULL,
	[PrecioToTal] [money] NOT NULL,
	[SucursalVenta] [int] NOT NULL,
	[Articulo] [varchar](100) NULL,
	[MaviUltimoPago] [datetime] NULL,
	[Familia] [varchar](50) NULL,
 CONSTRAINT [priBonifSIMavi] PRIMARY KEY CLUSTERED 
(
	[IDCxc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BonifSIMavi] ADD  DEFAULT (NULL) FOR [Articulo]
GO
