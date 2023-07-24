USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Detail_Com_Report]
								@Start_Date='6/1/23', --@Start_Date DATE,
								@End_Date='6/30/23', --@End_Date DATE,
								@Account='D-99280' --@Account VARCHAR(20)

SET NOCOUNT OFF