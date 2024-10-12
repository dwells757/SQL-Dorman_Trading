USE [GMIDATA]
GO

SET NOCOUNT ON

--*********************************************************************************
-- Create #Accounts
--*********************************************************************************
CREATE TABLE #Accounts
(Processing_Date DATE,
PRECID VARCHAR(1),
Account VARCHAR(20),
Related_Account VARCHAR(20),
GMI_SOD_Positions_Detailed INT) 

--*********************************************************************************
-- Load #Accounts
--*********************************************************************************
INSERT INTO #Accounts
(Processing_Date,
PRECID,
Account,
Related_Account,
GMI_SOD_Positions_Detailed)
SELECT 
Processing_Date,
PRECID,
Account,
Related_Account,
COUNT(*) --GMI_SOD_Positions_Detailed
FROM [dbo].[GMI_SOD_Positions_Detailed]
GROUP BY
Processing_Date,
PRECID,
Account,
Related_Account

SELECT *
FROM #Accounts
ORDER BY
Processing_Date,
PRECID,
Account,
Related_Account

--*********************************************************************************
-- Create #Related_Accounts
--*********************************************************************************
CREATE TABLE #Related_Accounts
(Processing_Date DATE,
PRECID VARCHAR(1),
Related_Account VARCHAR(20),
Account_Records INT,
GMI_SOD_Positions_Detailed INT) 

--*********************************************************************************
-- Load #Related_Accounts
--*********************************************************************************
INSERT INTO #Related_Accounts
(Processing_Date,
PRECID,
Related_Account,
Account_Records,
GMI_SOD_Positions_Detailed)
SELECT
Processing_Date,
PRECID,
Related_Account,
COUNT(*) , --Account_Records,
SUM(GMI_SOD_Positions_Detailed) --GMI_SOD_Positions_Detailed
FROM #Accounts
GROUP BY
Processing_Date,
PRECID,
Related_Account

SELECT *
FROM #Related_Accounts
WHERE (Account_Records>1)
ORDER BY
Processing_Date,
PRECID,
Related_Account

DROP TABLE #Accounts
DROP TABLE #Related_Accounts

SET NOCOUNT OFF