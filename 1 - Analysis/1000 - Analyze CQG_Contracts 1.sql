USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT
ContractSymbol,
GMI_Record_Number,
PEXCH,
PFC,
PCTYM,
StatusCode,
[Level],
ScaledPrice,
CorrectPriceScale,
CQG_to_GMI_Price_Multiplier,
PCLOSE,
CQG_Price,
DateLoaded
FROM [dbo].[CQG_Contracts]
ORDER BY
PEXCH,
PFC,
PCTYM

SET NOCOUNT OFF