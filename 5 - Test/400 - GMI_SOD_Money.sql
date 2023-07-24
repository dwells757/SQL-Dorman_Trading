USE [GMIDATA]
GO

SET NOCOUNT ON

--******************************************************************************
-- Create #GMI_SOD_Money
--******************************************************************************
CREATE TABLE #GMI_SOD_Money
(Processing_Date DATE,
MRECID VARCHAR(1),
Account VARCHAR(20),
Related_Account VARCHAR(20),
Account_Type VARCHAR(2),
AT_Curr VARCHAR(3),
Account_Balance NUMERIC(15,2),
OTE NUMERIC(15,2),
Total_Equity NUMERIC(15,2) DEFAULT 0,
LOV NUMERIC(15,2),
SOV NUMERIC(15,2),
NOV NUMERIC(15,2) DEFAULT 0,
Liquidating_Value NUMERIC(15,2) DEFAULT 0,
FMR NUMERIC(15,2),
FIR NUMERIC(15,2),
Margin_Excess_Deficit NUMERIC(15,2),
Securities_on_Deposit NUMERIC(15,2))

--******************************************************************************
-- Load #GMI_SOD_Money
--******************************************************************************
INSERT INTO #GMI_SOD_Money
(Processing_Date,
MRECID,
Account,
Related_Account,
Account_Type,
AT_Curr,
Account_Balance,
OTE,
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
Account_Type_Currency_Code_Symbol, --AT_Curr,
Account_Balance,
Open_Trade_Equity, --OTE,
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
--AND (MACCT IN(
--'43189',
--'Q1001',
--'Q1004'))

--******************************************************************************
-- Update Total_Equity
--******************************************************************************
UPDATE #GMI_SOD_Money
SET Total_Equity = Account_Balance + OTE

--******************************************************************************
-- Update NOV
--******************************************************************************
UPDATE #GMI_SOD_Money
SET NOV = LOV + SOV

--******************************************************************************
-- Update Liquidating_Value
--******************************************************************************
UPDATE #GMI_SOD_Money
SET Liquidating_Value = Total_Equity + NOV

SELECT
Processing_Date,
MRECID,
Account,
Related_Account,
Account_Type,
AT_Curr,
Account_Balance,
OTE,
Total_Equity,
Liquidating_Value,
Margin_Excess_Deficit,
Securities_on_Deposit,
LOV,
SOV,
NOV,
FMR,
FIR
FROM #GMI_SOD_Money
ORDER BY
Processing_Date,
MRECID,
Account,
Account_Type

DROP TABLE #GMI_SOD_Money

SET NOCOUNT OFF