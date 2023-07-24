USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_SOD_Positions_Summarized]
											@Account='D-99280' --@Account VARCHAR(20)

SET NOCOUNT OFF