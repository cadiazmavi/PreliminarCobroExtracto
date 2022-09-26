
GO

/****** Object:  View [dbo].[V_FactorIMMAVI]    Script Date: 24/09/2022 10:12:12 a. m. ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE View [dbo].[V_FactorIMMAVI]
AS
Select 
	FactorIM = (Select Case When 
								M.RestaDiasNatural<=M.DiasConProporcionIM
							Then 
								(M.RestaDiasNatural * M.ProporcionPagos/ 100)          
							Else 
								((RestaDiasNatural - DiasConProporcionIM) + (DiasConProporcionIM * ProporcionPagos) / 100)            
							End)
	,M.ID 
From 
(
	Select
		FechaLimiteProp = W.FechaDiasTotal
		,DiasConProporcionIM = (Select Case	When
												W.FechaUltIntereses>W.FechaDiasTotal
											Then
												0
											Else 
												DATEDIFF(dd,W.FechaUltIntereses,W.FechaDiasTotal)
								End)              
		,W.ProporcionPagos
		,W.RestaDiasNatural  
		,W.ID
	From
	(
		Select 
			FechaDiasTotal = ( Select Case When DAY(Z.Vencimiento)<>DAY(Z.Vencimiento + Z.DiasMesOrigen)  
												Then  
													(Z.Vencimiento) + (Z.DiasMesDestino + (Z.DiasMesDestino - Z.DiasMesOrigen))
												Else 
													(Z.Vencimiento + Z.DiasMesOrigen) 
								End)
			,Z.FechaUltIntereses 
			,Z.ProporcionPagos
			,Z.RestaDiasNatural  
			,Z.ID
		From
		(    
			Select  
					d_ldias = CONVERT(varchar(10),Y.d_ldias,101)          
					,t_ldias = DATEDIFF(DD,Y.d_ldias,DATEADD(MM,1,Y.d_ldias - DAY(Y.d_ldias) + 1))          
					,DiasMesOrigen = Y.t_vdias           
					,DiasMesDestino = DATEDIFF(DD,Y.d_ldias,DATEADD(MM,1,Y.d_ldias - DAY(Y.d_ldias) + 1))
					,Y.Vencimiento
					,Y.FechaUltIntereses
					,Y.ProporcionPagos
					,Y.RestaDiasNatural  
					,Y.ID
			From 
			(		            
				Select 
						 X.Vencimiento
						,d_dias = CONVERT(varchar(10),X.Vencimiento,101)          
						,t_vdias = DATEDIFF(DD,X.Vencimiento, DATEADD(MM,1,X.Vencimiento - DAY(X.Vencimiento) + 1))          
						,t_vmes = MONTH(X.Vencimiento)          
						,t_vaño = YEAR(X.Vencimiento)
						,X.Estatus           
						,RestaDiasNatural = DATEDIFF(dd,X.FechaUltIntereses, X.FechaActual)
						,MontoVencido=(Select Case When X.FechaActual>=X.FechaUltIntereses Then X.ImporteDocumento - X.PagosRealizados Else 0.0 End)
						,ProporcionPagos = ((Select Case When X.FechaActual>=X.FechaUltIntereses Then X.ImporteDocumento - X.PagosRealizados Else 0.0 End) / Case when  X.ImporteDocumento < 1 Then 1 Else X.ImporteDocumento End) * 100
						,MesVencimiento=(Select Case When Month(X.Vencimiento)+1=13 Then 1 Else Month(X.Vencimiento)+1 End)    
						,d_ldias = DATEADD(m,1,X.Vencimiento) 
						,X.FechaUltIntereses          
						,X.ID
				From
				(
					SELECT 
						FechaActual = GETDATE()      
						,C.Mov      
						,C.MovID      
						,Vencimiento = ISNULL(C.Vencimiento,C.FechaEmision)      
						,ImporteDocumento = ISNULL(C.Importe,1.0) + ISNULL(C.Impuestos,0.0)- ISNULL(C.Retencion,0.0)      
						,FechaUltIntereses = ISNULL(C.FechaOriginal,C.Vencimiento)      
						,Estatus
						,PagosRealizados =( SELECT   ISNULL(SUM(B.Importe),0.0)      
											FROM Cxcd B WITH(NOLOCK)  Inner Join CxC A WITH(NOLOCK)  On B.id=A.id 
											WHERE          
												A.Estatus='Concluido'      
												AND B.Aplica=C.Mov      
												AND B.AplicaID=C.MovID)
						,ID
					FROM    CXC C  WITH(NOLOCK)       
							JOIN MovTipo mt WITH(NOLOCK)  On mt.Mov=C.Mov            
					WHERE   mt.Modulo='CXC' -- And ID=4753923      
				) X
			) Y
		) Z
	)W
)M


--Select dbo.fnFactorIMMAVI(ID), Id, Mov, MovId from cxc where dbo.fnFactorIMMAVI(ID)<>0 And Mov like 'Factura%' And ID=4753923 order by Id Desc 
--*************************************************************************************************************-- 
--Select Top 10 dbo.fnFactorIMMAVI(ID), Id from cxc where dbo.fnFactorIMMAVI(ID)<>0 And Id=56344


--Select top 10 B.* from Cxcd B Where  B.Importe>0 AND B.Aplica='Factura' And  B.AplicaID='AAOC1'
--Select top 10 A.* from Cxc A Where   Mov='Factura' and MovId='AAOC1' --And Estatus='PENDIENTE' 

--Select top 10 B.Importe ,A.* from Cxcd B Inner Join CxC A On B.id=A.id  Where B.Aplica=A.Mov  And B.Importe>0    
--										AND B.AplicaID=A.MovID And A.Estatus='Concluido' And B.Importe>0 order by A.id desc



-- Select top 10 B.* from Cxcd B Where  B.Importe>0 AND B.Aplica='Factura' And  B.AplicaID='AAOC1'
--              SELECT   PagosRealizados = ISNULL(SUM(CxcD.Importe),0)      
--               FROM     Cxcd WITH (NOLOCK)      
--                       JOIN CXC WITH (NOLOCK) On cxcd.id=cxc.id      
--               WHERE    CXC.Estatus='Concluido'      
--                        AND Cxcd.Aplica='Factura'      
--                        AND Cxcd.AplicaID='AAOC1'  

--Select Top 10 dbo.fnFactorIMMAVI(ID), Id, Mov, MovId from cxc where dbo.fnFactorIMMAVI(ID)<>0 And Mov like 'Factura%' order by Id Desc 


GO


