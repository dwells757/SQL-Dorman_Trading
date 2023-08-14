USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office]
																	--@Account VARCHAR(20)
																	@Group_ID VARCHAR(30)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

DECLARE
@Group_Type VARCHAR(30)

--******************************************************************************
-- Create #GMI_Snapshot_Current
--******************************************************************************
CREATE TABLE #GMI_Snapshot_Current
(Id INT IDENTITY(1,1),
--Account VARCHAR(20),
Group_ID VARCHAR(30),
Group_Type VARCHAR(30),
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
FMR_SOD MONEY,
FMR_Top_Day MONEY,
FMR_Current MONEY,
FMR_Change MONEY,
FIR_SOD MONEY,
FIR_Top_Day MONEY,
FIR_Current MONEY,
FIR_Change MONEY,
Margin_Excess_Deficit_SOD MONEY,
Margin_Excess_Deficit_Top_Day MONEY,
Margin_Excess_Deficit_Current MONEY,
Margin_Excess_Deficit_Change MONEY,
Securities_on_Deposit_SOD MONEY,
Securities_on_Deposit_Top_Day MONEY,
Securities_on_Deposit_Current MONEY,
Securities_on_Deposit_Change MONEY,
Scanning_Risk_SOD MONEY,
Scanning_Risk_Top_Day MONEY,
Scanning_Risk_Current MONEY,
Scanning_Risk_Change MONEY,
Snapshot_Time VARCHAR(30))

--******************************************************************************
-- Try to get @Group_Type
--******************************************************************************
SELECT @Group_Type=Group_Type
FROM [dbo].[Groups]
WHERE (Group_ID=@Group_ID)

--*********************************************************************************************************************************************************************************
-- START - Load #GMI_Snapshot_Current
--*********************************************************************************************************************************************************************************
--***1***
IF (@Group_Type='Account') BEGIN

	INSERT INTO #GMI_Snapshot_Current
	(--Account,
	Group_ID,
	Group_Type,
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
	FMR_SOD,
	FMR_Top_Day,
	FMR_Current,
	FMR_Change,
	FIR_SOD,
	FIR_Top_Day,
	FIR_Current,
	FIR_Change,
	Margin_Excess_Deficit_SOD,
	Margin_Excess_Deficit_Top_Day,
	Margin_Excess_Deficit_Current,
	Margin_Excess_Deficit_Change,
	Securities_on_Deposit_SOD,
	Securities_on_Deposit_Top_Day,
	Securities_on_Deposit_Current,
	Securities_on_Deposit_Change,
	Scanning_Risk_SOD,
	Scanning_Risk_Top_Day,
	Scanning_Risk_Current,
	Scanning_Risk_Change,
	Snapshot_Time)
	SELECT
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
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
	--SUM(FMR), --FMR,
	--SUM(FIR), --FIR,
	--SUM(Margin_Excess_Deficit), --Margin_Excess_Deficit,
	--SUM(Securities_on_Deposit), --Securities_on_Deposit,
	SUM(FMR), --FMR_SOD,
	0, --FMR_Top_Day,
	SUM(FMR), --FMR_Current,
	0, --FMR_Change,
	SUM(FIR), --FIR_SOD,
	0, --FIR_Top_Day,
	SUM(FIR), --FIR_Current,
	0, --FIR_Change,
	SUM(Margin_Excess_Deficit), --Margin_Excess_Deficit_SOD,
	0, --Margin_Excess_Deficit_Top_Day,
	SUM(Margin_Excess_Deficit), --Margin_Excess_Deficit_Current,
	0, --Margin_Excess_Deficit_Change,
	SUM(Securities_on_Deposit), --Securities_on_Deposit_SOD,
	0, --Securities_on_Deposit_Top_Day,
	SUM(Securities_on_Deposit), --Securities_on_Deposit_Current,
	0, --Securities_on_Deposit_Change,
	SUM(FIR), --Scanning_Risk_SOD,
	0, --Scanning_Risk_Top_Day,
	SUM(FIR), --Scanning_Risk_Current,
	0, --Scanning_Risk_Change,
	MAX(CONVERT(VARCHAR,DateLoaded,100)) --Snapshot_Time
	FROM [dbo].[GMI_Snapshot_Current]
	WHERE (Account=@Group_ID)
	AND (Currency_Code='USD') --DWH TEST 8/14/23
	GROUP BY
	Account,
	Currency_Code
	ORDER BY
	Account,
	Currency_Code
--***1***
END

--***2***
IF (@Group_Type='Related_Account') BEGIN
	INSERT INTO #GMI_Snapshot_Current
	(--Account,
	Group_ID,
	Group_Type,
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
	FMR_SOD,
	FMR_Top_Day,
	FMR_Current,
	FMR_Change,
	FIR_SOD,
	FIR_Top_Day,
	FIR_Current,
	FIR_Change,
	Margin_Excess_Deficit_SOD,
	Margin_Excess_Deficit_Top_Day,
	Margin_Excess_Deficit_Current,
	Margin_Excess_Deficit_Change,
	Securities_on_Deposit_SOD,
	Securities_on_Deposit_Top_Day,
	Securities_on_Deposit_Current,
	Securities_on_Deposit_Change,
	Scanning_Risk_SOD,
	Scanning_Risk_Top_Day,
	Scanning_Risk_Current,
	Scanning_Risk_Change,
	Snapshot_Time)
	SELECT
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
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
	--SUM(FMR), --FMR,
	--SUM(FIR), --FIR,
	--SUM(Margin_Excess_Deficit), --Margin_Excess_Deficit,
	--SUM(Securities_on_Deposit), --Securities_on_Deposit,
	SUM(FMR), --FMR_SOD,
	0, --FMR_Top_Day,
	SUM(FMR), --FMR_Current,
	0, --FMR_Change,
	SUM(FIR), --FIR_SOD,
	0, --FIR_Top_Day,
	SUM(FIR), --FIR_Current,
	0, --FIR_Change,
	SUM(Margin_Excess_Deficit), --Margin_Excess_Deficit_SOD,
	0, --Margin_Excess_Deficit_Top_Day,
	SUM(Margin_Excess_Deficit), --Margin_Excess_Deficit_Current,
	0, --Margin_Excess_Deficit_Change,
	SUM(Securities_on_Deposit), --Securities_on_Deposit_SOD,
	0, --Securities_on_Deposit_Top_Day,
	SUM(Securities_on_Deposit), --Securities_on_Deposit_Current,
	0, --Securities_on_Deposit_Change,
	SUM(FIR), --Scanning_Risk_SOD,
	0, --Scanning_Risk_Top_Day,
	SUM(FIR), --Scanning_Risk_Current,
	0, --Scanning_Risk_Change,
	MAX(CONVERT(VARCHAR,DateLoaded,100)) --Snapshot_Time
	FROM [dbo].[GMI_Snapshot_Current]
	WHERE (Related_Account=@Group_ID)
	AND (Currency_Code='USD') --DWH TEST 8/14/23
	GROUP BY
	Related_Account,
	Currency_Code
	ORDER BY
	Related_Account,
	Currency_Code
--***2***
END

SELECT
Id,
--Account,
Group_ID,
Group_Type,
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
--CONVERT(NUMERIC(15,2),FMR) "FMR",
--CONVERT(NUMERIC(15,2),FIR) "FIR",
--CONVERT(NUMERIC(15,2),Margin_Excess_Deficit) "Margin_Excess_Deficit",
--CONVERT(NUMERIC(15,2),Securities_on_Deposit) "Securities_on_Deposit",
CONVERT(NUMERIC(15,2),FMR_SOD) "FMR_SOD",
CONVERT(NUMERIC(15,2),FMR_Top_Day) "FMR_Top_Day",
CONVERT(NUMERIC(15,2),FMR_Current) "FMR_Current",
CONVERT(NUMERIC(15,2),FMR_Change) "FMR_Change",
CONVERT(NUMERIC(15,2),FIR_SOD) "FIR_SOD",
CONVERT(NUMERIC(15,2),FIR_Top_Day) "FIR_Top_Day",
CONVERT(NUMERIC(15,2),FIR_Current) "FIR_Current",
CONVERT(NUMERIC(15,2),FIR_Change) "FIR_Change",
CONVERT(NUMERIC(15,2),Margin_Excess_Deficit_SOD) "Margin_Excess_Deficit_SOD",
CONVERT(NUMERIC(15,2),Margin_Excess_Deficit_Top_Day) "Margin_Excess_Deficit_Top_Day",
CONVERT(NUMERIC(15,2),Margin_Excess_Deficit_Current) "Margin_Excess_Deficit_Current",
CONVERT(NUMERIC(15,2),Margin_Excess_Deficit_Change) "Margin_Excess_Deficit_Change",
CONVERT(NUMERIC(15,2),Securities_on_Deposit_SOD) "Securities_on_Deposit_SOD",
CONVERT(NUMERIC(15,2),Securities_on_Deposit_Top_Day) "Securities_on_Deposit_Top_Day",
CONVERT(NUMERIC(15,2),Securities_on_Deposit_Current) "Securities_on_Deposit_Current",
CONVERT(NUMERIC(15,2),Securities_on_Deposit_Change) "Securities_on_Deposit_Change",
CONVERT(NUMERIC(15,2),Scanning_Risk_SOD) "Scanning_Risk_SOD",
CONVERT(NUMERIC(15,2),Scanning_Risk_Top_Day) "Scanning_Risk_Top_Day",
CONVERT(NUMERIC(15,2),Scanning_Risk_Current) "Scanning_Risk_Current",
CONVERT(NUMERIC(15,2),Scanning_Risk_Change) "Scanning_Risk_Change",
Snapshot_Time
FROM #GMI_Snapshot_Current
ORDER BY
--Account,
Group_ID,
Currency_Code

DROP TABLE #GMI_Snapshot_Current

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Snapshot_Current_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO