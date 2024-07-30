DROP PROCEDURE [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Contracts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Contracts]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Contracts] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--****************************************************************************************************
-- Create #CQG_Contracts
--****************************************************************************************************
CREATE TABLE #CQG_Contracts
(Product VARCHAR(50) DEFAULT '',
PEXCH VARCHAR(2),
PFC VARCHAR(2),
PCTYM VARCHAR(8),
ScaledPrice VARCHAR(20),
CQG_Price NUMERIC(18,9))

PRINT '**************************************************************************'
PRINT ' Load #CQG_Contracts'
PRINT ' with [dbo].[CQG_Contracts]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #CQG_Contracts
(PEXCH,
PFC,
PCTYM,
ScaledPrice,
CQG_Price)
SELECT
PEXCH,
PFC,
PCTYM,
ScaledPrice,
CONVERT(NUMERIC(18,9),CQG_Price) --CQG_Price
FROM [dbo].[CQG_Contracts]
WHERE (ISNUMERIC(CQG_Price)=1)

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Product'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #CQG_Contracts
SET Product = RTRIM(PEXCH) + '/' + RTRIM(PFC) + '/' + RTRIM(PCTYM)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

SELECT *
FROM #CQG_Contracts

PRINT '**************************************************************************'
PRINT ' Update [dbo].[GMI_Products]'
PRINT ' with #CQG_Contracts'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
GMI_Current_Price=A.CQG_Price,
Price_Updated_YN='Y',
Price_Update_Time=GETDATE()
FROM #CQG_Contracts A
INNER JOIN [dbo].[GMI_Products] B
ON (A.Product=B.Product)
WHERE (A.ScaledPrice<>'9999999')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #CQG_Contracts

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMI_Current_Price_With_CQG_Contracts] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO