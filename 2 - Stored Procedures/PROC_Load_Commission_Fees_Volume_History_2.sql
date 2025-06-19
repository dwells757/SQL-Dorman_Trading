USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History_2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History_2]
																@Processing_Date DATE=NULL

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History_2] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--***1***
IF (@Processing_Date IS NULL) BEGIN

	SELECT @Processing_Date=Current_Processing_Date
	FROM [dbo].[Current_Information]
--***1***
END

SELECT @Processing_Date "@dte_Current_Processing_Date"

--***************************************************************************************************************************************************************************************************************************************
-- START - Load #Commission_Fees_Volume_History_1
--***************************************************************************************************************************************************************************************************************************************

--************************************************************************************
-- Create #Commission_Fees_Volume_History_1
--************************************************************************************
CREATE TABLE #Commission_Fees_Volume_History_1
(Processing_Date DATE,
USE_THIS_RECORD_YN VARCHAR(1) DEFAULT 'Y',
Exclusion_Reason VARCHAR(255) DEFAULT '',
PFIRM VARCHAR(1),
POFFIC VARCHAR(3),
PACCT VARCHAR(5),
PRR VARCHAR(5),
PEXCH VARCHAR(2),
PFC VARCHAR(2),
Expiry VARCHAR(8),
PSTRIK NUMERIC(15,8),
PSUBTY VARCHAR(1),
PSDSC1 VARCHAR(50),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
PRECID VARCHAR(1),
PCLASS VARCHAR(1),
PSUBCL VARCHAR(1),
PATYPE VARCHAR(2),
PCURAT VARCHAR(3),
PLOC VARCHAR(1), --will be "dropped" when loading #Commission_Fees_Volume_History_2 below
PCARD VARCHAR(4), --will be "dropped" when loading #Commission_Fees_Volume_History_2 below
PCOMM NUMERIC(15,2),
PATCOM VARCHAR(2),
PFEE1 NUMERIC(15,2),
PATFE1 VARCHAR(2),
PFEE2 NUMERIC(15,2),
PATFE2 VARCHAR(2),
PFEE3 NUMERIC(15,2),
PATFE3 VARCHAR(2),
PFEE4 NUMERIC(15,2),
PATFE4 VARCHAR(2),
PFEE5 NUMERIC(15,2),
PATFE5 VARCHAR(2),
PFEE6 NUMERIC(15,2),
PATFE6 VARCHAR(2),
PFEE7 NUMERIC(15,2),
PATFE7 VARCHAR(2),
PFEE8 NUMERIC(15,2),
PATFE8 VARCHAR(2),
PFEE9 NUMERIC(15,2),
PATFE9 VARCHAR(2),
PGICHG NUMERIC(15,2),
PATGIV VARCHAR(2),
PBKCHG NUMERIC(15,2),
PATBKG VARCHAR(2),
POTHER NUMERIC(15,2),
PATOTH VARCHAR(2),
PMBKOF NUMERIC(15,2),
PATBKO VARCHAR(2),
PMFLOR NUMERIC(15,2),
PATFLR VARCHAR(2),
PMORDR NUMERIC(15,2),
PATORD VARCHAR(2),
PMWIRE NUMERIC(15,2),
PATWIR VARCHAR(2),
PMOTHR NUMERIC(15,2),
PATALO VARCHAR(2),
Transactions INT,
Quantity NUMERIC(18))

