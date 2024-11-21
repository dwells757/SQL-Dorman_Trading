DROP PROCEDURE [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Options_Contracts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Options_Contracts]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Options_Contracts] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--****************************************************************************************************
-- Create #CQG_Options_Contracts
--****************************************************************************************************
CREATE TABLE #CQG_Options_Contracts
(Product VARCHAR(50) DEFAULT '',
GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
GMI_Expiry VARCHAR(8),
GMI_Strike_Price NUMERIC(19,9),
GMI_Put_Call VARCHAR(1),
ScaledPrice VARCHAR(20),
CQG_Price NUMERIC(18,9),
IN_GMI_Products_YN VARCHAR(1) DEFAULT 'N')

PRINT '**************************************************************************'
PRINT ' Load #CQG_Options_Contracts'
PRINT ' with [dbo].[CQG_Options_Contracts]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #CQG_Options_Contracts
(GMI_Exchange,
GMI_Symbol,
GMI_Expiry,
GMI_Strike_Price,
GMI_Put_Call,
ScaledPrice,
CQG_Price)
SELECT
GMI_Exchange,
GMI_Symbol,
GMI_Expiry,
CONVERT(NUMERIC(18,9),GMI_Strike_Price), --GMI_Strike_Price
GMI_Put_Call,
ScaledPrice,
CONVERT(NUMERIC(18,9),CQG_Price) --CQG_Price
FROM [dbo].[CQG_Options_Contracts]
WHERE (ISNUMERIC(GMI_Strike_Price)=1)
AND (ISNUMERIC(CQG_Price)=1)

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Product'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #CQG_Options_Contracts
SET Product = 
RTRIM(GMI_Exchange) +
'/' +
RTRIM(GMI_Symbol) +
'/' +
RTRIM(GMI_Expiry) + --Expiry
'/' +
FORMAT(GMI_Strike_Price,'0.#########') +
'/' +
GMI_Put_Call

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update IN_GMI_Products_YN'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET IN_GMI_Products_YN='Y'
FROM #CQG_Options_Contracts A
INNER JOIN [dbo].[GMI_Products] B
ON (A.Product=B.Product)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

SELECT *
FROM #CQG_Options_Contracts
ORDER BY
GMI_Exchange,
GMI_Symbol,
GMI_Expiry,
GMI_Strike_Price,
GMI_Put_Call

PRINT '**************************************************************************'
PRINT ' Update [dbo].[GMI_Products]'
PRINT ' with #CQG_Options_Contracts'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
GMI_Current_Price=A.CQG_Price,
Price_Updated_YN='Y',
Price_Update_Source='CQG',
Price_Update_Time=GETDATE()
FROM #CQG_Options_Contracts A
INNER JOIN [dbo].[GMI_Products] B
ON (A.Product=B.Product)
WHERE (A.ScaledPrice<>'9999999')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #CQG_Options_Contracts

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Options_Contracts] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO