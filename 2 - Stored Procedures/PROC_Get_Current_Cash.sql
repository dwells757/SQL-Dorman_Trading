USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Cash]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Cash]
										@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Cash] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

SELECT
Account,
GMI_Description,
PNET,
PATYPE "Account_Type"
FROM [dbo].[Global_Risk_File_Current_Cash]
WHERE (Account=@Account)
ORDER BY GMI_Description

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Cash] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO