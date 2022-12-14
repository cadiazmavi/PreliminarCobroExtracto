
GO
/****** Object:  Table [dbo].[Cte_Final]    Script Date: 23/09/2022 08:49:09 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cte_Final](
	[ClienteF] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[ApellidoPaterno] [varchar](100) NULL,
	[ApellidoMaterno] [varchar](100) NULL,
	[FechaNacimiento] [datetime] NULL,
	[RFC] [varchar](15) NULL,
	[Direccion] [varchar](150) NULL,
	[DireccionNumero] [varchar](20) NULL,
	[DireccionNumeroInt] [varchar](20) NULL,
	[EntreCalles] [varchar](150) NULL,
	[Colonia] [varchar](100) NULL,
	[Poblacion] [varchar](100) NULL,
	[CodigoPostal] [varchar](15) NULL,
	[Estado] [varchar](30) NULL,
	[TelefonoFijo] [bigint] NULL,
	[TelefonoCelular] [bigint] NULL,
	[eMail] [varchar](50) NULL,
	[TipoIdentificacion] [varchar](50) NULL,
	[NoIdentificacion] [varchar](50) NULL,
	[FechaAlta] [datetime] NULL,
	[Estatus] [varchar](15) NOT NULL,
	[FechaUltimoCambio] [datetime] NULL,
	[Usuario] [varchar](15) NOT NULL,
	[FechaCtaF] [datetime] NULL,
	[ApoyoCobranza] [bit] NULL,
	[RetiroApoyoCobranza] [bit] NULL,
	[IntentosSolApoyo] [int] NULL,
	[TotalAsignaciones] [int] NULL,
	[NivelesEspecialesMavi] [varchar](100) NULL,
	[Compania] [varchar](50) NULL,
	[CodigoSMS] [int] NULL,
	[SMSValidado] [bit] NULL,
	[FechaValidado] [datetime] NULL,
	[Nip] [varchar](50) NULL,
	[DocumentoValidado] [bit] NULL,
	[IdTipoBF] [int] NULL,
	[ValidacionTel] [bit] NULL,
	[FechaCategorizacion] [datetime] NULL,
	[Irregularidad] [bit] NULL,
	[UsuarioIrreg] [varchar](10) NULL,
	[FechaIrreg] [datetime] NULL,
	[MotivoIrreg] [varchar](255) NULL,
	[SinBonifBF] [bit] NULL,
	[MapaLatitud] [float] NULL,
	[MapaLongitud] [float] NULL,
	[ReestructuraDeuda] [bit] NULL,
	[UsuarioValidaTarjeta] [varchar](10) NULL,
	[CuentaCLABE] [varchar](19) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cte_Final] ADD  DEFAULT ((0)) FOR [ApoyoCobranza]
GO
ALTER TABLE [dbo].[Cte_Final] ADD  DEFAULT ((0)) FOR [RetiroApoyoCobranza]
GO
ALTER TABLE [dbo].[Cte_Final] ADD  CONSTRAINT [DF_Cte_Final_IdTipoBF]  DEFAULT ((1)) FOR [IdTipoBF]
GO
ALTER TABLE [dbo].[Cte_Final] ADD  CONSTRAINT [DF_Cte_Final_ValidacionTel]  DEFAULT ((0)) FOR [ValidacionTel]
GO
ALTER TABLE [dbo].[Cte_Final] ADD  CONSTRAINT [DF_Cte_Final_Irregularidad]  DEFAULT ((0)) FOR [Irregularidad]
GO
ALTER TABLE [dbo].[Cte_Final] ADD  CONSTRAINT [DF_Cte_Final_SinBonifBF]  DEFAULT ((0)) FOR [SinBonifBF]
GO
EXEC sys.sp_addextendedproperty @name=N'NivelesEspecialesMavi', @value=N'Este campo permite al area de cobranza, asignar un nivel especial al cliente final' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'NivelesEspecialesMavi'
GO
EXEC sys.sp_addextendedproperty @name=N'Compania', @value=N'Compania de telefono del BF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'Compania'
GO
EXEC sys.sp_addextendedproperty @name=N'CodigoSMS', @value=N'Codigo que se envio para validar el telefono celular del BF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'CodigoSMS'
GO
EXEC sys.sp_addextendedproperty @name=N'SMSValidado', @value=N'Guarda el registro si el registro de telefono fue correcto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'SMSValidado'
GO
EXEC sys.sp_addextendedproperty @name=N'FechaValidado', @value=N'Fecha de validacion del telefono' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'FechaValidado'
GO
EXEC sys.sp_addextendedproperty @name=N'Nip', @value=N'Nip de venta para el BF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'Nip'
GO
EXEC sys.sp_addextendedproperty @name=N'DocumentoValidado', @value=N'Guarda si la boleta esta validada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'DocumentoValidado'
GO
EXEC sys.sp_addextendedproperty @name=N'IdTipoBF', @value=N'Agrega el id del tipo de Beneficiario Final' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'IdTipoBF'
GO
EXEC sys.sp_addextendedproperty @name=N'ValidacionTel', @value=N'Guarda si ya fue validado o no la información de la persona via telefonica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'ValidacionTel'
GO
EXEC sys.sp_addextendedproperty @name=N'FechaCategorizacion', @value=N'Guarda la fecha en la que se hizo un cambio de beneficiario final' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'FechaCategorizacion'
GO
EXEC sys.sp_addextendedproperty @name=N'Irregularidad', @value=N'Indica que el BF presento irregularidades durante la supervision' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'Irregularidad'
GO
EXEC sys.sp_addextendedproperty @name=N'UsuarioIrreg', @value=N'Usuario que reporto la irregularidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'UsuarioIrreg'
GO
EXEC sys.sp_addextendedproperty @name=N'FechaIrreg', @value=N'Fecha en que se reporto la irregularidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'FechaIrreg'
GO
EXEC sys.sp_addextendedproperty @name=N'MotivoIrreg', @value=N'MotivoIrreg por el que se reporto la irregularidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'MotivoIrreg'
GO
EXEC sys.sp_addextendedproperty @name=N'SinBonifBF', @value=N'Este campo almacena el estado de un beneficiario final, en caso de estar intervenido el campo almacenara un 1, caso contrario un 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'SinBonifBF'
GO
EXEC sys.sp_addextendedproperty @name=N'MapaLatitud', @value=N'Guardara la latitud de la coordenada asociada al Cte final' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'MapaLatitud'
GO
EXEC sys.sp_addextendedproperty @name=N'MapaLongitud', @value=N'Guardara la longitud de la coordenada asociada al Cte final' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'MapaLongitud'
GO
EXEC sys.sp_addextendedproperty @name=N'ReestructuraDeuda', @value=N'check para saber si tiene un ReestructuraDeuda' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'ReestructuraDeuda'
GO
EXEC sys.sp_addextendedproperty @name=N'UsuarioValidaTarjeta', @value=N'Este campo almacenara el usuario que realiza la validacion positiva o negativa de la informacion de consulta cep y dispersion.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'UsuarioValidaTarjeta'
GO
EXEC sys.sp_addextendedproperty @name=N'CuentaCLABE', @value=N'Este campo guardara la cuenta de la CLABE del cliente.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final', @level2type=N'COLUMN',@level2name=N'CuentaCLABE'
GO
EXEC sys.sp_addextendedproperty @name=N'Cte_Final', @value=N'Almacena la información de los beneficiarios finales' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cte_Final'
GO
