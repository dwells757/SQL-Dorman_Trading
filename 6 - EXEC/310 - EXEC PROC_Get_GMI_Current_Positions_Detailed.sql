USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_Current_Positions_Detailed]
												--@Account='D-99280' --@Account VARCHAR(20)
												@Account='D-38956', --@Account VARCHAR(20),
												--@Account='D-TX073', --@Account VARCHAR(20),
												--@Product='02/LN/202307/96/C' --@Product VARCHAR(50)
												@Product='ALL' --@Product VARCHAR(50)

SET NOCOUNT OFF