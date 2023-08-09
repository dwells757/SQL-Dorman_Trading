USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Current_Transactions_Portal_Back_Office]
														--@Account='D-38956' --@Account VARCHAR(20)
														--@Group_ID='D-10844' --@Group_ID VARCHAR(30), --Account
														--@Group_ID='D-10847' --@Group_ID VARCHAR(30), --Account
														@Group_ID='D-153-10826' --@Group_ID VARCHAR(30), --Related_Account

SET NOCOUNT OFF