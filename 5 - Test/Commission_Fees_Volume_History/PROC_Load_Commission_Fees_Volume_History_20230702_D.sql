USE [GMIDATA]
GO

--DROP PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History]
--GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--CREATE PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History]

--AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

DECLARE
@dte_Current_Processing_Date DATE

SELECT @dte_Current_Processing_Date=Current_Processing_Date
FROM [dbo].[Current_Information]

--SELECT @dte_Current_Processing_Date "@dte_Current_Processing_Date"

--************************************************************************************
-- Create #Commission_Fees_Volume_History
--************************************************************************************
CREATE TABLE #Commission_Fees_Volume_History
(Processing_Date DATE,
Account VARCHAR(20) DEFAULT '',
PFIRM VARCHAR(1),
POFFIC VARCHAR(3),
PACCT VARCHAR(5),
Related_Account VARCHAR(20) DEFAULT '',
PRECID VARCHAR(1),
PEXCH VARCHAR(2),
PFC VARCHAR(2),
Expiry VARCHAR(8),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
Security_Type VARCHAR(10) DEFAULT 'UNDEFINED',
PRR VARCHAR(5),
--PCLASS VARCHAR(1),
--PSUBCL VARCHAR(1),
--PRECID VARCHAR(1),
--PCOMM NUMERIC(15,2),
--PATYPE VARCHAR(2),
--PCURAT VARCHAR(3),
ST4F1_File_Records INT)

--PRINT '**************************************************************************'
--PRINT ' Load #Commission_Fees_Volume_History'
--PRINT ' with [dbo].[GMIST4F1_File_Current]'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

INSERT INTO #Commission_Fees_Volume_History
(Processing_Date,
PFIRM,
POFFIC,
PACCT,
PRECID,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
PRR,
ST4F1_File_Records)
SELECT
@dte_Current_Processing_Date, --Processing_Date,
PFIRM,
POFFIC,
PACCT,
PRECID,
PEXCH,
PFC,
RTRIM(PCTYM) + RTRIM(PSBCUS), --Expiry,
PSTYPE,
PTYPE,
PRR,
COUNT(*) --ST4F1_File_Records
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
GROUP BY
PFIRM,
POFFIC,
PACCT,
PRECID,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTYPE,
PTYPE,
PRR

--SELECT @@ROWCOUNT "Records Loaded"

--SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Generate Security_Type'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History
SET Security_Type =
	CASE PSTYPE
		WHEN 'B' THEN 'TBILL'
		WHEN 'F' THEN
			CASE PTYPE
				WHEN '' THEN 'FUT'
				WHEN 'O' THEN 'OOF'
				ELSE Security_Type --Leave as-is
			END
		ELSE Security_Type --Leave as-is
	END

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

--**************************************************************************
-- Create #GMI_Customer_Master
--**************************************************************************
CREATE TABLE #GMI_Customer_Master
(YFIRM VARCHAR(1),
YOFFIC VARCHAR(5),
YACCT VARCHAR(5),
Account VARCHAR(20),
Related_Account VARCHAR(20),
GMI_CFTC_Number VARCHAR(5),
GMI_CFTC_Number_2 VARCHAR(5),
YOMNBF VARCHAR(1),
YCFTSB VARCHAR(2),
Common_Ownership_Account VARCHAR(30))

--PRINT '**************************************************************************'
--PRINT ' Load #GMI_Customer_Master'
--PRINT ' with [dbo].[GMI_Customer_Master]'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Customer_Master
(YFIRM,
YOFFIC,
YACCT,
Account,
Related_Account,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Common_Ownership_Account)
SELECT
YFIRM,
YOFFIC,
YACCT,
Account,
Related_Account,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Common_Ownership_Account
FROM [dbo].[GMI_Customer_Master]

--SELECT @@ROWCOUNT "Records Loaded"

--SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Update #GMI_SOD_Positions_Detailed'
--PRINT ' with #GMI_Customer_Master'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

UPDATE B
SET
Account = A.Account,
Related_Account = A.Related_Account
FROM #GMI_Customer_Master A
INNER JOIN #Commission_Fees_Volume_History B
ON (A.YFIRM=B.PFIRM)
AND (A.YOFFIC=B.POFFIC)
AND (A.YACCT=B.PACCT)

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

DROP TABLE #GMI_Customer_Master

SELECT *
FROM #Commission_Fees_Volume_History
WHERE (PRR='00999')
ORDER BY --ST4F1_File_Records DESC
Processing_Date,
Account,
PFIRM,
POFFIC,
PACCT,
Related_Account,
PRECID,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
PRR

DROP TABLE #Commission_Fees_Volume_History

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

--GO