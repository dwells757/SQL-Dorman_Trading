USE [GMIDATA]
GO

SET NOCOUNT ON

DECLARE
@Account VARCHAR(20)

SET @Account='D-99280'

SELECT
Account,
Product,
COUNT(*) --Records
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (Account=@Account)
GROUP BY
Account,
Product
ORDER BY
COUNT(*) DESC,
Account,
Product

SET NOCOUNT OFF