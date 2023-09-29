DROP PROCEDURE [dbo].[PROC_Load_GMI_Current_Positions_Detailed]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Current_Positions_Detailed]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Current_Positions_Detailed] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #GMI_Current_Positions_Detailed_1
--******************************************************************************
CREATE TABLE #GMI_Current_Positions_Detailed_1
(Account VARCHAR(20),
Related_Account VARCHAR(20),
Product VARCHAR(50),
GMI_Security_Type VARCHAR(10),
GMI_Description VARCHAR(30),
PBS VARCHAR(1),
--Buy_Sell VARCHAR(7) DEFAULT '',
Quantity NUMERIC(18),
GMI_Trade_Price NUMERIC(18,9),
GMI_Last_Closing_Price NUMERIC(18,9),
GMI_Current_Price NUMERIC(18,9),
GMI_Multiplier NUMERIC(18,9),
Trade_Date DATE,
OTE_SOD MONEY DEFAULT 0,
OTE_Top_Day MONEY DEFAULT 0,
OTE_Current MONEY DEFAULT 0,
OTE_Change MONEY DEFAULT 0,
Market_Value MONEY DEFAULT 0,
Option_Unrealized_SOD MONEY DEFAULT 0,
Option_Unrealized_Top_Day MONEY DEFAULT 0,
Option_Unrealized_Current MONEY DEFAULT 0,
Option_Unrealized_Change MONEY DEFAULT 0,
GMI_Currency_Code VARCHAR(3) DEFAULT '',
GMI_Expiration_Date VARCHAR(8) DEFAULT '',
Source_Table VARCHAR(100),
IN_GMI_Products_YN VARCHAR(1) DEFAULT 'N',
Account_Type VARCHAR(2),
Currency_Code VARCHAR(3) DEFAULT '',
Account_Balance MONEY DEFAULT 0,
LOV MONEY DEFAULT 0,
SOV MONEY DEFAULT 0)

PRINT '**************************************************************************'
PRINT ' Load #GMI_Current_Positions_Detailed'
PRINT ' with [dbo].[GMI_SOD_Positions_Detailed]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Current_Positions_Detailed_1
(Account,
Related_Account,
Product,
GMI_Security_Type,
GMI_Description,
PBS,
Quantity,
GMI_Trade_Price,
GMI_Last_Closing_Price,
GMI_Current_Price,
GMI_Multiplier,
Trade_Date,
OTE_SOD,
Option_Unrealized_SOD,
GMI_Currency_Code,
GMI_Expiration_Date,
Source_Table,
Account_Type,
Currency_Code)
SELECT
Account,
Related_Account,
Product,
MAX(GMI_Security_Type), --GMI_Security_Type,
MAX(GMI_Description),
PBS,
SUM(PQTY), --Quantity,
GMI_Trade_Price,
MAX(GMI_Last_Closing_Price), --GMI_Last_Closing_Price,
--NOTE:		We are using "GMI_Last_Closing_Price" as the default "GMI_Current_Price"
--			here in case the join to [dbo].[GMI_Products] fails
MAX(GMI_Last_Closing_Price), --GMI_Current_Price,
MAX(GMI_Multiplier), --GMI_Multiplier
PTDATE, --Trade_Date,
SUM(OTE), --OTE_SOD,
SUM(Option_Unrealized), --Option_Unrealized_SOD
MAX(GMI_Currency_Code), --GMI_Currency_Code,
MAX(Expiration_Date), --GMI_Expiration_Date,
'GMI_SOD_Positions_Detailed', --Source_Table,
MAX(Account_Type), --Account_Type,
MAX(Currency_Code) --Currency_Code
FROM [dbo].[GMI_SOD_Positions_Detailed]
GROUP BY
Account,
Related_Account, --WARNING: This may cause a PRIMARY KEY violation!!!
Product,
PBS,
GMI_Trade_Price,
PTDATE

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #GMI_Current_Positions_Detailed_1'
PRINT ' with [dbo].[Global_Risk_File_Current_Transactions]'
PRINT ' WHERE (IN_GMI_Contracts_SOD="Y")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Current_Positions_Detailed_1
(Account,
Related_Account,
Product,
GMI_Security_Type,
GMI_Description,
PBS,
Quantity,
GMI_Trade_Price,
GMI_Last_Closing_Price,
GMI_Current_Price,
GMI_Multiplier,
Trade_Date,
Source_Table,
Account_Type,
Currency_Code)
SELECT
Account,
Related_Account,
Product,
MAX(GMI_Security_Type), --GMI_Security_Type,
MAX(GMI_Description),
PBS,
SUM(PQTY), --Quantity,
GMI_Trade_Price,
--NOTE:		We are using (zero) as the default "GMI_Last_Closing_Price"
--			here in case the join to [dbo].[GMI_Products] fails
0, --GMI_Last_Closing_Price
--NOTE:		We are using "GMI_Trade_Price" as the default "GMI_Current_Price"
--			here in case the join to [dbo].[GMI_Products] fails
GMI_Trade_Price, --GMI_Current_Price,
MAX(GMI_Multiplier), --GMI_Multiplier
PSDATE, --Trade_Date,
'Global_Risk_File_Current_Transactions', --Source_Table,
MAX(PATYPE), --Account_Type,
MAX(Currency_Code) --Currency_Code
FROM [dbo].[Global_Risk_File_Current_Transactions]
WHERE (IN_GMI_Contracts_SOD='Y')
GROUP BY
Account,
Related_Account, --WARNING: This may cause a PRIMARY KEY violation!!!
Product,
PBS,
GMI_Trade_Price,
PSDATE

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Current_Positions_Detailed_1'
PRINT ' with [dbo].[GMI_Products]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
GMI_Security_Type=A.GMI_Security_Type,
GMI_Description=A.GMI_Description,
GMI_Last_Closing_Price=A.GMI_Last_Closing_Price,
GMI_Current_Price=A.GMI_Current_Price,
GMI_Multiplier=A.GMI_Multiplier,
GMI_Currency_Code=A.GMI_Currency_Code,
GMI_Expiration_Date=A.GMI_Expiration_Date,
IN_GMI_Products_YN='Y'
FROM [dbo].[GMI_Products] A
INNER JOIN #GMI_Current_Positions_Detailed_1 B
ON (A.Product=B.Product)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate OTE_Top_Day for "FUT"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET OTE_Top_Day =
	CASE Source_Table
		WHEN 'GMI_SOD_Positions_Detailed' THEN 
			CASE PBS
				WHEN '1' THEN (GMI_Current_Price - GMI_Last_Closing_Price) *  Quantity * GMI_Multiplier
				WHEN '2' THEN (GMI_Last_Closing_Price - GMI_Current_Price) *  Quantity * GMI_Multiplier
				ELSE 0
			END
		WHEN 'Global_Risk_File_Current_Transactions' THEN 
			CASE PBS
				WHEN '1' THEN (GMI_Current_Price - GMI_Trade_Price) *  Quantity * GMI_Multiplier
				WHEN '2' THEN (GMI_Trade_Price - GMI_Current_Price) *  Quantity * GMI_Multiplier
				ELSE 0
			END
		ELSE 0
	END
WHERE (GMI_Security_Type='FUT')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate OTE_Current for "FUT"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET OTE_Current = OTE_SOD + OTE_Top_Day
WHERE (GMI_Security_Type='FUT')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate OTE_Change for "FUT"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET OTE_Change = OTE_Current - OTE_SOD
WHERE (GMI_Security_Type='FUT')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Market_Value and Option_Unrealized_Top_Day for "OOF"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET 
Market_Value =
	CASE PBS
		WHEN '1' THEN GMI_Last_Closing_Price *  Quantity * GMI_Multiplier
		WHEN '2' THEN -1 * GMI_Last_Closing_Price *  Quantity * GMI_Multiplier
		ELSE 0
	END,
