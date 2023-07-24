USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Balance_Report_Summary]
										@Start_Date='1/1/23', --@Start_Date DATE,
										@End_Date='6/30/23' --@End_Date DATE

SET NOCOUNT OFF