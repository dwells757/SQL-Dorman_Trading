USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT
Account,
COUNT(*) "Transactions",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[Global_Risk_File_Current_Transactions]
GROUP BY Account
ORDER BY COUNT(*) DESC

SELECT
Account,
COUNT(*) "Cash",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[Global_Risk_File_Current_Cash]
GROUP BY Account
ORDER BY 
COUNT(*) DESC,
Account

SET NOCOUNT OFF