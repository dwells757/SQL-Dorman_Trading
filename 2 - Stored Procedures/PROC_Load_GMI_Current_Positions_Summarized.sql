USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_GMI_Current_Positions_Summarized]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Current_Positions_Summarized]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Current_Positions_Summarized] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Current_Positions_Summarized
--******************************************************************************
CREATE TABLE #GMI_Current_Positions_Summarized
(Account VARCHAR(20),
Product VARCHAR(50),
GMI_Description VARCHAR(30),
Long_Quantity NUMERIC(18),
Short_Quantity NUMERIC(18),
NET_Quantity NUMERIC(18) DEFAULT 0,
Market_Price NUMERIC(18,9),
OTE_SOD MONEY,
OTE_Current MONEY,
OTE_Change MONEY,
Market_Value MONEY,
Option_Unrealized_SOD MONEY,
Option_Unrealized_Current MONEY,
Option_Unrealized_Change MONEY,
Currency_Code VARCHAR(3),
Expiration_Date VARCHAR(8))

PRINT '**************************************************************************'
PRINT ' Load #GMI_Current_Positions_Summarized'
PRINT ' with [dbo].[GMI_Current_Positions_Detailed]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Current_Positions_Summarized
(Account,
Product,
GMI_Description,
Long_Quantity,
Short_Quantity,
Market_Price,
OTE_SOD,
OTE_Current,
OTE_Change,
Market_Value,
Option_Unrealized_SOD,
Option_Unrealized_Current,
Option_Unrealized_Change,
Currency_Code,
Expiration_Date)
SELECT
Account,
Product,
MAX(GMI_Description),
SUM(CASE PBS
	WHEN '1' THEN Quantity
	ELSE 0
END), --Long_Quantity,
SUM(CASE PBS
	WHEN '2' THEN Quantity
	ELSE 0
END), --Short_Quantity,
MAX(GMI_Current_Price), --Market_Price,
SUM(OTE_SOD), --OTE_SOD,
SUM(OTE_Current), --OTE_Current,
SUM(OTE_Change), --OTE_Change,
SUM(Market_Value), --Market_Value
SUM(Option_Unrealized_SOD), --Option_Unrealized_SOD
SUM(Option_Unrealized_Current), --Option_Unrealized_Current
SUM(Option_Unrealized_Change), --Option_Unrealized_Change
MAX(Currency_Code), --GMI_Currency_Code,
MAX(GMI_Expiration_Date) --Expiration_Date
FROM [dbo].[GMI_Current_Positions_Detailed]
GROUP BY
Account,
Product

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate NET_Quantity'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Summarized
SET NET_Quantity = Long_Quantity  - Short_Quantity

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Current_Positions_Summarized]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Current_Positions_Summarized]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[GMI_Current_Positions_Summarized]'
PRINT ' with #GMI_Current_Positions_Summarized'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Current_Positions_Summarized]
(Account,
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
Currency_Code,
Expiration_Date)
SELECT
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
Currency_Code,
Expiration_Date
FROM #GMI_Current_Positions_Summarized

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Current_Positions_Summarized

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Current_Positions_Summarized] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO