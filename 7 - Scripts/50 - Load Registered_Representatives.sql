USE [GMIDATA]
GO

SET NOCOUNT ON

--**************************************************************************************
-- Create #Registered_Representatives_1
--**************************************************************************************
CREATE TABLE #Registered_Representatives_1
(RR VARCHAR(5),
Registered_Representative VARCHAR(5) DEFAULT '',
Master_Common_Name VARCHAR(100))

PRINT '********************************************************************************'
PRINT ' Load #Registered_Representatives_1'
PRINT ' with [dbo].[Sales_Series_Names]'
PRINT '********************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Registered_Representatives_1
(RR,
Master_Common_Name)
SELECT
RR,
Master_Common_Name
FROM [dbo].[Sales_Series_Names]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '********************************************************************************'
PRINT ' Generate Registered_Representative'
PRINT '********************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Registered_Representatives_1
SET Registered_Representative = RIGHT('00000' + RR,5)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--**************************************************************************************
-- Create #Registered_Representatives_2
--**************************************************************************************
CREATE TABLE #Registered_Representatives_2
(Registered_Representative VARCHAR(5),
Master_Common_Name VARCHAR(100))

PRINT '********************************************************************************'
PRINT ' Load #Registered_Representatives_2'
PRINT ' with #Registered_Representatives_1'
PRINT '********************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Registered_Representatives_2
(Registered_Representative,
Master_Common_Name)
SELECT
Registered_Representative,
Master_Common_Name
FROM #Registered_Representatives_1

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Registered_Representatives_1

SELECT
Registered_Representative,
COUNT(*) "Duplicate Records"
FROM #Registered_Representatives_2
GROUP BY Registered_Representative
HAVING COUNT(*)>1
ORDER BY Registered_Representative

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Registered_Representatives]'
PRINT '********************************************************************************'

PRINT '********************************************************************************'
PRINT ' Load [dbo].[Registered_Representatives]'
PRINT ' with #Registered_Representatives_2'
PRINT '********************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Registered_Representatives]
(Registered_Representative,
Master_Common_Name)
SELECT
Registered_Representative,
Master_Common_Name
FROM #Registered_Representatives_2

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Registered_Representatives_2

SET NOCOUNT OFF