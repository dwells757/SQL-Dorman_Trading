USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_Current_Positions_Summarized_Portal_Back_Office]
																	--@Group_ID='D-99280' --@Group_ID VARCHAR(30)
																	--@Group_ID='D-00154' --@Group_ID VARCHAR(30) --Account
																	--@Group_ID='D-00420' --@Group_ID VARCHAR(30) --Account
																	@Group_ID='D-00421' --@Group_ID VARCHAR(30) --Account
																	--@Group_ID='D-153-00154' --@Group_ID VARCHAR(30) --Related_Account
																	--@Account='D-38956' --@Account VARCHAR(20)
																	--@Account='D-99203' --@Account VARCHAR(20)
																	--@Account='D-TX073' --@Account VARCHAR(20)
																	

SET NOCOUNT OFF