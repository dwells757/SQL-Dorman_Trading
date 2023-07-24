USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT MAX(Processing_Date) "GMIMNYF1_File_History"
FROM [dbo].[GMIMNYF1_File_History]

SELECT MAX(Processing_Date) "GMIPOSF1_File_History"
FROM [dbo].[GMIPOSF1_File_History]

SELECT MAX(Processing_Date) "GMIST4F1_File_History"
FROM [dbo].[GMIST4F1_File_History]

SET NOCOUNT OFF