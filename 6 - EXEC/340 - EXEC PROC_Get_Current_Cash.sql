USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Current_Cash]
							@Account='D-TX073' --@Account VARCHAR(20)

SET NOCOUNT OFF