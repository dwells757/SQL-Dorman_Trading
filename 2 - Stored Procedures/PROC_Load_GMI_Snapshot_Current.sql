DROP PROCEDURE [dbo].[PROC_Load_GMI_Snapshot_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Snapshot_Current]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Snapshot_Current] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Snapshot_Current
--******************************************************************************
CREATE TABLE #GMI_Snapshot_Current
(Account VARCHAR(20),
Account_Type VARCHAR(2),
Related_Account VARCHAR(20),
Currency_Code VARCHAR(3),
Balance_SOD MONEY DEFAULT 0,
Balance_Top_Day MONEY DEFAULT 0,
Balance_Current MONEY DEFAULT 0,
Balance_Change MONEY DEFAULT 0,
OTE_SOD MONEY DEFAULT 0,
OTE_Top_Day MONEY DEFAULT 0,
OTE_Current MONEY DEFAULT 0,
OTE_Change MONEY DEFAULT 0,
Total_Equity_SOD MONEY DEFAULT 0, ---
Total_Equity_Top_Day MONEY DEFAULT 0, ---
Total_Equity_Current MONEY DEFAULT 0, ---
Total_Equity_Change MONEY DEFAULT 0, ---
LOV_SOD MONEY DEFAULT 0,
LOV_Top_Day MONEY DEFAULT 0,
LOV_Current MONEY DEFAULT 0,
LOV_Change MONEY DEFAULT 0,
SOV_SOD MONEY DEFAULT 0,
SOV_Top_Day MONEY DEFAULT 0,
SOV_Current MONEY DEFAULT 0,
SOV_Change MONEY,
NOV_SOD MONEY DEFAULT 0, ---
NOV_Top_Day MONEY DEFAULT 0, ---
NOV_Current MONEY DEFAULT 0, ---
NOV_Change MONEY DEFAULT 0, ---
Liquidating_Value_SOD MONEY DEFAULT 0, ---
Liquidating_Value_Top_Day MONEY DEFAULT 0, ---
Liquidating_Value_Current MONEY DEFAULT 0, ---
Liquidating_Value_Change MONEY DEFAULT 0, ---
Option_Unrealized_SOD MONEY DEFAULT 0,
Option_Unrealized_Top_Day MONEY DEFAULT 0,
Option_Unrealized_Current MONEY DEFAULT 0,
Option_Unrealized_Change MONEY DEFAULT 0,
FMR NUMERIC(15,2) DEFAULT 0,
FIR NUMERIC(15,2) DEFAULT 0,
Margin_Excess_Deficit NUMERIC(15,2) DEFAULT 0,
Securities_on_Deposit NUMERIC(15,2) DEFAULT 0,
IN_GMI_Snapshot_SOD_YN VARCHAR(1) DEFAULT 'N',
IN_GMI_Snapshot_Top_Day_YN VARCHAR(1) DEFAULT 'N')