PRINT '**************************************************************************'
PRINT ' Load #Commission_Fees_Volume_History_1'
PRINT ' with [dbo].[ST4F1_File_History]'
PRINT ' WHERE (Processing_Date="' + CONVERT(VARCHAR,@Processing_Date,101) + '")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Commission_Fees_Volume_History_1
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
PLOC,
PCARD,
PCOMM,
PATCOM,
PFEE1,
PATFE1,
PFEE2,
PATFE2,
PFEE3,
PATFE3,
PFEE4,
PATFE4,
PFEE5,
PATFE5,
PFEE6,
PATFE6,
PFEE7,
PATFE7,
PFEE8,
PATFE8,
PFEE9,
PATFE9,
PGICHG,
PATGIV,
PBKCHG,
PATBKG,
POTHER,
PATOTH,
PMBKOF,
PATBKO,
PMFLOR,
PATFLR,
PMORDR,
PATORD,
PMWIRE,
PATWIR,
PMOTHR,
PATALO,
Transactions,
Quantity)
SELECT
Processing_Date,
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
PLOC,
PCARD,
SUM(PCOMM) "PCOMM",
PATCOM,
SUM(PFEE1) "PFEE1",
PATFE1,
SUM(PFEE2) "PFEE2",
PATFE2,
SUM(PFEE3) "PFEE3",
PATFE3,
SUM(PFEE4) "PFEE4",
PATFE4,
SUM(PFEE5) "PFEE5",
PATFE5,
SUM(PFEE6) "PFEE6",
PATFE6,
SUM(PFEE7) "PFEE7",
PATFE7,
SUM(PFEE8) "PFEE8",
PATFE8,
SUM(PFEE9) "PFEE9",
PATFE9,
SUM(PGICHG) "PGICHG",
PATGIV,
SUM(PBKCHG) "PBKCHG",
PATBKG,
SUM(POTHER) "POTHER",
PATOTH,
SUM(PMBKOF) "PMBKOF",
PATBKO,
SUM(PMFLOR) "PMFLOR",
PATFLR,
SUM(PMORDR) "PMORDR",
PATORD,
SUM(PMWIRE) "PMWIRE",
PATWIR,
SUM(PMOTHR) "PMOTHR",
PATALO,
COUNT(*) "Transactions",
SUM(PQTY) "Quantity"
FROM [dbo].[ST4F1_File_History]
WHERE (Processing_Date=@Processing_Date)
GROUP BY
Processing_Date,
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
PCURAT,
PLOC,
PCARD,
PATCOM,
PATFE1,
PATFE2,
PATFE3,
PATFE4,
PATFE5,
PATFE6,
PATFE7,
PATFE8,
PATFE9,
PATGIV,
PATBKG,
PATOTH,
PATBKO,
PATFLR,
PATORD,
PATWIR,
PATALO

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (a)'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_1
SET USE_THIS_RECORD_YN='N'
WHERE (PCLASS NOT IN('C','H')) --"Customer" or "House" Records ONLY

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (b)'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_1
SET USE_THIS_RECORD_YN='N'
WHERE (PRECID IN(
'C', --C = Cash Journal
'P', --P = P&S Trades
'Q', --Q = P&S Reversal
'R')) --R = Receipts/Delivery

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (c)'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_1
SET USE_THIS_RECORD_YN='N'
WHERE (PRECID='A')
AND (PCOMM=0)
AND (PFEE1=0)
AND (PFEE2=0)
AND (PFEE3=0)
AND (PFEE4=0)
AND (PFEE5=0)
AND (PFEE6=0)
AND (PFEE7=0)
AND (PFEE8=0)
AND (PFEE9=0)
AND (PGICHG=0)
AND (PBKCHG=0)
AND (POTHER=0)
AND (PMBKOF=0)
AND (PMFLOR=0)
AND (PMORDR=0)
AND (PMWIRE=0)
AND (PMOTHR=0)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (d) - "Warehouse Receipts"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_1
SET 
USE_THIS_RECORD_YN='N',
Exclusion_Reason = 'Warehouse Receipt'
WHERE (PRECID='B')
AND (PLOC='X')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (e) - "FUNG Records"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_1
SET 
USE_THIS_RECORD_YN='N',
Exclusion_Reason = 'FUNG Record'
WHERE (PRECID='T')
AND (PCARD='FUNG')
AND (PCOMM=0)
AND (PFEE1=0)
AND (PFEE2=0)
AND (PFEE3=0)
AND (PFEE4=0)
AND (PFEE5=0)
AND (PFEE6=0)
AND (PFEE7=0)
AND (PFEE8=0)
AND (PFEE9=0)
AND (PGICHG=0)
AND (PBKCHG=0)
AND (POTHER=0)
AND (PMBKOF=0)
AND (PMFLOR=0)
AND (PMORDR=0)
AND (PMWIRE=0)
AND (PMOTHR=0)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update USE_THIS_RECORD_YN (f) - "Transfers from another Firm"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_1
SET 
USE_THIS_RECORD_YN='N',
Exclusion_Reason = 'Transfers from another Firm'
WHERE (PRECID='T')
AND (PCARD='0998')
AND (PCOMM=0)
AND (PFEE1=0)
AND (PFEE2=0)
AND (PFEE3=0)
AND (PFEE4=0)
AND (PFEE5=0)
AND (PFEE6=0)
AND (PFEE7=0)
AND (PFEE8=0)
AND (PFEE9=0)
AND (PGICHG=0)
AND (PBKCHG=0)
AND (POTHER=0)
AND (PMBKOF=0)
AND (PMFLOR=0)
AND (PMORDR=0)
AND (PMWIRE=0)
AND (PMOTHR=0)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--***************************************************************************************************************************************************************************************************************************************
-- END - Load #Commission_Fees_Volume_History_1
--***************************************************************************************************************************************************************************************************************************************

