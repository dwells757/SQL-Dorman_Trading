USE [GMIDATA]
GO

SET NOCOUNT ON

--******************************************************************************
-- Create #GMI_SOD_Positions
--******************************************************************************
CREATE TABLE #GMI_SOD_Positions
(Processing_Date DATE,
Account VARCHAR(20),
GMI_Sub_Account VARCHAR(10),
Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
Buy_Sell VARCHAR(1),
Quantity NUMERIC(18),
GMI_Trade_Price NUMERIC(18,9),
GMI_Multiplier NUMERIC(18,9),
GMI_Last_Closing_Price NUMERIC(18,9),
OTE MONEY DEFAULT 0,
Market_Value MONEY DEFAULT 0,
Expiration_Date VARCHAR(8))

--******************************************************************************
-- Load #GMI_SOD_Positions
--******************************************************************************
INSERT INTO #GMI_SOD_Positions
(Processing_Date,
Account,
GMI_Sub_Account,
Related_Account,
Product,
GMI_Description,
Buy_Sell,
Quantity,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
Expiration_Date)
SELECT
Processing_Date,
Account,
GMI_Sub_Account,
Related_Account,
Product,
GMI_Description,
PBS, --Buy_Sell,
SUM(PQTY), --Quantity,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
Expiration_Date
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (Account='D-99280')
GROUP BY
Processing_Date,
Account,
GMI_Sub_Account,
Related_Account,
Product,
GMI_Description,
PBS, --Buy_Sell,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
Expiration_Date

--******************************************************************************
-- Generate OTE
--******************************************************************************
UPDATE #GMI_SOD_Positions
SET OTE =
	CASE Buy_Sell
		WHEN '1' THEN (GMI_Last_Closing_Price - GMI_Trade_Price) *  Quantity * GMI_Multiplier
		WHEN '2' THEN (GMI_Trade_Price - GMI_Last_Closing_Price) *  Quantity * GMI_Multiplier
		ELSE 0
	END

----******************************************************************************
---- Update NOV
----******************************************************************************
--UPDATE #GMI_SOD_Positions
--SET NOV = LOV + SOV

----******************************************************************************
---- Update Liquidating_Value
----******************************************************************************
--UPDATE #GMI_SOD_Positions
--SET Liquidating_Value = Total_Equity + NOV

SELECT
Processing_Date,
Account,
GMI_Sub_Account,
Related_Account,
Product,
GMI_Description,
Buy_Sell,
Quantity,
FORMAT(GMI_Trade_Price,'0.#########') "GMI_Trade_Price",
FORMAT(GMI_Multiplier,'0.#########') "GMI_Multiplier",
FORMAT(GMI_Last_Closing_Price,'0.#########') "GMI_Last_Closing_Price",
OTE,
Market_Value,
Expiration_Date
FROM #GMI_SOD_Positions
ORDER BY
Processing_Date,
Account,
GMI_Sub_Account,
Related_Account,
Product,
GMI_Description,
Buy_Sell,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
Expiration_Date

--SELECT
--Processing_Date,
--MRECID,
--Account,
--Related_Account,
--Account_Type,
--AT_Curr,
--Account_Balance,
--OTE,
--Total_Equity,
--Liquidating_Value,
--Margin_Excess_Deficit,
--Securities_on_Deposit,
--LOV,
--SOV,
--NOV,
--FMR,
--FIR
--FROM #GMI_SOD_Positions
--ORDER BY
--Processing_Date,
--MRECID,
--Account,
--Account_Type

DROP TABLE #GMI_SOD_Positions

SET NOCOUNT OFF