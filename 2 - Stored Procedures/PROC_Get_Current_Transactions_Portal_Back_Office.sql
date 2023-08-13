USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Transactions_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Transactions_Portal_Back_Office]
																	--@Account VARCHAR(20)
																	@Group_ID VARCHAR(30)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Transactions_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

DECLARE
@Group_Type VARCHAR(30)

--******************************************************************************
-- Create #GMI_Current_Positions_Detailed
--******************************************************************************
CREATE TABLE #GMI_Current_Positions_Detailed
(Id INT IDENTITY(1,1),
--Account VARCHAR(20),
Group_ID VARCHAR(30),
Group_Type VARCHAR(30),
PBS VARCHAR(1),
Quantity INT,
Product VARCHAR(50),
GMI_Security_Type VARCHAR(30),
GMI_Description VARCHAR(30),
GMI_Trade_Price NUMERIC(18,9),
GMI_Current_Price NUMERIC(18,9),
GMI_Multiplier NUMERIC(18,9),
Account_Balance MONEY,
OTE_Top_Day MONEY,
OTE_Current MONEY, --*******
LOV MONEY,
SOV MONEY,
Option_Unrealized_Top_Day MONEY,
Option_Unrealized_Current MONEY, --*******
Market_Value MONEY, --*******
Currency_Code VARCHAR(3),
Expiration_Date VARCHAR(8), --*******
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

	INSERT INTO #GMI_Current_Positions_Detailed
	(--Account,
	Group_ID,
	Group_Type,
	PBS,
	Quantity,
	Product,
	GMI_Security_Type,
	GMI_Description,
	GMI_Trade_Price,
	GMI_Current_Price,
	GMI_Multiplier,
	Account_Balance,
	OTE_Top_Day,
	OTE_Current, --*******
	LOV,
	SOV,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current, --*******
	Market_Value, --*******
	Currency_Code,
	Expiration_Date, --*******
	Trade_Date,
	Snapshot_Time)
	SELECT
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
	PBS,
	Quantity,
	Product,
	GMI_Security_Type,
	GMI_Description,
	GMI_Trade_Price,
	GMI_Current_Price,
	GMI_Multiplier,
	Account_Balance,
	OTE_Top_Day,
	OTE_Current, --*******
	LOV,
	SOV,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current, --*******
	Market_Value, --*******
	Currency_Code,
	GMI_Expiration_Date, --Expiration_Date, --*******
	CONVERT(VARCHAR,Trade_Date,112), --Trade_Date,
	CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
	FROM [dbo].[GMI_Current_Positions_Detailed]
	WHERE (Source_Table='Global_Risk_File_Current_Transactions')
	AND (Account=@Group_ID)
	ORDER BY
	GMI_Security_Type,
	Product,
	GMI_Trade_Price,
	PBS

--***1***
END

--***2***
IF (@Group_Type='Related_Account') BEGIN

	INSERT INTO #GMI_Current_Positions_Detailed
	(--Account,
	Group_ID,
	Group_Type,
	PBS,
	Quantity,
	Product,
	GMI_Security_Type,
	GMI_Description,
	GMI_Trade_Price,
	GMI_Current_Price,
	GMI_Multiplier,
	Account_Balance,
	OTE_Top_Day,
	OTE_Current, --*******
	LOV,
	SOV,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current, --*******
	Market_Value, --*******
	Currency_Code,
	Expiration_Date, --*******
	Trade_Date,
	Snapshot_Time)
	SELECT
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
	PBS,
	Quantity,
	Product,
	GMI_Security_Type,
	GMI_Description,
	GMI_Trade_Price,
	GMI_Current_Price,
	GMI_Multiplier,
	Account_Balance,
	OTE_Top_Day,
	OTE_Current, --*******
	LOV,
	SOV,
	Option_Unrealized_Top_Day,
	Option_Unrealized_Current, --*******
	Market_Value, --*******
	Currency_Code,
	GMI_Expiration_Date, --Expiration_Date, --*******
	CONVERT(VARCHAR,Trade_Date,112), --Trade_Date,
	CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
	FROM [dbo].[GMI_Current_Positions_Detailed]
	WHERE (Source_Table='Global_Risk_File_Current_Transactions')
	AND (Related_Account=@Group_ID)
	ORDER BY
	GMI_Security_Type,
	Product,
	GMI_Trade_Price,
	PBS

--***2***
END

SELECT
Id,
--Account,
Group_ID,
Group_Type,
PBS,
Quantity,
GMI_Security_Type "Security_Type",
GMI_Description "Description",
FORMAT(GMI_Trade_Price,'0.#########') "Trade_Price",
FORMAT(GMI_Current_Price,'0.#########') "Current_Price",
FORMAT(GMI_Multiplier,'0.#########') "Multiplier",
CONVERT(NUMERIC(15,2),Account_Balance) "Account_Balance",
CONVERT(NUMERIC(15,2),OTE_Top_Day) "OTE_Top_Day",
CONVERT(NUMERIC(15,2),OTE_Current) "OTE_Current", --*******
CONVERT(NUMERIC(15,2),LOV) "LOV",
CONVERT(NUMERIC(15,2),SOV) "SOV",
CONVERT(NUMERIC(15,2),Option_Unrealized_Top_Day) "Option_Unrealized_Top_Day",
CONVERT(NUMERIC(15,2),Option_Unrealized_Current) "Option_Unrealized_Current", --*******
CONVERT(NUMERIC(15,2),Market_Value) "Market_Value", --*******
Currency_Code,
Expiration_Date, --*******
Trade_Date,
Snapshot_Time
FROM #GMI_Current_Positions_Detailed
ORDER BY Id
--GMI_Security_Type,
--Product,
--GMI_Trade_Price,
--PBS

DROP TABLE #GMI_Current_Positions_Detailed

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Transactions_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO