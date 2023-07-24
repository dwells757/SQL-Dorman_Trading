USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Current_Transactions]
									@Account='D-TX073' --@Account VARCHAR(20)

SET NOCOUNT OFF