Option_Unrealized_Top_Day =
	CASE Source_Table
		WHEN 'GMI_SOD_Positions_Detailed' THEN 
			CASE PBS
				WHEN '1' THEN (GMI_Current_Price - GMI_Last_Closing_Price) *  Quantity * GMI_Multiplier
				WHEN '2' THEN (GMI_Last_Closing_Price - GMI_Current_Price) *  Quantity * GMI_Multiplier
				ELSE 0
			END
		WHEN 'Global_Risk_File_Current_Transactions' THEN 
			CASE PBS
				WHEN '1' THEN (GMI_Current_Price - GMI_Trade_Price) *  Quantity * GMI_Multiplier
				WHEN '2' THEN (GMI_Trade_Price - GMI_Current_Price) *  Quantity * GMI_Multiplier
				ELSE 0
			END
		ELSE 0
	END
WHERE (GMI_Security_Type='OOF')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Option_Unrealized_Current for "OOF"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET Option_Unrealized_Current = Option_Unrealized_SOD + Option_Unrealized_Top_Day
WHERE (GMI_Security_Type='OOF')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Option_Unrealized_Change for "OOF"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET Option_Unrealized_Change = Option_Unrealized_Current - Option_Unrealized_SOD
WHERE (GMI_Security_Type='OOF')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Market_Value for "TBILL"'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET Market_Value = -1 * Quantity * GMI_Multiplier * GMI_Last_Closing_Price
WHERE (GMI_Security_Type='TBILL')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate Account_Balance, LOV and SOV for "Top-Day" "OOF" records'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Current_Positions_Detailed_1
SET 
Account_Balance =
	CASE PBS
		WHEN '1' THEN -1 * GMI_Trade_Price *  Quantity * GMI_Multiplier
		WHEN '2' THEN GMI_Trade_Price *  Quantity * GMI_Multiplier
		ELSE 0
	END,
LOV =
	CASE PBS
		WHEN '1' THEN GMI_Current_Price *  Quantity * GMI_Multiplier
		ELSE 0
	END,
SOV =
	CASE PBS
		WHEN '2' THEN -1 * GMI_Current_Price *  Quantity * GMI_Multiplier
		ELSE 0
	END
WHERE (Source_Table='Global_Risk_File_Current_Transactions')
AND (GMI_Security_Type='OOF')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Current_Positions_Detailed]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Current_Positions_Detailed]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[GMI_Current_Positions_Detailed]'
PRINT ' with #GMI_Current_Positions_Detailed_2'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Current_Positions_Detailed]
(Account,
Related_Account,
Product,
GMI_Security_Type,
GMI_Description,
PBS,
--Buy_Sell,
Quantity,
GMI_Trade_Price,
GMI_Last_Closing_Price,
GMI_Current_Price,
GMI_Multiplier,
Trade_Date,
OTE_SOD,
OTE_Top_Day,
OTE_Current,
OTE_Change,
Market_Value,
Option_Unrealized_SOD,
Option_Unrealized_Top_Day,
Option_Unrealized_Current,
Option_Unrealized_Change,
GMI_Currency_Code,
GMI_Expiration_Date,
Source_Table,
IN_GMI_Products_YN,
Account_Type,
Currency_Code,
Account_Balance,
LOV,
SOV)
SELECT
Account,
Related_Account, --WARNING: This may cause a PRIMARY KEY violation!!!
Product,
GMI_Security_Type,
GMI_Description,
PBS,
--Buy_Sell,
Quantity,
GMI_Trade_Price,
GMI_Last_Closing_Price,
GMI_Current_Price,
GMI_Multiplier,
Trade_Date,
OTE_SOD,
OTE_Top_Day,
OTE_Current,
OTE_Change,
Market_Value,
Option_Unrealized_SOD,
Option_Unrealized_Top_Day,
Option_Unrealized_Current,
Option_Unrealized_Change,
GMI_Currency_Code,
GMI_Expiration_Date,
Source_Table,
IN_GMI_Products_YN,
Account_Type,
Currency_Code,
Account_Balance,
LOV,
SOV
FROM #GMI_Current_Positions_Detailed_1

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Current_Positions_Detailed_1

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Current_Positions_Detailed] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO