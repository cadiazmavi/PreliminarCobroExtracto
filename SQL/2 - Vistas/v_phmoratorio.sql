
GO

/****** Object:  View [dbo].[v_phmoratorio]    Script Date: 23/09/2022 06:51:30 p. m. ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE VIEW [dbo].[v_phmoratorio] 
AS  
SELECT   
       Papa.ID AS P_ID  
      ,Papa.Empresa P_Empresa  
      ,Papa.Mov AS P_Mov  
      ,Papa.MovID AS P_MovID  
      ,Papa.Cliente AS P_Cliente  
      ,Papa.ClienteEnviarA AS P_ClienteEnviara  
      ,Papa.Condicion AS P_Condicion  
      ,Papa.Concepto AS P_Concepto  
      ,Hijo.Saldo AS H_Saldo  
      ,Hijo.Vencimiento AS H_Vencimiento  
      ,Hijo.InteresesMoratoriosMavi AS H_InteresesMoratorioMavi  
      ,Hijo.ID AS H_ID  
      ,Hijo.Concepto AS H_Concepto  
      ,Hijo.Mov AS H_Mov  
      ,Hijo.MovID AS H_MovID  
      ,Hijo.PadreIDMAVI AS H_PadreIDMAVI   
      ,Hijo.PadreMAVI AS H_PadreMAVI  
FROM CXC Papa  WITH (NOLOCK)
INNER JOIN CXC Hijo  WITH (NOLOCK)
ON Papa.Mov = Hijo.PadreMAVI   
AND Papa.MovID = Hijo.PadreIDMAVI  
GO


