USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History_with_GMIST4F1_File_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History_with_GMIST4F1_File_Current]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History_with_GMIST4F1_File_Current] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

DECLARE
@dte_Current_Processing_Date DATE

SELECT @dte_Current_Processing_Date=Current_Processing_Date
FROM [dbo].[Current_Information]

SELECT @dte_Current_Processing_Date "@dte_Current_Processing_Date"

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
PSTRIK NUMERIC(15,8),
PSUBTY VARCHAR(1),
PSDSC1 VARCHAR(50),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
Security_Type VARCHAR(10) DEFAULT 'UNDEFINED',
PRECID VARCHAR(1),
PCLASS VARCHAR(1),
PSUBCL VARCHAR(1),
PATYPE VARCHAR(2),
PCURAT VARCHAR(3),

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
Quantity NUMERIC(18),
Commission_Amount NUMERIC(15,2) DEFAULT 0,
Total_Fees NUMERIC(15,2) DEFAULT 0,
GMI_Account_Type_Description VARCHAR(255) DEFAULT 'UNDEFINED',
USE_THIS_RECORD_YN VARCHAR(1) DEFAULT 'Y')

PRINT '**************************************************************************'
PRINT ' Load #Commission_Fees_Volume_History'
PRINT ' with [dbo].[GMIST4F1_File_Current]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Commission_Fees_Volume_History
(Processing_Date,
PFIRM,
POFFIC,
PACCT,
PRR,
PEXCH,
PFC,
Expiry,
PSTRIK,
PSUBTY,
PSDSC1,
PSTYPE,
PTYPE,
PRECID,
PCLASS,
PSUBCL,
PATYPE,
PCURAT,

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
PSTRIK,
PSUBTY,
PSDSC1,
PSTYPE,
PTYPE,
PRECID,
PCLASS,
PSUBCL,
PATYPE,
PCURAT,
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
--Processing_Date,
PFIRM,
POFFIC,
PACCT,
PRR,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
PSDSC1,
PSTYPE,
PTYPE,
PRECID,
PCLASS,
PSUBCL,
PATYPE,
PCURAT

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Security_Type'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

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

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

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

PRINT '**************************************************************************'
PRINT ' Load #GMI_Customer_Master'
PRINT ' with [dbo].[GMI_Customer_Master]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

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

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_SOD_Positions_Detailed'
PRINT ' with #GMI_Customer_Master'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
Account = A.Account,
Related_Account = A.Related_Account
FROM #GMI_Customer_Master A
INNER JOIN #Commission_Fees_Volume_History B
ON (A.YFIRM=B.PFIRM)
AND (A.YOFFIC=B.POFFIC)
AND (A.YACCT=B.PACCT)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Customer_Master

PRINT '**************************************************************************'
PRINT ' Update GMI_Account_Type_Description'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"
UPDATE B
SET GMI_Account_Type_Description = A.GMI_Account_Type_Description
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #Commission_Fees_Volume_History B
ON (A.GMI_Account_Type=B.PATYPE)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Commission_Amount and Total_Fees'
PRINT '**************************************************************************'

UPDATE #Commission_Fees_Volume_History
SET
Commission_Amount = PCOMM,
Total_Fees = 
PFEE1 +
PFEE2 +
PFEE3 +
PFEE4 +
PFEE5 +
PFEE6 +
PFEE7 +
PFEE8 +
PFEE9 +
PGICHG +
PBKCHG +
POTHER +
PMBKOF +
PMFLOR +
PMORDR +
PMWIRE +
PMOTHR

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (a)'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History
SET USE_THIS_RECORD_YN='N'
WHERE (PRECID IN(
'C', --C = Cash Journal
'P', --P = P&S Trades
'Q', --Q = P&S Reversal
'R')) --R = Receipts/Delivery

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (b)'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History
SET USE_THIS_RECORD_YN='N'
WHERE (PRECID='A')
AND (Commission_Amount=0)
AND (Total_Fees=0)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PSDSC1'
PRINT ' WHERE (PRECID="B")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History
SET PSDSC1 = PSDSC1 + '-CXL'
WHERE (PRECID='B')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Delete from [dbo].[Commission_Fees_Volume_History]'
PRINT ' WHERE (Processing_Date="' + CONVERT(VARCHAR,@dte_Current_Processing_Date,101) + '"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

DELETE FROM [dbo].[Commission_Fees_Volume_History]
WHERE (Processing_Date=@dte_Current_Processing_Date)

SELECT @@ROWCOUNT "Records Deleted"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Commission_Fees_Volume_History]'
PRINT ' with #Commission_Fees_Volume_History'
PRINT ' WHERE (USE_THIS_RECORD_YN="Y")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Commission_Fees_Volume_History]
(Processing_Date,
Account,
PFIRM,
POFFIC,
PACCT,
Related_Account,
PRR,
PEXCH,
PFC,
Expiry,
PSTRIK,
PSUBTY,
PSDSC1,
PSTYPE,
PTYPE,
Security_Type,
PRECID,
PCLASS,
PSUBCL,
PATYPE,
PCURAT,
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
Quantity,
Commission_Amount,
Total_Fees,
GMI_Account_Type_Description)
SELECT
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
PSTRIK,
PSUBTY,
PSDSC1,
PSTYPE,
PTYPE,
Security_Type,
PRECID,
PCLASS,
PSUBCL,
PATYPE,
PCURAT,
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
Quantity,
Commission_Amount,
Total_Fees,
GMI_Account_Type_Description
FROM #Commission_Fees_Volume_History
WHERE (USE_THIS_RECORD_YN='Y')

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Commission_Fees_Volume_History

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History_with_GMIST4F1_File_Current] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO


