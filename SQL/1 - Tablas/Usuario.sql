
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/09/2022 02:27:26 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Sucursal] [int] NULL,
	[DefEmpresa] [varchar](5) NULL,
	[GrupoTrabajo] [varchar](50) NULL,
	[Departamento] [varchar](50) NULL,
	[Contrasena] [varchar](32) NULL,
	[ContrasenaConfirmacion] [varchar](32) NULL,
	[ContrasenaFecha] [datetime] NULL,
	[Telefono] [varchar](100) NULL,
	[Extencion] [varchar](10) NULL,
	[DefAgente] [varchar](10) NULL,
	[DefCajero] [varchar](10) NULL,
	[DefAlmacen] [varchar](10) NULL,
	[DefAlmacenTrans] [varchar](10) NULL,
	[DefCtaDinero] [varchar](10) NULL,
	[DefCtaDineroTrans] [varchar](10) NULL,
	[DefMoneda] [varchar](10) NULL,
	[DefProyecto] [varchar](50) NULL,
	[DefLocalidad] [varchar](50) NULL,
	[DefCliente] [varchar](10) NULL,
	[DefActividad] [varchar](50) NULL,
	[DefMovVentas] [varchar](20) NULL,
	[DefZonaImpuesto] [varchar](30) NULL,
	[DefFormaPago] [varchar](50) NULL,
	[Afectar] [bit] NOT NULL,
	[Cancelar] [bit] NOT NULL,
	[Desafectar] [bit] NOT NULL,
	[Autorizar] [bit] NULL,
	[AutorizarVenta] [bit] NULL,
	[AutorizarCxp] [bit] NULL,
	[AutorizarGasto] [bit] NULL,
	[AutorizarDinero] [bit] NULL,
	[AutorizarPV] [bit] NULL,
	[AutorizarCompra] [bit] NULL,
	[AutorizarSeriesLotes] [bit] NULL,
	[AfectarOtrosMovs] [bit] NOT NULL,
	[CancelarOtrosMovs] [bit] NOT NULL,
	[ConsultarOtrosMovs] [bit] NOT NULL,
	[ConsultarOtrosMovsGrupo] [bit] NULL,
	[ConsultarOtrasEmpresas] [bit] NULL,
	[ConsultarOtrasSucursales] [bit] NULL,
	[AccesarOtrasSucursalesEnLinea] [bit] NULL,
	[AfectarOtrasSucursalesEnLinea] [bit] NULL,
	[ModificarOtrosMovs] [bit] NOT NULL,
	[ModificarVencimientos] [bit] NOT NULL,
	[ModificarEntregas] [bit] NOT NULL,
	[ModificarFechaRequerida] [bit] NULL,
	[ModificarEnvios] [bit] NOT NULL,
	[ModificarReferencias] [bit] NOT NULL,
	[ModificarAlmacenEntregas] [bit] NOT NULL,
	[ModificarSituacion] [bit] NOT NULL,
	[ModificarAgente] [bit] NOT NULL,
	[ModificarUsuario] [bit] NOT NULL,
	[ModificarListaPrecios] [bit] NOT NULL,
	[ModificarZonaImpuesto] [bit] NOT NULL,
	[ModificarSucursalDestino] [bit] NULL,
	[ModificarProyUENActCC] [bit] NULL,
	[AgregarCteExpress] [bit] NOT NULL,
	[AgregarArtExpress] [bit] NOT NULL,
	[Costos] [bit] NOT NULL,
	[BloquearCostos] [bit] NULL,
	[VerInfoDeudores] [bit] NOT NULL,
	[VerInfoAcreedores] [bit] NOT NULL,
	[VerComisionesPendientes] [bit] NOT NULL,
	[BloquearEncabezadoVenta] [bit] NOT NULL,
	[BloquearCxcCtaDinero] [bit] NOT NULL,
	[BloquearCxpCtaDinero] [bit] NOT NULL,
	[BloquearDineroCtaDinero] [bit] NOT NULL,
	[EnviarExcel] [bit] NOT NULL,
	[ImprimirMovs] [bit] NOT NULL,
	[PreliminarMovs] [bit] NOT NULL,
	[Reservar] [bit] NOT NULL,
	[DesReservar] [bit] NOT NULL,
	[Asignar] [bit] NOT NULL,
	[DesAsignar] [bit] NOT NULL,
	[ModificarAlmacenPedidos] [bit] NOT NULL,
	[ModificarConceptos] [bit] NOT NULL,
	[ModificarReferenciasSiempre] [bit] NOT NULL,
	[ModificarAgenteCxcPendiente] [bit] NOT NULL,
	[ModificarMovsNominaVigentes] [bit] NULL,
	[BloquearPrecios] [bit] NOT NULL,
	[BloquearDescGlobal] [bit] NULL,
	[BloquearDescLinea] [bit] NULL,
	[BloquearCondiciones] [bit] NOT NULL,
	[BloquearAlmacen] [bit] NOT NULL,
	[BloquearMoneda] [bit] NOT NULL,
	[BloquearAgente] [bit] NOT NULL,
	[BloquearFechaEmision] [bit] NOT NULL,
	[BloquearProyecto] [bit] NOT NULL,
	[BloquearFormaPago] [bit] NULL,
	[Oficina] [varchar](50) NULL,
	[DefArtTipo] [varchar](20) NULL,
	[DefUnidad] [varchar](50) NULL,
	[AbrirCajon] [bit] NULL,
	[BloquearCobroInmediato] [bit] NULL,
	[ConsultarCompraPendiente] [bit] NULL,
	[AccesoTotalCuentas] [bit] NULL,
	[Estatus] [varchar](15) NOT NULL,
	[UltimoCambio] [datetime] NULL,
	[Alta] [datetime] NULL,
	[Configuracion] [varchar](10) NULL,
	[Acceso] [varchar](10) NULL,
	[TieneMovimientos] [bit] NULL,
	[Refacturar] [bit] NULL,
	[DefListaPreciosEsp] [varchar](20) NULL,
	[LimiteTableroControl] [int] NULL,
	[CteInfo] [bit] NULL,
	[CteBloquearOtrosDatos] [bit] NULL,
	[ArtBloquearOtrosDatos] [bit] NULL,
	[CteSucursalVenta] [bit] NULL,
	[CtaDineroInfo] [bit] NULL,
	[ImpresionInmediata] [bit] NULL,
	[MostrarCampos] [bit] NULL,
	[AsistentePrecios] [bit] NULL,
	[CambioValidarCobertura] [bit] NULL,
	[CambioNormatividad] [bit] NULL,
	[CambioEditarCobertura] [bit] NULL,
	[CambioVerPosicionEmpresa] [bit] NULL,
	[CambioVerPosicionSucursal] [bit] NULL,
	[CambioVerPosicionOtraSucursal] [bit] NULL,
	[CambioAutorizarOperacionLimite] [bit] NULL,
	[AutoDobleCapturaPrecios] [bit] NULL,
	[AutoArtGrupo] [varchar](50) NULL,
	[AutoAgregarRecaudacionConsumo] [bit] NULL,
	[AutoDiesel] [bit] NULL,
	[BloquearActividad] [bit] NULL,
	[UEN] [int] NULL,
	[eMail] [varchar](50) NULL,
	[CteMov] [bit] NULL,
	[CteArt] [bit] NULL,
	[ProvMov] [bit] NULL,
	[ArtMov] [bit] NULL,
	[DefContUso] [varchar](20) NULL,
	[BloquearContUso] [bit] NULL,
	[Observaciones] [varchar](255) NULL,
	[TraspasarTodo] [bit] NULL,
	[BloquearNotasNegativas] [bit] NULL,
	[ModificarSerieLoteProp] [bit] NULL,
	[NominaEliminacionParcial] [bit] NULL,
	[ModificarPropiedadesLotes] [bit] NULL,
	[PVAbrirCajonSiempre] [bit] NULL,
	[PVBloquearEgresos] [bit] NULL,
	[PVCobrarNotasEstatusBorrador] [bit] NULL,
	[PVModificarEstatusBorrador] [bit] NULL,
	[BloquearPersonalCfg] [bit] NULL,
	[BloquearFacturacionDirecta] [bit] NULL,
	[Idioma] [varchar](50) NULL,
	[ModificarDatosVIN] [bit] NULL,
	[ModificarDatosCliente] [bit] NULL,
	[CxcExpress] [bit] NULL,
	[CxpExpress] [bit] NULL,
	[Cliente] [varchar](10) NULL,
	[SubModuloAtencion] [varchar](5) NULL,
	[BloquearCancelarFactura] [bit] NULL,
	[CambioPresentacionExpress] [bit] NULL,
	[ModificarConsecutivos] [bit] NULL,
	[ModificarVINFechaBaja] [bit] NULL,
	[ModificarVINFechaPago] [bit] NULL,
	[ModificarVINAccesorio] [bit] NULL,
	[PVEditarNota] [bit] NULL,
	[ModificarDescGlobalImporte] [bit] NULL,
	[ConsultarClientesOtrosAgentes] [bit] NULL,
	[ACLCUsoEspecifico] [varchar](20) NULL,
	[ACEditarTablaAmortizacion] [bit] NULL,
	[PlantillasOffice] [bit] NULL,
	[ConfigPlantillasOffice] [bit] NULL,
	[ACTasaGrupo] [varchar](50) NULL,
	[CambioAgregarBeneficiarios] [bit] NULL,
	[AgregarConceptoExpress] [bit] NULL,
	[BloquearArtMaterial] [bit] NULL,
	[InfoPath] [bit] NULL,
	[InfoPathExe] [varchar](255) NULL,
	[FEA] [bit] NULL,
	[FEACertificado] [varchar](100) NULL,
	[FEALlave] [varchar](100) NULL,
	[ContrasenaNuncaExpira] [bit] NULL,
	[Menu] [varchar](50) NULL,
	[MenuAccesoTotal] [bit] NULL,
	[BloquearPDF] [bit] NULL,
	[VerificarOrtografia] [bit] NULL,
	[ContSinOrigen] [bit] NULL,
	[UnidadOrganizacional] [varchar](20) NULL,
	[ProyectoMov] [bit] NULL,
	[CompraDevTodo] [bit] NULL,
	[BloquearWebContenido] [bit] NULL,
	[BloquearWebHTML] [bit] NULL,
	[AgregarProvExpress] [bit] NULL,
	[ProyMov] [bit] NULL,
	[Tipo_Descuento] [varchar](50) NULL,
	[PorcDescuento] [float] NULL,
	[ContrasenaPocket] [varchar](20) NULL,
	[PerfilForma] [varchar](50) NULL,
	[Licenciamiento] [varchar](50) NULL,
	[AutorizarGestion] [bit] NULL,
	[DBMailPerfil] [varchar](50) NULL,
	[BloquearInvSalidaDirecta] [bit] NULL,
	[UltimoAcceso] [datetime] NULL,
	[BloquearSituacionUsuario] [bit] NULL,
	[InformacionConfidencial] [bit] NULL,
	[ContrasenaModificar] [bit] NULL,
	[SituacionArea] [varchar](50) NULL,
	[ModificarTipoImpuesto] [bit] NULL,
	[BloquearTipoCambio] [bit] NULL,
	[Personal] [varchar](10) NULL,
	[AfectarCORTE] [bit] NULL,
	[ModificarPosicionSugeridaWMS] [bit] NULL,
	[ModificarAgenteWMS] [bit] NULL,
	[OPORTPlantilla] [varchar](20) NULL,
	[INFORPerfil] [varchar](30) NULL,
	[INFORSupervisor] [bit] NOT NULL,
	[ReferenciaIntelisisService] [varchar](50) NULL,
	[ISMESNotificarError] [bit] NULL,
	[POSPerfil] [varchar](10) NULL,
	[POSEsSupervisor] [bit] NULL,
	[MESAcceso] [bit] NOT NULL,
	[MESEstructura] [bit] NOT NULL,
	[MESPlanificacion] [bit] NOT NULL,
	[MESVariantes] [bit] NOT NULL,
	[MESScheduling] [bit] NOT NULL,
	[VicAgregaCondic] [bit] NULL,
	[VicActualizaCondic] [bit] NULL,
	[VicInactivaCondic] [bit] NULL,
	[VicEliminaCondic] [bit] NULL,
	[vic_VerPlanoGramaDiseno] [bit] NULL,
	[vic_VerPlanoGramaProduccion] [bit] NULL,
	[vic_CopiarAccionesPlanoGrama] [bit] NULL,
	[vic_ActualizarPlanoGrama] [bit] NULL,
	[vic_EliminarPlanoGrama] [bit] NULL,
	[vic_AccionesPlanoGrama] [bit] NULL,
	[AutorizaAltaTarima] [bit] NULL,
	[CE] [bit] NULL,
	[AutorizarCE] [bit] NULL,
	[CEBloquearCalif] [bit] NULL,
	[DefPersonal] [varchar](10) NULL,
	[DesafectarAsig] [bit] NULL,
	[PeriodoEvalWEB] [bit] NULL,
	[ModNumCiclo] [bit] NULL,
	[ModMatricula] [bit] NULL,
	[CreditosSugeridos] [bit] NULL,
	[CEHorarioAlumnoRegMat] [bit] NULL,
	[CENoGenerarCuotasJob] [bit] NULL,
	[AgregarAlumnosCyA] [bit] NULL,
	[CEPlandeEstudios] [bit] NULL,
	[CEAfectarMovControlFechas] [bit] NULL,
	[CEContrasenaPortal] [varchar](255) NULL,
	[CEUltimasContrasenasPortal1] [varchar](255) NULL,
	[CEUltimasContrasenasPortal2] [varchar](255) NULL,
	[CEUltimasContrasenasPortal3] [varchar](255) NULL,
	[CEUltimasContrasenasPortal4] [varchar](255) NULL,
	[CEUltimasContrasenasPortal5] [varchar](255) NULL,
	[CEUltimasContrasenasPortal6] [varchar](255) NULL,
	[CECaducaContrasenaPortal] [datetime] NULL,
	[RefBancoTipo] [varchar](255) NULL,
	[RefBancoTipo1] [varchar](255) NULL,
	[RefBancoTipo2] [varchar](255) NULL,
	[RefBancoTipo3] [varchar](255) NULL,
	[RefBancoTipo4] [varchar](255) NULL,
	[RefBancoTipo5] [varchar](255) NULL,
	[RefBancoTipo6] [varchar](255) NULL,
	[BloqueaCPortal] [bit] NULL,
	[DesafectarBaja] [bit] NULL,
	[UsuarioSesionPortal] [varchar](20) NULL,
	[UsuarioPerfilPortal] [varchar](10) NULL,
	[PerfilPortal] [varchar](20) NULL,
	[EstatusPortal] [varchar](15) NULL,
	[ModificarPerfilPortal] [bit] NULL,
	[ModificarEstatusPortal] [bit] NULL,
	[eMailInt] [varchar](50) NULL,
	[IdiomaPortal] [varchar](20) NULL,
	[POSCodigoAut] [varchar](36) NULL,
	[vicRenovarEspecial] [bit] NULL,
	[vic_BajaContrato] [bit] NULL,
	[VicRealizarApartado] [bit] NULL,
	[VicModificarFechasApartado] [bit] NULL,
	[VicRealizarDesapartado] [bit] NULL,
	[VicEditarContrato] [bit] NULL,
	[vicParametrizacion] [bit] NULL,
	[vicAccesoHerrEnvioMail] [bit] NULL,
	[vicConfigHerrEnvioMail] [bit] NULL,
	[vicLocalUsuarioPS] [bit] NULL,
	[vicFusDivLocales] [bit] NOT NULL,
	[vicGenerarComision] [bit] NULL,
	[vicVentaDepRefdo] [bit] NULL,
	[vicLogPN] [bit] NULL,
	[vicGenerarComplementoRenovacio] [bit] NULL,
	[VicHerramientaFechaProximoMov] [bit] NULL,
	[VicHerramientaCondicionPago] [bit] NULL,
	[UsuarioSalud] [bit] NULL,
	[vicComisiones] [bit] NULL,
	[vicGFAAutorizaComisiones] [bit] NULL,
	[vicGFAAfectaComisiones] [bit] NULL,
 CONSTRAINT [priUsuario] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT [dbo].[Usuario] ([Usuario], [Nombre], [Sucursal], [DefEmpresa], [GrupoTrabajo], [Departamento], [Contrasena], [ContrasenaConfirmacion], [ContrasenaFecha], [Telefono], [Extencion], [DefAgente], [DefCajero], [DefAlmacen], [DefAlmacenTrans], [DefCtaDinero], [DefCtaDineroTrans], [DefMoneda], [DefProyecto], [DefLocalidad], [DefCliente], [DefActividad], [DefMovVentas], [DefZonaImpuesto], [DefFormaPago], [Afectar], [Cancelar], [Desafectar], [Autorizar], [AutorizarVenta], [AutorizarCxp], [AutorizarGasto], [AutorizarDinero], [AutorizarPV], [AutorizarCompra], [AutorizarSeriesLotes], [AfectarOtrosMovs], [CancelarOtrosMovs], [ConsultarOtrosMovs], [ConsultarOtrosMovsGrupo], [ConsultarOtrasEmpresas], [ConsultarOtrasSucursales], [AccesarOtrasSucursalesEnLinea], [AfectarOtrasSucursalesEnLinea], [ModificarOtrosMovs], [ModificarVencimientos], [ModificarEntregas], [ModificarFechaRequerida], [ModificarEnvios], [ModificarReferencias], [ModificarAlmacenEntregas], [ModificarSituacion], [ModificarAgente], [ModificarUsuario], [ModificarListaPrecios], [ModificarZonaImpuesto], [ModificarSucursalDestino], [ModificarProyUENActCC], [AgregarCteExpress], [AgregarArtExpress], [Costos], [BloquearCostos], [VerInfoDeudores], [VerInfoAcreedores], [VerComisionesPendientes], [BloquearEncabezadoVenta], [BloquearCxcCtaDinero], [BloquearCxpCtaDinero], [BloquearDineroCtaDinero], [EnviarExcel], [ImprimirMovs], [PreliminarMovs], [Reservar], [DesReservar], [Asignar], [DesAsignar], [ModificarAlmacenPedidos], [ModificarConceptos], [ModificarReferenciasSiempre], [ModificarAgenteCxcPendiente], [ModificarMovsNominaVigentes], [BloquearPrecios], [BloquearDescGlobal], [BloquearDescLinea], [BloquearCondiciones], [BloquearAlmacen], [BloquearMoneda], [BloquearAgente], [BloquearFechaEmision], [BloquearProyecto], [BloquearFormaPago], [Oficina], [DefArtTipo], [DefUnidad], [AbrirCajon], [BloquearCobroInmediato], [ConsultarCompraPendiente], [AccesoTotalCuentas], [Estatus], [UltimoCambio], [Alta], [Configuracion], [Acceso], [TieneMovimientos], [Refacturar], [DefListaPreciosEsp], [LimiteTableroControl], [CteInfo], [CteBloquearOtrosDatos], [ArtBloquearOtrosDatos], [CteSucursalVenta], [CtaDineroInfo], [ImpresionInmediata], [MostrarCampos], [AsistentePrecios], [CambioValidarCobertura], [CambioNormatividad], [CambioEditarCobertura], [CambioVerPosicionEmpresa], [CambioVerPosicionSucursal], [CambioVerPosicionOtraSucursal], [CambioAutorizarOperacionLimite], [AutoDobleCapturaPrecios], [AutoArtGrupo], [AutoAgregarRecaudacionConsumo], [AutoDiesel], [BloquearActividad], [UEN], [eMail], [CteMov], [CteArt], [ProvMov], [ArtMov], [DefContUso], [BloquearContUso], [Observaciones], [TraspasarTodo], [BloquearNotasNegativas], [ModificarSerieLoteProp], [NominaEliminacionParcial], [ModificarPropiedadesLotes], [PVAbrirCajonSiempre], [PVBloquearEgresos], [PVCobrarNotasEstatusBorrador], [PVModificarEstatusBorrador], [BloquearPersonalCfg], [BloquearFacturacionDirecta], [Idioma], [ModificarDatosVIN], [ModificarDatosCliente], [CxcExpress], [CxpExpress], [Cliente], [SubModuloAtencion], [BloquearCancelarFactura], [CambioPresentacionExpress], [ModificarConsecutivos], [ModificarVINFechaBaja], [ModificarVINFechaPago], [ModificarVINAccesorio], [PVEditarNota], [ModificarDescGlobalImporte], [ConsultarClientesOtrosAgentes], [ACLCUsoEspecifico], [ACEditarTablaAmortizacion], [PlantillasOffice], [ConfigPlantillasOffice], [ACTasaGrupo], [CambioAgregarBeneficiarios], [AgregarConceptoExpress], [BloquearArtMaterial], [InfoPath], [InfoPathExe], [FEA], [FEACertificado], [FEALlave], [ContrasenaNuncaExpira], [Menu], [MenuAccesoTotal], [BloquearPDF], [VerificarOrtografia], [ContSinOrigen], [UnidadOrganizacional], [ProyectoMov], [CompraDevTodo], [BloquearWebContenido], [BloquearWebHTML], [AgregarProvExpress], [ProyMov], [Tipo_Descuento], [PorcDescuento], [ContrasenaPocket], [PerfilForma], [Licenciamiento], [AutorizarGestion], [DBMailPerfil], [BloquearInvSalidaDirecta], [UltimoAcceso], [BloquearSituacionUsuario], [InformacionConfidencial], [ContrasenaModificar], [SituacionArea], [ModificarTipoImpuesto], [BloquearTipoCambio], [Personal], [AfectarCORTE], [ModificarPosicionSugeridaWMS], [ModificarAgenteWMS], [OPORTPlantilla], [INFORPerfil], [INFORSupervisor], [ReferenciaIntelisisService], [ISMESNotificarError], [POSPerfil], [POSEsSupervisor], [MESAcceso], [MESEstructura], [MESPlanificacion], [MESVariantes], [MESScheduling], [VicAgregaCondic], [VicActualizaCondic], [VicInactivaCondic], [VicEliminaCondic], [vic_VerPlanoGramaDiseno], [vic_VerPlanoGramaProduccion], [vic_CopiarAccionesPlanoGrama], [vic_ActualizarPlanoGrama], [vic_EliminarPlanoGrama], [vic_AccionesPlanoGrama], [AutorizaAltaTarima], [CE], [AutorizarCE], [CEBloquearCalif], [DefPersonal], [DesafectarAsig], [PeriodoEvalWEB], [ModNumCiclo], [ModMatricula], [CreditosSugeridos], [CEHorarioAlumnoRegMat], [CENoGenerarCuotasJob], [AgregarAlumnosCyA], [CEPlandeEstudios], [CEAfectarMovControlFechas], [CEContrasenaPortal], [CEUltimasContrasenasPortal1], [CEUltimasContrasenasPortal2], [CEUltimasContrasenasPortal3], [CEUltimasContrasenasPortal4], [CEUltimasContrasenasPortal5], [CEUltimasContrasenasPortal6], [CECaducaContrasenaPortal], [RefBancoTipo], [RefBancoTipo1], [RefBancoTipo2], [RefBancoTipo3], [RefBancoTipo4], [RefBancoTipo5], [RefBancoTipo6], [BloqueaCPortal], [DesafectarBaja], [UsuarioSesionPortal], [UsuarioPerfilPortal], [PerfilPortal], [EstatusPortal], [ModificarPerfilPortal], [ModificarEstatusPortal], [eMailInt], [IdiomaPortal], [POSCodigoAut], [vicRenovarEspecial], [vic_BajaContrato], [VicRealizarApartado], [VicModificarFechasApartado], [VicRealizarDesapartado], [VicEditarContrato], [vicParametrizacion], [vicAccesoHerrEnvioMail], [vicConfigHerrEnvioMail], [vicLocalUsuarioPS], [vicFusDivLocales], [vicGenerarComision], [vicVentaDepRefdo], [vicLogPN], [vicGenerarComplementoRenovacio], [VicHerramientaFechaProximoMov], [VicHerramientaCondicionPago], [UsuarioSalud], [vicComisiones], [vicGFAAutorizaComisiones], [vicGFAAfectaComisiones]) VALUES (N'VENTP00740', N'', 25, NULL, N'VENTAS PISO', NULL, N'', N'', CAST(N'2019-06-22T09:39:54.947' AS DateTime), NULL, NULL, NULL, N'', NULL, NULL, N'SU25CA01', N'SUCBAN25', N'Pesos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, 0, 0, 1, 0, N'ALTA', CAST(N'2019-06-22T09:39:54.000' AS DateTime), CAST(N'2013-10-25T16:03:22.000' AS DateTime), NULL, N'VENTP_GERA', 1, 0, NULL, 200, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, NULL, 0, 0, 1, 1, NULL, 0, 0, 0, 0, N'SUCU0025', 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 1, 0, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, 1, N'(Clasico)', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, N'No Permitir', NULL, NULL, NULL, N'(Total)', 0, NULL, 0, CAST(N'2022-06-15T00:00:00.000' AS DateTime), 0, 0, 0, N'(General)', 0, 0, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [Sucursal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Afectar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Cancelar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [Desafectar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [Autorizar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarVenta]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarCxp]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarGasto]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarDinero]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarPV]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarCompra]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarSeriesLotes]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AfectarOtrosMovs]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CancelarOtrosMovs]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ConsultarOtrosMovs]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ConsultarOtrosMovsGrupo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ConsultarOtrasEmpresas]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ConsultarOtrasSucursales]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AccesarOtrasSucursalesEnLinea]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AfectarOtrasSucursalesEnLinea]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarOtrosMovs]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarVencimientos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarEntregas]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarFechaRequerida]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarEnvios]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarReferencias]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarAlmacenEntregas]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [ModificarSituacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarAgente]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarUsuario]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarListaPrecios]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarZonaImpuesto]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarSucursalDestino]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarProyUENActCC]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AgregarCteExpress]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AgregarArtExpress]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [Costos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearCostos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [VerInfoDeudores]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [VerInfoAcreedores]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [VerComisionesPendientes]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearEncabezadoVenta]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearCxcCtaDinero]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearCxpCtaDinero]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearDineroCtaDinero]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [EnviarExcel]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [ImprimirMovs]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [PreliminarMovs]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Reservar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [DesReservar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Asignar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [DesAsignar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarAlmacenPedidos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarConceptos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarReferenciasSiempre]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarAgenteCxcPendiente]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarMovsNominaVigentes]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearPrecios]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearDescGlobal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearDescLinea]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearCondiciones]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearAlmacen]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearMoneda]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearAgente]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearFechaEmision]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearProyecto]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearFormaPago]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_DefArtTipo_93]  DEFAULT ('(Empresa)') FOR [DefArtTipo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('(Empresa)') FOR [DefUnidad]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AbrirCajon]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearCobroInmediato]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [ConsultarCompraPendiente]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AccesoTotalCuentas]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [TieneMovimientos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [Refacturar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((200)) FOR [LimiteTableroControl]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [CteInfo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CteBloquearOtrosDatos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ArtBloquearOtrosDatos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CteSucursalVenta]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [CtaDineroInfo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ImpresionInmediata]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [MostrarCampos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AsistentePrecios]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CambioValidarCobertura]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CambioNormatividad]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CambioEditarCobertura]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [CambioVerPosicionEmpresa]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [CambioVerPosicionSucursal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [CambioVerPosicionOtraSucursal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CambioAutorizarOperacionLimite]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [AutoDobleCapturaPrecios]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutoAgregarRecaudacionConsumo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutoDiesel]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearActividad]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CteMov]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CteArt]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ProvMov]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ArtMov]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearContUso]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [TraspasarTodo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearNotasNegativas]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarSerieLoteProp]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [NominaEliminacionParcial]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarPropiedadesLotes]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [PVAbrirCajonSiempre]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [PVBloquearEgresos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [PVCobrarNotasEstatusBorrador]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [PVModificarEstatusBorrador]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearPersonalCfg]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearFacturacionDirecta]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarDatosVIN]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarDatosCliente]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CxcExpress]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CxpExpress]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearCancelarFactura]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CambioPresentacionExpress]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarConsecutivos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarVINFechaBaja]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarVINFechaPago]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarVINAccesorio]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [PVEditarNota]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarDescGlobalImporte]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [ConsultarClientesOtrosAgentes]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ACEditarTablaAmortizacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [PlantillasOffice]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ConfigPlantillasOffice]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [CambioAgregarBeneficiarios]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AgregarConceptoExpress]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearArtMaterial]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [InfoPath]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [FEA]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ContrasenaNuncaExpira]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [MenuAccesoTotal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearPDF]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [VerificarOrtografia]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ContSinOrigen]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ProyectoMov]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CompraDevTodo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearWebContenido]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearWebHTML]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ProyMov]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('(Total)') FOR [Licenciamiento]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarGestion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearInvSalidaDirecta]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearSituacionUsuario]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [InformacionConfidencial]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ContrasenaModificar]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('(General)') FOR [SituacionArea]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarTipoImpuesto]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloquearTipoCambio]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AfectarCORTE]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarPosicionSugeridaWMS]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModificarAgenteWMS]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [INFORSupervisor]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ISMESNotificarError]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [MESAcceso]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [MESEstructura]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [MESPlanificacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [MESVariantes]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [MESScheduling]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vic_VerPlanoGramaDiseno]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vic_VerPlanoGramaProduccion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vic_CopiarAccionesPlanoGrama]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vic_ActualizarPlanoGrama]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vic_EliminarPlanoGrama]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vic_AccionesPlanoGrama]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizaAltaTarima]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CE]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AutorizarCE]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CEBloquearCalif]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [DesafectarAsig]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [PeriodoEvalWEB]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModNumCiclo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [ModMatricula]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CreditosSugeridos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CEHorarioAlumnoRegMat]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CENoGenerarCuotasJob]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [AgregarAlumnosCyA]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CEPlandeEstudios]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [CEAfectarMovControlFechas]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BloqueaCPortal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [DesafectarBaja]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('admin') FOR [UsuarioPerfilPortal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('USUARIO') FOR [PerfilPortal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('Activo') FOR [EstatusPortal]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vic_BajaContrato]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vicParametrizacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vicFusDivLocales]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (NULL) FOR [vicVentaDepRefdo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (NULL) FOR [vicLogPN]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [vicGenerarComplementoRenovacio]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [VicHerramientaFechaProximoMov]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [VicHerramientaCondicionPago]
GO
