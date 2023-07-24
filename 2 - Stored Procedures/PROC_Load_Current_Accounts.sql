USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_Current_Accounts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Current_Accounts]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Current_Accounts] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--************************************************************************************
-- Create #Current_Accounts_1
--************************************************************************************
CREATE TABLE #Current_Accounts_1
(Account VARCHAR(20))

PRINT '**************************************************************************'
PRINT ' Load #Current_Accounts_1'
PRINT ' with [dbo].[GMI_Current_Positions_Summarized]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Current_Accounts_1
(Account)
SELECT
Account
FROM [dbo].[GMI_Current_Positions_Summarized]
GROUP BY Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #Current_Accounts_1'
PRINT ' with [dbo].[GMI_Current_Positions_Summarized]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Current_Accounts_1
(Account)
SELECT
Account
FROM [dbo].[GMI_Current_Positions_Summarized]
GROUP BY Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

--************************************************************************************
-- Create #Current_Accounts_2
--************************************************************************************
CREATE TABLE #Current_Accounts_2
(Account VARCHAR(20))

PRINT '**************************************************************************'
PRINT ' Load #Current_Accounts_2'
PRINT ' with #Current_Accounts_1'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Current_Accounts_2
(Account)
SELECT
Account
FROM #Current_Accounts_1
GROUP BY Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Current_Accounts_1

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Current_Accounts]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[Current_Accounts]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Current_Accounts]'
PRINT ' with #Current_Accounts_2'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Current_Accounts]
(Account)
SELECT
Account
FROM #Current_Accounts_2

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Current_Accounts_2

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Current_Accounts] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO