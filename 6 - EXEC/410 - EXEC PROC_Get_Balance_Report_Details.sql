USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Balance_Report_Details]
										@Start_Date='1/1/23', --@Start_Date DATE,
										@End_Date='6/30/23', --@End_Date DATE,
										@Registered_Rep='00150' --@Registered_Rep VARCHAR(5)
										--@Registered_Rep='00454' --@Registered_Rep VARCHAR(5)
										--@Registered_Rep='00999' --@Registered_Rep VARCHAR(5)
										--@Registered_Rep='TJM01' --@Registered_Rep VARCHAR(5)

SET NOCOUNT OFF