USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_GMI_Products]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Products]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Products] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************
-- Create #GMI_SOD_Positions_Detailed
--**************************************************************
CREATE TABLE #GMI_SOD_Positions_Detailed
(Product VARCHAR(50),
GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
PCTYM VARCHAR(6),
PSBCUS VARCHAR(2),
GMI_Expiry VARCHAR(8) DEFAULT '',
GMI_Strike_Price NUMERIC(18,9),
GMI_Put_Call VARCHAR(8),
GMI_Expiration_Date VARCHAR(8),
GMI_Description VARCHAR(30),
PSTYPE VARCHAR(1),
PSUBTY VARCHAR(1),
GMI_Security_Type VARCHAR(10) DEFAULT 'UNDEFINED',
GMI_Multiplier NUMERIC(18,9),
GMI_Currency_Code VARCHAR(3),
GMI_Last_Closing_Price NUMERIC(18,9),
GMI_Current_Price NUMERIC(18,9),)

PRINT '**************************************************************************'
PRINT ' Load #GMI_SOD_Positions_Detailed'
PRINT ' with [dbo].[GMI_SOD_Positions_Detailed]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_SOD_Positions_Detailed
(Product,
GMI_Exchange,
GMI_Symbol,
PCTYM,
PSBCUS,
GMI_Strike_Price,
GMI_Put_Call,
GMI_Expiration_Date,
GMI_Description,
PSTYPE,
PSUBTY,
GMI_Multiplier,
GMI_Currency_Code,
GMI_Last_Closing_Price,
GMI_Current_Price)
SELECT
Product,
PEXCH, --GMI_Exchange,
PFC, --GMI_Symbol,
PCTYM,
PSBCUS,
PSTRIK, --GMI_Strike_Price,
PSUBTY, --GMI_Put_Call,
Expiration_Date, --GMI_Expiration_Date,
GMI_Description,
PSTYPE,
PSUBTY,
GMI_Multiplier,
GMI_Currency_Code,
GMI_Last_Closing_Price,
GMI_Last_Closing_Price --GMI_Current_Price
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (PSTYPE<>'')
GROUP BY
Product,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK, --GMI_Strike_Price,
PSUBTY,
Expiration_Date,
GMI_Description,
PSTYPE,
PSUBTY,
GMI_Multiplier,
GMI_Currency_Code,
GMI_Last_Closing_Price

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' UPDATE #GMI_SOD_Positions_Detailed'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_SOD_Positions_Detailed
SET 
GMI_Expiry = RTRIM(PCTYM) + RTRIM(PSBCUS),
GMI_Security_Type =
	CASE PSTYPE
		WHEN 'B' THEN 'TBILL'
		WHEN 'F' THEN
			CASE PSUBTY
				WHEN '' THEN 'FUT'
				WHEN 'C' THEN 'OOF'
				WHEN 'P' THEN 'OOF'
				ELSE GMI_Security_Type --Leave as-is
			END
		ELSE GMI_Security_Type --Leave as-is
	END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--SELECT *
--FROM #GMI_SOD_Positions_Detailed
--ORDER BY Product

--**************************************************************
-- Create #GMI_Products
--**************************************************************
CREATE TABLE #GMI_Products
(Product VARCHAR(50),
GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
GMI_Expiry VARCHAR(8),
GMI_Strike_Price NUMERIC(18,9),
GMI_Put_Call VARCHAR(8),
GMI_Expiration_Date VARCHAR(8),
GMI_Description VARCHAR(30),
GMI_Security_Type VARCHAR(10),
GMI_Multiplier NUMERIC(18,9),
GMI_Currency_Code VARCHAR(3),
GMI_Last_Closing_Price NUMERIC(18,9),
GMI_Current_Price NUMERIC(18,9))

PRINT '**************************************************************************'
PRINT ' Load #GMI_Products'
PRINT ' with #GMI_SOD_Positions_Detailed'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Products
(Product,
GMI_Exchange,
GMI_Symbol,
GMI_Expiry,
GMI_Strike_Price,
GMI_Put_Call,
GMI_Expiration_Date,
GMI_Description,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code,
GMI_Last_Closing_Price,
GMI_Current_Price)
SELECT
Product,
MAX(GMI_Exchange),
MAX(GMI_Symbol),
MAX(GMI_Expiry),
MAX(GMI_Strike_Price),
MAX(GMI_Put_Call),
MAX(GMI_Expiration_Date),
MAX(GMI_Description),
MAX(GMI_Security_Type),
MAX(GMI_Multiplier),
MAX(GMI_Currency_Code),
MAX(GMI_Last_Closing_Price),
MAX(GMI_Current_Price)
FROM #GMI_SOD_Positions_Detailed
GROUP BY Product

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_SOD_Positions_Detailed

--SELECT *
--FROM #GMI_Products
--ORDER BY Product

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Products]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Products]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_Products]'
PRINT ' with #GMI_Products'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Products]
(Product,
GMI_Exchange,
GMI_Symbol,
GMI_Expiry,
GMI_Strike_Price,
GMI_Put_Call,
GMI_Expiration_Date,
GMI_Description,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code,
GMI_Last_Closing_Price,
GMI_Current_Price)
SELECT
Product,
GMI_Exchange,
GMI_Symbol,
GMI_Expiry,
GMI_Strike_Price,
GMI_Put_Call,
GMI_Expiration_Date,
GMI_Description,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code,
GMI_Last_Closing_Price,
GMI_Current_Price
FROM #GMI_Products

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Products

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Products] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO