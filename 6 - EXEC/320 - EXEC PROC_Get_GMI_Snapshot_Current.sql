USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_Snapshot_Current]
									--@Account='D-99280' --@Account VARCHAR(20)
									@Account='D-TX073' --@Account VARCHAR(20)

SET NOCOUNT OFF