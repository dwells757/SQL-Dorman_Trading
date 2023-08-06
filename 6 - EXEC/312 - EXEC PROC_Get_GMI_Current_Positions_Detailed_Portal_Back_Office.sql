USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_GMI_Current_Positions_Detailed_Portal_Back_Office]
																--@Account='D-99280', --@Account VARCHAR(20),
																--@Group_ID='D-00154', --@Group_ID VARCHAR(30), --Account
																--@Group_ID='D-00420', --@Group_ID VARCHAR(30), --Account
																@Group_ID='D-00421', --@Group_ID VARCHAR(30), --Account
																--@Group_ID='D-153-00154', --@Group_ID VARCHAR(30), --Related_Account
																@Product='01/S-/202401' --@Product VARCHAR(50)
																
SET NOCOUNT OFF