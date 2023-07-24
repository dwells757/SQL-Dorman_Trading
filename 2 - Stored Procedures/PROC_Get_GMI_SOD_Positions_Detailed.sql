USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_SOD_Positions_Detailed]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_SOD_Positions_Detailed]
														@Account VARCHAR(20),
														@Product VARCHAR(50)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_SOD_Positions_Detailed] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_SOD_Positions_Detailed
--******************************************************************************
CREATE TABLE #GMI_SOD_Positions_Detailed
(Processing_Date DATE,
Account VARCHAR(20),
--GMI_Sub_Account VARCHAR(10),
--Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
PBS VARCHAR(1),
Buy_Sell VARCHAR(7) DEFAULT '',
Quantity NUMERIC(18),
Trade_Price NUMERIC(18,9),
--GMI_Multiplier NUMERIC(18,9),
Market_Price NUMERIC(18,9),
OTE MONEY,
--Market_Value MONEY DEFAULT 0,
Expiration_Date VARCHAR(8))

--******************************************************************************
-- Load #GMI_SOD_Positions
--******************************************************************************
INSERT INTO #GMI_SOD_Positions_Detailed
(Processing_Date,
Account,
Product,
GMI_Description,
PBS,
Quantity,
Trade_Price,
Market_Price,
OTE,
Expiration_Date)
SELECT
Processing_Date,
Account,
Product,
MAX(GMI_Description), --GMI_Description
PBS,
SUM(PQTY), --Quantity,
GMI_Trade_Price, --Trade_Price
MAX(GMI_Last_Closing_Price), --Market_Price
SUM(OTE), --OTE,
MAX(Expiration_Date) --Expiration_Date
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (Account=@Account)
AND (Product=@Product)
GROUP BY
Processing_Date,
Account,
Product,
PBS,
GMI_Trade_Price

--******************************************************************************
-- Generate Buy_Sell
--******************************************************************************
UPDATE #GMI_SOD_Positions_Detailed
SET Buy_Sell =
	CASE PBS
		WHEN '1' THEN 'Buy'
		WHEN '2' THEN 'Sell'
		ELSE 'UNKNOWN'
	END

SELECT
Processing_Date,
Account,
Product,
GMI_Description "Description",
Buy_Sell,
Quantity,
FORMAT(Trade_Price,'0.#########') "Trade_Price",
FORMAT(Market_Price,'0.#########') "Market_Price",
OTE,
Expiration_Date
FROM #GMI_SOD_Positions_Detailed
ORDER BY
Processing_Date,
Account,
Product,
Trade_Price,
Buy_Sell

DROP TABLE #GMI_SOD_Positions_Detailed

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_SOD_Positions_Detailed] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO