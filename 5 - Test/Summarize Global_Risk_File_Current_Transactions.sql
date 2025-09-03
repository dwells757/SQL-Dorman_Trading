USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT
COUNT(*) "Global_Risk_File_Current_Transactions",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[Global_Risk_File_Current_Transactions]

SELECT
COUNT(*) "Global_Risk_File_Current_Transactions_2",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[Global_Risk_File_Current_Transactions_2]

SET NOCOUNT OFF