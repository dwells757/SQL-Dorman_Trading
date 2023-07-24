USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Accounts_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Accounts_Portal_Back_Office]

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Accounts_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #Current_Accounts
--******************************************************************************
CREATE TABLE #Current_Accounts
(Id INT IDENTITY(1,1),
Account VARCHAR(20))

--******************************************************************************
-- Load #Current_Accounts
--******************************************************************************
INSERT INTO #Current_Accounts
(Account)
SELECT
Account
FROM [dbo].[Current_Accounts]
WHERE (Account<>'')
AND (Account NOT LIKE '%$%')
ORDER BY Account

--******************************************************************************
-- Return Records
--******************************************************************************
SELECT
Id,
Account
FROM #Current_Accounts

DROP TABLE #Current_Accounts

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Accounts_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO