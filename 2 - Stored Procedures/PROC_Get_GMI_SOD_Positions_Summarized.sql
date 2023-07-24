USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_SOD_Positions_Summarized]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_SOD_Positions_Summarized]
														@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_SOD_Positions_Summarized] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--SELECT @Account "@Account"

--******************************************************************************
-- Create #GMI_SOD_Positions_Summarized
--******************************************************************************
CREATE TABLE #GMI_SOD_Positions_Summarized
(Processing_Date DATE,
Account VARCHAR(20),
--GMI_Sub_Account VARCHAR(10),
--Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
--Buy_Sell VARCHAR(1),
Long_Quantity NUMERIC(18),
Short_Quantity NUMERIC(18),
NET_Quantity NUMERIC(18) DEFAULT 0,
--GMI_Trade_Price NUMERIC(18,9),
--GMI_Multiplier NUMERIC(18,9),
Market_Price NUMERIC(18,9),
OTE MONEY,
--Market_Value MONEY DEFAULT 0,
Expiration_Date VARCHAR(8))

--******************************************************************************
-- Load #GMI_SOD_Positions_Summarized
--******************************************************************************
INSERT INTO #GMI_SOD_Positions_Summarized
(Processing_Date,
Account,
Product,
GMI_Description,
Long_Quantity,
Short_Quantity,
Market_Price,
OTE,
Expiration_Date)
SELECT
Processing_Date,
Account,
Product,
MAX(GMI_Description),
SUM(CASE PBS
	WHEN '1' THEN PQTY
	ELSE 0
END), --Long_Quantity,
SUM(CASE PBS
	WHEN '2' THEN PQTY
	ELSE 0
END), --Short_Quantity,
MAX(GMI_Last_Closing_Price), --Market_Price,
SUM(OTE), --OTE,
MAX(Expiration_Date) --Expiration_Date
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (Account=@Account)
GROUP BY
Processing_Date,
Account,
Product

--******************************************************************************
-- Generate NET_Quantity
--******************************************************************************
UPDATE #GMI_SOD_Positions_Summarized
SET NET_Quantity = Long_Quantity  - Short_Quantity

SELECT
Processing_Date,
Account,
Product,
GMI_Description "Description",
Long_Quantity,
Short_Quantity,
NET_Quantity,
--Market_Price,
FORMAT(Market_Price,'0.#########') "Market_Price",
OTE,
Expiration_Date
FROM #GMI_SOD_Positions_Summarized
ORDER BY
Processing_Date,
Account,
Product

DROP TABLE #GMI_SOD_Positions_Summarized

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_SOD_Positions_Summarized] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO