USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Detailed]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Detailed]
														@Account VARCHAR(20),
														@Product VARCHAR(50)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Detailed] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Current_Positions_Detailed
--******************************************************************************
CREATE TABLE #GMI_Current_Positions_Detailed
(--Processing_Date DATE,
Account VARCHAR(20),
--GMI_Sub_Account VARCHAR(10),
--Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
PBS VARCHAR(1),
Buy_Sell VARCHAR(7) DEFAULT '',
Quantity NUMERIC(18),
Trade_Price NUMERIC(18,9),
Last_Closing_Price NUMERIC(18,9),
Market_Price NUMERIC(18,9),
GMI_Multiplier NUMERIC(18,9),
OTE_SOD MONEY,
OTE_Top_Day MONEY,
OTE_Current MONEY,
OTE_Change MONEY,
Market_Value MONEY,
Option_Unrealized_SOD MONEY,
Option_Unrealized_Top_Day MONEY,
Option_Unrealized_Current MONEY,
Option_Unrealized_Change MONEY,
GMI_Currency_Code VARCHAR(3),
Expiration_Date VARCHAR(8),
Source_Table VARCHAR(100))

--******************************************************************************
-- Load #GMI_Current_Positions_Detailed
--******************************************************************************
--***1***
IF (@Product='ALL') BEGIN
	INSERT INTO #GMI_Current_Positions_Detailed
	(--Processing_Date,
	Account,
	Product,
	GMI_Description,
	PBS,
	Quantity,
	Trade_Price,
	Last_Closing_Price,
	Market_Price,
	GMI_Multiplier,
	OTE_SOD,
	OTE_Top_Day,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	GMI_Currency_Code,
	Expiration_Date,
	Source_Table)
	SELECT
	--Processing_Date,
	Account,
	Product,
	GMI_Description,
	PBS,
	Quantity,
	GMI_Trade_Price, --Trade_Price,
	GMI_Last_Closing_Price, --Last_Closing_Price,
	GMI_Current_Price, --Market_Price,
	GMI_Multiplier,
	OTE_SOD,
	OTE_Top_Day,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	GMI_Currency_Code,
	GMI_Expiration_Date, --Expiration_Date,
	Source_Table
	FROM [dbo].[GMI_Current_Positions_Detailed]
	WHERE (Account=@Account)
	AND (IN_GMI_Products_YN='Y')
--***1***
END
--***1***
ELSE BEGIN
		INSERT INTO #GMI_Current_Positions_Detailed
	(--Processing_Date,
	Account,
	Product,
	GMI_Description,
	PBS,
	Quantity,
	Trade_Price,
	Last_Closing_Price,
	Market_Price,
	GMI_Multiplier,
	OTE_SOD,
	OTE_Top_Day,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	GMI_Currency_Code,
	Expiration_Date,
	Source_Table)
	SELECT
	--Processing_Date,
	Account,
	Product,
	GMI_Description,
	PBS,
	Quantity,
	GMI_Trade_Price, --Trade_Price,
	GMI_Last_Closing_Price, --Last_Closing_Price,
	GMI_Current_Price, --Market_Price,
	GMI_Multiplier,
	OTE_SOD,
	OTE_Top_Day,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	GMI_Currency_Code,
	GMI_Expiration_Date, --Expiration_Date,
	Source_Table
	FROM [dbo].[GMI_Current_Positions_Detailed]
	WHERE (Account=@Account)
	AND (Product=@Product)
--***1***
END


--******************************************************************************
-- Generate Buy_Sell
--******************************************************************************
UPDATE #GMI_Current_Positions_Detailed
SET Buy_Sell =
	CASE PBS
		WHEN '1' THEN 'Buy'
		WHEN '2' THEN 'Sell'
		ELSE 'UNKNOWN'
	END

SELECT
--Processing_Date,
Account,
Product,
GMI_Description "Description",
Buy_Sell,
Quantity,
FORMAT(Trade_Price,'0.#########') "Trade_Price",
FORMAT(Last_Closing_Price,'0.#########') "Last_Closing_Price",
FORMAT(Market_Price,'0.#########') "Market_Price",
FORMAT(GMI_Multiplier,'0.#########') "GMI_Multiplier",
OTE_SOD,
OTE_Top_Day,
OTE_Current,
OTE_Change,
Market_Value,
Option_Unrealized_SOD,
Option_Unrealized_Top_Day,
Option_Unrealized_Current,
Option_Unrealized_Change,
GMI_Currency_Code,
Expiration_Date,
Source_Table
FROM #GMI_Current_Positions_Detailed
ORDER BY
--Processing_Date,
Account,
Product,
Trade_Price,
Buy_Sell

DROP TABLE #GMI_Current_Positions_Detailed

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Detailed] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO