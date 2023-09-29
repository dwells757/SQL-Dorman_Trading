DROP PROCEDURE [dbo].[PROC_Load_GMI_Snapshot_SOD]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Snapshot_SOD]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Snapshot_SOD] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Snapshot_SOD
--******************************************************************************
CREATE TABLE #GMI_Snapshot_SOD
(Processing_Date DATE,
MRECID VARCHAR(1),
Account VARCHAR(20),
Related_Account VARCHAR(20),
Account_Type VARCHAR(2),
Currency_Code VARCHAR(3) DEFAULT '',
Account_Balance NUMERIC(15,2),
Open_Trade_Equity NUMERIC(15,2),
Total_Equity NUMERIC(15,2) DEFAULT 0,
LOV NUMERIC(15,2),
SOV NUMERIC(15,2),
NOV NUMERIC(15,2) DEFAULT 0,
Liquidating_Value NUMERIC(15,2) DEFAULT 0,
FMR NUMERIC(15,2),
FIR NUMERIC(15,2),
Margin_Excess_Deficit NUMERIC(15,2),
Securities_on_Deposit NUMERIC(15,2),
Option_Unrealized NUMERIC(15,2) DEFAULT 0) --NOTE: This value is NOT in the "GMI Money" file

PRINT '**************************************************************************'
PRINT ' Load #GMI_Snapshot_SOD'
PRINT ' with [dbo].[GMI_SOD_Money]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Snapshot_SOD
(Processing_Date,
MRECID,
Account,
Related_Account,
Account_Type,
Account_Balance,
Open_Trade_Equity,
LOV,
SOV,
FMR,
FIR,
Margin_Excess_Deficit,
Securities_on_Deposit)
SELECT
Processing_Date,
MRECID,
Account,
Related_Account,
Account_Type,
Account_Balance,
Open_Trade_Equity,
Long_Option_Market_Value, --LOV,
Short_Option_Market_Value, --SOV,
Futures_Maintenance_Margin_Requirement, --FMR,
Futures_Initial_Margin_Requirement, --FIR,
Margin_Excess_Deficit,
Long_Market_Value_of_Securities_on_Deposit --Securities_on_Deposit
FROM [dbo].[GMI_SOD_Money]
WHERE (MRECID='M')
AND (Account<>'')
AND (Account NOT LIKE '%$%')

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update Total_Equity'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_SOD
SET Total_Equity = Account_Balance + Open_Trade_Equity

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update NOV'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_SOD
SET NOV = LOV + SOV

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update Liquidating_Value'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_SOD
SET Liquidating_Value = Total_Equity + NOV

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--************************************************************************************************************************************************************************************************************
-- START - Update Option_Unrealized
--************************************************************************************************************************************************************************************************************

--******************************************************************************
-- Create #GMI_SOD_Positions_Detailed
--******************************************************************************
CREATE TABLE #GMI_SOD_Positions_Detailed
(Processing_Date DATE,
Account VARCHAR(20),
Account_Type VARCHAR(2),
Option_Unrealized NUMERIC(15,2)) --NOTE: This value is NOT in the "GMI Money" file

PRINT '**************************************************************************'
PRINT ' Load #GMI_SOD_Positions_Detailed'
PRINT ' with [dbo].[GMI_SOD_Positions_Detailed]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_SOD_Positions_Detailed
(Processing_Date,
Account,
Account_Type,
Option_Unrealized)
SELECT
Processing_Date,
Account,
Account_Type,
SUM(Option_Unrealized) --Option_Unrealized
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (Option_Unrealized<>0)
GROUP BY
Processing_Date,
Account,
Account_Type

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Snapshot_SOD'
PRINT ' with #GMI_SOD_Positions_Detailed'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET Option_Unrealized = A.Option_Unrealized
FROM #GMI_SOD_Positions_Detailed A
INNER JOIN #GMI_Snapshot_SOD B
ON (A.Processing_Date=B.Processing_Date)
AND (A.Account=B.Account)
AND (A.Account_Type=B.Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_SOD_Positions_Detailed

--************************************************************************************************************************************************************************************************************
-- END - Update Option_Unrealized
--************************************************************************************************************************************************************************************************************

PRINT '**************************************************************************'
PRINT ' Update #GMI_Snapshot_SOD'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET Currency_Code=A.Currency_Code
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #GMI_Snapshot_SOD B
ON (A.GMI_Account_Type=B.Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Snapshot_SOD]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Snapshot_SOD]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_Snapshot_SOD]'
PRINT ' with #GMI_Snapshot_SOD'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Snapshot_SOD]
(Account,
Account_Type,
Related_Account,
Currency_Code,
Account_Balance,
Open_Trade_Equity,
Total_Equity,
LOV,
SOV,
NOV,
Liquidating_Value,
FMR,
FIR,
Margin_Excess_Deficit,
Securities_on_Deposit,
Option_Unrealized)
SELECT
Account,
Account_Type,
Related_Account,
Currency_Code,
Account_Balance,
Open_Trade_Equity,
Total_Equity,
LOV,
SOV,
NOV,
Liquidating_Value,
FMR,
FIR,
Margin_Excess_Deficit,
Securities_on_Deposit,
Option_Unrealized
FROM #GMI_Snapshot_SOD

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Snapshot_SOD

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Snapshot_SOD] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO