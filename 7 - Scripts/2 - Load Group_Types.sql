SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Group_Types]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[Group_Types]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[Group_Types]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[Group_Types](Group_Type,[Description])VALUES('Account','FIRM + "-" + OFFIC + "-" + ACCT')
INSERT INTO [dbo].[Group_Types](Group_Type,[Description])VALUES('Related_Account','REL1F + "-" + REL1O + "-" + REL1A')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[Group_Types]

SET NOCOUNT OFF