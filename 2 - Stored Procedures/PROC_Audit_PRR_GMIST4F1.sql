USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Audit_PRR_GMIST4F1]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PROC_Audit_PRR_GMIST4F1]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Audit_PRR_GMIST4F1] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--***************************************************************
-- Create #GMIST4F1_File_Current
--***************************************************************
CREATE TABLE #GMIST4F1_File_Current
(PRR VARCHAR(5),
Master_Common_Name VARCHAR(100) DEFAULT '',
Records INT)

PRINT '******************************************************************************'
PRINT ' Load #GMIST4F1_File_Current'
PRINT ' with [dbo].[GMIST4F1_File_Current]'
PRINT '******************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMIST4F1_File_Current
(PRR,
Records)
SELECT
PRR,
COUNT(*) "Records"
FROM [dbo].[GMIST4F1_File_Current]
GROUP BY PRR

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************'
PRINT ' Update Master_Common_Name'
PRINT ' with [dbo].[Registered_Representative]'
PRINT '******************************************************************************'

SELECT GETDATE() "Start Time"
UPDATE B
SET Master_Common_Name = A.Master_Common_Name
FROM [dbo].[Registered_Representative] A
INNER JOIN #GMIST4F1_File_Current B
ON (A.[Name]=B.PRR)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--************************************************************************************************************************
-- NOTE: It is assumed here that the [dbo].[PRR_Audit] Table has been TRUNCATED elsewhere
--************************************************************************************************************************

PRINT '******************************************************************************'
PRINT ' Load [dbo].[PRR_Audit]'
PRINT ' with #GMIST4F1_File_Current'
PRINT '******************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[PRR_Audit]
(GMI_Table,
PRR,
Master_Common_Name)
SELECT
'GMIST4F1', --GMI_Table,
PRR,
Master_Common_Name
FROM #GMIST4F1_File_Current

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMIST4F1_File_Current

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Audit_PRR_GMIST4F1] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO


