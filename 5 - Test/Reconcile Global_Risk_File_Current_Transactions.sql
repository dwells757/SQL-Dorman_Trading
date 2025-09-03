USE [GMIDATA]
GO

SET NOCOUNT ON

--*******************************************************************************************
-- Create #OLD
--*******************************************************************************************
CREATE TABLE #OLD
(Trade_Date DATE,
Account VARCHAR(20),
Related_Account VARCHAR(20),
[Product] VARCHAR(50),
PBS VARCHAR(1),
Quantity NUMERIC(18))

--*******************************************************************************************
-- Load #OLD
--*******************************************************************************************
INSERT INTO #OLD
(Trade_Date,
Account,
Related_Account,
[Product],
PBS,
Quantity)
SELECT
PSDATE, --Trade_Date,
Account,
Related_Account,
[Product],
PBS,
SUM(PQTY) --Quantity
FROM [dbo].[Global_Risk_File_Current_Transactions]
WHERE (IN_GMI_Contracts_SOD='Y')
GROUP BY
PSDATE,
Account,
Related_Account, --WARNING: This may cause a PRIMARY KEY violation!!!
[Product],
PBS

--*******************************************************************************************
-- Create #NEW
--*******************************************************************************************
CREATE TABLE #NEW
(Trade_Date DATE,
Account VARCHAR(20),
Related_Account VARCHAR(20),
[Product] VARCHAR(50),
PBS VARCHAR(1),
Quantity NUMERIC(18))

--*******************************************************************************************
-- Load #NEW
--*******************************************************************************************
INSERT INTO #NEW
(Trade_Date,
Account,
Related_Account,
[Product],
PBS,
Quantity)
SELECT
PSDATE, --Trade_Date,
Account,
Related_Account,
[Product],
PBS,
SUM(PQTY) --Quantity
FROM [dbo].[Global_Risk_File_Current_Transactions_2]
WHERE (IN_GMI_Contracts_SOD='Y')
GROUP BY
PSDATE,
Account,
Related_Account, --WARNING: This may cause a PRIMARY KEY violation!!!
[Product],
PBS

--*******************************************************************************************
-- Create #Recon
--*******************************************************************************************
CREATE TABLE #Recon
(Trade_Date DATE,
Account VARCHAR(20),
Related_Account VARCHAR(20),
[Product] VARCHAR(50),
PBS VARCHAR(1),
Quantity_OLD NUMERIC(18) DEFAULT 0,
Quantity_NEW NUMERIC(18) DEFAULT 0,
Quantity_BREAK NUMERIC(18) DEFAULT 0,
IN_OLD_YN VARCHAR(1) DEFAULT 'N',
IN_NEW_YN VARCHAR(1) DEFAULT 'N')

--*******************************************************************************************
-- Load #Recon with #OLD
--*******************************************************************************************
INSERT INTO #Recon
(Trade_Date,
Account,
Related_Account,
[Product],
PBS,
Quantity_OLD,
IN_OLD_YN)
SELECT
Trade_Date,
Account,
Related_Account,
[Product],
PBS,
Quantity, --Quantity_OLD,
'Y' --IN_OLD_YN
FROM #OLD

--*******************************************************************************************
-- Update #Recon with #NEW
--*******************************************************************************************
UPDATE R
SET
Quantity_NEW=N.Quantity,
IN_NEW_YN='Y'
FROM #NEW N
INNER JOIN #Recon R
ON (N.Trade_Date=R.Trade_Date)
AND (N.Account=R.Account)
AND (N.Related_Account=R.Related_Account)
AND (N.[Product]=R.[Product])
AND (N.PBS=R.PBS)

--*******************************************************************************************
-- Load #Recon with missing #NEW
--*******************************************************************************************
INSERT INTO #Recon
(Trade_Date,
Account,
Related_Account,
[Product],
PBS,
Quantity_NEW,
IN_NEW_YN)
SELECT
N.Trade_Date,
N.Account,
N.Related_Account,
N.[Product],
N.PBS,
N.Quantity, --Quantity_NEW,
'Y' --IN_NEW_YN
FROM #NEW N
LEFT OUTER JOIN #Recon R
ON (N.Trade_Date=R.Trade_Date)
AND (N.Account=R.Account)
AND (N.Related_Account=R.Related_Account)
AND (N.[Product]=R.[Product])
AND (N.PBS=R.PBS)
WHERE (R.IN_OLD_YN IS NULL)

--*******************************************************************************************
-- Update Quantity_BREAK
--*******************************************************************************************
UPDATE #Recon
SET Quantity_BREAK = Quantity_NEW - Quantity_OLD

SELECT COUNT(*) "Total Records"
FROM #Recon

SELECT COUNT(*) "Matched Records"
FROM #Recon
WHERE (Quantity_BREAK=0)

SELECT COUNT(*) "Break Records"
FROM #Recon
WHERE (Quantity_BREAK<>0)

SELECT *
FROM #Recon
WHERE (Quantity_BREAK<>0)
ORDER BY
Trade_Date,
Account,
Related_Account,
[Product],
PBS

SELECT *
FROM #Recon
WHERE (Quantity_BREAK=0)
ORDER BY
Trade_Date,
Account,
Related_Account,
[Product],
PBS

DROP TABLE #OLD
DROP TABLE #NEW
DROP TABLE #Recon

SET NOCOUNT OFF