USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_Groups]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Groups]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Groups] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--********************************************************************
-- Create #Groups
--********************************************************************
CREATE TABLE #Groups
(Group_ID VARCHAR(30),
Group_Type VARCHAR(30))

PRINT '**************************************************************************'
PRINT ' Load #Groups'
PRINT ' with unique "Account" values'
PRINT ' from [dbo].[GMI_SOD_Money]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Groups
(Group_ID,
Group_Type)
SELECT
Account, --Group_ID,
'Account' --Group_Type
FROM [dbo].[GMI_SOD_Money]
WHERE (Account<>'')
GROUP BY Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #Groups'
PRINT ' with unique "Related_Account" values'
PRINT ' from [dbo].[GMI_SOD_Money]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Groups
(Group_ID,
Group_Type)
SELECT
Related_Account, --Group_ID,
'Related_Account' --Group_Type
FROM [dbo].[GMI_SOD_Money]
WHERE (Related_Account<>'')
GROUP BY Related_Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Groups]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[Groups]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[Groups]'
PRINT ' with #Groups'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Groups]
(Group_ID,
Group_Type)
SELECT
Group_ID,
Group_Type
FROM #Groups

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Groups

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Groups] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO