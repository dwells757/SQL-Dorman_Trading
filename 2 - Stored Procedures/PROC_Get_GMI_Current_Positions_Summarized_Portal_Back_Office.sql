DROP PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Summarized_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Summarized_Portal_Back_Office]
																				--@Account VARCHAR(20)
																				@Group_ID VARCHAR(30)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Summarized_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

DECLARE
@Group_Type VARCHAR(30)

--SELECT @Account "@Account"

--******************************************************************************
-- Create #GMI_Current_Positions_Summarized
--******************************************************************************
CREATE TABLE #GMI_Current_Positions_Summarized
(Id INT IDENTITY(1,1),
--Processing_Date DATE,
--Account VARCHAR(20),
Group_ID VARCHAR(30),
Group_Type VARCHAR(30),
--GMI_Sub_Account VARCHAR(10),
--Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
--Buy_Sell VARCHAR(1),
Long_Quantity INT,
Short_Quantity INT,
NET_Quantity INT,
--GMI_Trade_Price NUMERIC(18,9),
--GMI_Multiplier NUMERIC(18,9),
Average_Trade_Price NUMERIC(18,9),
Market_Price NUMERIC(18,9),
OTE_SOD MONEY,
OTE_Current MONEY,
OTE_Change MONEY,
--Market_Value MONEY DEFAULT 0,
Market_Value MONEY,
Option_Unrealized_SOD MONEY,
Option_Unrealized_Current MONEY,
Option_Unrealized_Change MONEY,
Currency_Code VARCHAR(3),
Expiration_Date VARCHAR(8),
Snapshot_Time VARCHAR(30))

--******************************************************************************
-- Try to get @Group_Type
--******************************************************************************
SELECT @Group_Type=Group_Type
FROM [dbo].[Groups]
WHERE (Group_ID=@Group_ID)

--*********************************************************************************************************************************************************************************
-- START - Load #GMI_Current_Positions_Summarized
--*********************************************************************************************************************************************************************************
--***1***
IF (@Group_Type='Account') BEGIN

	INSERT INTO #GMI_Current_Positions_Summarized
	(--Processing_Date,
	--Account,
	Group_ID,
	Group_Type,
	Product,
	GMI_Description,
	Long_Quantity,
	Short_Quantity,
	NET_Quantity,
	Average_Trade_Price,
	Market_Price,
	OTE_SOD,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	Currency_Code,
	Expiration_Date,
	Snapshot_Time)
	SELECT
	--Processing_Date,
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
	Product,
	GMI_Description,
	Long_Quantity,
	Short_Quantity,
	NET_Quantity,
	Average_Trade_Price,
	Market_Price,
	OTE_SOD,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	Currency_Code,
	Expiration_Date,
	CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
	FROM [dbo].[GMI_Current_Positions_Summarized]
	WHERE (Account=@Group_ID)
	AND (Expiration_Date<>'')
	ORDER BY
	Account,
	Product

--***1***
END

--***2***
IF (@Group_Type='Related_Account') BEGIN

	INSERT INTO #GMI_Current_Positions_Summarized
	(--Processing_Date,
	--Account,
	Group_ID,
	Group_Type,
	Product,
	GMI_Description,
	Long_Quantity,
	Short_Quantity,
	NET_Quantity,
	Average_Trade_Price,
	Market_Price,
	OTE_SOD,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	Currency_Code,
	Expiration_Date,
	Snapshot_Time)
	SELECT
	--Processing_Date,
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
	Product,
	GMI_Description,
	Long_Quantity,
	Short_Quantity,
	NET_Quantity,
	Average_Trade_Price,
	Market_Price,
	OTE_SOD,
	OTE_Current,
	OTE_Change,
	Market_Value,
	Option_Unrealized_SOD,
	Option_Unrealized_Current,
	Option_Unrealized_Change,
	Currency_Code,
	Expiration_Date,
	CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
	FROM [dbo].[GMI_Current_Positions_Summarized]
	WHERE (Related_Account=@Group_ID)
	AND (Expiration_Date<>'')
	ORDER BY
	Account,
	Product

--***2***
END

--*********************************************************************************************************************************************************************************
-- END - Load #GMI_Current_Positions_Summarized
--*********************************************************************************************************************************************************************************

SELECT
Id,
--Processing_Date,
--Account,
Group_ID,
Group_Type,
Product,
GMI_Description "Description",
Long_Quantity,
Short_Quantity,
NET_Quantity,
--Market_Price,
FORMAT(Average_Trade_Price,'0.#########') "Average_Trade_Price",
FORMAT(Market_Price,'0.#########') "Market_Price",
CONVERT(NUMERIC(15,2),OTE_SOD) "OTE_SOD",
CONVERT(NUMERIC(15,2),OTE_Current) "OTE_Current",
CONVERT(NUMERIC(15,2),OTE_Change) "OTE_Change",
CONVERT(NUMERIC(15,2),Market_Value) "Market_Value",
CONVERT(NUMERIC(15,2),Option_Unrealized_SOD) "Option_Unrealized_SOD",
CONVERT(NUMERIC(15,2),Option_Unrealized_Current) "Option_Unrealized_Current",
CONVERT(NUMERIC(15,2),Option_Unrealized_Change) "Option_Unrealized_Change",
Currency_Code,
Expiration_Date,
Snapshot_Time
FROM #GMI_Current_Positions_Summarized
ORDER BY
--Processing_Date,
--Account,
Group_ID,
Product

DROP TABLE #GMI_Current_Positions_Summarized

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Summarized_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO