DROP PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Detailed_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Detailed_Portal_Back_Office]
																			--@Account VARCHAR(20),
																			@Group_ID VARCHAR(30),
																			@Product VARCHAR(50)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Detailed_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

DECLARE
@Group_Type VARCHAR(30)

--******************************************************************************
-- Create #GMI_Current_Positions_Detailed
--******************************************************************************
CREATE TABLE #GMI_Current_Positions_Detailed
(Id INT IDENTITY(1,1),
--Processing_Date DATE,
--Account VARCHAR(20),
Group_ID VARCHAR(30),
Group_Type VARCHAR(30),
--GMI_Sub_Account VARCHAR(10),
--Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
PBS VARCHAR(1),
Buy_Sell VARCHAR(7) DEFAULT '',
Quantity INT,
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
Currency_Code VARCHAR(3),
Expiration_Date VARCHAR(8),
Trade_Date VARCHAR(8),
Snapshot_Time VARCHAR(30))

--******************************************************************************
-- Try to get @Group_Type
--******************************************************************************
SELECT @Group_Type=Group_Type
FROM [dbo].[Groups]
WHERE (Group_ID=@Group_ID)

--*********************************************************************************************************************************************************************************
-- START - Load #GMI_Current_Positions_Detailed
--*********************************************************************************************************************************************************************************
--***1***
IF (@Group_Type='Account') BEGIN

	--***2***
	IF (@Product='ALL') BEGIN

		INSERT INTO #GMI_Current_Positions_Detailed
		(--Processing_Date,
		--Account,
		Group_ID,
		Group_Type,
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
		Currency_Code,
		Expiration_Date,
		Trade_Date,
		Snapshot_Time)
		SELECT
		--Processing_Date,
		--Account,
		@Group_ID, --Group_ID,
		@Group_Type, --Group_Type,
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
		Currency_Code,
		GMI_Expiration_Date, --Expiration_Date,
		CONVERT(VARCHAR,Trade_Date,112), --Trade_Date,
		CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
		FROM [dbo].[GMI_Current_Positions_Detailed]
		WHERE (Account=@Group_ID)
		ORDER BY
		Account,
		Product,
		GMI_Trade_Price,
		PBS,
		Source_Table

	--***2***
	END
	--***2***
	ELSE BEGIN
	
		INSERT INTO #GMI_Current_Positions_Detailed
		(--Processing_Date,
		--Account,
		Group_ID,
		Group_Type,
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
		Currency_Code,
		Expiration_Date,
		Trade_Date,
		Snapshot_Time)
		SELECT
		--Processing_Date,
		--Account,
		@Group_ID, --Group_ID,
		@Group_Type, --Group_Type,
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
		Currency_Code,
		GMI_Expiration_Date, --Expiration_Date,
		CONVERT(VARCHAR,Trade_Date,112), --Trade_Date,
		CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
		FROM [dbo].[GMI_Current_Positions_Detailed]
		WHERE (Account=@Group_ID)
		AND (Product=@Product)
		ORDER BY
		Account,
		Product,
		GMI_Trade_Price,
		PBS,
		Source_Table

	--***2***
	END
--***1***
END

--***2***
IF (@Group_Type='Related_Account') BEGIN

	--***3***
	IF (@Product='ALL') BEGIN

		INSERT INTO #GMI_Current_Positions_Detailed
		(--Processing_Date,
		--Account,
		Group_ID,
		Group_Type,
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
		Currency_Code,
		Expiration_Date,
		Trade_Date,
		Snapshot_Time)
		SELECT
		--Processing_Date,
		--Account,
		@Group_ID, --Group_ID,
		@Group_Type, --Group_Type,
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
		Currency_Code,
		GMI_Expiration_Date, --Expiration_Date,
		CONVERT(VARCHAR,Trade_Date,112), --Trade_Date,
		CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
		FROM [dbo].[GMI_Current_Positions_Detailed]
		WHERE (Related_Account=@Group_ID)
		ORDER BY
		Account,
		Product,
		GMI_Trade_Price,
		PBS,
		Source_Table

	--***3***
	END
	--***3***
	ELSE BEGIN

		INSERT INTO #GMI_Current_Positions_Detailed
		(--Processing_Date,
		--Account,
		Group_ID,
		Group_Type,
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
		Currency_Code,
		Expiration_Date,
		Trade_Date,
		Snapshot_Time)
		SELECT
		--Processing_Date,
		--Account,
		@Group_ID, --Group_ID,
		@Group_Type, --Group_Type,
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
		Currency_Code,
		GMI_Expiration_Date, --Expiration_Date,
		CONVERT(VARCHAR,Trade_Date,112), --Trade_Date,
		CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
		FROM [dbo].[GMI_Current_Positions_Detailed]
		WHERE (Related_Account=@Group_ID)
		AND (Product=@Product)
		ORDER BY
		Account,
		Product,
		GMI_Trade_Price,
		PBS,
		Source_Table

	--***3***
	END
--***2***
END
--*********************************************************************************************************************************************************************************
-- END - Load #GMI_Current_Positions_Detailed
--*********************************************************************************************************************************************************************************

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
Id,
--Processing_Date,
--Account,
Group_ID,
Group_Type,
Product,
GMI_Description "Description",
Buy_Sell "Buy_Sell",
Quantity,
FORMAT(Trade_Price,'0.#########') "Trade_Price",
FORMAT(Last_Closing_Price,'0.#########') "Last_Closing_Price",
FORMAT(Market_Price,'0.#########') "Market_Price",
FORMAT(GMI_Multiplier,'0.#########') "Multiplier",
CONVERT(NUMERIC(15,2),OTE_SOD) "OTE_SOD",
CONVERT(NUMERIC(15,2),OTE_Top_Day) "OTE_Top_Day",
CONVERT(NUMERIC(15,2),OTE_Current) "OTE_Current",
CONVERT(NUMERIC(15,2),OTE_Change) "OTE_Change",
CONVERT(NUMERIC(15,2),Market_Value) "Market_Value",
CONVERT(NUMERIC(15,2),Option_Unrealized_SOD) "Option_Unrealized_SOD",
CONVERT(NUMERIC(15,2),Option_Unrealized_Top_Day) "Option_Unrealized_Top_Day",
CONVERT(NUMERIC(15,2),Option_Unrealized_Current) "Option_Unrealized_Current",
CONVERT(NUMERIC(15,2),Option_Unrealized_Change) "Option_Unrealized_Change",
Currency_Code,
Expiration_Date,
Trade_Date,
Snapshot_Time
FROM #GMI_Current_Positions_Detailed
ORDER BY
--Account,
Group_ID,
Product,
Trade_Price,
Buy_Sell

DROP TABLE #GMI_Current_Positions_Detailed

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Detailed_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO