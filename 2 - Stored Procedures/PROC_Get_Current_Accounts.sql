USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Accounts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Accounts]

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Accounts] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

SELECT
Account
FROM [dbo].[Current_Accounts]
WHERE (Account<>'')
AND (Account NOT LIKE '%$%')
ORDER BY Account

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Accounts] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO