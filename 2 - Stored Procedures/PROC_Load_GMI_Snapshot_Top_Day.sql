DROP PROCEDURE [dbo].[PROC_Load_GMI_Snapshot_Top_Day]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Snapshot_Top_Day]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Snapshot_Top_Day] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Snapshot_Top_Day_1
--******************************************************************************
CREATE TABLE #GMI_Snapshot_Top_Day_1
(Account VARCHAR(20),
Account_Type VARCHAR(2),
Related_Account VARCHAR(20),
--AT_Curr VARCHAR(3),
Account_Balance NUMERIC(15,2),
Open_Trade_Equity NUMERIC(15,2) DEFAULT 0,
LOV NUMERIC(15,2) DEFAULT 0,
SOV NUMERIC(15,2) DEFAULT 0,
Option_Unrealized NUMERIC(15,2) DEFAULT 0)

PRINT '**************************************************************************'
PRINT ' Load #GMI_Snapshot_Top_Day_1'
PRINT ' with [dbo].[GMI_Current_Positions_Detailed]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Snapshot_Top_Day_1
(Account,
Account_Type,
Related_Account,
Account_Balance,
Open_Trade_Equity,
LOV,
SOV,
Option_Unrealized)
SELECT
Account,
Account_Type,
Related_Account,
SUM(Account_Balance), --Account_Balance,
SUM(OTE_Top_Day), --Open_Trade_Equity,
SUM(LOV), --LOV,
SUM(SOV), --SOV,
SUM(Option_Unrealized_Top_Day) --Option_Unrealized
FROM [dbo].[GMI_Current_Positions_Detailed]
GROUP BY
Account,
Account_Type,
Related_Account --WARNING: This may cause a PRIMARY KEY violation!!!
ORDER BY
Account,
Account_Type,
Related_Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #GMI_Snapshot_Top_Day_1'
PRINT ' with [dbo].[Global_Risk_File_Current_Cash]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Snapshot_Top_Day_1
(Account,
Account_Type,
Related_Account,
Account_Balance)
SELECT
Account,
PATYPE, --Account_Type,
Related_Account,
SUM(PNET) --Account_Balance
FROM [dbo].[Global_Risk_File_Current_Cash]
GROUP BY
Account,
PATYPE,
Related_Account
ORDER BY
Account,
PATYPE,
Related_Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

--******************************************************************************
-- Create #GMI_Snapshot_Top_Day_2
--******************************************************************************
CREATE TABLE #GMI_Snapshot_Top_Day_2
(Account VARCHAR(20),
Account_Type VARCHAR(2),
Related_Account VARCHAR(20),
Currency_Code VARCHAR(3) DEFAULT '',
Account_Balance NUMERIC(15,2),
Open_Trade_Equity NUMERIC(15,2),
Total_Equity NUMERIC(15,2) DEFAULT 0,
LOV NUMERIC(15,2),
SOV NUMERIC(15,2),
NOV NUMERIC(15,2) DEFAULT 0,
Liquidating_Value NUMERIC(15,2) DEFAULT 0,
Option_Unrealized NUMERIC(15,2))

PRINT '**************************************************************************'
PRINT ' Load #GMI_Snapshot_Top_Day_2'
PRINT ' with #GMI_Snapshot_Top_Day_1'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Snapshot_Top_Day_2
(Account,
Account_Type,
Related_Account,
Account_Balance,
Open_Trade_Equity,
LOV,
SOV,
Option_Unrealized)
SELECT
Account,
Account_Type,
Related_Account,
SUM(Account_Balance), --Account_Balance,
SUM(Open_Trade_Equity), --Open_Trade_Equity,
SUM(LOV), --LOV,
SUM(SOV), --SOV,
SUM(Option_Unrealized) --Option_Unrealized
FROM #GMI_Snapshot_Top_Day_1
GROUP BY
Account,
Account_Type,
Related_Account --WARNING: This may cause a PRIMARY KEY violation!!!

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Snapshot_Top_Day_1

PRINT '**************************************************************************'
PRINT ' Update Total_Equity'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_Top_Day_2
SET Total_Equity = Account_Balance + Open_Trade_Equity

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update NOV'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_Top_Day_2
SET NOV = LOV + SOV

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update Liquidating_Value'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Snapshot_Top_Day_2
SET Liquidating_Value = Total_Equity + NOV

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Snapshot_Top_Day_2'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET Currency_Code=A.Currency_Code
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #GMI_Snapshot_Top_Day_2 B
ON (A.GMI_Account_Type=B.Account_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Snapshot_Top_Day]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Snapshot_Top_Day]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_Snapshot_Top_Day]'
PRINT ' with #GMI_Snapshot_Top_Day_2'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Snapshot_Top_Day]
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
--FMR,
--FIR,
--Margin_Excess_Deficit,
--Securities_on_Deposit,
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
--FMR,
--FIR,
--Margin_Excess_Deficit,
--Securities_on_Deposit,
Option_Unrealized
FROM #GMI_Snapshot_Top_Day_2

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Snapshot_Top_Day_2

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Snapshot_Top_Day] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO