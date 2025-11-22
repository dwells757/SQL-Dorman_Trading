USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Account_Number_Groups]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[Account_Number_Groups]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[Account_Number_Groups]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('Gamma_Q','GAM01')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('Gradable','PC171')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('Gradable','PC181')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('Gradable','PC441')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('HarvestIQ','AA057')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('HarvestIQ','AA062')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('HarvestIQ','AA063')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('HarvestIQ','AA064')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('HarvestIQ','AA065')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('HarvestIQ','AA066')
INSERT INTO [dbo].[Account_Number_Groups](Account_Number_Group,Account_Number)VALUES('HarvestIQ','AA067')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[Account_Number_Groups]

SET NOCOUNT OFF