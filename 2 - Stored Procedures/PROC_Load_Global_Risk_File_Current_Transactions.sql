DROP PROCEDURE [dbo].[PROC_Load_Global_Risk_File_Current_Transactions]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Global_Risk_File_Current_Transactions]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Global_Risk_File_Current_Transactions] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************************
-- Create #Global_Risk_File_Current_Transactions
--**************************************************************************
CREATE TABLE #Global_Risk_File_Current_Transactions
(Processing_Date DATE DEFAULT GETDATE(),
PRECID VARCHAR(1),
PFIRM VARCHAR(1),
POFFIC VARCHAR(3),
PACCT VARCHAR(5),
Account VARCHAR(20) DEFAULT '',
--GMI_Sub_Account VARCHAR(10),
Related_Account VARCHAR(20) DEFAULT '',
Common_Ownership_Account VARCHAR(30) DEFAULT '',
PEXCH VARCHAR(2),
PFC VARCHAR(2),
PCTYM VARCHAR(6),
PSBCUS VARCHAR(2),
PSTRIK NUMERIC(18,9),
PSUBTY VARCHAR(1),
GMI_Security_Type VARCHAR(10) DEFAULT 'UNDEFINED',
Product VARCHAR(50) DEFAULT '',
GMI_Description VARCHAR(30),
PBS VARCHAR(1),
PQTY NUMERIC(18),
GMI_Trade_Price NUMERIC(18,9),
GMI_Multiplier NUMERIC(18,9) DEFAULT 1,
--GMI_Last_Closing_Price NUMERIC(18,9) DEFAULT 0,
--OTE MONEY DEFAULT 0,
GMI_Currency_Code VARCHAR(3) DEFAULT '',
--PTDATE VARCHAR(8),
--Expiration_Date VARCHAR(8) DEFAULT '',
IN_GMI_Contracts_SOD VARCHAR(1) DEFAULT 'N',
PCLASS VARCHAR(2),
PEXPDT VARCHAR(8),
PSTYPE VARCHAR(1),
--PLTDAT VARCHAR(8),
PCUSP2 VARCHAR(12),
PLEAVQ NUMERIC(18),
PBUSTQ NUMERIC(18),
--PBROKR VARCHAR(1),
--PGIVIO VARCHAR(2),
--PSPRED VARCHAR(1),
GMI_CFTC_Number VARCHAR(5) DEFAULT '',
GMI_CFTC_Number_2 VARCHAR(5) DEFAULT '',
YOMNBF VARCHAR(1) DEFAULT '',
YCFTSB VARCHAR(2) DEFAULT '',
PRECNO NUMERIC(7),
PATYPE VARCHAR(2),
PROUT3 VARCHAR(1),
PPCNTY VARCHAR(2),
PCARD VARCHAR(4),
PSYMBL VARCHAR(6),
PSUBTY_UFC_UNSYMB VARCHAR(6),
PSTAT5 VARCHAR(8),
PPTYPE VARCHAR(1),
PCABCD VARCHAR(1),
PCMNT2 VARCHAR(2),
PSTAT7 VARCHAR(8),
PDELET VARCHAR(1),
PDEST VARCHAR(1),
PCLOSE NUMERIC(15,2),
PSDATE VARCHAR(8),
PNET NUMERIC(15,2),
Currency_Code VARCHAR(3) DEFAULT '')

