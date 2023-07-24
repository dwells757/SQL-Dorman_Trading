USE [GMIDATA]
GO

SET NOCOUNT ON

--*********************************************************************
-- Create #GMI_Current_Positions_Detailed
--*********************************************************************
CREATE TABLE #GMI_Current_Positions_Detailed
(Account VARCHAR(20),
GMI_Security_Type VARCHAR(30),
Records INT)

--*********************************************************************
-- Load #GMI_Current_Positions_Detailed
--*********************************************************************
INSERT INTO #GMI_Current_Positions_Detailed
(Account,
GMI_Security_Type,
Records)
SELECT
Account,
GMI_Security_Type,
COUNT(*) --Records
FROM [dbo].[GMI_Current_Positions_Detailed]
WHERE (Source_Table<>'GMI_SOD_Positions_Detailed')
GROUP BY
Account,
GMI_Security_Type

SELECT *
FROM #GMI_Current_Positions_Detailed
ORDER BY
Account,
GMI_Security_Type

--*********************************************************************
-- Create #Accounts
--*********************************************************************
CREATE TABLE #Accounts
(Account VARCHAR(20),
Records INT)

--*********************************************************************
-- Load #Accounts
--*********************************************************************
INSERT INTO #Accounts
(Account,
Records)
SELECT
Account,
COUNT(*) --Records
FROM #GMI_Current_Positions_Detailed
GROUP BY Account

SELECT *
FROM #Accounts
WHERE (Records>1)
ORDER BY Account

DROP TABLE #GMI_Current_Positions_Detailed
DROP TABLE #Accounts

SET NOCOUNT OFF