USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Get_Balance_Report_Summary]
										@Start_Date='7/1/23', --@Start_Date DATE,
										@End_Date='7/31/23' --@End_Date DATE

SET NOCOUNT OFF