USE [GMIDATA]
GO

SET NOCOUNT ON

DECLARE
@Current_Processing_Date DATE

SELECT @Current_Processing_Date=Current_Processing_Date
FROM [dbo].[Current_Information]

SELECT @Current_Processing_Date "@Current_Processing_Date"

--************************************************************************************
-- Create #Commission_History
--************************************************************************************
CREATE TABLE #Commission_History
(Processing_Date DATE,
PRR VARCHAR(5),
PFIRM VARCHAR(1),
POFFIC VARCHAR(3),
PACCT VARCHAR(5),
PCLASS VARCHAR(1),
PSUBCL VARCHAR(1),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
PRECID VARCHAR(1),
PCOMM NUMERIC(15,2),
PATYPE VARCHAR(2),
PCURAT VARCHAR(3),
ST4F1_File_Records INT)

PRINT '**************************************************************************'
PRINT ' Load #Commission_History '
PRINT ' with [dbo].[GMIST4F1_File_Current]'
PRINT ' For "Futures"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Commission_History
(Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PCOMM,
PATYPE,
PCURAT,
ST4F1_File_Records)
SELECT
@Current_Processing_Date, --Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
SUM(PCOMM), --PCOMM
PATYPE,
PCURAT,
COUNT(*) --ST4F1_File_Records
--FROM [dbo].[ST4F1_File_History]
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
AND (PTYPE='') --Futures
AND (PRECID IN(
'T', --"T" = "Transaction"
'V')) --"V" = "Confirm Reversal"
GROUP BY 
--Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PATYPE,
PCURAT

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #Commission_History '
PRINT ' with [dbo].[GMIST4F1_File_Current]'
PRINT ' For "Options"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Commission_History
(Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PCOMM,
PATYPE,
PCURAT,
ST4F1_File_Records)
SELECT
@Current_Processing_Date, --Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
SUM(PCOMM), --PCOMM
PATYPE,
PCURAT,
COUNT(*) --ST4F1_File_Records
--FROM [dbo].[ST4F1_File_History]
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
AND (PTYPE='O') --Options
AND (PRECID IN(
'P', --"P" = "P & S Trades"
'Q')) --"Q" = "P & S Reversal"
GROUP BY 
--Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PATYPE,
PCURAT

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #Commission_History '
PRINT ' with [dbo].[GMIST4F1_File_Current]'
PRINT ' For "Adjustments"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Commission_History
(Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PCOMM,
PATYPE,
PCURAT,
ST4F1_File_Records)
SELECT
@Current_Processing_Date, --Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
SUM(PCOMM), --PCOMM
PATYPE,
PCURAT,
COUNT(*) --ST4F1_File_Records
--FROM [dbo].[ST4F1_File_History]
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
AND (PRECID='A') --"A" = "Adjustments"
AND (PCOMM<>0) --PCOMM Adjustment ONLY
GROUP BY 
--Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PATYPE,
PCURAT

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' DELETE FROM [dbo].[Commission_History]'
PRINT ' WHERE (Processing_Date="' + CONVERT(VARCHAR,@Current_Processing_Date,101) + '")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

DELETE FROM [dbo].[Commission_History]
WHERE (Processing_Date=@Current_Processing_Date)

SELECT @@ROWCOUNT "Records Deleted"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Commission_History]'
PRINT ' with #Commission_History'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Commission_History]
(Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PCOMM,
PATYPE,
PCURAT,
ST4F1_File_Records)
SELECT
Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PCOMM,
PATYPE,
PCURAT,
ST4F1_File_Records
FROM #Commission_History
--WHERE (PRECID='A')
ORDER BY
Processing_Date,
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
PATYPE,
PCURAT

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Commission_History

SET NOCOUNT OFF