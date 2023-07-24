USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_Current_Positions_Summarized_Portal_Back_Office]
																	--@Account='D-99280' --@Account VARCHAR(20)
																	@Account='D-38956' --@Account VARCHAR(20)
																	--@Account='D-99203' --@Account VARCHAR(20)
																	--@Account='D-TX073' --@Account VARCHAR(20)
																	

SET NOCOUNT OFF