
GO
/****** Object:  UserDefinedFunction [dbo].[FN_MAVICALCULAMORATORIOS]    Script Date: 23/09/2022 06:50:02 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- ========================================================================================================================================
-- Modificacion: Fernando Romero 30/10/2020 se redondea los moratorios para dineralia
-- ========================================================================================================================================
CREATE FUNCTION [dbo].[FN_MAVICALCULAMORATORIOS] (@id int)
RETURNS money
AS
BEGIN
  DECLARE @id_padre int,
          @empresa varchar(20),
          @saldo money,
          @resultado money,
          @interesesmoratoriosmavi money,
          @montominmoratorio money,
          @moratoriocxctasa float

  SET @resultado = 0
  IF (SELECT
      SUM(ISNULL(vi.H_Saldo, 0))
    FROM v_phmoratorio Vi WITH (NOLOCK)
    WHERE vi.H_ID = @id
    AND vi.H_Saldo IS NOT NULL
    AND vi.H_Saldo > 0)
    > 0
  BEGIN
    SELECT
      @id_padre = vi.P_ID,
      @montominmoratorio = ISNULL(E.MontoMinMoratorioMAVI, 0),
      @saldo = ISNULL(vi.H_Saldo, 0),
      @interesesmoratoriosmavi = ISNULL(vi.H_InteresesMoratorioMavi, 0),
      @empresa = vi.P_Empresa
    FROM v_phmoratorio AS vi WITH (NOLOCK)
    INNER JOIN EmpresaCFG2 E WITH (NOLOCK)
      ON vi.P_Empresa = E.Empresa
    INNER JOIN VentasCanalMavi V WITH (NOLOCK)
      ON V.ID = vi.P_ClienteEnviara
    INNER JOIN MovTipo M WITH (NOLOCK)
      ON m.mov = vi.P_Mov
      AND M.Modulo = 'CXC'
    LEFT JOIN CalculoMoratoriosExMAVI Ex WITH (NOLOCK)
      ON ex.Mov = vi.H_Mov
      AND ex.Concepto = vi.H_Concepto
    LEFT JOIN CteEnviarA Cea WITH (NOLOCK)
      ON Cea.Cliente = vi.P_Cliente
      AND Cea.ID = vi.P_ClienteEnviarA
    WHERE vi.H_ID = @id
    AND CalculoMoratorioMavi = 1
    AND Ex.Mov IS NULL
    AND vi.H_Saldo IS NOT NULL
    AND vi.H_Saldo > 0
    AND ((GeneraCargoxMoratorio = 1)
    OR (V.Categoria = 'INSTITUCIONES'
    AND Cea.Categoria = V.Categoria
    AND Cea.SeccionCobranzaMavi = 'CREDITO MENUDEO'))


    SET @saldo = ISNULL(@saldo, 0)
    IF @id_padre IS NOT NULL
    BEGIN
      -- Obtener la informacion de Herramientas -> Cxc -> Tasas según la empresa      
      SELECT
        @moratoriocxctasa = CxcMoratoriosTasa
      FROM EmpresaCfg WITH (NOLOCK)
      WHERE Empresa = @empresa--FN      

      SET @resultado = (ISNULL((SELECT
        FactorIM
      FROM V_FactorIMMAVI VIM WITH (NOLOCK)
      WHERE VIM.Id = @id)
      , 0) * @moratoriocxctasa * @saldo) + @interesesmoratoriosmavi

      -- El Saldo Moratorio debe ser mayor al MontoMinimoMoratorio | Configuracion -> Empresa -> Edicion Cfg Modulos CXC2      
      IF CAST(@resultado AS decimal(10, 2)) <= @montominmoratorio
        SET @resultado = 0
    END
    ELSE
    BEGIN
      SET @resultado = 0
    END
  END

  IF (SELECT
      ClienteEnviarA
    FROM Cxc WITH (NOLOCK)
    WHERE ID = @id)
    = 77
    SET @resultado = CEILING(@resultado)

  RETURN @resultado
END