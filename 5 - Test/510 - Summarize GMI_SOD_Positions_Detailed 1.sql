USE [GMIDATA]
GO

SET NOCOUNT ON

--******************************************************************
-- Create #GMI_SOD_Positions_Detailed_1
--******************************************************************
CREATE TABLE GMI_SOD_Positions_Detailed_1
(Account VARCHAR(20),
Product VARCHAR(50),
Records INT)

--******************************************************************
-- Load #GMI_SOD_Positions_Detailed_1
--******************************************************************
INSERT INTO GMI_SOD_Positions_Detailed_1
(Account,
Product,
Records)
SELECT
Account,
Product,
COUNT(*) --Records
FROM [dbo].[GMI_SOD_Positions_Detailed]
GROUP BY
Account,
Product

--SELECT *
--FROM GMI_SOD_Positions_Detailed_1
--ORDER BY
--Account,
--Product

--******************************************************************
-- Create #GMI_SOD_Positions_Detailed_2
--******************************************************************
CREATE TABLE GMI_SOD_Positions_Detailed_2
(Account VARCHAR(20),
Products INT,
Records INT)

--******************************************************************
-- Load #GMI_SOD_Positions_Detailed_2
--******************************************************************
INSERT INTO GMI_SOD_Positions_Detailed_2
(Account,
Products,
Records)
SELECT
Account,
COUNT(*), --Products,
SUM(Records) --Records
FROM GMI_SOD_Positions_Detailed_1
GROUP BY Account

DROP TABLE GMI_SOD_Positions_Detailed_1

SELECT *
FROM GMI_SOD_Positions_Detailed_2
ORDER BY Products DESC

DROP TABLE GMI_SOD_Positions_Detailed_2

SET NOCOUNT OFF