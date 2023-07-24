USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Load_Commission_Fees_Volume_History_with_ST4F1_File_History]
																	@Start_Date='6/1/23', --@Start_Date DATE,
																	@End_Date='6/30/23' --@End_Date DATE

SET NOCOUNT OFF