PRINT '**************************************************************************'
PRINT ' Load #Global_Risk_File_Current_Transactions'
PRINT ' with [dbo].[Global_Risk_File_Raw]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Global_Risk_File_Current_Transactions
(PRECID,
PFIRM,
POFFIC,
PACCT,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
PCLASS,
PEXPDT,
PSTYPE,
PCUSP2,
PLEAVQ,
PBUSTQ,
PRECNO, --
PATYPE,
PROUT3,
PPCNTY,
PCARD,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PSTAT5,
PPTYPE,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET)
SELECT --TOP 10
PRECID, --[varchar](1) NOT NULL,
PFIRM, --[varchar](1) NOT NULL,
POFFIC, --[varchar](3) NOT NULL,
PACCT, --[varchar](5) NOT NULL,
PEXCH, --[varchar](2) NOT NULL,
PFC, --[varchar](2) NOT NULL,
PCTYM, --[varchar](6) NOT NULL,
PSBCUS, --[varchar](2) NOT NULL,
CONVERT(NUMERIC(15,8),PSTRIK), --PSTRIK, --[numeric](15,8) NOT NULL,
PSUBTY, --[varchar](1) NOT NULL,
PSDSC1, --GMI_Description, [varchar](30) NOT NULL, 
PBS, --[varchar](1) NOT NULL,
CONVERT(NUMERIC(18),PQTY), --PQTY, --[numeric](15,4) NOT NULL,
CONVERT(NUMERIC(15,8),PTPRIC), --GMI_Trade_Price, --[numeric](15,8) NOT NULL,
PCLASS, --[varchar](1) NOT NULL,
PEXPDT, --[varchar](8) NOT NULL,
PSTYPE, --[varchar](1) NOT NULL,
PCUSP2, --[varchar](12) NOT NULL,
CONVERT(NUMERIC(18),PLEAVQ), --PLEAVQ, --[numeric](15,4) NOT NULL,
CONVERT(NUMERIC(18),PBUSTQ), --PBUSTQ, --[numeric](15,4) NOT NULL,
CONVERT(NUMERIC(7),PRECNO), --PRECNO, --[numeric](7) NOT NULL,
PATYPE, --[varchar](2) NOT NULL,
PROUT3, --[varchar](1) NOT NULL,
PPCNTY, --[varchar](2) NOT NULL,
PCARD, --[varchar](4) NOT NULL,
PSYMBL, --[varchar](6) NOT NULL,
PSUBTY_UFC_UNSYMB, --[varchar](6) NOT NULL,
PSTAT5, --[varchar](8) NOT NULL,
PPTYPE, --[varchar](1) NOT NULL,
PCABCD, --[varchar](1) NOT NULL,
PCMNT2, --[varchar](2) NOT NULL,
PSTAT7, --[varchar](8) NOT NULL,
PDELET, --[varchar](1) NOT NULL,
PDEST, --[varchar](1) NOT NULL,
CONVERT(NUMERIC(15,8),PCLOSE), --0, --PCLOSE, --[numeric](15,8) NOT NULL,
--CONVERT(NUMERIC(9),PSDATE), --0, --PSDATE, --[numeric](9) NOT NULL,
PSDATE, --[varchar](8) NOT NULL,
CONVERT(NUMERIC(15,2),PNET) --0 --PNET --[numeric](15,2) NOT NULL
FROM [dbo].[Global_Risk_File_Raw]
WHERE (PRECID='T') --"T" = Transaction

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate GMI_Security_Type'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Global_Risk_File_Current_Transactions
SET GMI_Security_Type =
	CASE PSTYPE
		WHEN 'B' THEN 'TBILL'
		WHEN 'F' THEN
			CASE PSUBTY
				WHEN '' THEN 'FUT'
				WHEN 'C' THEN 'OOF'
				WHEN 'P' THEN 'OOF'
				ELSE GMI_Security_Type --Leave as-is
			END
		ELSE GMI_Security_Type --Leave as-is
	END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #Global_Risk_File_Current_Transactions'
