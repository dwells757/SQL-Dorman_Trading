USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office]
														--@Account='D-99280' --@Account VARCHAR(20)
														--@Account='D-38956' --@Account VARCHAR(20)
														@Account='D-46774' --@Account VARCHAR(20)
														

SET NOCOUNT OFF