USE [GMIDATA]
GO

SET NOCOUNT ON

--*********************************************************************
-- Create #Accounts_With_Option_Trades
--*********************************************************************
CREATE TABLE #Accounts_With_Option_Trades
(Account VARCHAR(20),
GMI_Security_Type VARCHAR(30),
Records INT)

--*********************************************************************
-- Load #Accounts_With_Option_Trades
--*********************************************************************
INSERT INTO #Accounts_With_Option_Trades
(Account,
GMI_Security_Type,
Records)
SELECT
Account,
GMI_Security_Type,
COUNT(*) --Records
FROM [dbo].[GMI_Current_Positions_Detailed]
WHERE (Source_Table='Global_Risk_File_Current_Transactions')
AND (GMI_Security_Type='OOF')
GROUP BY
Account,
GMI_Security_Type

SELECT *
FROM #Accounts_With_Option_Trades
ORDER BY
Account,
GMI_Security_Type

SELECT *
FROM #Accounts_With_Option_Trades A
INNER JOIN [dbo].[Global_Risk_File_Current_Cash] B
ON (A.Account=B.Account)
ORDER BY
A.Account,
A.GMI_Security_Type

DROP TABLE #Accounts_With_Option_Trades

SET NOCOUNT OFF