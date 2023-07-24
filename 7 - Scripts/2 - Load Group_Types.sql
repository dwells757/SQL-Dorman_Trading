USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Group_Types]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[Group_Types]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[Group_Types]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[Group_Types](Group_Type,[Description])VALUES(1,'Firm')
INSERT INTO [dbo].[Group_Types](Group_Type,[Description])VALUES(2,'Office')
INSERT INTO [dbo].[Group_Types](Group_Type,[Description])VALUES(3,'Account')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[Group_Types]

SET NOCOUNT OFF