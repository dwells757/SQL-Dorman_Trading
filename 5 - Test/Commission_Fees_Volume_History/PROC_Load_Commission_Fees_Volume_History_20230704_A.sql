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
PRR VARCHAR(5),
PEXCH VARCHAR(2),
PFC VARCHAR(2),
Expiry VARCHAR(8),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
Security_Type VARCHAR(10) DEFAULT 'UNDEFINED',
PRECID VARCHAR(1),
PCOMM NUMERIC(15,2),
PFEE1 NUMERIC(15,2),
PFEE2 NUMERIC(15,2),
PFEE3 NUMERIC(15,2),
PFEE4 NUMERIC(15,2),
PFEE5 NUMERIC(15,2),
PFEE6 NUMERIC(15,2),
PFEE7 NUMERIC(15,2),
PFEE8 NUMERIC(15,2),
PFEE9 NUMERIC(15,2),
PGICHG NUMERIC(15,2),
PBKCHG NUMERIC(15,2),
POTHER NUMERIC(15,2),
PMBKOF NUMERIC(15,2),
PMFLOR NUMERIC(15,2),
PMORDR NUMERIC(15,2),
PMWIRE NUMERIC(15,2),
PMOTHR NUMERIC(15,2),
Transactions INT,
Quantity NUMERIC(18))
--PCLASS VARCHAR(1),
--PSUBCL VARCHAR(1),
--PRECID VARCHAR(1),
--PCOMM NUMERIC(15,2),
--PATYPE VARCHAR(2),
--PCURAT VARCHAR(3),
--ST4F1_File_Records INT)

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
PRR,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
PRECID,
PCOMM,
PFEE1,
PFEE2,
PFEE3,
PFEE4,
PFEE5,
PFEE6,
PFEE7,
PFEE8,
PFEE9,
PGICHG,
PBKCHG,
POTHER,
PMBKOF,
PMFLOR,
PMORDR,
PMWIRE,
PMOTHR,
Transactions,
Quantity)
SELECT
@dte_Current_Processing_Date, --Processing_Date,
PFIRM,
POFFIC,
PACCT,
PRR,
PEXCH,
PFC,
RTRIM(PCTYM) + RTRIM(PSBCUS), --Expiry,
PSTYPE,
PTYPE,
PRECID,
SUM(PCOMM) "PCOMM",
SUM(PFEE1) "PFEE1",
SUM(PFEE2) "PFEE2",
SUM(PFEE3) "PFEE3",
SUM(PFEE4) "PFEE4",
SUM(PFEE5) "PFEE5",
SUM(PFEE6) "PFEE6",
SUM(PFEE7) "PFEE7",
SUM(PFEE8) "PFEE8",
SUM(PFEE9) "PFEE9",
SUM(PGICHG) "PGICHG",
SUM(PBKCHG) "PBKCHG",
SUM(POTHER) "POTHER",
--SUM(PGROSS) "PGROSS",
--SUM(PNET) "PNET",
SUM(PMBKOF) "PMBKOF",
SUM(PMFLOR) "PMFLOR",
SUM(PMORDR) "PMORDR",
SUM(PMWIRE) "PMWIRE",
SUM(PMOTHR) "PMOTHR",
COUNT(*) "Transactions",
SUM(PQTY) "Quantity"
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
GROUP BY
PFIRM,
POFFIC,
PACCT,
PRR,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTYPE,
PTYPE,
PRECID

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
PRR,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
PRECID

DROP TABLE #Commission_Fees_Volume_History

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

--GO