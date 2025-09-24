USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Add_Records_to_Global_Risk_File_Raw]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Add_Records_to_Global_Risk_File_Raw]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Add_Records_to_Global_Risk_File_Raw] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--****************************************************************
-- Create #Global_Risk_File_Raw
--****************************************************************
CREATE TABLE #Global_Risk_File_Raw
(PRECID VARCHAR(255),
PRECNO INT,
New_PRECNO INT DEFAULT 0,
PFIRM VARCHAR(255),
POFFIC VARCHAR(255),
PACCT VARCHAR(255),
Original_PACCT VARCHAR(5) DEFAULT '?????',
PATYPE VARCHAR(255),
PCLASS VARCHAR(255),
PROUT3 VARCHAR(255),
PPCNTY VARCHAR(255),
PCARD VARCHAR(255),
PEXCH VARCHAR(255),
PFC VARCHAR(255),
PSYMBL VARCHAR(255),
PSUBTY_UFC_UNSYMB VARCHAR(255),
PCUSP2 VARCHAR(255),
Undefined_1 VARCHAR(255),
PSTAT5 VARCHAR(255),
PSTYPE VARCHAR(255),
PSUBTY VARCHAR(255),
PSDSC1 VARCHAR(255),
PPTYPE VARCHAR(255),
PBS VARCHAR(255),
New_PBS VARCHAR(1) DEFAULT '?',
PQTY VARCHAR(255),
PBUSTQ VARCHAR(255),
PLEAVQ VARCHAR(255),
PCTYM VARCHAR(255),
PSBCUS VARCHAR(255),
PSTRIK VARCHAR(255),
PEXPDT VARCHAR(255),
PTPRIC VARCHAR(255),
PCABCD VARCHAR(255),
PCMNT2 VARCHAR(255),
PSTAT7 VARCHAR(255),
PDELET VARCHAR(255),
PDEST VARCHAR(255),
PCLOSE VARCHAR(255),
PSDATE VARCHAR(255),
PNET VARCHAR(255))

PRINT '**************************************************************************'
PRINT ' Load #Global_Risk_File_Raw'
PRINT ' with [dbo].[Global_Risk_File_Raw]'
PRINT ' WHERE (PSTAT5="NNYYYYNN")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Global_Risk_File_Raw
(PRECID,
PRECNO,
PFIRM,
POFFIC,
PACCT,
PATYPE,
PCLASS,
PROUT3,
PPCNTY,
PCARD,
PEXCH,
PFC,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PCUSP2,
Undefined_1,
PSTAT5,
PSTYPE,
PSUBTY,
PSDSC1,
PPTYPE,
PBS,
PQTY,
PBUSTQ,
PLEAVQ,
PCTYM,
PSBCUS,
PSTRIK,
PEXPDT,
PTPRIC,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET)
SELECT
PRECID,
CONVERT(INT,PRECNO), --PRECNO,
PFIRM,
POFFIC,
PACCT,
PATYPE,
PCLASS,
PROUT3,
PPCNTY,
PCARD,
PEXCH,
PFC,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PCUSP2,
Undefined_1,
PSTAT5,
PSTYPE,
PSUBTY,
PSDSC1,
PPTYPE,
PBS,
PQTY,
PBUSTQ,
PLEAVQ,
PCTYM,
PSBCUS,
PSTRIK,
PEXPDT,
PTPRIC,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET
FROM [dbo].[Global_Risk_File_Raw]
WHERE (PSTAT5='NNYYYYNN')

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate New_PRECNO'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Global_Risk_File_Raw
SET New_PRECNO = 1000000000 + PRECNO

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update Original_PACCT'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET Original_PACCT=B.PACCT
FROM #Global_Risk_File_Raw A
INNER JOIN [dbo].[GMIPOSF1_File_Current] B
ON (A.PEXCH=B.PEXCH)
AND (A.PFC=B.PFC)
AND (A.PCTYM=B.PCTYM)
AND (A.PSBCUS=B.PSBCUS)
AND (A.PSTRIK=B.PSTRIK)
AND (A.PSDATE=B.PSDATE)
AND (A.PBS=B.PBS)
AND (A.PQTY=B.PQTY)
AND (A.PTPRIC=B.PTPRIC)
AND  (A.PCARD=B.PCARD)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate New_PBS'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Global_Risk_File_Raw
SET New_PBS =
	CASE PBS
		WHEN '1' THEN '2'
		WHEN '2' THEN '1'
		ELSE PBS --leave as-is
	END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Global_Risk_File_Raw]'
PRINT ' with #Global_Risk_File_Raw'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Global_Risk_File_Raw]
(PRECID,
PRECNO,
PFIRM,
POFFIC,
PACCT,
PATYPE,
PCLASS,
PROUT3,
PPCNTY,
PCARD,
PEXCH,
PFC,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PCUSP2,
Undefined_1,
PSTAT5,
PSTYPE,
PSUBTY,
PSDSC1,
PPTYPE,
PBS,
PQTY,
PBUSTQ,
PLEAVQ,
PCTYM,
PSBCUS,
PSTRIK,
PEXPDT,
PTPRIC,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET)
SELECT
PRECID,
New_PRECNO, --PRECNO,
PFIRM,
POFFIC,
Original_PACCT, --PACCT,
PATYPE,
PCLASS,
PROUT3,
PPCNTY,
PCARD,
PEXCH,
PFC,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PCUSP2,
Undefined_1,
PSTAT5,
PSTYPE,
PSUBTY,
PSDSC1,
PPTYPE,
New_PBS, --PBS,
PQTY,
PBUSTQ,
PLEAVQ,
PCTYM,
PSBCUS,
PSTRIK,
PEXPDT,
PTPRIC,
PCABCD,
PCMNT2,
'DWH', --PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET
FROM #Global_Risk_File_Raw
WHERE (Original_PACCT<>'?????')

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Global_Risk_File_Raw

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Add_Records_to_Global_Risk_File_Raw] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO