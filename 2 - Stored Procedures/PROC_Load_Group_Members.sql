DROP PROCEDURE [dbo].[PROC_Load_Group_Members]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Group_Members]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Group_Members] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--********************************************************************
-- Create #Group_Members
--********************************************************************
CREATE TABLE #Group_Members
(Group_ID VARCHAR(30),
Account VARCHAR(20))

PRINT '**************************************************************************'
PRINT ' Load #Group_Members'
PRINT ' with unique "Account" values'
PRINT ' from [dbo].[GMI_SOD_Money]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Group_Members
(Group_ID,
Account)
SELECT
Account, --Group_ID,
Account
FROM [dbo].[GMI_SOD_Money]
WHERE (MRECID='M')
AND (Account<>'')
GROUP BY Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load #Group_Members'
PRINT ' with unique "Related_Account" and "Account" values'
PRINT ' from [dbo].[GMI_SOD_Money]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Group_Members
(Group_ID,
Account)
SELECT
Related_Account, --Group_ID,
Account
FROM [dbo].[GMI_SOD_Money]
WHERE (MRECID='M')
AND (Related_Account<>'')
GROUP BY 
Related_Account,
Account

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Group_Members]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[Group_Members]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[Group_Members]'
PRINT ' with #Group_Members'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Group_Members]
(Group_ID,
Account)
SELECT
Group_ID,
Account
FROM #Group_Members

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Group_Members

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Group_Members] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO