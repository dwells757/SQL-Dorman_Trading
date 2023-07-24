USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Fee_Report_by_Account]
									@Start_Date='6/1/23', --@Start_Date DATE,
									@End_Date='6/30/23' --@End_Date DATE

SET NOCOUNT OFF