--***************************************************************************************************************************************************************************************************************************************
-- START - Load [dbo].[Commission_Fees_Volume_History_2_Excluded_Records]
--***************************************************************************************************************************************************************************************************************************************

PRINT '**************************************************************************'
PRINT ' Delete from [dbo].[Commission_Fees_Volume_History_2_Excluded_Records]'
PRINT ' WHERE (Processing_Date="' + CONVERT(VARCHAR,@Processing_Date,101) + '"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

DELETE FROM [dbo].[Commission_Fees_Volume_History_2_Excluded_Records]
WHERE (Processing_Date=@Processing_Date)

SELECT @@ROWCOUNT "Records Deleted"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Commission_Fees_Volume_History_2_Excluded_Records]'
PRINT ' with #Commission_Fees_Volume_History_2'
PRINT ' WHERE (USE_THIS_RECORD_YN="N")'
PRINT ' AND (Exclusion_Reason<>"")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Commission_Fees_Volume_History_2_Excluded_Records]
(Processing_Date,
USE_THIS_RECORD_YN,
Exclusion_Reason,
--Account,
PFIRM,
POFFIC,
PACCT,
--Related_Account,
PRR,
PEXCH,
PFC,
Expiry,
PSTRIK,
PSUBTY,
PSDSC1,
PSTYPE,
PTYPE,
--Security_Type,
PRECID,
PCLASS,
PSUBCL,
PATYPE,
PCURAT,
PLOC,
PCARD,
PCOMM,
PATCOM,
--PATCOM_Currency_Code,
PFEE1,
PATFE1,
--PATFE1_Currency_Code,
PFEE2,
PATFE2,
--PATFE2_Currency_Code,
PFEE3,
PATFE3,
--PATFE3_Currency_Code,
PFEE4,
PATFE4,
--PATFE4_Currency_Code,
PFEE5,
PATFE5,
--PATFE5_Currency_Code,
PFEE6,
PATFE6,
--PATFE6_Currency_Code,
PFEE7,
PATFE7,
--PATFE7_Currency_Code,
PFEE8,
PATFE8,
--PATFE8_Currency_Code,
PFEE9,
PATFE9,
--PATFE9_Currency_Code,
PGICHG,
PATGIV,
--PATGIV_Currency_Code,
PBKCHG,
PATBKG,
--PATBKG_Currency_Code,
POTHER,
PATOTH,
--PATOTH_Currency_Code,
PMBKOF,
PATBKO,
--PATBKO_Currency_Code,
PMFLOR,
PATFLR,
--PATFLR_Currency_Code,
PMORDR,
PATORD,
--PATORD_Currency_Code,
PMWIRE,
PATWIR,
--PATWIR_Currency_Code,
PMOTHR,
PATALO,
--PATALO_Currency_Code,
Transactions,
Quantity)
--Commission_Quantity,
--USD_Commission_Amount,
--USD_Total_Fees,
--EUR_Total_Fees,
--USD_Transaction_Fees,
--EUR_Transaction_Fees,
--GMI_Account_Type_Description,
SELECT
Processing_Date,
USE_THIS_RECORD_YN,
Exclusion_Reason,
--Account,
PFIRM,
POFFIC,
PACCT,
--Related_Account,
PRR,
PEXCH,
PFC,
Expiry,
PSTRIK,
PSUBTY,
PSDSC1,
PSTYPE,
PTYPE,
--Security_Type,
PRECID,
PCLASS,
PSUBCL,
PATYPE,
PCURAT,
PLOC,
PCARD,
PCOMM,
PATCOM,
--PATCOM_Currency_Code,
--PRTHT,
PFEE1,
PATFE1,
--PATFE1_Currency_Code,
PFEE2,
PATFE2,
--PATFE2_Currency_Code,
PFEE3,
PATFE3,
--PATFE3_Currency_Code,
PFEE4,
PATFE4,
--PATFE4_Currency_Code,
PFEE5,
PATFE5,
--PATFE5_Currency_Code,
PFEE6,
PATFE6,
--PATFE6_Currency_Code,
PFEE7,
PATFE7,
--PATFE7_Currency_Code,
PFEE8,
PATFE8,
--PATFE8_Currency_Code,
PFEE9,
PATFE9,
--PATFE9_Currency_Code,
PGICHG,
PATGIV,
--PATGIV_Currency_Code,
PBKCHG,
PATBKG,
--PATBKG_Currency_Code,
POTHER,
PATOTH,
--PATOTH_Currency_Code,
PMBKOF,
PATBKO,
--PATBKO_Currency_Code,
PMFLOR,
PATFLR,
--PATFLR_Currency_Code,
PMORDR,
PATORD,
--PATORD_Currency_Code,
PMWIRE,
PATWIR,
--PATWIR_Currency_Code,
PMOTHR,
PATALO,
--PATALO_Currency_Code,
Transactions,
Quantity
--Commission_Quantity,
--USD_Commission_Amount,
--USD_Total_Fees,
--EUR_Total_Fees,
--USD_Transaction_Fees,
--EUR_Transaction_Fees,
--GMI_Account_Type_Description,
FROM #Commission_Fees_Volume_History_1
WHERE (USE_THIS_RECORD_YN='N')
AND (Exclusion_Reason<>'')

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

