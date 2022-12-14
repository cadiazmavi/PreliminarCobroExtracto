
GO
/****** Object:  Table [dbo].[CteTel]    Script Date: 23/09/2022 02:59:14 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CteTel](
	[Cliente] [varchar](10) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
	[Lada] [varchar](10) NULL,
	--[Extencion] [varchar](10) NULL,
	--[PedirTono] [bit] NULL,
	--[DePreferencia] [bit] NULL,
	--[id_tel] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[ValidacionTel] [bit] NULL
	--[AppOrigen] [varchar](50) NULL,
	--[Usuario] [varchar](10) NULL,
	--[EnvioNIP] [bit] NULL,
	--[Sucursal] [int] NULL,
	--[FechaCaptura] [datetime] NULL,
	--[TelExistente] [bit] NULL,
 CONSTRAINT [priCteTel] PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC,
	[Tipo] ASC,
	[Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[CteTel] ADD  DEFAULT ((0)) FOR [PedirTono]
--GO
--ALTER TABLE [dbo].[CteTel] ADD  DEFAULT ((0)) FOR [DePreferencia]
--GO
--ALTER TABLE [dbo].[CteTel] ADD  CONSTRAINT [DF_CteTel_ValidacionTel]  DEFAULT ((0)) FOR [ValidacionTel]
--GO
--EXEC sys.sp_addextendedproperty @name=N'ValidacionTel', @value=N'Campo que almacena si el número celular está validado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CteTel', @level2type=N'COLUMN',@level2name=N'ValidacionTel'
--GO
--EXEC sys.sp_addextendedproperty @name=N'AppOrigen', @value=N'Campo que almacena de dónde ha sido validado el número celular: APP SUP/WEB/PISO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CteTel', @level2type=N'COLUMN',@level2name=N'AppOrigen'
--GO
--EXEC sys.sp_addextendedproperty @name=N'Usuario', @value=N'Usuario que valida el telefono' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CteTel', @level2type=N'COLUMN',@level2name=N'Usuario'
--GO
--EXEC sys.sp_addextendedproperty @name=N'EnvioNIP', @value=N'Indica si se envio nip de validacion al cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CteTel', @level2type=N'COLUMN',@level2name=N'EnvioNIP'
--GO
--EXEC sys.sp_addextendedproperty @name=N'Sucursal', @value=N'Campo que contiene numero de sucursal.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CteTel', @level2type=N'COLUMN',@level2name=N'Sucursal'
--GO
--EXEC sys.sp_addextendedproperty @name=N'FechaCaptura', @value=N'Almacenará la fecha en la que el telefono fue registrado de las distintas herrameintas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CteTel', @level2type=N'COLUMN',@level2name=N'FechaCaptura'
--GO
--EXEC sys.sp_addextendedproperty @name=N'TelExistente', @value=N'Indica si existe el Telefono del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CteTel', @level2type=N'COLUMN',@level2name=N'TelExistente'
--GO
