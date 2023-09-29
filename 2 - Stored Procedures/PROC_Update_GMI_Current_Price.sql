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
-- Create #MAX_Record_Numbers
--**************************************************************
CREATE TABLE #MAX_Record_Numbers
(Product VARCHAR(50),
MAX_Record_Number INT)

PRINT '**************************************************************************'
PRINT ' Load #MAX_Record_Numbers'
PRINT ' with [dbo].[Global_Risk_File_Current_Transactions]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #MAX_Record_Numbers
(Product,
MAX_Record_Number)
SELECT
Product,
MAX(Record_Number) --MAX_Record_Number
FROM [dbo].[Global_Risk_File_Current_Transactions]
GROUP BY Product

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
PRINT ' with #MAX_Record_Numbers'
PRINT ' and [dbo].[Global_Risk_File_Current_Transactions]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Global_Risk_File_Current_Transactions
(Product,
GMI_Current_Price)
SELECT
B.Product,
B.GMI_Trade_Price --GMI_Current_Price
FROM #MAX_Record_Numbers A
INNER JOIN [dbo].[Global_Risk_File_Current_Transactions] B
ON (A.MAX_Record_Number=B.Record_Number)

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #MAX_Record_Numbers

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