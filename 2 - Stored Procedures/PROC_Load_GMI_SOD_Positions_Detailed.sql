DROP PROCEDURE [dbo].[PROC_Load_GMI_SOD_Positions_Detailed]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_SOD_Positions_Detailed]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_SOD_Positions_Detailed] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

DECLARE
@dte_Current_Processing_Date DATE

SELECT @dte_Current_Processing_Date=Current_Processing_Date
FROM [dbo].[Current_Information]

SELECT @dte_Current_Processing_Date "@dte_Current_Processing_Date"

--**************************************************************************
-- Create #GMI_SOD_Positions_Detailed
--**************************************************************************
CREATE TABLE #GMI_SOD_Positions_Detailed
(Processing_Date DATE,
PRECID VARCHAR(1),
PFIRM VARCHAR(1),
POFFIC VARCHAR(3),
PACCT VARCHAR(5),
Account VARCHAR(20) DEFAULT '',
GMI_Sub_Account VARCHAR(10),
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
GMI_Multiplier NUMERIC(18,9),
GMI_Last_Closing_Price NUMERIC(18,9),
OTE MONEY DEFAULT 0,
Market_Value MONEY DEFAULT 0,
Option_Unrealized MONEY DEFAULT 0,
Securities_on_Deposit MONEY DEFAULT 0,
GMI_Currency_Code VARCHAR(3),
PTDATE VARCHAR(8),
Expiration_Date VARCHAR(8) DEFAULT '',
PCLASS VARCHAR(2),
PEXPDT VARCHAR(8),
PSTYPE VARCHAR(1),
PLTDAT VARCHAR(8),
PCUSP2 VARCHAR(12),
PLEAVQ NUMERIC(18),
PBUSTQ NUMERIC(18),
PBROKR VARCHAR(1),
PGIVIO VARCHAR(2),
PSPRED VARCHAR(1),
GMI_CFTC_Number VARCHAR(5) DEFAULT '',
GMI_CFTC_Number_2 VARCHAR(5) DEFAULT '',
YOMNBF VARCHAR(1) DEFAULT '',
YCFTSB VARCHAR(2) DEFAULT '',
Account_Type VARCHAR(2),
Currency_Code VARCHAR(3) DEFAULT '')

PRINT '**************************************************************************'
PRINT ' Load #GMI_SOD_Positions_Detailed'
PRINT ' with [dbo].[GMIPOSF1_File_Current]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_SOD_Positions_Detailed
(Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
GMI_Sub_Account,
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
GMI_Multiplier,
GMI_Last_Closing_Price,
GMI_Currency_Code,
PTDATE,
PCLASS,
PEXPDT,
PSTYPE,
PLTDAT,
PCUSP2,
PLEAVQ,
PBUSTQ,
PBROKR,
PGIVIO,
PSPRED,
Account_Type)
SELECT
@dte_Current_Processing_Date, --Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
PSUBAC, --GMI_Sub_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
PSDSC1, --GMI_Description,
PBS,
PQTY,
PTPRIC, --GMI_Trade_Price,
PMULTF, --GMI_Multiplier,
PCLOSE, --GMI_Last_Closing_Price,
PCURCD, --GMI_Currency_Code,
PTDATE,
PCLASS,
PEXPDT,
PSTYPE,
PLTDAT,
PCUSP2,
PLEAVQ,
PBUSTQ,
PBROKR,
PGIVIO,
PSPRED,
PATYPE --Account_Type
FROM [dbo].[GMIPOSF1_File_Current]
WHERE (PRECID='P')
AND (PTRACE NOT LIKE '%*%')

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate GMI_Security_Type'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
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
PRINT ' Generate OTE for "FUT"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
SET OTE =
	CASE PBS
		WHEN '1' THEN (GMI_Last_Closing_Price - GMI_Trade_Price) *  PQTY * GMI_Multiplier
		WHEN '2' THEN (GMI_Trade_Price - GMI_Last_Closing_Price) *  PQTY * GMI_Multiplier
		ELSE 0
	END
WHERE (GMI_Security_Type='FUT')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Market_Value and Option_Unrealized for "OOF"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
SET 
Market_Value =
	CASE PBS
		WHEN '1' THEN GMI_Last_Closing_Price *  PQTY * GMI_Multiplier
		WHEN '2' THEN -1 * GMI_Last_Closing_Price *  PQTY * GMI_Multiplier
		ELSE 0
	END,
