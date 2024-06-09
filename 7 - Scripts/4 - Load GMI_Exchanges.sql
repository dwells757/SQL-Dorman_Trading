USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Exchanges]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Exchanges]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[GMI_Exchanges]'
PRINT '********************************************************************************'
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('01','CBT','XCBT','CME_Group')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('02','CME','XCME','CME_Group')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('04','COMEX','XCEC','CME_Group')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('05','IFLL','IFLL','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('06','IFUS','IFUS','ICE_Clear_US')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('07','NYMEX','XNYM','CME_Group')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('09','MGE','XMGE','Minneapolis_Grain_Exchange')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('10','CDC','','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('12','XLME','XLME','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('13','IFUS','IFUS','ICE_Clear_US')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('14','IFLX','IFLX','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('16','CME','XCME','CME_Group')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('17','SGX','XSES','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('18','SFE','XSFE','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('19','','','ICE_Clear_Europe')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('22','OSE','XOSE','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('24','OSE','XOSE','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('25','MAT','XMAT','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('27','EURX','XEUR','EUREX')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('28','MONA','XEUE','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('30','MONP','XMON','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('32','MEFF','XMRV','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('33','HKFE','XHKF','')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('5K','','','ICE_Clear_Europe')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('6D','IFAD','IFAD','ICE_Clear_Europe')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('6L','FREX','FREX','Nodal_Clear')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('7B','XCBF','XCBF','OCC_Futures')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('7G','NDEX','NDEX','ICE_Clear_Europe')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('7K','','','ICE_Clear_Europe')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('9C','CME','XCME','CME_Group')
INSERT INTO [dbo].[GMI_Exchanges](GMI_Exchange,Clearing_House_Exchange,Market_Identifier_Code,Clearing_House)VALUES('9J','CME','XCME','CME_Group')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[GMI_Exchanges]

SET NOCOUNT OFF