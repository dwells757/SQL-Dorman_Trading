DROP PROCEDURE [dbo].[PROC_Update_GMI_Current_Price]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Update_GMI_Current_Price]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMI_Current_Price] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************
-- Create #MAX_PRECNO
--**************************************************************
CREATE TABLE #MAX_PRECNO
(Product VARCHAR(50),
MAX_PRECNO INT)

PRINT '**************************************************************************'
PRINT ' Load #MAX_PRECNO'
PRINT ' with [dbo].[Global_Risk_File_Current_Transactions]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #MAX_PRECNO
(Product,
MAX_PRECNO)
SELECT
[Product],
MAX(PRECNO) --MAX_PRECNO
FROM [dbo].[Global_Risk_File_Current_Transactions]
GROUP BY [Product]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

--**************************************************************
-- Create #Global_Risk_File_Current_Transactions
--**************************************************************
CREATE TABLE #Global_Risk_File_Current_Transactions
(Product VARCHAR(50),
GMI_Current_Price NUMERIC(18,9))

PRINT '**************************************************************************'
PRINT ' Load #Global_Risk_File_Current_Transactions'
PRINT ' with #MAX_PRECNO'
PRINT ' and [dbo].[Global_Risk_File_Current_Transactions]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Global_Risk_File_Current_Transactions
([Product],
GMI_Current_Price)
SELECT
B.[Product],
B.GMI_Trade_Price --GMI_Current_Price
FROM #MAX_PRECNO A
INNER JOIN [dbo].[Global_Risk_File_Current_Transactions] B
ON (A.MAX_PRECNO=B.PRECNO)

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #MAX_PRECNO

PRINT '**************************************************************************'
PRINT ' Update [dbo].[GMI_Products]'
PRINT ' with #Global_Risk_File_Current_Transactions'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
GMI_Current_Price=A.GMI_Current_Price,
Price_Updated_YN='Y',
Price_Update_Time=GETDATE()
FROM #Global_Risk_File_Current_Transactions A
INNER JOIN [dbo].[GMI_Products] B
ON (A.Product=B.Product)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #Global_Risk_File_Current_Transactions

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMI_Current_Price] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO