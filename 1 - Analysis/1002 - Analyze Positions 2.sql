USE [GMIDATA]
GO

SET NOCOUNT ON

SELECT *
FROM [dbo].[GMI_SOD_Positions_Detailed]
WHERE (Related_Account='D-OPC-PC123')
ORDER BY
Processing_Date,
PRECID,
Account,
Related_Account

SET NOCOUNT OFF