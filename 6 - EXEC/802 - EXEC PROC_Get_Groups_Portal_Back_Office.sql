USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Groups_Portal_Back_Office]
										@Group_Type='Account' --@Group_Type VARCHAR(30)
										--@Group_Type='Related_Account' --@Group_Type VARCHAR(30)
SET NOCOUNT OFF