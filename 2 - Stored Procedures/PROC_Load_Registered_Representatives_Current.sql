USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_Registered_Representatives_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Registered_Representatives_Current]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Registered_Representatives_Current] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************************
-- Create #Registered_Representatives_Current
--**************************************************************************
CREATE TABLE #Registered_Representatives_Current
(Registered_Representative_ID VARCHAR(5))

PRINT '**************************************************************************'
PRINT ' Load #Registered_Representatives_Current'
PRINT ' with [dbo].[GMIMNYF1_File_Current]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Registered_Representatives_Current
(Registered_Representative_ID)
SELECT
MRR --Registered_Representative_ID
FROM [dbo].[GMIMNYF1_File_Current]
WHERE (MRECID='M')
AND (MCLASS IN('C','H'))
GROUP BY MRR
ORDER BY MRR

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Registered_Representatives_Current]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[Registered_Representatives_Current]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[Registered_Representatives_Current]'
PRINT ' with #Registered_Representatives_Current'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Registered_Representatives_Current]
(Registered_Representative_ID)
SELECT
Registered_Representative_ID
FROM #Registered_Representatives_Current

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Registered_Representatives_Current

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Registered_Representatives_Current] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO