USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office]
																	@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Snapshot_Current
--******************************************************************************
CREATE TABLE #GMI_Snapshot_Current
(Id INT IDENTITY(1,1),
Account VARCHAR(20),
--Account_Type VARCHAR(2),
Currency_Code VARCHAR(3),
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
Securities_on_Deposit NUMERIC(15,2),
Snapshot_Time VARCHAR(30))

--******************************************************************************
-- Load #GMI_Snapshot_Current
--******************************************************************************
INSERT INTO #GMI_Snapshot_Current
(Account,
--Account_Type,
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
Securities_on_Deposit,
Snapshot_Time)
SELECT
Account,
--Account_Type,
Currency_Code,
SUM(Balance_SOD), --Balance_SOD,
SUM(Balance_Top_Day), --Balance_Top_Day,
SUM(Balance_Current), --Balance_Current,
SUM(Balance_Change), --Balance_Change,
SUM(OTE_SOD), --OTE_SOD,
SUM(OTE_Top_Day), --OTE_Top_Day,
SUM(OTE_Current), --OTE_Current,
SUM(OTE_Change), --OTE_Change,
SUM(Total_Equity_SOD), --Total_Equity_SOD,
SUM(Total_Equity_Top_Day), --Total_Equity_Top_Day,
SUM(Total_Equity_Current), --Total_Equity_Current,
SUM(Total_Equity_Change), --Total_Equity_Change,
SUM(LOV_SOD), --LOV_SOD,
SUM(LOV_Top_Day), --LOV_Top_Day,
SUM(LOV_Current), --LOV_Current,
SUM(LOV_Change), --LOV_Change,
SUM(SOV_SOD), --SOV_SOD,
SUM(SOV_Top_Day), --SOV_Top_Day,
SUM(SOV_Current), --SOV_Current,
SUM(SOV_Change), --SOV_Change,
SUM(NOV_SOD), --NOV_SOD,
SUM(NOV_Top_Day), --NOV_Top_Day,
SUM(NOV_Current), --NOV_Current,
SUM(NOV_Change), --NOV_Change,
SUM(Liquidating_Value_SOD), --Liquidating_Value_SOD,
SUM(Liquidating_Value_Top_Day), --Liquidating_Value_Top_Day,
SUM(Liquidating_Value_Current), --Liquidating_Value_Current,
SUM(Liquidating_Value_Change), --Liquidating_Value_Change,
SUM(Option_Unrealized_SOD), --Option_Unrealized_SOD,
SUM(Option_Unrealized_Top_Day), --Option_Unrealized_Top_Day,
SUM(Option_Unrealized_Current), --Option_Unrealized_Current,
SUM(Option_Unrealized_Change), --Option_Unrealized_Change,
SUM(FMR), --FMR,
SUM(FIR), --FIR,
SUM(Margin_Excess_Deficit), --Margin_Excess_Deficit,
SUM(Securities_on_Deposit), --Securities_on_Deposit,
MAX(CONVERT(VARCHAR,DateLoaded,100)) --Snapshot_Time
FROM [dbo].[GMI_Snapshot_Current]
WHERE (Account=@Account)
GROUP BY
Account,
Currency_Code
ORDER BY
Account,
Currency_Code

SELECT
Id,
Account,
--Account_Type,
Currency_Code,
CONVERT(NUMERIC(15,2),Balance_SOD) "Balance_SOD",
CONVERT(NUMERIC(15,2),Balance_Top_Day) "Balance_Top_Day",
CONVERT(NUMERIC(15,2),Balance_Current) "Balance_Current",
CONVERT(NUMERIC(15,2),Balance_Change) "Balance_Change",
CONVERT(NUMERIC(15,2),OTE_SOD) "OTE_SOD",
CONVERT(NUMERIC(15,2),OTE_Top_Day) "OTE_Top_Day",
CONVERT(NUMERIC(15,2),OTE_Current) "OTE_Current",
CONVERT(NUMERIC(15,2),OTE_Change) "OTE_Change",
CONVERT(NUMERIC(15,2),Total_Equity_SOD) "Total_Equity_SOD" ,
CONVERT(NUMERIC(15,2),Total_Equity_Top_Day) "Total_Equity_Top_Day",
CONVERT(NUMERIC(15,2),Total_Equity_Current) "Total_Equity_Current",
CONVERT(NUMERIC(15,2),Total_Equity_Change) "Total_Equity_Change",
CONVERT(NUMERIC(15,2),LOV_SOD) "LOV_SOD",
CONVERT(NUMERIC(15,2),LOV_Top_Day) "LOV_Top_Day",
CONVERT(NUMERIC(15,2),LOV_Current) "LOV_Current",
CONVERT(NUMERIC(15,2),LOV_Change) "LOV_Change",
CONVERT(NUMERIC(15,2),SOV_SOD) "SOV_SOD",
CONVERT(NUMERIC(15,2),SOV_Top_Day) "SOV_Top_Day",
CONVERT(NUMERIC(15,2),SOV_Current) "SOV_Current",
CONVERT(NUMERIC(15,2),SOV_Change) "SOV_Change",
CONVERT(NUMERIC(15,2),NOV_SOD) "NOV_SOD",
CONVERT(NUMERIC(15,2),NOV_Top_Day) "NOV_Top_Day",
CONVERT(NUMERIC(15,2),NOV_Current) "NOV_Current",
CONVERT(NUMERIC(15,2),NOV_Change) "NOV_Change",
CONVERT(NUMERIC(15,2),Liquidating_Value_SOD) "Liquidating_Value_SOD",
CONVERT(NUMERIC(15,2),Liquidating_Value_Top_Day) "Liquidating_Value_Top_Day",
CONVERT(NUMERIC(15,2),Liquidating_Value_Current) "Liquidating_Value_Current",
CONVERT(NUMERIC(15,2),Liquidating_Value_Change) "Liquidating_Value_Change",
CONVERT(NUMERIC(15,2),Option_Unrealized_SOD) "Option_Unrealized_SOD",
CONVERT(NUMERIC(15,2),Option_Unrealized_Top_Day) "Option_Unrealized_Top_Day",
CONVERT(NUMERIC(15,2),Option_Unrealized_Current) "Option_Unrealized_Current",
CONVERT(NUMERIC(15,2),Option_Unrealized_Change) "Option_Unrealized_Change",
CONVERT(NUMERIC(15,2),FMR) "FMR",
CONVERT(NUMERIC(15,2),FIR) "FIR",
CONVERT(NUMERIC(15,2),Margin_Excess_Deficit) "Margin_Excess_Deficit",
CONVERT(NUMERIC(15,2),Securities_on_Deposit) "Securities_on_Deposit",
Snapshot_Time
FROM #GMI_Snapshot_Current
ORDER BY
Account,
Currency_Code

DROP TABLE #GMI_Snapshot_Current

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO