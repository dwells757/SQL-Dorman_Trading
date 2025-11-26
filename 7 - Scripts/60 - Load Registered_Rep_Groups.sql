USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Registered_Rep_Groups]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[Registered_Rep_Groups]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[Registered_Rep_Groups]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW001')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW002')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW003')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW004')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW005')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW006')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW007')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW008')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('SWEET_FUTURES','SW009')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Trade_Pro_Futures','00364')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Trade_Pro_Futures','00365')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Trade_Pro_Futures','00612')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Trade_Pro_Futures','C0074')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Trade_Pro_Futures','C0075')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','00364')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','00365')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','00612')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','C0074')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','C0075')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB001')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB002')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB003')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB004')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB005')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB006')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB007')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB008')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB009')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB010')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB011')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB012')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB013')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB014')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB015')
INSERT INTO [dbo].[Registered_Rep_Groups](Registered_Rep_Group,Registered_Rep)VALUES('Tradier','TB016')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[Registered_Rep_Groups]

SET NOCOUNT OFF