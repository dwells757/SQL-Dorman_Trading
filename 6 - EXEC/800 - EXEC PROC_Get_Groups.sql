USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Groups]
						--@Group_Type='Account' --@Group_Type VARCHAR(30)
						@Group_Type='Related_Account' --@Group_Type VARCHAR(30)

SET NOCOUNT OFF