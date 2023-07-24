USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Transactions]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Transactions]
												@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Transactions] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

SELECT
Account,
PBS,
Quantity,
GMI_Security_Type,
GMI_Description,
GMI_Trade_Price,
GMI_Current_Price,
GMI_Multiplier,
Account_Balance,
OTE_Top_Day,
LOV,
SOV,
Option_Unrealized_Top_Day,
Account_Type
FROM [dbo].[GMI_Current_Positions_Detailed]
WHERE (Source_Table='Global_Risk_File_Current_Transactions')
AND (Account=@Account)
ORDER BY
GMI_Security_Type,
Product,
GMI_Trade_Price,
PBS

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Transactions] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO