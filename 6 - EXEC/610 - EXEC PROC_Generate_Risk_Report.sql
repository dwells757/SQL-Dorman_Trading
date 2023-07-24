USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Generate_Risk_Report]
								@Processing_Date='7/19/23' --@Processing_Date DATE=NULL

SET NOCOUNT OFF