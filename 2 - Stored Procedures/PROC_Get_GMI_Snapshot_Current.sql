USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_Snapshot_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Snapshot_Current]
												@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Snapshot_Current] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Snapshot_Current
--******************************************************************************
CREATE TABLE #GMI_Snapshot_Current
(Account VARCHAR(20),
Account_Type VARCHAR(2),
Balance_SOD MONEY,
Balance_Top_Day MONEY,
Balance_Current MONEY,
Balance_Change MONEY,
OTE_SOD MONEY,
OTE_Top_Day MONEY,
OTE_Current MONEY,
OTE_Change MONEY,
Total_Equity_SOD MONEY,
Total_Equity_Top_Day MONEY,
Total_Equity_Current MONEY,
Total_Equity_Change MONEY,
LOV_SOD MONEY,
LOV_Top_Day MONEY,
LOV_Current MONEY,
LOV_Change MONEY,
SOV_SOD MONEY,
SOV_Top_Day MONEY,
SOV_Current MONEY,
SOV_Change MONEY,
NOV_SOD MONEY,
NOV_Top_Day MONEY,
NOV_Current MONEY,
NOV_Change MONEY,
Liquidating_Value_SOD MONEY,
Liquidating_Value_Top_Day MONEY,
Liquidating_Value_Current MONEY,
Liquidating_Value_Change MONEY,
Option_Unrealized_SOD MONEY,
Option_Unrealized_Top_Day MONEY,
Option_Unrealized_Current MONEY,
Option_Unrealized_Change MONEY,
FMR NUMERIC(15,2),
FIR NUMERIC(15,2),
Margin_Excess_Deficit NUMERIC(15,2),
Securities_on_Deposit NUMERIC(15,2))

--******************************************************************************
-- Load #GMI_Snapshot_Current
--******************************************************************************
INSERT INTO #GMI_Snapshot_Current
(Account,
Account_Type,
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
FROM [dbo].[GMI_Snapshot_Current]
WHERE (Account=@Account)

SELECT
Account,
Account_Type,
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
ORDER BY
Account,
Account_Type

DROP TABLE #GMI_Snapshot_Current

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Snapshot_Current] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO