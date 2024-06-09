USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Exchanges_by_GMI_Contract]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Exchanges_by_GMI_Contract]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[GMI_Exchanges_by_GMI_Contract]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[GMI_Exchanges_by_GMI_Contract](GMI_Exchange,GMI_Symbol,GMI_Type,Clearing_House_Exchange,Market_Identifier_Code)VALUES('19','BC','','IFEU','IFEU')
INSERT INTO [dbo].[GMI_Exchanges_by_GMI_Contract](GMI_Exchange,GMI_Symbol,GMI_Type,Clearing_House_Exchange,Market_Identifier_Code)VALUES('19','BC','O','IFEU','IFEU')
INSERT INTO [dbo].[GMI_Exchanges_by_GMI_Contract](GMI_Exchange,GMI_Symbol,GMI_Type,Clearing_House_Exchange,Market_Identifier_Code)VALUES('19','GL','','IFEU','IFEU')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[GMI_Exchanges_by_GMI_Contract]

SET NOCOUNT OFF