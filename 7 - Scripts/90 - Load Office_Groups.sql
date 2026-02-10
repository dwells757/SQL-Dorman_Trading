USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Office_Groups]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[Office_Groups]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[Office_Groups]'
PRINT '********************************************************************************'
--MetroTrade
INSERT INTO [dbo].[Office_Groups](Office_Group,Office)VALUES('MetroTrade','525')
INSERT INTO [dbo].[Office_Groups](Office_Group,Office)VALUES('MetroTrade','MET')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[Office_Groups]

SET NOCOUNT OFF