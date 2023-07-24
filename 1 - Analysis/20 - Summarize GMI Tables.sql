USE [GMIDATA]
GO

SET NOCOUNT ON

DECLARE
@dte_Current_Processing_Date DATE

SELECT @dte_Current_Processing_Date=Current_Processing_Date
FROM [dbo].[Current_Information]

SELECT @dte_Current_Processing_Date "@dte_Current_Processing_Date"

SELECT 
COUNT(*) "GMIMNYF1_File_Current",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[GMIMNYF1_File_Current]

SELECT TOP 3
Processing_Date,
COUNT(*) "MNYF1_File_History",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)",
MIN(DateLoaded_Local) "MIN(DateLoaded_Local)",
MAX(DateLoaded_Local) "MAX(DateLoaded_Local)"
FROM [dbo].[MNYF1_File_History]
GROUP BY Processing_Date
ORDER BY Processing_Date DESC

SELECT 
COUNT(*) "GMIST4F1_File_Current",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[GMIST4F1_File_Current]

SELECT TOP 3
Processing_Date,
COUNT(*) "ST4F1_File_History",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)",
MIN(DateLoaded_Local) "MIN(DateLoaded_Local)",
MAX(DateLoaded_Local) "MAX(DateLoaded_Local)"
FROM [dbo].[ST4F1_File_History]
GROUP BY Processing_Date
ORDER BY Processing_Date DESC

SET NOCOUNT OFF