PRINT ' with [dbo].[GMI_Contracts_SOD]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
GMI_Multiplier=A.GMI_Multiplier,
--GMI_Last_Closing_Price=A.GMI_Last_Closing_Price,
GMI_Currency_Code=A.GMI_Currency_Code,
--Expiration_Date=A.Expiration_Date,
IN_GMI_Contracts_SOD='Y'
FROM [dbo].[GMI_Contracts_SOD] A
INNER JOIN #Global_Risk_File_Current_Transactions B
ON (A.GMI_Exchange=B.PEXCH)
AND (A.GMI_Symbol=B.PFC)
AND (A.GMI_Security_Type=B.GMI_Security_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Product for Futures'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Global_Risk_File_Current_Transactions
SET Product =
RTRIM(PEXCH) +
'/' +
RTRIM(PFC) +
'/' +
RTRIM(PCTYM) + RTRIM(PSBCUS) --Expiry
WHERE (PSTYPE='F')
AND (PSUBTY='')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Product for Futures Options'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Global_Risk_File_Current_Transactions
SET Product =
RTRIM(PEXCH) +
'/' +
RTRIM(PFC) +
'/' +
RTRIM(PCTYM) + RTRIM(PSBCUS) + --Expiry
'/' +
FORMAT(PSTRIK,'0.#########') +
'/' +
PSUBTY
WHERE (PSTYPE='F')
AND (PSUBTY<>'')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Product for PSTYPE = "B"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #Global_Risk_File_Current_Transactions
SET Product =
RTRIM(PSTYPE) +
'/' +
RTRIM(PEXPDT)
WHERE (PSTYPE='B')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Generate OTE for Futures'
--PRINT ' WHERE (IN_GMI_SOD_Positions_Detailed_YN="Y")'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

--UPDATE #Global_Risk_File_Current_Transactions
--SET OTE =
--	CASE PBS
--		WHEN '1' THEN (GMI_Last_Closing_Price - GMI_Trade_Price) *  PQTY * GMI_Multiplier
--		WHEN '2' THEN (GMI_Trade_Price - GMI_Last_Closing_Price) *  PQTY * GMI_Multiplier
--		ELSE 0
--	END
--WHERE (PSTYPE='F')
--AND (PSUBTY='')
--AND (IN_GMI_SOD_Positions_Detailed_YN='Y')

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
PRINT ' Update #Global_Risk_File_Current_Transactions'
PRINT ' with #GMI_Customer_Master'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
Account = A.Account,
Related_Account = A.Related_Account,
GMI_CFTC_Number = A.GMI_CFTC_Number,
GMI_CFTC_Number_2 = A.GMI_CFTC_Number_2,
YOMNBF = A.YOMNBF,
YCFTSB = A.YCFTSB--,
--Common_Ownership_Account =
--	CASE A.YOMNBF
--		WHEN 'O' THEN
--			CASE B.GMI_Sub_Account
--				WHEN '' THEN RTRIM(A.Common_Ownership_Account) + '-' + RTRIM(B.PBS) --Omnibus Accounts (YOMNBF = "O") (without a Sub-Account)
--				ELSE RTRIM(A.Common_Ownership_Account) + '-' + RTRIM(B.GMI_Sub_Account) --We do NOT need PBS with Sub-Accounts
--			END
--		ELSE
--			CASE B.GMI_Sub_Account
--				WHEN '' THEN RTRIM(A.Common_Ownership_Account) + '-' + RTRIM(B.PBS) --Omnibus Accounts (YOMNBF = "O") (without a Sub-Account)
--				ELSE RTRIM(A.Common_Ownership_Account) + '-' + RTRIM(B.GMI_Sub_Account) --We do NOT need PBS with Sub-Accounts
--			END
--		END
FROM #GMI_Customer_Master A
INNER JOIN #Global_Risk_File_Current_Transactions B
ON (A.YFIRM=B.PFIRM)
AND (A.YOFFIC=B.POFFIC)
AND (A.YACCT=B.PACCT)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Customer_Master

--SELECT COUNT(*) "Records"
--FROM #Global_Risk_File_Current_Transactions

PRINT '**************************************************************************'
PRINT ' Update #Global_Risk_File_Current_Transactions'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET Currency_Code=A.Currency_Code
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #Global_Risk_File_Current_Transactions B
ON (A.GMI_Account_Type=B.PATYPE)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Transactions]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Transactions]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Global_Risk_File_Current_Transactions]'
PRINT ' with #Global_Risk_File_Current_Transactions'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Global_Risk_File_Current_Transactions]
(Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Currency_Code,
--Expiration_Date,
IN_GMI_Contracts_SOD,
PCLASS,
PEXPDT,
PSTYPE,
PCUSP2,
PLEAVQ,
PBUSTQ,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
PRECNO,
PATYPE,
PROUT3,
PPCNTY,
PCARD,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PSTAT5,
PPTYPE,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET,
Currency_Code)
SELECT
Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Currency_Code,
--Expiration_Date,
IN_GMI_Contracts_SOD,
PCLASS,
PEXPDT,
PSTYPE,
PCUSP2,
PLEAVQ,
PBUSTQ,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
PRECNO,
PATYPE,
PROUT3,
PPCNTY,
PCARD,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PSTAT5,
PPTYPE,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET,
Currency_Code
FROM #Global_Risk_File_Current_Transactions

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Global_Risk_File_Current_Transactions

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Global_Risk_File_Current_Transactions] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO