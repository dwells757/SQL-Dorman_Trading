SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Current_Information]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[Current_Information]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[Current_Information]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[Current_Information](Current_Processing_Date,Snapshot_Time)VALUES(GETDATE(),GETDATE())

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[Current_Information]

SET NOCOUNT OFF