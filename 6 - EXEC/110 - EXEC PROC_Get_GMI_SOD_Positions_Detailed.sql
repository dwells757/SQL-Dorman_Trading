USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_SOD_Positions_Detailed]
											@Account='D-99280', --@Account VARCHAR(20),
											@Product='16/MS/202306' --@Product VARCHAR(50)

SET NOCOUNT OFF