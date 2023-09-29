USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Fee_Report_Summary_1]
									@Start_Date='1/1/23', --@Start_Date DATE,
									@End_Date='8/31/23' --@End_Date DATE

SET NOCOUNT OFF