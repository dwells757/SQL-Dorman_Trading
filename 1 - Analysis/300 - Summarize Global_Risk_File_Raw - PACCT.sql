USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT 
PACCT,
COUNT(*) "Global Risk File Records",
MIN(DateLoaded) "MIN(DateLoaded)",
MAX(DateLoaded) "MAX(DateLoaded)"
FROM [dbo].[Global_Risk_File_Raw]
GROUP BY PACCT
ORDER BY PACCT

SET NOCOUNT OFF