--********************************************************************************************************************************************************************************
-- END - Load [dbo].[Commission_Fees_Volume_History_2_Excluded_Records]
--********************************************************************************************************************************************************************************

--***************************************************************************************************************************************************************************************************************************************
-- START - Load #Commission_Fees_Volume_History_2
--***************************************************************************************************************************************************************************************************************************************

--************************************************************************************
-- Create #Commission_Fees_Volume_History_2
--************************************************************************************
CREATE TABLE #Commission_Fees_Volume_History_2
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
PATCOM VARCHAR(2),
PATCOM_Currency_Code VARCHAR(3) DEFAULT '',
PFEE1 NUMERIC(15,2),
PATFE1 VARCHAR(2),
PATFE1_Currency_Code VARCHAR(3) DEFAULT '',
PFEE2 NUMERIC(15,2),
PATFE2 VARCHAR(2),
PATFE2_Currency_Code VARCHAR(3) DEFAULT '',
PFEE3 NUMERIC(15,2),
PATFE3 VARCHAR(2),
PATFE3_Currency_Code VARCHAR(3) DEFAULT '',
PFEE4 NUMERIC(15,2),
PATFE4 VARCHAR(2),
PATFE4_Currency_Code VARCHAR(3) DEFAULT '',
PFEE5 NUMERIC(15,2),
PATFE5 VARCHAR(2),
PATFE5_Currency_Code VARCHAR(3) DEFAULT '',
PFEE6 NUMERIC(15,2),
PATFE6 VARCHAR(2),
PATFE6_Currency_Code VARCHAR(3) DEFAULT '',
PFEE7 NUMERIC(15,2),
PATFE7 VARCHAR(2),
PATFE7_Currency_Code VARCHAR(3) DEFAULT '',
PFEE8 NUMERIC(15,2),
PATFE8 VARCHAR(2),
PATFE8_Currency_Code VARCHAR(3) DEFAULT '',
PFEE9 NUMERIC(15,2),
PATFE9 VARCHAR(2),
PATFE9_Currency_Code VARCHAR(3) DEFAULT '',
PGICHG NUMERIC(15,2),
PATGIV VARCHAR(2),
PATGIV_Currency_Code VARCHAR(3) DEFAULT '',
PBKCHG NUMERIC(15,2),
PATBKG VARCHAR(2),
PATBKG_Currency_Code VARCHAR(3) DEFAULT '',
POTHER NUMERIC(15,2),
PATOTH VARCHAR(2),
PATOTH_Currency_Code VARCHAR(3) DEFAULT '',
PMBKOF NUMERIC(15,2),
PATBKO VARCHAR(2),
PATBKO_Currency_Code VARCHAR(3) DEFAULT '',
PMFLOR NUMERIC(15,2),
PATFLR VARCHAR(2),
PATFLR_Currency_Code VARCHAR(3) DEFAULT '',
PMORDR NUMERIC(15,2),
PATORD VARCHAR(2),
PATORD_Currency_Code VARCHAR(3) DEFAULT '',
PMWIRE NUMERIC(15,2),
PATWIR VARCHAR(2),
PATWIR_Currency_Code VARCHAR(3) DEFAULT '',
PMOTHR NUMERIC(15,2),
PATALO VARCHAR(2),
PATALO_Currency_Code VARCHAR(3) DEFAULT '',
Transactions INT,
Quantity NUMERIC(18),
Commission_Quantity NUMERIC(18) DEFAULT 0,
USD_Commission_Amount NUMERIC(15,2) DEFAULT 0,
USD_Total_Fees NUMERIC(15,2) DEFAULT 0,
EUR_Total_Fees NUMERIC(15,2) DEFAULT 0,
USD_Transaction_Fees NUMERIC(15,2) DEFAULT 0,
EUR_Transaction_Fees NUMERIC(15,2) DEFAULT 0,
GMI_Account_Type_Description VARCHAR(255) DEFAULT 'UNDEFINED',
USE_THIS_RECORD_YN VARCHAR(1) DEFAULT 'Y',
Exclusion_Reason VARCHAR(255) DEFAULT '')

