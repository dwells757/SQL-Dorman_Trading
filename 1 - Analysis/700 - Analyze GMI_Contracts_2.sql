USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT *
FROM [dbo].[GMI_Contracts_2]
ORDER BY
GMI_Exchange,
GMI_Symbol,
GMI_Type

SELECT *
FROM [dbo].[GMI_Contracts_2]
WHERE (CQG_Symbol='')
ORDER BY
GMI_Exchange,
GMI_Symbol,
GMI_Type

SELECT *
FROM [dbo].[GMI_Contracts_2]
WHERE (TT_Symbol='')
ORDER BY
GMI_Exchange,
GMI_Symbol,
GMI_Type

SELECT *
FROM [dbo].[GMI_Contracts_2]
WHERE (CQG_Symbol='--')
ORDER BY
GMI_Exchange,
GMI_Symbol,
GMI_Type

SELECT *
FROM [dbo].[GMI_Contracts_2]
WHERE (Clearing_House_Exchange='')
ORDER BY
GMI_Exchange,
GMI_Symbol,
GMI_Type

SET NOCOUNT OFF

