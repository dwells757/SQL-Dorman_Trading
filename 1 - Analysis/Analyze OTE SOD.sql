SELECT
GMI_Security_Type,
COUNT(*) "Records"
FROM [dbo].[GMI_SOD_Positions_Detailed]
GROUP BY GMI_Security_Type
ORDER BY GMI_Security_Type

SELECT TOP 7
Processing_Date,
Account,
Related_Account,
GMI_Security_Type "Security_Type",
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
OTE,
GMI_Currency_Code
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (GMI_Security_Type='FUT')
AND (OTE<>0)

SELECT TOP 7
Processing_Date,
Account,
Related_Account,
GMI_Security_Type "Security_Type",
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
OTE,
GMI_Currency_Code
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (GMI_Security_Type='OOF')
AND (OTE<>0)

SELECT TOP 7
Processing_Date,
Account,
Related_Account,
GMI_Security_Type "Security_Type",
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
OTE,
GMI_Currency_Code
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (GMI_Security_Type='TBILL')
AND (OTE<>0)