PRINT '**************************************************************************'
PRINT ' Load #Commission_Fees_Volume_History_2'
PRINT ' with #Commission_Fees_Volume_History_1'
PRINT ' WHERE (USE_THIS_RECORD_YN="Y")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Commission_Fees_Volume_History_2
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
PATCOM,
PFEE1,
PATFE1,
PFEE2,
PATFE2,
PFEE3,
PATFE3,
PFEE4,
PATFE4,
PFEE5,
PATFE5,
PFEE6,
PATFE6,
PFEE7,
PATFE7,
PFEE8,
PATFE8,
PFEE9,
PATFE9,
PGICHG,
PATGIV,
PBKCHG,
PATBKG,
POTHER,
PATOTH,
PMBKOF,
PATBKO,
PMFLOR,
PATFLR,
PMORDR,
PATORD,
PMWIRE,
PATWIR,
PMOTHR,
PATALO,
Transactions,
Quantity)
SELECT
Processing_Date,
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
SUM(PCOMM), --PCOMM,
PATCOM,
SUM(PFEE1), --PFEE1,
PATFE1,
SUM(PFEE2), --PFEE2,
PATFE2,
SUM(PFEE3), --PFEE3,
PATFE3,
SUM(PFEE4), --PFEE4,
PATFE4,
SUM(PFEE5), --PFEE5,
PATFE5,
SUM(PFEE6), --PFEE6,
PATFE6,
SUM(PFEE7), --PFEE7,
PATFE7,
SUM(PFEE8), --PFEE8,
PATFE8,
SUM(PFEE9), --PFEE9,
PATFE9,
SUM(PGICHG), --PGICHG,
PATGIV,
SUM(PBKCHG), --PBKCHG,
PATBKG,
SUM(POTHER), --POTHER,
PATOTH,
SUM(PMBKOF), --PMBKOF,
PATBKO,
SUM(PMFLOR), --PMFLOR,
PATFLR,
SUM(PMORDR), --PMORDR,
PATORD,
SUM(PMWIRE), --PMWIRE,
PATWIR,
SUM(PMOTHR), --PMOTHR,
PATALO,
SUM(Transactions), --Transactions
SUM(Quantity) --Quantity
FROM #Commission_Fees_Volume_History_1
WHERE (USE_THIS_RECORD_YN='Y')
GROUP BY
Processing_Date,
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
PATCOM,
PATFE1,
PATFE2,
PATFE3,
PATFE4,
PATFE5,
PATFE6,
PATFE7,
PATFE8,
PATFE9,
PATGIV,
PATBKG,
PATOTH,
PATBKO,
PATFLR,
PATORD,
PATWIR,
PATALO

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Commission_Fees_Volume_History_1

PRINT '**************************************************************************'
PRINT ' Generate Security_Type'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
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
INNER JOIN #Commission_Fees_Volume_History_2 B
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
INNER JOIN #Commission_Fees_Volume_History_2 B
ON (A.GMI_Account_Type=B.PATYPE)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATCOM_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATCOM_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATCOM=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE1_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE1_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE1=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE2_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE2_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE2=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE3_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE3_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE3=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE4_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE4_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE4=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE5_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE5_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE5=B.GMI_Account_Type)

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Update PATFE6_Currency_Code'
--PRINT ' with [dbo].[GMI_Account_Types]'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE6_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE6=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE7_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE7_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE7=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE8_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE8_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE8=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFE9_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFE9_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFE9=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATGIV_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATGIV_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATGIV=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATBKG_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATBKG_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATBKG=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATOTH_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATOTH_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATOTH=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATBKO_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATBKO_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATBKO=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATFLR_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATFLR_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATFLR=B.GMI_Account_Type)

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Update PATORD_Currency_Code'
--PRINT ' with [dbo].[GMI_Account_Types]'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