PRINT '**************************************************************************'
PRINT ' Load #GMI_Snapshot_Current'
PRINT ' with [dbo].[GMI_Snapshot_SOD]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Snapshot_Current
(Account,
Account_Type,
Related_Account,
Currency_Code,
Balance_SOD,
OTE_SOD,
Total_Equity_SOD,
LOV_SOD,
SOV_SOD,
NOV_SOD,
Liquidating_Value_SOD,
Option_Unrealized_SOD,
FMR,
FIR,
Margin_Excess_Deficit,
Securities_on_Deposit,
IN_GMI_Snapshot_SOD_YN)
SELECT
Account,
Account_Type,
Related_Account,
Currency_Code,
Account_Balance, --Balance_SOD,
Open_Trade_Equity, --OTE_SOD,
Total_Equity, --Total_Equity_SOD
LOV, --LOV_SOD,
SOV, --SOV_SOD,
NOV, --NOV_SOD,
Liquidating_Value, --Liquidating_Value_SOD,
Option_Unrealized, --Option_Unrealized_SOD
FMR,
FIR,
Margin_Excess_Deficit,
Securities_on_Deposit,
'Y' --IN_GMI_Snapshot_SOD_YN
FROM [dbo].[GMI_Snapshot_SOD]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Snapshot_Current'
PRINT ' with [dbo].[GMI_Snapshot_Top_Day]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
Currency_Code=A.Currency_Code,
Balance_Top_Day=A.Account_Balance,
OTE_Top_Day=A.Open_Trade_Equity,
Total_Equity_Top_Day=A.Total_Equity,
LOV_Top_Day=A.LOV,
SOV_Top_Day=A.SOV,
NOV_Top_Day=A.NOV,
Liquidating_Value_Top_Day=A.Liquidating_Value,
Option_Unrealized_Top_Day=A.Option_Unrealized,
IN_GMI_Snapshot_Top_Day_YN='Y'
FROM [dbo].[GMI_Snapshot_Top_Day] A
INNER JOIN #GMI_Snapshot_Current B
ON (A.Account=B.Account)
AND (A.Account_Type=B.Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #GMI_Snapshot_Current'
PRINT ' with missing [dbo].[GMI_Snapshot_Top_Day]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Snapshot_Current
(Account,
Account_Type,
Related_Account,
Currency_Code,
Balance_Top_Day,
OTE_Top_Day,
Total_Equity_Top_Day,
LOV_Top_Day,
SOV_Top_Day,
NOV_Top_Day,
Liquidating_Value_Top_Day,
Option_Unrealized_Top_Day,
IN_GMI_Snapshot_Top_Day_YN)
SELECT
A.Account,
A.Account_Type,
A.Related_Account,
A.Currency_Code,
A.Account_Balance, --Balance_Top_Day,
A.Open_Trade_Equity, --OTE_Top_Day,
A.Total_Equity, --Total_Equity_Top_Day,
A.LOV, --LOV_Top_Day,
A.SOV, --SOV_Top_Day,
A.NOV, --NOV_Top_Day,
A.Liquidating_Value, --Liquidating_Value_Top_Day,
A.Option_Unrealized, --Option_Unrealized_Top_Day
'Y' --IN_GMI_Snapshot_Top_Day_YN
FROM [dbo].[GMI_Snapshot_Top_Day] A
LEFT OUTER JOIN #GMI_Snapshot_Current B
ON (A.Account=B.Account)
AND (A.Account_Type=B.Account_Type)
WHERE (B.IN_GMI_Snapshot_SOD_YN IS NULL)

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update "Current" values'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_Current
SET
Balance_Current = Balance_SOD + Balance_Top_Day,
OTE_Current = OTE_SOD + OTE_Top_Day,
Total_Equity_Current = Total_Equity_SOD + Total_Equity_Top_Day,
LOV_Current = LOV_SOD + LOV_Top_Day,
SOV_Current = SOV_SOD + SOV_Top_Day,
NOV_Current = NOV_SOD + NOV_Top_Day,
Liquidating_Value_Current = Liquidating_Value_SOD + Liquidating_Value_Top_Day,
Option_Unrealized_Current = Option_Unrealized_SOD + Option_Unrealized_Top_Day

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update "Change" values'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_Current
SET
Balance_Change = Balance_Current - Balance_SOD,
OTE_Change = OTE_Current - OTE_SOD,
Total_Equity_Change = Total_Equity_Current - Total_Equity_SOD,
LOV_Change = LOV_Current - LOV_SOD,
SOV_Change = SOV_Current - SOV_SOD,
NOV_Change = NOV_Current - NOV_SOD,
Liquidating_Value_Change = Liquidating_Value_Current - Liquidating_Value_SOD,
Option_Unrealized_Change = Option_Unrealized_Current - Option_Unrealized_SOD

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Update Total_Equity'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

--UPDATE #GMI_Snapshot_Current
--SET Total_Equity = Balance_Current + OTE_Current

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Update NOV'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

--UPDATE #GMI_Snapshot_Current
--SET NOV = LOV_Current + SOV_Current

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

--PRINT '**************************************************************************'
--PRINT ' Update Liquidating_Value'
--PRINT '**************************************************************************'

--SELECT GETDATE() "Start Time"

--UPDATE #GMI_Snapshot_Current
--SET Liquidating_Value = Total_Equity + NOV

--SELECT @@ROWCOUNT "Records Updated"

--SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Snapshot_Current]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Snapshot_Current]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_Snapshot_Current]'
PRINT ' with #GMI_Snapshot_Current'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Snapshot_Current]
(Account,
Account_Type,
Related_Account,
Currency_Code,
Balance_SOD,
Balance_Top_Day,
Balance_Current,
Balance_Change,
OTE_SOD,
OTE_Top_Day,
OTE_Current,
OTE_Change,
Total_Equity_SOD,
Total_Equity_Top_Day,
Total_Equity_Current,
Total_Equity_Change,
LOV_SOD,
LOV_Top_Day,
LOV_Current,
LOV_Change,
SOV_SOD,
SOV_Top_Day,
SOV_Current,
SOV_Change,
NOV_SOD,
NOV_Top_Day,
NOV_Current,
NOV_Change,
Liquidating_Value_SOD,
Liquidating_Value_Top_Day,
Liquidating_Value_Current,
Liquidating_Value_Change,
Option_Unrealized_SOD,
Option_Unrealized_Top_Day,
Option_Unrealized_Current,
Option_Unrealized_Change,
FMR,
FIR,
Margin_Excess_Deficit,
Securities_on_Deposit)
SELECT
Account,
Account_Type,
Related_Account, --WARNING: This may cause a PRIMARY KEY violation!!!
Currency_Code,
Balance_SOD,
Balance_Top_Day,
Balance_Current,
Balance_Change,
OTE_SOD,
OTE_Top_Day,
OTE_Current,
OTE_Change,
Total_Equity_SOD,
Total_Equity_Top_Day,
Total_Equity_Current,
Total_Equity_Change,
LOV_SOD,
LOV_Top_Day,
LOV_Current,
LOV_Change,
SOV_SOD,
SOV_Top_Day,
SOV_Current,
SOV_Change,
NOV_SOD,
NOV_Top_Day,
NOV_Current,
NOV_Change,
Liquidating_Value_SOD,
Liquidating_Value_Top_Day,
Liquidating_Value_Current,
Liquidating_Value_Change,
Option_Unrealized_SOD,
Option_Unrealized_Top_Day,
Option_Unrealized_Current,
Option_Unrealized_Change,
FMR,
FIR,
Margin_Excess_Deficit,
Securities_on_Deposit
FROM #GMI_Snapshot_Current

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Snapshot_Current

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Snapshot_Current] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO