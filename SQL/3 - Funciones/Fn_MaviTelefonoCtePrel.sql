
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_MaviTelefonoCtePrel]    Script Date: 23/09/2022 09:59:05 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- ==========================================================================================================================================  
-- NOMBRE Fn:  Fn_MaviTelefonoCtePrel  
-- AUTO:   joseABEL cruzMARTINEZ
-- FECHA CREACION: 21/07/2017  
-- DESARROLLO:  RM0906PreliminardeCobro  
-- MODULO:   CTETEL  
-- DESCRIPCION:  NOS PROPORCIONA EL NUMERO DE TELEFONO DEL CLIENTE CON DEL TIPO SOLICITADO (Particular,Movil) mas reciente  
-- Uso:  Select dbo.Fn_MaviTelefonoCtePrel('C00005079','Particular')  
-- ==========================================================================================================================================  
-- FECHA Y AUTOR MODIFICACION:  21/jul/2017      Por: NOMBRE COMPLETO, ASI COMO TAMBIEN SE DEBE DOCUMENTAR LAS MODICACION A REALIZAR O REALIZADA.  
-- 
-- ==========================================================================================================================================  
CREATE FUNCTION [dbo].[Fn_MaviTelefonoCtePrel]  (
--declare
@Cliente varchar(15),
@tipotel varchar(20)		
 )  
--set @Cliente = 'C00005079'  
--set @tipotel = 'Particular'--'Movil'

RETURNS varchar(15)  
AS  
BEGIN  
  
DECLARE   
@Telefono Varchar(15)  

	SELECT @Telefono=Telefono 
	FROM (
		SELECT Telefono=LADA+TELEFONO,TIPO,
				Fecha=CASE WHEN Fecha is null THEN GETDATE() ELSE FECHA END,
				ROW_NUMBER() OVER(PARTITION BY cliente,TIPO ORDER BY TIPO,fecha DESC) as R 
		FROM CTETEL With(Nolock) 
		WHERE Cliente=@Cliente and Tipo = @TipoTel
		)T
	WHERE R = 1
  
--select  @Telefono   
RETURN @Telefono  
END  


--  select LADA+TELEFONO,LADA,TELEFONO,TIPO,FECHA from ctetel where cliente = 'C00005079'
