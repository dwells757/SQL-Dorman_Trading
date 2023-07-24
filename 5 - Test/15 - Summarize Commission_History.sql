USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT
Processing_Date,
COUNT(*) "Records",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[Commission_History]
GROUP BY Processing_Date
ORDER BY Processing_Date

SET NOCOUNT OFF