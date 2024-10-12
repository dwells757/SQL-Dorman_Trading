USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Load_Commission_Fees_Volume_History_with_ST4F1_File_History]
																	@Start_Date='5/1/24', --@Start_Date DATE,
																	@End_Date='5/2/24' --@End_Date DATE

SET NOCOUNT OFF