Option_Unrealized =
	CASE PBS
		WHEN '1' THEN (GMI_Last_Closing_Price - GMI_Trade_Price) *  PQTY * GMI_Multiplier
		WHEN '2' THEN (GMI_Trade_Price - GMI_Last_Closing_Price) *  PQTY * GMI_Multiplier
		ELSE 0
	END
WHERE (GMI_Security_Type='OOF')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Market_Value and Securities_on_Deposit for "TBILL"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
SET 
Market_Value = -1 * PQTY * GMI_Multiplier * GMI_Last_Closing_Price,
Securities_on_Deposit = PQTY * GMI_Multiplier * GMI_Last_Closing_Price
	--CASE PBS
	--	WHEN '1' THEN (GMI_Last_Closing_Price - GMI_Trade_Price) *  PQTY * GMI_Multiplier
	--	WHEN '2' THEN (GMI_Trade_Price - GMI_Last_Closing_Price) *  PQTY * GMI_Multiplier
	--	ELSE 0
	--END
WHERE (GMI_Security_Type='TBILL')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Product for Futures'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
SET 
Product =
	RTRIM(PEXCH) +
	'/' +
	RTRIM(PFC) +
	'/' +
	RTRIM(PCTYM) + RTRIM(PSBCUS)--, --Expiry--,
--OTE =
--	CASE PBS
--		WHEN '1' THEN (GMI_Last_Closing_Price - GMI_Trade_Price) *  PQTY * GMI_Multiplier
--		WHEN '2' THEN (GMI_Trade_Price - GMI_Last_Closing_Price) *  PQTY * GMI_Multiplier
--		ELSE 0
--	END
WHERE (PSTYPE='F')
AND (PSUBTY='')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Product for Futures Options'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
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

UPDATE #GMI_SOD_Positions_Detailed
SET Product =
RTRIM(PSTYPE) +
'/' +
RTRIM(PEXPDT)
WHERE (PSTYPE='B')

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
INNER JOIN #GMI_SOD_Positions_Detailed B
ON (A.YFIRM=B.PFIRM)
AND (A.YOFFIC=B.POFFIC)
AND (A.YACCT=B.PACCT)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Customer_Master

PRINT '**************************************************************************'
PRINT ' Update Expiration_Date (1)'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
SET Expiration_Date =
	CASE PSTYPE
		WHEN 'B' THEN PEXPDT
		WHEN 'F' THEN
			CASE PSUBTY
				WHEN '' THEN PLTDAT
				WHEN 'C' THEN PEXPDT
				WHEN 'P' THEN PEXPDT
				ELSE '????????'
			END
		ELSE '????????'
	END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update Expiration_Date (2)'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
SET Expiration_Date = PEXPDT
WHERE (PSUBTY='') --A Future
AND (Expiration_Date='0') --PLTDAT was bogus
AND (PSBCUS<>'') --A "Prompt Date" Future

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_SOD_Positions_Detailed'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET Currency_Code=A.Currency_Code
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #GMI_SOD_Positions_Detailed B
ON (A.GMI_Account_Type=B.Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_SOD_Positions_Detailed]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_SOD_Positions_Detailed]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_SOD_Positions_Detailed]'
PRINT ' with #GMI_SOD_Positions_Detailed'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_SOD_Positions_Detailed]
(Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
GMI_Sub_Account,
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
GMI_Last_Closing_Price,
OTE,
Market_Value,
Option_Unrealized,
Securities_on_Deposit,
GMI_Currency_Code,
PTDATE,
Expiration_Date,
PCLASS,
PEXPDT,
PSTYPE,
PLTDAT,
PCUSP2,
PLEAVQ,
PBUSTQ,
PBROKR,
PGIVIO,
PSPRED,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Account_Type,
Currency_Code)
SELECT
Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
GMI_Sub_Account,
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
GMI_Last_Closing_Price,
OTE,
Market_Value,
Option_Unrealized,
Securities_on_Deposit,
GMI_Currency_Code,
PTDATE,
Expiration_Date,
PCLASS,
PEXPDT,
PSTYPE,
PLTDAT,
PCUSP2,
PLEAVQ,
PBUSTQ,
PBROKR,
PGIVIO,
PSPRED,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Account_Type,
Currency_Code
FROM #GMI_SOD_Positions_Detailed

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_SOD_Positions_Detailed

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_SOD_Positions_Detailed] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO