
GO
/****** Object:  StoredProcedure [dbo].[SpCXCPreliminarCteCto]    Script Date: 23/09/2022 02:37:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--====================================================================================================================================================================
--NOMBRE      : SpCXCPreliminarCteCto
--AUTOR        : Jesus Del Toro Andrade
--FECHA CREACIÓN  : 27/06/2018
--DESARROLLO    : Preliminar de Cobro. 
--MODULO  		: CXC
--DESCRIPCIÓN		: Procedimiento que dependiendo de un parametro retorna datos de cliente, contactos de cliente o gestor de cobranza.
--EJEMPLO			: EXEC SpCXCPreliminarCteCto 'C00938525', 1
--====================================================================================================================================================================
-- FECHA Y AUTOR MODIFICACION:    02/05/2019 Por: Jesus del Toro Andrade
-- Se agregan niveles especiales y operativos en clientes
-- ========================================================================================================================================
-- FECHA Y AUTOR MODIFICACION:    15/07/2019 Por: Jesus del Toro Andrade
-- Se permite la busqueda de clientes que no cuentan con saldo.
-- Se agrega la busqueda del Jefe o Sub Gerente de Grupo.
-- Se agrega consulta para la alerta de cuenta en asignacion.
-- FECHA Y AUTOR MODIFICACION:    30/10/2019 Por: Miriam J. Márquez Muriño
-- Se agrega el nip de venta 
-- FECHA Y AUTOR MODIFICACION:    06/11/2019 Por: Miriam J. Márquez Muriño
-- Se agrega Validación del Telefono.
-- FECHA Y AUTOR MODIFICACIÓN:    04/12/2019 Por: Miriam Jocelyn Márquez Muriño
-- Se agrega columna TieneSaldo y se agrega top 100 en la consulta 
-- ========================================================================================================================================
-- AUTOR           : Cristian Alan Delgado Villanueva
-- FECHA           : 26/01/2022
-- MODIFICACION    : Se modifico para poder obtener datos de ACXCHSubConcentradoraNatural en vez de MaviRecuperacion y se añadieron opcion 6 y 7
-- ========================================================================================================================================
-- AUTOR           : Cristian Alan Delgado Villanueva
-- FECHA           : 27/04/2022
-- MODIFICACION    : Se modifico para poder obtener datos de gestion de promesas de pago del cliente
-- ========================================================================================================================================

CREATE PROCEDURE [dbo].[SpCXCPreliminarCteCto] @Cliente varchar(10),
@Opcion int,
@Nombre varchar(100) = NULL,
@Direccion varchar(150) = NULL,
@Telefono varchar(25) = NULL,
@Codigo_Postal varchar(15) = NULL,
@Buscar_Final bit = 0,
@IdCatalogoTarjetas varchar(16) = NULL
AS
BEGIN
  DECLARE @Daten datetime,
          @Year varchar(10),
          @Quincena varchar(10),
          @Respuesta bit,
          @ValidaTel int,
          @switch varchar(2) = 'NO'

  SELECT
    @switch = ISNULL(Valor, 'NO')
  FROM TablaStD WITH (NOLOCK)
  WHERE TablaSt = 'NUEVA ASIGNACION'

  /*	Asignar la quincena en que se está trabajando	*/
  SET @DateN = GETDATE()
  SET @Year = YEAR(@DateN)
  SET @Quincena =
                 CASE
                   WHEN DAY(@DateN) > 16 THEN MONTH(@DateN) * 2
                   ELSE (MONTH(@DateN) * 2) - 1
                 END
  SET @Quincena =
                 CASE
                   WHEN DAY(@DateN) = 1 THEN @Quincena - 1
                   ELSE @Quincena
                 END
  SET @Year =
             CASE
               WHEN DAY(@DateN) = 1 AND
                 MONTH(@DateN) = 1 THEN @Year - 1
               ELSE @Year
             END
  SET @Quincena =
                 CASE
                   WHEN DAY(@DateN) = 1 AND
                     MONTH(@DateN) = 1 THEN 24
                   ELSE @Quincena
                 END

  IF @Opcion = 1 -- Información del cliente.
  BEGIN
    IF ISNULL(@Cliente, '') = ''
      AND ISNULL(@IdCatalogoTarjetas, '') != ''
	  PRINT('Se comento paramantener simple el ejemplo')
      --SELECT TOP 1
      --  @Cliente = C.Cliente
      --FROM CXCDCatalogoTarjetas T WITH (NOLOCK)
      --JOIN Cte C WITH (NOLOCK)
      --  ON C.Cliente = T.Cliente
      --  AND C.IdCatalogoTarjetas = T.IdCatalogoTarjetas
      --WHERE T.IdCatalogoTarjetas = @IdCatalogoTarjetas
      --AND T.Estatus = 'ASIGNADA'

    SET @ValidaTel = (SELECT TOP 1
      validacionTel
    FROM CteTel WITH (NOLOCK)
    WHERE cliente = @Cliente
    AND Tipo = 'Movil'
    ORDER BY Fecha DESC)


    IF ISNULL(OBJECT_ID('tempdb..#InfoCteTemp'), 0) != 0
      DROP TABLE #InfoCteTemp
    SELECT
      Cte.Nombre,
      Cte.RFC,
      Cte.Cliente,
      TelefonoPart = ISNULL(dbo.Fn_MaviTelefonoCtePrel(Cte.Cliente, 'PARTICULAR'), ''),
      TelefonoMov = ISNULL(dbo.Fn_MaviTelefonoCtePrel(Cte.Cliente, 'MOVIL'), ''),
      Cte.Direccion,
      Cte.DireccionNumero,
      Cte.DireccionNumeroInt,
      Cte.Colonia,
      Cte.CodigoPostal,
      Cte.Estado,
      Cte.Delegacion,
      Cte.Poblacion,
      CalificacionGlobal = ROUND(Cte.CalificacionGlobal, 2),
      RutaCobro = CP.Cobranza,
      CompraMay = CAST(0 AS money),
      SaldoNC = CAST(0 AS money),
      SaldoFavor = CAST(0 AS money),
      Cte.SinBonifDIMA,
      NIP.NIP_COBRO,
      CAST('' AS varchar(30)) Division,
      Cte.IdCatalogoTarjetas,
      Cte.NipVenta,
      ValidaTel = CAST(IIF(@ValidaTel = 1, 0, 1) AS bit),  ---Si no esta validado el telefono se pone en true VALIDATEL
      Cte.IDMagento INTO #InfoCteTemp
    FROM Cte WITH (NOLOCK)
    LEFT JOIN CodigoPostal CP WITH (NOLOCK)
      ON Cte.CodigoPostal = CP.CodigoPostal
      AND Cte.Colonia = CP.Colonia
      AND Cte.Estado = CP.Estado
      AND Cte.Delegacion = CP.Delegacion
    LEFT JOIN DM0244_CLAVES NIP WITH (NOLOCK)
      ON NIP.CUENTA = CTE.Cliente
    WHERE Cte.Cliente = @Cliente

    /*	--  Traer la compra mayor del cliente  --	*/
    UPDATE C
    SET C.CompraMay = CM.CompraMay
    FROM #InfoCteTemp C
    JOIN (SELECT
      Cxc.Cliente,
      CompraMay = MAX(ISNULL(Cxc.Importe, 0) + ISNULL(Cxc.Impuestos, 0))
    FROM Cxc WITH (NOLOCK)
    JOIN MovTipo MT WITH (NOLOCK)
      ON MT.Mov = CXC.Mov
      AND MT.Clave IN ('CXC.F', 'CXC.CAP')
    WHERE Cxc.Cliente = @Cliente
    AND Cxc.Estatus IN ('CONCLUIDO', 'PENDIENTE')
    GROUP BY Cxc.Cliente) CM
      ON CM.Cliente = C.Cliente

    /*	--  Traer los saldos de las notas de credito del cliente  --	*/
    UPDATE C
    SET C.SaldoNC = NC.SaldoNC
    FROM #InfoCteTemp C
    JOIN (SELECT
      C.Cliente,
      SaldoNC = ISNULL(SUM(ISNULL(C.Saldo, 0)), 0)
    FROM Cxc C WITH (NOLOCK)
    JOIN MovTipo M WITH (NOLOCK)
      ON C.Mov = M.Mov
      AND M.Clave = 'CXC.NC'
    LEFT JOIN TcIDM0224_ConfigNotasEspejo NCE WITH (NOLOCK)
      ON NCE.MovCredito = C.Mov
      AND NCE.ConceptoCredito = C.Concepto
    WHERE C.Cliente = @Cliente
    AND C.Estatus = 'PENDIENTE'
    AND NCE.MovCredito IS NULL
    GROUP BY C.Cliente) NC
      ON NC.Cliente = C.Cliente

    /*	--  Traer el saldo a favor cliente  --	*/
    UPDATE C
    SET C.SaldoFavor = SF.SaldoFavor
    FROM #InfoCteTemp C
    JOIN (SELECT
      Cuenta,
      SaldoFavor = ISNULL(SUM(ISNULL(Abono, 0) - ISNULL(Cargo, 0)), 0)
    FROM Auxiliar WITH (NOLOCK)
    WHERE Cuenta = @Cliente
    AND Rama = 'CEFE'
    AND Modulo = 'CXC'
    GROUP BY Cuenta) SF
      ON SF.Cuenta = C.Cliente

    /*	--  Traer la division del cliente  --	*/
    /*Switch ACXCHSubConcentradoraNatural y MaviRecuperacion*/
    --IF @switch = 'NO'
    --BEGIN
    --  UPDATE C
    --  SET C.Division = ISNULL(MA.Division, '')
    --  FROM #InfoCteTemp C
    --  JOIN MaviRecuperacion MA WITH (NOLOCK)
    --    ON MA.Quincena = @Quincena
    --    AND MA.Ejercicio = @Year
    --    AND MA.Cliente = C.Cliente
    --END
    --ELSE
    --BEGIN
    --  UPDATE C
    --  SET C.Division = ISNULL(sn.Division, '')
    --  FROM #InfoCteTemp C
    --  JOIN MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural AS sn WITH (NOLOCK)
    --    ON sn.Quincena = @Quincena
    --    AND sn.Ejercicio = @Year
    --    AND sn.Cliente = C.Cliente
    --    AND sn.TipoCobro = 'CLIENTE'
    --END

    SELECT
      *
    FROM #InfoCteTemp

    IF ISNULL(OBJECT_ID('tempdb..#InfoCteTemp'), 0) != 0
      DROP TABLE #InfoCteTemp

  END	--	@Opcion = 1
  --ELSE
  --IF @Opcion = 2 -- Información de Avales.
  --BEGIN
  --  SELECT
  --    C.ID,
  --    C.Nombre,
  --    C.ApellidoPaterno,
  --    C.ApellidoMaterno,
  --    C.Telefonos,
  --    O.Direccion,
  --    O.MaviNumero,
  --    C.Tipo
  --  FROM CteCto C WITH (NOLOCK)
  --  LEFT JOIN CteCtoDireccion O WITH (NOLOCK)
  --    ON C.ID = O.ID
  --  WHERE C.Cliente = @Cliente
  --  AND C.MaviEstatus = 'Supervisado'
  --  AND (C.Tipo = 'AVAL'
  --  OR C.Tipo LIKE '%AVAL DIMA ELITE%')
  --  AND ISNULL(C.RetiroFirmaAval, 0) = 0
  --END	--	@Opcion = 2
  --ELSE
  --IF @Opcion = 3 -- Información de gestores y asignaciones.
  --BEGIN
  --  IF ISNULL(OBJECT_ID('tempdb..#MaviRecuperacionTemp'), 0) != 0
  --    DROP TABLE #MaviRecuperacionTemp

  --  CREATE TABLE #MaviRecuperacionTemp (
  --    NivelCobranza varchar(100),
  --    AgenteCobrador varchar(10),
  --    Zona varchar(100),
  --    Division varchar(30),
  --    TipoAgente varchar(50)
  --  )
  --  /*Switch ACXCHSubConcentradoraNatural y MaviRecuperacion*/
  --  IF @switch = 'NO'
  --  BEGIN
  --    INSERT INTO #MaviRecuperacionTemp (NivelCobranza, AgenteCobrador, Zona, Division, TipoAgente)
  --      SELECT
  --        MR.NivelCobranza,
  --        MR.AgenteCobrador,
  --        MR.zona,
  --        MR.division,
  --        CAST('Agente' AS varchar(50)) TipoAgente
  --      FROM MaviRecuperacion MR WITH (NOLOCK)
  --      WHERE MR.Quincena = @Quincena
  --      AND MR.Ejercicio = @Year
  --      AND MR.Cliente = @Cliente
  --      GROUP BY MR.NivelCobranza,
  --               MR.AgenteCobrador,
  --               MR.zona,
  --               MR.division
  --  END
  --  ELSE
  --  BEGIN
  --    INSERT INTO #MaviRecuperacionTemp (NivelCobranza, AgenteCobrador, Zona, Division, TipoAgente)
  --      SELECT
  --        sn.EtapaNatural AS NivelCobranza,
  --        sn.AgenteAsignado AS AgenteCobrador,
  --        sn.Zona,
  --        sn.Division,
  --        CAST('Agente' AS varchar(50)) TipoAgente
  --      FROM MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural AS sn WITH (NOLOCK)
  --      WHERE sn.Quincena = @Quincena
  --      AND sn.Ejercicio = @Year
  --      AND sn.Cliente = @Cliente
  --      AND sn.TipoCobro = 'CLIENTE'
  --      GROUP BY sn.EtapaNatural,
  --               sn.AgenteAsignado,
  --               sn.Zona,
  --               sn.Division
  --  END

  --  /*	Niveles especiales	*/
  --  UPDATE MR
  --  SET MR.AgenteCobrador = ISNULL(ANE.Agente, MR.AgenteCobrador)
  --  FROM #MaviRecuperacionTemp MR
  --  LEFT JOIN NivelesEspecialesCobranzaMavi NE WITH (NOLOCK)
  --    ON NE.Nombre = MR.NivelCobranza
  --  LEFT JOIN (SELECT
  --    ROW_NUMBER() OVER (PARTITION BY ANE.Nivel ORDER BY ANE.FechaAsigna DESC) N,
  --    ANE.Nivel,
  --    ANE.Agente,
  --    ANE.Fechaasigna
  --  FROM RM0497NivelcobAgenteHist ANE WITH (NOLOCK)
  --  JOIN #MaviRecuperacionTemp MR
  --    ON MR.NivelCobranza = ANE.Nivel) ANE
  --    ON ANE.N = 1
  --    AND ANE.Nivel = MR.NivelCobranza

  --  /*	Jefe o Sub Gerente de Grupo	*/
  --  UPDATE MR
  --  SET MR.AgenteCobrador =
  --                         CASE
  --                           WHEN RTRIM(LTRIM(ISNULL(J.ReportaA, ''))) != '' THEN J.ReportaA
  --                           ELSE ISNULL(SG.ReportaA, 'SIN AGENTE')
  --                         END,
  --      MR.TipoAgente =
  --                     CASE
  --                       WHEN RTRIM(LTRIM(ISNULL(J.ReportaA, ''))) != '' THEN 'Jefe Grupo'
  --                       ELSE 'Sub Gerente Grupo'
  --                     END
  --  FROM #MaviRecuperacionTemp MR
  --  LEFT JOIN DM0214ZonasCobranza NC WITH (NOLOCK)
  --    ON NC.Zona = MR.zona
  --    AND NC.NivelCobranza = MR.NivelCobranza
  --    AND NC.Division = MR.division
  --  LEFT JOIN EquipoAgente EA WITH (NOLOCK)
  --    ON EA.Agente = NC.Equipo
  --  LEFT JOIN Agente J WITH (NOLOCK)
  --    ON J.Agente = EA.Agente
  --  LEFT JOIN Agente SG WITH (NOLOCK)
  --    ON SG.Agente = EA.Equipo
  --  WHERE ISNULL(MR.AgenteCobrador, 'SIN AGENTE') = 'SIN AGENTE'

  --  /*Switch ACXCHSubConcentradoraNatural y MaviRecuperacion*/
  --  IF @switch = 'NO'
  --  BEGIN
  --    SELECT
  --      MR.NivelCobranza,
  --      MR.TipoAgente,
  --      MR.AgenteCobrador,
  --      P.Nombre,
  --      P.ApellidoPaterno,
  --      P.ApellidoMaterno,
  --      AC.Linea,
  --      MR.TipoAsignacion,
  --      MR.CteFinal,
  --      MR.NombreBF,
  --      MR.ApellidoPaternoBF,
  --      MR.ApellidoMaternoBF
  --    FROM (SELECT
  --      MR.NivelCobranza,
  --      MR.TipoAgente,
  --      MR.AgenteCobrador,
  --      'CLIENTE' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM #MaviRecuperacionTemp MR
  --    WHERE MR.AgenteCobrador != 'SIN AGENTE'
  --    GROUP BY MR.NivelCobranza,
  --             MR.TipoAgente,
  --             MR.AgenteCobrador

  --    UNION

  --    SELECT
  --      MR.NivelCobranza,
  --      'Agente' TipoAgente,
  --      ISNULL(ANE.Agente, MR.AgenteCobrador) AgenteCobrador,
  --      'MAVICOB' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM MaviCob..MaviRecuperacion MR WITH (NOLOCK)
  --    LEFT JOIN MaviCob..NivelesEspecialesCobranzaMavi NE WITH (NOLOCK)
  --      ON NE.Nombre = MR.NivelCobranza
  --    LEFT JOIN (SELECT
  --      ROW_NUMBER() OVER (PARTITION BY ANE.Nivel ORDER BY ANE.FechaAsigna DESC) N,
  --      ANE.Nivel,
  --      ANE.Agente,
  --      ANE.Fechaasigna
  --    FROM MaviCob..RM0497NivelcobAgenteHist ANE WITH (NOLOCK)) ANE
  --      ON ANE.N = 1
  --      AND ANE.Nivel = MR.NivelCobranza
  --    WHERE MR.Quincena = @Quincena
  --    AND MR.Ejercicio = @Year
  --    AND ISNULL(ANE.Agente, MR.AgenteCobrador) != 'SIN AGENTE'
  --    AND mr.Cliente = @Cliente
  --    GROUP BY mr.NivelCobranza,
  --             ISNULL(ANE.Agente, MR.AgenteCobrador)

  --    UNION

  --    SELECT
  --      MRA.NivelCobranza,
  --      'Agente' TipoAgente,
  --      MRA.AgenteCobAval,
  --      'AVAL' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM DM0196MavirecupAvalesTbl MRA WITH (NOLOCK)
  --    WHERE MRA.Quincena = @Quincena
  --    AND MRA.Ejercicio = @Year
  --    AND MRA.AgenteCobAval != 'SIN AGENTE'
  --    AND MRA.Cliente = @Cliente
  --    GROUP BY MRA.NivelCobranza,
  --             MRA.AgenteCobAval

  --    UNION

  --    SELECT
  --      MRF.NivelCobranza,
  --      'Agente' TipoAgente,
  --      MRF.AgenteCobrador,
  --      'FINAL' TipoAsignacion,
  --      Cxc.CteFinal,
  --      BF.Nombre NombreBF,
  --      BF.ApellidoPaterno ApellidoPaternoBF,
  --      BF.ApellidoMaterno ApellidoMaternoBF
  --    FROM DM0207MaviRecuperacionCteFinal MRF WITH (NOLOCK)
  --    JOIN Cxc WITH (NOLOCK)
  --      ON Cxc.ID = MRF.IDMov
  --    JOIN Cte_Final BF WITH (NOLOCK)
  --      ON BF.ClienteF = Cxc.CteFinal
  --    WHERE MRF.Quincena = @Quincena
  --    AND MRF.Ejercicio = @Year
  --    AND MRF.AgenteCobrador != 'SIN AGENTE'
  --    AND MRF.ApoyoDima = 0
  --    AND Cxc.Cliente = @Cliente
  --    GROUP BY MRF.NivelCobranza,
  --             MRF.AgenteCobrador,
  --             Cxc.CteFinal,
  --             BF.Nombre,
  --             BF.ApellidoPaterno,
  --             BF.ApellidoMaterno

  --    UNION

  --    SELECT
  --      MRF.NivelCobranza,
  --      'Agente' TipoAgente,
  --      MRF.AgenteCobrador,
  --      'FINAL CON APOYO' TipoAsignacion,
  --      Cxc.CteFinal,
  --      BF.Nombre NombreBF,
  --      BF.ApellidoPaterno ApellidoPaternoBF,
  --      BF.ApellidoMaterno ApellidoMaternoBF
  --    FROM DM0207MaviRecuperacionCteFinal MRF WITH (NOLOCK)
  --    JOIN Cxc WITH (NOLOCK)
  --      ON Cxc.ID = MRF.IDMov
  --    JOIN Cte_Final BF WITH (NOLOCK)
  --      ON BF.ClienteF = Cxc.CteFinal
  --    WHERE MRF.Quincena = @Quincena
  --    AND MRF.Ejercicio = @Year
  --    AND MRF.AgenteCobrador != 'SIN AGENTE'
  --    AND MRF.ApoyoDima = 1
  --    AND Cxc.Cliente = @Cliente
  --    GROUP BY MRF.NivelCobranza,
  --             MRF.AgenteCobrador,
  --             Cxc.CteFinal,
  --             BF.Nombre,
  --             BF.ApellidoPaterno,
  --             BF.ApellidoMaterno

  --    UNION

  --    SELECT
  --      CO.Titulo NivelCobranza,
  --      'Agente' TipoAgente,
  --      COP.Nomina AgenteCobrador,
  --      'OPERATIVO' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM MAVIANDROID01.ServicioAndroid.dbo.Cob_Operativos CO WITH (NOLOCK)
  --    JOIN MAVIANDROID01.ServicioAndroid.dbo.Cob_Operativo_Cuentas COC WITH (NOLOCK)
  --      ON COC.ID_OPERATIVO = CO.ID
  --    JOIN MAVIANDROID01.ServicioAndroid.dbo.Cob_Operativo_Personal COP WITH (NOLOCK)
  --      ON COP.ID_OPERATIVO = CO.ID
  --      AND COP.Activo = 1
  --    WHERE COC.Cuenta = @Cliente
  --    AND
  --       CASE
  --         WHEN DAY(CO.FECHA_INICIAL) > 16 THEN MONTH(CO.FECHA_INICIAL) * 2
  --         WHEN DAY(CO.FECHA_INICIAL) = 1 THEN (MONTH(CO.FECHA_INICIAL) * 2) - 1
  --         WHEN DAY(CO.FECHA_INICIAL) = 1 AND
  --           MONTH(CO.FECHA_INICIAL) = 1 THEN 24
  --         ELSE (MONTH(CO.FECHA_INICIAL) * 2) - 1
  --       END = @Quincena
  --    AND
  --       CASE
  --         WHEN DAY(CO.FECHA_INICIAL) = 1 AND
  --           MONTH(CO.FECHA_INICIAL) = 1 THEN YEAR(CO.FECHA_INICIAL) - 1
  --         ELSE YEAR(CO.FECHA_INICIAL)
  --       END = @Year) MR
  --    LEFT JOIN Comercializadora.dbo.DM0222AsignaChips AC WITH (NOLOCK)
  --      ON MR.AgenteCobrador = AC.Personal
  --    LEFT JOIN Comercializadora.dbo.Personal P WITH (NOLOCK)
  --      ON P.Personal = MR.AgenteCobrador

  --  END
  --  ELSE
  --  BEGIN
  --    SELECT
  --      MR.NivelCobranza,
  --      MR.TipoAgente,
  --      MR.AgenteCobrador,
  --      P.Nombre,
  --      P.ApellidoPaterno,
  --      P.ApellidoMaterno,
  --      AC.Linea,
  --      MR.TipoAsignacion,
  --      MR.CteFinal,
  --      MR.NombreBF,
  --      MR.ApellidoPaternoBF,
  --      MR.ApellidoMaternoBF
  --    FROM (SELECT
  --      MR.NivelCobranza,
  --      MR.TipoAgente,
  --      MR.AgenteCobrador,
  --      'CLIENTE' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM #MaviRecuperacionTemp MR
  --    WHERE MR.AgenteCobrador != 'SIN AGENTE'
  --    GROUP BY MR.NivelCobranza,
  --             MR.TipoAgente,
  --             MR.AgenteCobrador

  --    UNION

  --    SELECT
  --      MR.NivelCobranza,
  --      'Agente' TipoAgente,
  --      ISNULL(ANE.Agente, MR.AgenteCobrador) AgenteCobrador,
  --      'MAVICOB' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM MaviCob..MaviRecuperacion MR WITH (NOLOCK)
  --    LEFT JOIN MaviCob..NivelesEspecialesCobranzaMavi NE WITH (NOLOCK)
  --      ON NE.Nombre = MR.NivelCobranza
  --    LEFT JOIN (SELECT
  --      ROW_NUMBER() OVER (PARTITION BY ANE.Nivel ORDER BY ANE.FechaAsigna DESC) N,
  --      ANE.Nivel,
  --      ANE.Agente,
  --      ANE.Fechaasigna
  --    FROM MaviCob..RM0497NivelcobAgenteHist ANE WITH (NOLOCK)) ANE
  --      ON ANE.N = 1
  --      AND ANE.Nivel = MR.NivelCobranza
  --    WHERE MR.Quincena = @Quincena
  --    AND MR.Ejercicio = @Year
  --    AND ISNULL(ANE.Agente, MR.AgenteCobrador) != 'SIN AGENTE'
  --    AND mr.Cliente = @Cliente
  --    GROUP BY mr.NivelCobranza,
  --             ISNULL(ANE.Agente, MR.AgenteCobrador)

  --    UNION

  --    SELECT
  --      sna.EtapaNatural,
  --      'Agente' TipoAgente,
  --      sna.AgenteAsignado,
  --      'AVAL' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural AS sna WITH (NOLOCK)
  --    WHERE sna.Quincena = @Quincena
  --    AND sna.Ejercicio = @Year
  --    AND sna.AgenteAsignado != 'SIN AGENTE'
  --    AND sna.Cliente = @Cliente
  --    AND sna.TipoCobro = 'AVAL'
  --    GROUP BY sna.EtapaNatural,
  --             sna.AgenteAsignado

  --    UNION

  --    SELECT
  --      snf.EtapaNatural,
  --      'Agente' TipoAgente,
  --      snf.AgenteAsignado,
  --      'FINAL' TipoAsignacion,
  --      Cxc.CteFinal,
  --      BF.Nombre NombreBF,
  --      BF.ApellidoPaterno ApellidoPaternoBF,
  --      BF.ApellidoMaterno ApellidoMaternoBF
  --    FROM MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural AS snf WITH (NOLOCK)
  --    JOIN Cxc WITH (NOLOCK)
  --      ON Cxc.Mov = snf.Mov
  --      AND Cxc.MovID = snf.MovID
  --    JOIN Cte_Final BF WITH (NOLOCK)
  --      ON BF.ClienteF = Cxc.CteFinal
  --    WHERE snf.Quincena = @Quincena
  --    AND snf.Ejercicio = @Year
  --    AND snf.AgenteAsignado != 'SIN AGENTE'
  --    AND snf.ApoyoDima = 0
  --    AND snf.TipoCobro = 'CLIENTE FINAL'
  --    AND Cxc.Cliente = @Cliente
  --    GROUP BY snf.EtapaNatural,
  --             snf.AgenteAsignado,
  --             Cxc.CteFinal,
  --             BF.Nombre,
  --             BF.ApellidoPaterno,
  --             BF.ApellidoMaterno

  --    UNION

  --    SELECT
  --      snf2.EtapaNatural,
  --      'Agente' TipoAgente,
  --      snf2.AgenteAsignado,
  --      'FINAL CON APOYO' TipoAsignacion,
  --      Cxc.CteFinal,
  --      BF.Nombre NombreBF,
  --      BF.ApellidoPaterno ApellidoPaternoBF,
  --      BF.ApellidoMaterno ApellidoMaternoBF
  --    FROM MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural AS snf2 WITH (NOLOCK)
  --    JOIN Cxc WITH (NOLOCK)
  --      ON Cxc.Mov = snf2.Mov
  --      AND Cxc.MovID = snf2.MovID
  --    JOIN Cte_Final BF WITH (NOLOCK)
  --      ON BF.ClienteF = Cxc.CteFinal
  --    WHERE snf2.Quincena = @Quincena
  --    AND snf2.Ejercicio = @Year
  --    AND snf2.AgenteAsignado != 'SIN AGENTE'
  --    AND snf2.ApoyoDima = 1
  --    AND Cxc.Cliente = @Cliente
  --    AND snf2.TipoCobro = 'CLIENTE FINAL'
  --    GROUP BY snf2.EtapaNatural,
  --             snf2.AgenteAsignado,
  --             Cxc.CteFinal,
  --             BF.Nombre,
  --             BF.ApellidoPaterno,
  --             BF.ApellidoMaterno

  --    UNION

  --    SELECT
  --      CO.Titulo NivelCobranza,
  --      'Agente' TipoAgente,
  --      COP.Nomina AgenteCobrador,
  --      'OPERATIVO' TipoAsignacion,
  --      NULL CteFinal,
  --      NULL NombreBF,
  --      NULL ApellidoPaternoBF,
  --      NULL ApellidoMaternoBF
  --    FROM MAVIANDROID01.ServicioAndroid.dbo.Cob_Operativos CO WITH (NOLOCK)
  --    JOIN MAVIANDROID01.ServicioAndroid.dbo.Cob_Operativo_Cuentas COC WITH (NOLOCK)
  --      ON COC.ID_OPERATIVO = CO.ID
  --    JOIN MAVIANDROID01.ServicioAndroid.dbo.Cob_Operativo_Personal COP WITH (NOLOCK)
  --      ON COP.ID_OPERATIVO = CO.ID
  --      AND COP.Activo = 1
  --    WHERE COC.Cuenta = @Cliente
  --    AND
  --       CASE
  --         WHEN DAY(CO.FECHA_INICIAL) > 16 THEN MONTH(CO.FECHA_INICIAL) * 2
  --         WHEN DAY(CO.FECHA_INICIAL) = 1 THEN (MONTH(CO.FECHA_INICIAL) * 2) - 1
  --         WHEN DAY(CO.FECHA_INICIAL) = 1 AND
  --           MONTH(CO.FECHA_INICIAL) = 1 THEN 24
  --         ELSE (MONTH(CO.FECHA_INICIAL) * 2) - 1
  --       END = @Quincena
  --    AND
  --       CASE
  --         WHEN DAY(CO.FECHA_INICIAL) = 1 AND
  --           MONTH(CO.FECHA_INICIAL) = 1 THEN YEAR(CO.FECHA_INICIAL) - 1
  --         ELSE YEAR(CO.FECHA_INICIAL)
  --       END = @Year) MR
  --    LEFT JOIN Comercializadora.dbo.DM0222AsignaChips AC WITH (NOLOCK)
  --      ON MR.AgenteCobrador = AC.Personal
  --    LEFT JOIN Comercializadora.dbo.Personal P WITH (NOLOCK)
  --      ON P.Personal = MR.AgenteCobrador

  --  END

  --  IF ISNULL(OBJECT_ID('tempdb..#MaviRecuperacionTemp'), 0) != 0
  --    DROP TABLE #MaviRecuperacionTemp
  --END	--	@Opcion = 3
  --ELSE
  --IF @Opcion = 4 -- Buscar cliente por Nombre
  --BEGIN
  --  IF ISNULL(@Direccion, '') != ''
  --    SET @Direccion = '%' + @Direccion + '%'

  --  IF ISNULL(OBJECT_ID('tempdb..#CteTemp'), 0) != 0
  --    DROP TABLE #CteTemp
  --  CREATE TABLE #CteTemp (
  --    Cliente varchar(10),
  --    Nombre varchar(100),
  --    Direccion varchar(100),
  --    DireccionNumero varchar(20),
  --    DireccionNumeroInt varchar(20),
  --    CteFinal varchar(10),
  --    NombreFinal varchar(100),
  --    TieneSaldo char(2) DEFAULT 'NO'
  --  )

  --  DECLARE @SQL nvarchar(max)

  --  IF @Buscar_Final = 0
  --  BEGIN
  --    IF ISNULL(@Nombre, '') != ''
  --      SET @Nombre = '"*' + @Nombre + '*"'

  --    SET @SQL = '
		--	INSERT INTO #CteTemp(Cliente, Nombre, Direccion, DireccionNumero, DireccionNumeroInt)
		--	SELECT TOP 100
		--		Cte.Cliente,
		--		Cte.Nombre,
		--		Cte.Direccion,
		--		Cte.DireccionNumero,
		--		Cte.DireccionNumeroInt
		--	FROM Cte WITH(NOLOCK)
		--	WHERE Cte.Cliente NOT LIKE ''P%''
		--		' + CASE
  --      WHEN ISNULL(@Cliente, '') != '' THEN ' AND Cte.Cliente = @Cliente '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Nombre, '') != '' THEN ' AND CONTAINS(Cte.Nombre, @Nombre) '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Direccion, '') != '' THEN ' AND ISNULL(Cte.Direccion, '''') + '' '' + ISNULL(Cte.DireccionNumero, '''') + ''-'' + ISNULL(Cte.DireccionNumeroInt, '''') LIKE @Direccion '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Telefono, '') != '' THEN ' AND Cte.Cliente IN (SELECT CteTel.Cliente FROM CteTel WITH(NOLOCK) WHERE CteTel.Cliente NOT LIKE ''P%'' AND CteTel.Lada + CteTel.Telefono = @Telefono) '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Codigo_Postal, '') != '' THEN ' AND Cte.CodigoPostal = @Codigo_Postal '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Cliente, '') = '' AND
  --        ISNULL(@Nombre, '') = '' AND
  --        ISNULL(@Direccion, '') = '' AND
  --        ISNULL(@Telefono, '') = '' AND
  --        ISNULL(@Codigo_Postal, '') = '' THEN ' AND 0 = 1 '
  --      ELSE ''
  --    END + ' 
		--	OPTION (RECOMPILE)'
  --  END
  --  ELSE
  --  BEGIN
  --    IF ISNULL(@Nombre, '') != ''
  --      SET @Nombre = '%' + @Nombre + '%'
  --    SET @SQL = '
		--	INSERT INTO #CteTemp(Cliente, Nombre, Direccion, DireccionNumero, DireccionNumeroInt)
		--	SELECT
		--		Cte_Final.ClienteF,
		--		ISNULL(Cte_Final.ApellidoPaterno, '''') + '' '' + ISNULL(Cte_Final.ApellidoMaterno, '''') + '' '' + ISNULL(Cte_Final.Nombre, '''') Nombre,
		--		Cte_Final.Direccion,
		--		Cte_Final.DireccionNumero,
		--		Cte_Final.DireccionNumeroInt
		--	FROM Cte_Final WITH(NOLOCK)
		--	WHERE 1 = 1
		--		' + CASE
  --      WHEN ISNULL(@Cliente, '') != '' THEN ' AND Cte_Final.ClienteF = @Cliente '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Nombre, '') != '' THEN ' AND ISNULL(Cte_Final.ApellidoPaterno, '''') + '' '' + ISNULL(Cte_Final.ApellidoMaterno, '''') + '' '' + ISNULL(Cte_Final.Nombre, '''') LIKE @Nombre '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Direccion, '') != '' THEN ' AND ISNULL(Cte_Final.Direccion, '''') + '' '' + ISNULL(Cte_Final.DireccionNumero, '''') + ''-'' + ISNULL(Cte_Final.DireccionNumeroInt, '''') LIKE @Direccion '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Telefono, '') != '' THEN ' AND @Telefono IN(Cte_Final.TelefonoFijo, Cte_Final.TelefonoCelular) '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Codigo_Postal, '') != '' THEN ' AND Cte_Final.CodigoPostal = @Codigo_Postal '
  --      ELSE ''
  --    END + '
		--		' + CASE
  --      WHEN ISNULL(@Cliente, '') = '' AND
  --        ISNULL(@Nombre, '') = '' AND
  --        ISNULL(@Direccion, '') = '' AND
  --        ISNULL(@Telefono, '') = '' AND
  --        ISNULL(@Codigo_Postal, '') = '' THEN ' AND 0 = 1 '
  --      ELSE ''
  --    END + ' 
		--	OPTION (RECOMPILE)'
  --  END

  --  EXECUTE sp_executesql @SQL,
  --                        N'@Cliente VARCHAR(10), @Nombre VARCHAR(100) , @Direccion VARCHAR(150), @Telefono VARCHAR(25), @Codigo_Postal VARCHAR(15)',
  --                        @Cliente = @Cliente,
  --                        @Nombre = @Nombre,
  --                        @Direccion = @Direccion,
  --                        @Telefono = @Telefono,
  --                        @Codigo_Postal = @Codigo_Postal

  --  IF @Buscar_Final = 1
  --  BEGIN
  --    IF ISNULL(OBJECT_ID('tempdb..#Cte_FinalTemp'), 0) != 0
  --      DROP TABLE #Cte_FinalTemp

  --    SELECT
  --      * INTO #Cte_FinalTemp
  --    FROM (SELECT
  --      Cxc.Cliente,
  --      Cxc.CteFinal,
  --      C.Nombre
  --    FROM Cxc WITH (NOLOCK)
  --    JOIN #CteTemp C
  --      ON C.Cliente = Cxc.CteFinal
  --    WHERE Cxc.Estatus = 'PENDIENTE'
  --    GROUP BY Cxc.Cliente,
  --             Cxc.CteFinal,
  --             C.Nombre

  --    UNION

  --    SELECT
  --      Cxc.Cliente,
  --      Cxc.CteFinal,
  --      C.Nombre
  --    FROM MaviCob..Cxc WITH (NOLOCK)
  --    JOIN #CteTemp C
  --      ON C.Cliente = Cxc.CteFinal
  --    WHERE Cxc.Estatus = 'PENDIENTE'
  --    GROUP BY Cxc.Cliente,
  --             Cxc.CteFinal,
  --             C.Nombre) CF_SALDO

  --    TRUNCATE TABLE #CteTemp

  --    INSERT INTO #CteTemp (Cliente, Nombre, Direccion, DireccionNumero, DireccionNumeroInt, CteFinal, NombreFinal)
  --      SELECT
  --        Cte.Cliente,
  --        Cte.Nombre,
  --        Cte.Direccion,
  --        Cte.DireccionNumero,
  --        Cte.DireccionNumeroInt,
  --        C.CteFinal,
  --        C.Nombre NombreFinal
  --      FROM Cte WITH (NOLOCK)
  --      JOIN #Cte_FinalTemp C
  --        ON C.Cliente = Cte.Cliente

  --    IF ISNULL(OBJECT_ID('tempdb..#Cte_FinalTemp'), 0) != 0
  --      DROP TABLE #Cte_FinalTemp
  --  END
  --  ELSE
  --  BEGIN
  --    UPDATE CT
  --    SET TieneSaldo = 'SI'
  --    FROM #CteTemp CT
  --    JOIN (SELECT
  --      c.Cliente
  --    FROM Cxc c WITH (NOLOCK)
  --    JOIN MovTipo MT WITH (NOLOCK)
  --      ON c.PadreMAVI = Mt.Mov
  --      AND MT.Clave IN ('CXC.F', 'CXC.CAP', 'CXC.CA', 'CXC.CD', 'CXC.DM')
  --      AND C.Estatus = 'PENDIENTE'
  --    GROUP BY c.Cliente) S
  --      ON ct.Cliente = S.Cliente
  --  END

  --  SELECT
  --    C.*
  --  FROM #CteTemp C

  --  IF ISNULL(OBJECT_ID('tempdb..#CteTemp'), 0) != 0
  --    DROP TABLE #CteTemp
  --END	--	@Opcion = 4
  --ELSE
  --IF @Opcion = 5 -- Validación para alerta de Asignación.
  --BEGIN
  --  SET @Respuesta = 0
  --  /*Switch ACXCHSubConcentradoraNatural y MaviRecuperacion*/
  --  IF @switch = 'NO'
  --  BEGIN
  --    IF EXISTS (SELECT
  --        MR.IDMov
  --      FROM MaviRecuperacion MR WITH (NOLOCK)
  --      WHERE MR.Quincena = @Quincena
  --      AND MR.Ejercicio = @Year
  --      AND mr.Cliente = @Cliente)
  --      SET @Respuesta = 1
  --    ELSE
  --    IF EXISTS (SELECT
  --        MR.IDMov
  --      FROM MaviCob..MaviRecuperacion MR WITH (NOLOCK)
  --      WHERE MR.Quincena = @Quincena
  --      AND MR.Ejercicio = @Year
  --      AND MR.Cliente = @Cliente)
  --      SET @Respuesta = 1
  --    ELSE
  --    IF EXISTS (SELECT
  --        MRA.IDAval
  --      FROM DM0196MavirecupAvalesTbl MRA WITH (NOLOCK)
  --      WHERE MRA.Quincena = @Quincena
  --      AND MRA.Ejercicio = @Year
  --      AND MRA.Cliente = @Cliente)
  --      SET @Respuesta = 1
  --    ELSE
  --    IF EXISTS (SELECT
  --        MRF.IDMov
  --      FROM DM0207MaviRecuperacionCteFinal MRF WITH (NOLOCK)
  --      JOIN Cxc WITH (NOLOCK)
  --        ON Cxc.ID = MRF.IDMov
  --      WHERE MRF.Quincena = @Quincena
  --      AND MRF.Ejercicio = @Year
  --      AND Cxc.Cliente = @Cliente)
  --      SET @Respuesta = 1
  --  END
  --  ELSE
  --  BEGIN
  --    IF EXISTS (SELECT
  --        snc.Cliente
  --      FROM MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural AS snc WITH (NOLOCK)
  --      WHERE snc.Quincena = @Quincena
  --      AND snc.Ejercicio = @Year
  --      AND snc.Cliente = @Cliente)
  --      SET @Respuesta = 1
  --    ELSE
  --    IF EXISTS (SELECT
  --        MR.Cliente
  --      FROM MaviCob..MaviRecuperacion MR WITH (NOLOCK)
  --      WHERE MR.Quincena = @Quincena
  --      AND MR.Ejercicio = @Year
  --      AND MR.Cliente = @Cliente)
  --      SET @Respuesta = 1

  --  END

  --  SELECT
  --    @Respuesta Res

  --END	--	@Opcion = 5
  --IF @Opcion = 6 -- Existe loc.
  --BEGIN
  --  /*Switch ACXCHSubConcentradoraNatural y MaviRecuperacion*/
  --  IF @switch = 'NO'
  --  BEGIN
  --    SELECT
  --      Cte = COUNT(1)
  --    FROM Mavirecuperacion WITH (NOLOCK)
  --    WHERE Ejercicio = YEAR(GETDATE())
  --    AND Quincena = (CASE
  --      WHEN DAY(GETDATE()) >= 16 THEN MONTH(GETDATE()) * 2
  --      ELSE (MONTH(GETDATE()) * 2) - 1
  --    END)
  --    AND NivelCobranza LIKE '%LOC %'
  --    AND Cliente = @Cliente
  --  END
  --  ELSE
  --  BEGIN
  --    SELECT
  --      Cte = COUNT(1)
  --    FROM MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural WITH (NOLOCK)
  --    WHERE Ejercicio = YEAR(GETDATE())
  --    AND Quincena = (CASE
  --      WHEN DAY(GETDATE()) >= 16 THEN MONTH(GETDATE()) * 2
  --      ELSE (MONTH(GETDATE()) * 2) - 1
  --    END)
  --    AND EtapaNatural LIKE '%LOC %'
  --    AND Cliente = @Cliente
  --  END
  --END	--	@Opcion = 6
  --IF @Opcion = 7 -- Existe loc. Aval.
  --BEGIN
  --  /*Switch ACXCHSubConcentradoraNatural y MaviRecuperacion*/
  --  IF @switch = 'NO'
  --  BEGIN
  --    SELECT
  --      Cte = COUNT(1)
  --    FROM DM0196MavirecupAvalesTbl WITH (NOLOCK)
  --    WHERE Ejercicio = YEAR(GETDATE())
  --    AND Quincena = (CASE
  --      WHEN DAY(GETDATE()) >= 16 THEN MONTH(GETDATE()) * 2
  --      ELSE (MONTH(GETDATE()) * 2) - 1
  --    END)
  --    AND NivelCobranza LIKE '%LOC %'
  --    AND Cliente = @Cliente
  --  END
  --  ELSE
  --  BEGIN
  --    SELECT
  --      Cte = COUNT(1)
  --    FROM MaviAndroid01.SIGMavi.dbo.ACXCHSubConcentradoraNatural WITH (NOLOCK)
  --    WHERE Ejercicio = YEAR(GETDATE())
  --    AND Quincena = (CASE
  --      WHEN DAY(GETDATE()) >= 16 THEN MONTH(GETDATE()) * 2
  --      ELSE (MONTH(GETDATE()) * 2) - 1
  --    END)
  --    AND EtapaNatural LIKE '%LOC %'
  --    AND Cliente = @Cliente
  --    AND TipoCobro = 'AVAL'
  --  END
  --END	--	@Opcion = 7
  --IF @Opcion = 8 -- Obtener gestiones de promesa de pago del cliente
  --BEGIN
  --  DECLARE @FechaInicial datetime,
  --          @FechaFinal datetime

  --  SELECT
  --    @FechaInicial = FechaD,
  --    @FechaFinal = FechaA
  --  FROM dbo.FNDeQuincenaAFecha(@Year, @Quincena, 'cobranza')

  --  SELECT
  --    a.Nombre AS NombreAgente,
  --    CASE
  --      WHEN cc.promotor = '' THEN 'SIN AGENTE'
  --      ELSE cc.promotor
  --    END AS Nomina,
  --    CONVERT(decimal(18, 2), CASE
  --      WHEN cc.pago_importe = '' THEN '0.00'
  --      ELSE REPLACE(cc.pago_importe, ' ', '')
  --    END) AS MontoPromesa,
  --    CONVERT(varchar(10), CONVERT(date, cc.pago_promesa, 23), 103) AS FechaPromesa
  --  FROM MaviAndroid01.ServicioAndroid.dbo.COMENTARIOS_COB AS cc WITH (NOLOCK)
  --  LEFT JOIN Agente AS a WITH (NOLOCK)
  --    ON a.Agente = cc.promotor
  --  WHERE cc.cuenta = @Cliente
  --  AND cc.resultado IN ('promesa ', 'promesa ')
  --  AND REPLACE(cc.fecha_inicio, '/', '-') >= CONVERT(varchar(10), @FechaInicial, 23)
  --  AND REPLACE(cc.fecha_inicio, '/', '-') <= CONVERT(varchar(10), @FechaFinal, 23)
  --END
END