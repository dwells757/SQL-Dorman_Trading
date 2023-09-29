SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Account_Types]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Account_Types]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[GMI_Account_Types]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('91','US USD USD CONVERTED REG (Seg Converted)','USD','United States dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('92','US USD USD CONVERTED REG (Seg Converted)','USD','United States dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('9Z','US USD USD CONVERTED REG (Seg Converted)','USD','United States dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('AD','SECURED AUSTRIALIAN DOLLAR','AUD','Australian dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('BP','SECURED BRITISH POUNDS','GBP','Pound sterling')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('CD','SECURED CANADIAN DOLLAR','CAD','Canadian dollar')	
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('EU','SECURED EURO','EUR','Euro')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('F1','CUSTOMER REGULATED - USD','USD','United States dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('F2','CUSTOMER NON-REGULATED	- USD','USD','United States dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('F3','CANADIAN DOLLARS','CAD','Canadian dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('F4','JAPANESE YEN','JPY','Japanese yen')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('F5','BRITHISH POUNDS','GBP','Pound sterling')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('F6','AUSTRALIAN DOLLARS','AUD','Australian dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('F9','SWISS FRANCS','CHF','Swiss franc')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('FE','ECU','EUR','Euro')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('FK','NOK','NOK','Norwegian krone')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('HK','SECURED HONG KONG DOLLAR','HKD','Hong Kong dollar')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('JY','SECURED JAPANESE YEN','JPY','Japanese yen')
INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description,Currency_Code,Currency_Name)VALUES('SF','SECURED SWISS FRANC','CHF','Swiss franc')

--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('92','US USD USD CONVERTED SEC (Secured Convered)')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('9Z','Converted Total (All Balances Converted to USD)')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('BP','SECURED BRITISH POUNDS')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('CD','SECURED CANADIAN DOLLAR')	
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('EU','SECURED EURO')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('F1','CUSTOMER REGULATED - USD')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('F2','CUSTOMER NON-REGULATED	- USD')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('F3','CANADIAN DOLLARS')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('F4','JAPANESE YEN')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('F5','BRITHISH POUNDS')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('F6','AUSTRALIAN DOLLARS')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('F9','SWISS FRANCS')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('FE','ECU')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('FK',' NOK')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('HK','SECURED HONG KONG DOLLAR')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('JY','SECURED JAPANESE YEN')
--INSERT INTO [dbo].[GMI_Account_Types](GMI_Account_Type,GMI_Account_Type_Description)VALUES('SF','SECURED SWISS FRANC')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[GMI_Account_Types]

SET NOCOUNT OFF