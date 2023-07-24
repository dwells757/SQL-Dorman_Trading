USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT ' ************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Registered_Representative]'
PRINT ' ************************************************************************'
TRUNCATE TABLE [dbo].[Registered_Representative]

PRINT ' ************************************************************************'
PRINT ' Load [dbo].[Registered_Representative]'
PRINT ' with [dbo].[Registered_Representatives]'
PRINT ' ************************************************************************'

INSERT INTO [dbo].[Registered_Representative]
([Name],
Master_Common_Name)
SELECT
Registered_Representative, --[Name],
Master_Common_Name
FROM [dbo].[Registered_Representatives]
ORDER BY Registered_Representative

SELECT @@ROWCOUNT "Records Loaded"

SET NOCOUNT OFF