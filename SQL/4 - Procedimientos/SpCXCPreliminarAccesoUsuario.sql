
GO
/****** Object:  StoredProcedure [dbo].[SpCXCPreliminarAccesoUsuario]    Script Date: 23/09/2022 02:23:58 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =================================================================================================================================================================
--NOMBRE  		: SpCXCPreliminarAccesoUsuario
--AUTOR				: Jesus Del Toro Andrade
--FECHA CREACIÓN	: 28/06/2018
--DESARROLLO		: Preliminar de Cobro. 
--MODULO			: CXC
--DESCRIPCIÓN		: Procedimiento que obtiene los accesos del preliminar de cobro de un usuario.
--EJEMPLO			: EXEC SpCXCPreliminarAccesoUsuario 'VENTP00898'
-- ====================================================================================================================================================================
-- FECHA Y AUTOR MODIFICACIÓN:    10/01/2020 Por: Miriam Jocelyn Márquez Muriño
-- Se cambia la condición de SucursalRDP en el else de 0 a 1, imprime siempre por rutaticket
-- ====================================================================================================================================================================
CREATE PROCEDURE [dbo].[SpCXCPreliminarAccesoUsuario] @Usuario varchar(10)
AS
BEGIN

  SELECT
    U.Usuario,
    U.Nombre,
    U.Sucursal,
    U.Acceso,
    U.Estatus,
    U.DefCtaDinero,
    CAST(CASE
      WHEN ISNULL(SC.Valor, 0) > 0 THEN 1
      ELSE 0
    END AS bit) SucursalGeneraCobro,
    CAST(CASE
      WHEN ISNULL(SPS.Valor, 0) > 0 THEN 1
      ELSE 0
    END AS bit) SucursalServicioRecarga,
    CAST(CASE
      WHEN ISNULL(PPD.Nombre, '') != '' THEN 1
      ELSE 0
    END AS bit) SolicitaNIPDIMA,
    CAST(CASE
      WHEN ISNULL(RDP.Numero, 0) > 0 THEN 1
      ELSE 1
    END AS bit) SucursalRDP,
    U.DefCajero,
    U.UEN,
    S.Estado
  FROM Usuario U WITH (NOLOCK)
  LEFT JOIN Sucursal S WITH (NOLOCK)
    ON S.Sucursal = U.Sucursal
  LEFT JOIN TablaNumD SC WITH (NOLOCK)
    ON SC.TablaNum = 'SUCURSALES COBRO'
    AND SC.Numero = U.Sucursal
  LEFT JOIN TablaNumD SPS WITH (NOLOCK)
    ON SPS.TablaNum = 'SUCURSALES PAGOSERVICIOS'
    AND SPS.Numero = U.Sucursal
  LEFT JOIN TablaStD PPD WITH (NOLOCK)
    ON PPD.TablaSt = 'PRELIMINAR PSW DIMAS'
    AND U.Acceso = PPD.Nombre
  LEFT JOIN TablaNumD RDP WITH (NOLOCK)
    ON RDP.TablaNum = 'SUCURSALES RDP'
    AND RDP.Numero = U.Sucursal
  WHERE U.Usuario = @Usuario
  AND U.Estatus = 'ALTA'

END