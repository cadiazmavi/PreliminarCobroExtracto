
GO
/****** Object:  UserDefinedFunction [dbo].[fn_MAVIRM0906CobxPol]    Script Date: 23/09/2022 07:49:06 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
--====================================================================================================================================================================
-- FECHA Y AUTOR MODIFICACION:    08/01/2020 Por: Miriam J. Márquez Muriño
-- Se agrega la condicion de categoría para la configuracion de bonificación de intereses moratorios
-- ========================================================================================================================================
-- FECHA Y AUTOR MODIFICACION:    22/04/2021 Por: Miriam J. Márquez Muriño
-- Se agrega nueva política para las facturas convenio RD 
-- ========================================================================================================================================

Create FUNCTION [dbo].[fn_MAVIRM0906CobxPol] (@ID int)
RETURNS varchar(10)
AS
BEGIN
  DECLARE @COB varchar(10),
          @DV int,
          @DI int,
          @DVEC int,
          @DINAC int,
          @SECC varchar(50),
          @Cliente varchar(10),
          @Quincena int,
          @Year int = YEAR(GETDATE()),
          @Categoria varchar(50),
          @Cuantos int
  SELECT
    @Cliente = C.Cliente,
    @SECC = ISNULL(CE.SeccionCobranzaMAVI, ''),
    @DVEC = ISNULL(CM.DiasVencActMAVI, 0),
    @DINAC = ISNULL(CM.DiasInacActMAVI, 0),
    @Categoria = ISNULL(v.Categoria, '')
  FROM CxcMavi CM WITH (NOLOCK)
  JOIN Cxc C WITH (NOLOCK)
    ON C.ID = CM.ID
  JOIN TablaStD T WITH (NOLOCK)
    ON T.TablaSt = 'MOVIMIENTOS COBRO X POLITICA'
    AND T.Nombre = C.Mov
  LEFT JOIN CteEnviarA CE WITH (NOLOCK)
    ON CE.ID = C.ClienteEnviarA
    AND CE.Cliente = C.Cliente
  LEFT JOIN VentasCanalMAVI V WITH (NOLOCK)
    ON C.ClienteEnviarA = V.ID
  WHERE CM.ID = @ID

  IF ISNULL(@Cliente, '') != ''
    AND ISNULL(@SECC, '') != 'INSTITUCIONES'
    AND (ISNULL(@DVEC, 0) > 0
    OR ISNULL(@DINAC, 0) > 0)
  BEGIN
    SET @Quincena =
                   CASE
                     WHEN DAY(GETDATE()) > 16 THEN MONTH(GETDATE()) * 2
                     ELSE (MONTH(GETDATE()) * 2) - 1
                   END
    SET @Quincena =
                   CASE
                     WHEN DAY(GETDATE()) = 1 THEN @Quincena - 1
                     ELSE @Quincena
                   END
    SELECT
      @Year =
             CASE
               WHEN DAY(GETDATE()) = 1 AND
                 MONTH(GETDATE()) = 1 THEN @Year - 1
               ELSE @Year
             END,
      @Quincena =
                 CASE
                   WHEN DAY(GETDATE()) = 1 AND
                     MONTH(GETDATE()) = 1 THEN 24
                   ELSE @Quincena
                 END


    DECLARE @CATEGORIAS TABLE (
      categoria varchar(50),
      DV int,
      DI int
    )
    INSERT INTO @CATEGORIAS (categoria, DV, DI)
      SELECT
        con.CategoriaVenta,
        DV = ISNULL(CON.DV, 0),
        DI = ISNULL(CON.DI, 0)
      FROM TcIRM0906_ConfigDivisionYParam CON WITH (NOLOCK)
      JOIN MaviRecuperacion MA WITH (NOLOCK)
        ON ISNULL(CON.Division, '') = ISNULL(MA.Division, '')
        AND MA.Quincena = @Quincena
        AND MA.Ejercicio = @Year
        AND MA.Cliente = @Cliente
    IF EXISTS (SELECT
        categoria
      FROM @CATEGORIAS
      WHERE ISNULL(categoria, '') = ISNULL(@Categoria, ''))
    BEGIN
      SELECT TOP 1
        @DV = ISNULL(DV, 0),
        @DI = ISNULL(DI, 0)
      FROM @CATEGORIAS
      WHERE ISNULL(categoria, '') = ISNULL(@Categoria, '')
    END
    ELSE
    BEGIN
      SELECT TOP 1
        @DV = ISNULL(DV, 0),
        @DI = ISNULL(DI, 0)
      FROM @CATEGORIAS
      WHERE ISNULL(categoria, '') = ''
    END

    SELECT
      @DV = ISNULL(@DV, 0),
      @DI = ISNULL(@DI, 0),
      @DVEC = ISNULL(@DVEC, 0),
      @DINAC = ISNULL(@DINAC, 0)
    SET @COB =
              CASE
                WHEN ((@DVEC >= @DV AND
                  @DV <> 0) OR
                  (@DINAC >= @DI AND
                  @DI <> 0)) THEN 'SI'
                ELSE 'NO'
              END
  END

  ---Si la factura es convenio RD no aplica la política------

  SELECT
    @Cuantos = COUNT(1)
  FROM CXCCConvenioRD WITH (NOLOCK)
  WHERE Cliente = @Cliente
  AND Estatus LIKE '%Pendiente de cobro%'

  SET @COB =
            CASE
              WHEN @Cuantos > 0 THEN 'NO'
              ELSE @COB
            END

  SET @COB = ISNULL(@COB, 'NO')
  RETURN @COB
END