UPDATE A
SET PATORD_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATORD=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATWIR_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATWIR_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATWIR=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update PATALO_Currency_Code'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET PATALO_Currency_Code = B.Currency_Code
FROM #Commission_Fees_Volume_History_2 A
INNER JOIN [dbo].[GMI_Account_Types] B
ON (A.PATALO=B.GMI_Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Commission_Quantity'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
SET Commission_Quantity = Quantity
WHERE (PCOMM<>0)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate USD_Commission_Amount'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
SET USD_Commission_Amount = PCOMM
WHERE (PATCOM_Currency_Code='USD')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate USD_Total_Fees'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
SET USD_Total_Fees = 
CASE WHEN PATFE1_Currency_Code='USD' THEN PFEE1 ELSE 0 END +
CASE WHEN PATFE2_Currency_Code='USD' THEN PFEE2 ELSE 0 END +
CASE WHEN PATFE3_Currency_Code='USD' THEN PFEE3 ELSE 0 END +
CASE WHEN PATFE4_Currency_Code='USD' THEN PFEE4 ELSE 0 END +
CASE WHEN PATFE5_Currency_Code='USD' THEN PFEE5 ELSE 0 END +
CASE WHEN PATFE6_Currency_Code='USD' THEN PFEE6 ELSE 0 END +
CASE WHEN PATFE7_Currency_Code='USD' THEN PFEE7 ELSE 0 END +
CASE WHEN PATFE8_Currency_Code='USD' THEN PFEE8 ELSE 0 END +
CASE WHEN PATFE9_Currency_Code='USD' THEN PFEE9 ELSE 0 END +
CASE WHEN PATGIV_Currency_Code='USD' THEN PGICHG ELSE 0 END +
CASE WHEN PATBKG_Currency_Code='USD' THEN PBKCHG ELSE 0 END +
CASE WHEN PATOTH_Currency_Code='USD' THEN POTHER ELSE 0 END +
CASE WHEN PATBKO_Currency_Code='USD' THEN PMBKOF ELSE 0 END +
CASE WHEN PATFLR_Currency_Code='USD' THEN PMFLOR ELSE 0 END +
CASE WHEN PATORD_Currency_Code='USD' THEN PMORDR ELSE 0 END +
CASE WHEN PATWIR_Currency_Code='USD' THEN PMWIRE ELSE 0 END +
CASE WHEN PATALO_Currency_Code='USD' THEN PMOTHR ELSE 0 END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate EUR_Total_Fees'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
SET EUR_Total_Fees = 
CASE WHEN PATFE1_Currency_Code='EUR' THEN PFEE1 ELSE 0 END +
CASE WHEN PATFE2_Currency_Code='EUR' THEN PFEE2 ELSE 0 END +
CASE WHEN PATFE3_Currency_Code='EUR' THEN PFEE3 ELSE 0 END +
CASE WHEN PATFE4_Currency_Code='EUR' THEN PFEE4 ELSE 0 END +
CASE WHEN PATFE5_Currency_Code='EUR' THEN PFEE5 ELSE 0 END +
CASE WHEN PATFE6_Currency_Code='EUR' THEN PFEE6 ELSE 0 END +
CASE WHEN PATFE7_Currency_Code='EUR' THEN PFEE7 ELSE 0 END +
CASE WHEN PATFE8_Currency_Code='EUR' THEN PFEE8 ELSE 0 END +
CASE WHEN PATFE9_Currency_Code='EUR' THEN PFEE9 ELSE 0 END +
CASE WHEN PATGIV_Currency_Code='EUR' THEN PGICHG ELSE 0 END +
CASE WHEN PATBKG_Currency_Code='EUR' THEN PBKCHG ELSE 0 END +
CASE WHEN PATOTH_Currency_Code='EUR' THEN POTHER ELSE 0 END +
CASE WHEN PATBKO_Currency_Code='EUR' THEN PMBKOF ELSE 0 END +
CASE WHEN PATFLR_Currency_Code='EUR' THEN PMFLOR ELSE 0 END +
CASE WHEN PATORD_Currency_Code='EUR' THEN PMORDR ELSE 0 END +
CASE WHEN PATWIR_Currency_Code='EUR' THEN PMWIRE ELSE 0 END +
CASE WHEN PATALO_Currency_Code='EUR' THEN PMOTHR ELSE 0 END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate USD_Transaction_Fees'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
SET USD_Transaction_Fees = 
--CASE WHEN PATFE1_Currency_Code='USD' THEN PFEE1 ELSE 0 END + --Fee Amt 1 for Clearing Fee/Bond Interest/St Tax
--CASE WHEN PATFE2_Currency_Code='USD' THEN PFEE2 ELSE 0 END + --Fee Amt 2 for Exch Fee/Postage
--CASE WHEN PATFE3_Currency_Code='USD' THEN PFEE3 ELSE 0 END + --Fee Amt 3 for NFA or Sec Fees or Finder's Percent
CASE WHEN PATFE4_Currency_Code='USD' THEN PFEE4 ELSE 0 END +
CASE WHEN PATFE5_Currency_Code='USD' THEN PFEE5 ELSE 0 END +
CASE WHEN PATFE6_Currency_Code='USD' THEN PFEE6 ELSE 0 END +
CASE WHEN PATFE7_Currency_Code='USD' THEN PFEE7 ELSE 0 END +
CASE WHEN PATFE8_Currency_Code='USD' THEN PFEE8 ELSE 0 END +
CASE WHEN PATFE9_Currency_Code='USD' THEN PFEE9 ELSE 0 END +
CASE WHEN PATGIV_Currency_Code='USD' THEN PGICHG ELSE 0 END +
CASE WHEN PATBKG_Currency_Code='USD' THEN PBKCHG ELSE 0 END +
CASE WHEN PATOTH_Currency_Code='USD' THEN POTHER ELSE 0 END +
CASE WHEN PATBKO_Currency_Code='USD' THEN PMBKOF ELSE 0 END +
CASE WHEN PATFLR_Currency_Code='USD' THEN PMFLOR ELSE 0 END +
CASE WHEN PATORD_Currency_Code='USD' THEN PMORDR ELSE 0 END +
CASE WHEN PATWIR_Currency_Code='USD' THEN PMWIRE ELSE 0 END +
CASE WHEN PATALO_Currency_Code='USD' THEN PMOTHR ELSE 0 END

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Generate EUR_Transaction_Fees'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
SET EUR_Transaction_Fees = 
--CASE WHEN PATFE1_Currency_Code='EUR' THEN PFEE1 ELSE 0 END + --Fee Amt 1 for Clearing Fee/Bond Interest/St Tax
--CASE WHEN PATFE2_Currency_Code='EUR' THEN PFEE2 ELSE 0 END + --Fee Amt 2 for Exch Fee/Postage
--CASE WHEN PATFE3_Currency_Code='EUR' THEN PFEE3 ELSE 0 END + --Fee Amt 3 for NFA or Sec Fees or Finder's Percent
CASE WHEN PATFE4_Currency_Code='EUR' THEN PFEE4 ELSE 0 END +
CASE WHEN PATFE5_Currency_Code='EUR' THEN PFEE5 ELSE 0 END +
CASE WHEN PATFE6_Currency_Code='EUR' THEN PFEE6 ELSE 0 END +
CASE WHEN PATFE7_Currency_Code='EUR' THEN PFEE7 ELSE 0 END +
CASE WHEN PATFE8_Currency_Code='EUR' THEN PFEE8 ELSE 0 END +
CASE WHEN PATFE9_Currency_Code='EUR' THEN PFEE9 ELSE 0 END +
CASE WHEN PATGIV_Currency_Code='EUR' THEN PGICHG ELSE 0 END +
CASE WHEN PATBKG_Currency_Code='EUR' THEN PBKCHG ELSE 0 END +
CASE WHEN PATOTH_Currency_Code='EUR' THEN POTHER ELSE 0 END +
CASE WHEN PATBKO_Currency_Code='EUR' THEN PMBKOF ELSE 0 END +
CASE WHEN PATFLR_Currency_Code='EUR' THEN PMFLOR ELSE 0 END +
CASE WHEN PATORD_Currency_Code='EUR' THEN PMORDR ELSE 0 END +
CASE WHEN PATWIR_Currency_Code='EUR' THEN PMWIRE ELSE 0 END +
CASE WHEN PATALO_Currency_Code='EUR' THEN PMOTHR ELSE 0 END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--********************************************************************************************************************************************************************************
-- START - Update USE_THIS_RECORD_YN
--********************************************************************************************************************************************************************************

--********************************************************************************************************************************************************************************
-- END - Update USE_THIS_RECORD_YN
--********************************************************************************************************************************************************************************

PRINT '**************************************************************************'
PRINT ' Update PSDSC1'
PRINT ' WHERE (PRECID="B")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Commission_Fees_Volume_History_2
SET PSDSC1 = PSDSC1 + '-CXL'
WHERE (PRECID='B')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--***************************************************************************************************************************************************************************************************************************************
-- END - Load #Commission_Fees_Volume_History_2
--***************************************************************************************************************************************************************************************************************************************

--***************************************************************************************************************************************************************************************************************************************
-- START - Load [dbo].[Commission_Fees_Volume_History_2]
--***************************************************************************************************************************************************************************************************************************************

PRINT '**************************************************************************'
PRINT ' Delete from [dbo].[Commission_Fees_Volume_History_2]'
PRINT ' WHERE (Processing_Date="' + CONVERT(VARCHAR,@Processing_Date,101) + '"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

DELETE FROM [dbo].[Commission_Fees_Volume_History_2]
WHERE (Processing_Date=@Processing_Date)

SELECT @@ROWCOUNT "Records Deleted"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Commission_Fees_Volume_History_2]'
PRINT ' with #Commission_Fees_Volume_History_2'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Commission_Fees_Volume_History_2]
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
PATCOM,
PATCOM_Currency_Code,
--PRTHT,
PFEE1,
PATFE1,
PATFE1_Currency_Code,
PFEE2,
PATFE2,
PATFE2_Currency_Code,
PFEE3,
PATFE3,
PATFE3_Currency_Code,
PFEE4,
PATFE4,
PATFE4_Currency_Code,
PFEE5,
PATFE5,
PATFE5_Currency_Code,
PFEE6,
PATFE6,
PATFE6_Currency_Code,
PFEE7,
PATFE7,
PATFE7_Currency_Code,
PFEE8,
PATFE8,
PATFE8_Currency_Code,
PFEE9,
PATFE9,
PATFE9_Currency_Code,
PGICHG,
PATGIV,
PATGIV_Currency_Code,
PBKCHG,
PATBKG,
PATBKG_Currency_Code,
POTHER,
PATOTH,
PATOTH_Currency_Code,
PMBKOF,
PATBKO,
PATBKO_Currency_Code,
PMFLOR,
PATFLR,
PATFLR_Currency_Code,
PMORDR,
PATORD,
PATORD_Currency_Code,
PMWIRE,
PATWIR,
PATWIR_Currency_Code,
PMOTHR,
PATALO,
PATALO_Currency_Code,
Transactions,
Quantity,
Commission_Quantity,
USD_Commission_Amount,
USD_Total_Fees,
EUR_Total_Fees,
USD_Transaction_Fees,
EUR_Transaction_Fees,
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
PATCOM,
PATCOM_Currency_Code,
--PRTHT,
PFEE1,
PATFE1,
PATFE1_Currency_Code,
PFEE2,
PATFE2,
PATFE2_Currency_Code,
PFEE3,
PATFE3,
PATFE3_Currency_Code,
PFEE4,
PATFE4,
PATFE4_Currency_Code,
PFEE5,
PATFE5,
PATFE5_Currency_Code,
PFEE6,
PATFE6,
PATFE6_Currency_Code,
PFEE7,
PATFE7,
PATFE7_Currency_Code,
PFEE8,
PATFE8,
PATFE8_Currency_Code,
PFEE9,
PATFE9,
PATFE9_Currency_Code,
PGICHG,
PATGIV,
PATGIV_Currency_Code,
PBKCHG,
PATBKG,
PATBKG_Currency_Code,
POTHER,
PATOTH,
PATOTH_Currency_Code,
PMBKOF,
PATBKO,
PATBKO_Currency_Code,
PMFLOR,
PATFLR,
PATFLR_Currency_Code,
PMORDR,
PATORD,
PATORD_Currency_Code,
PMWIRE,
PATWIR,
PATWIR_Currency_Code,
PMOTHR,
PATALO,
PATALO_Currency_Code,
Transactions,
Quantity,
Commission_Quantity,
USD_Commission_Amount,
USD_Total_Fees,
EUR_Total_Fees,
USD_Transaction_Fees,
EUR_Transaction_Fees,
GMI_Account_Type_Description
FROM #Commission_Fees_Volume_History_2

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

--***************************************************************************************************************************************************************************************************************************************
-- END - Load [dbo].[Commission_Fees_Volume_History_2]
--***************************************************************************************************************************************************************************************************************************************

DROP TABLE #Commission_Fees_Volume_History_2

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History_2] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO


