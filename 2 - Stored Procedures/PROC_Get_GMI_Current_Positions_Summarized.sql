USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Summarized]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Current_Positions_Summarized]
														@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Summarized] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--SELECT @Account "@Account"

--******************************************************************************
-- Create #GMI_Current_Positions_Summarized
--******************************************************************************
CREATE TABLE #GMI_Current_Positions_Summarized
(--Processing_Date DATE,
Account VARCHAR(20),
--GMI_Sub_Account VARCHAR(10),
--Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
--Buy_Sell VARCHAR(1),
Long_Quantity NUMERIC(18),
Short_Quantity NUMERIC(18),
NET_Quantity NUMERIC(18),
--GMI_Trade_Price NUMERIC(18,9),
--GMI_Multiplier NUMERIC(18,9),
Market_Price NUMERIC(18,9),
OTE_SOD MONEY,
OTE_Current MONEY,
OTE_Change MONEY,
--Market_Value MONEY DEFAULT 0,
Market_Value MONEY,
Option_Unrealized_SOD MONEY,
Option_Unrealized_Current MONEY,
Option_Unrealized_Change MONEY,
GMI_Currency_Code VARCHAR(3),
Expiration_Date VARCHAR(8))

--******************************************************************************
-- Load #GMI_Current_Positions_Summarized
--******************************************************************************
INSERT INTO #GMI_Current_Positions_Summarized
(--Processing_Date,
Account,
Product,
GMI_Description,
Long_Quantity,
Short_Quantity,
NET_Quantity,
Market_Price,
OTE_SOD,
OTE_Current,
OTE_Change,
Market_Value,
Option_Unrealized_SOD,
Option_Unrealized_Current,
Option_Unrealized_Change,
GMI_Currency_Code,
Expiration_Date)
SELECT
--Processing_Date,
Account,
Product,
GMI_Description,
Long_Quantity,
Short_Quantity,
NET_Quantity,
Market_Price,
OTE_SOD,
OTE_Current,
OTE_Change,
Market_Value,
Option_Unrealized_SOD,
Option_Unrealized_Current,
Option_Unrealized_Change,
GMI_Currency_Code,
Expiration_Date
FROM [dbo].[GMI_Current_Positions_Summarized]
WHERE (Account=@Account)
AND (Expiration_Date<>'')

SELECT
--Processing_Date,
Account,
Product,
GMI_Description "Description",
Long_Quantity,
Short_Quantity,
NET_Quantity,
--Market_Price,
FORMAT(Market_Price,'0.#########') "Market_Price",
OTE_SOD,
OTE_Current,
OTE_Change,
Market_Value,
Option_Unrealized_SOD,
Option_Unrealized_Current,
Option_Unrealized_Change,
GMI_Currency_Code,
Expiration_Date
FROM #GMI_Current_Positions_Summarized
ORDER BY
--Processing_Date,
Account,
Product

DROP TABLE #GMI_Current_Positions_Summarized

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Current_Positions_Summarized] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO