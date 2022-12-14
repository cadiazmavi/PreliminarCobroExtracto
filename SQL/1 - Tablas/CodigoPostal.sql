
GO
/****** Object:  Table [dbo].[CodigoPostal]    Script Date: 23/09/2022 05:26:27 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodigoPostal](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CodigoPostal] [varchar](15) NOT NULL,
	[Colonia] [varchar](60) NOT NULL,
	[Delegacion] [varchar](50) NOT NULL,
	[Estado] [varchar](50) NULL,
	--[Ruta] [varchar](50) NULL,
	--[LocalidadCNBV] [varchar](10) NULL,
	--[MaviRutaSupervision] [varchar](50) NULL,
	[Cobranza] [varchar](100) NULL
	--[CRMObjectId] [uniqueidentifier] NULL,
	--[CRMLastUpdate] [datetime] NULL,
	--[d_tipo_asenta] [varchar](5) NULL,
	--[d_ciudad] [varchar](50) NULL,
	--[d_cp] [varchar](50) NULL,
	--[c_estado] [varchar](50) NULL,
	--[c_oficina] [varchar](50) NULL,
	--[c_CP] [varchar](50) NULL,
	--[c_tipo_asenta] [varchar](50) NULL,
	--[c_mnpio] [varchar](50) NULL,
	--[id_asenta_cpcons] [varchar](50) NULL,
	--[d_zona] [varchar](50) NULL,
	--[c_cve_ciudad] [varchar](50) NULL,
	--[Kms] [float] NULL,
	--[Latitud] [float] NULL,
	--[Longitud] [float] NULL,
 CONSTRAINT [priCodigoPostal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[CodigoPostal] ADD  DEFAULT (getdate()) FOR [CRMLastUpdate]
--GO
--EXEC sys.sp_addextendedproperty @name=N'Kms', @value=N'guardara la cantidad de kms que recorrea del cd al destino' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CodigoPostal', @level2type=N'COLUMN',@level2name=N'Kms'
--GO
--EXEC sys.sp_addextendedproperty @name=N'Latitud', @value=N'Campo para guardar la latitud del codigo postal.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CodigoPostal', @level2type=N'COLUMN',@level2name=N'Latitud'
--GO
--EXEC sys.sp_addextendedproperty @name=N'Longitud', @value=N'Campo para guardar la longitud del codigo postal.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CodigoPostal', @level2type=N'COLUMN',@level2name=N'Longitud'
--GO
