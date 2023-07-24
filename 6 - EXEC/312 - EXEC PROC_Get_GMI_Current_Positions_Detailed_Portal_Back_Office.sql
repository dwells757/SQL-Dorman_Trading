USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_Current_Positions_Detailed_Portal_Back_Office]
																--@Account='D-99280', --@Account VARCHAR(20),
																@Account='D-38956', --@Account VARCHAR(20),
																--@Product='01/06/202307' --@Product VARCHAR(50)
																@Product='ALL' --@Product VARCHAR(50)

SET NOCOUNT OFF