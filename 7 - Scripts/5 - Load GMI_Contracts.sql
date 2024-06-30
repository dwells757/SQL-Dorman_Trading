USE [GMIDATA]
GO

SET NOCOUNT ON

PRINT '********************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Contracts]'
PRINT '********************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Contracts]

PRINT '********************************************************************************'
PRINT ' Load [dbo].[GMI_Contracts]'
PRINT '********************************************************************************'
--INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,PTYPE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','43','','ICEUS COFFEEC','KCE','ICE Futures US (NBE)','Coffee -- NYBOT/ICE')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','27','ICEUS SUGAR11','SBE','ICE Futures US (NBE)','Sugar World #11 -- NYBOT/ICE')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','43','ICEUS COFFEEC','KCE','ICE Futures US (NBE)','Coffee -- NYBOT/ICE')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','CY','ICEUS COCOA','CCE','ICE Futures US (NBE)','Cocoa -- NYBOT/ICE')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','RS','ICEUS CANOLA','WR','ICE Futures US-Canadian Grains (WCE)','Canola (Rape Seed) -- ICECAN')

INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('13','28','ICEUS COTTON2','CTE','ICE Futures US (NBE)','Cotton -- NYBOT/ICE')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('13','96','ICEUS FCOJ-A','OJE','ICE Futures US (NBE)','Orange Juice A(FCOJ-A) -- NYBOT/ICE')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('13','XD','ICEUS USD INDX','DXE','ICE Futures US (NBE)','Dollar Index -- NYBOT/ICE')

INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('16','AD','IMM AUS $','DA6','CME (GLOBEX) (GLO)','Australian Dollar -- GLOBEX')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('16','BP','IMM B-POUND','BP6','CME (GLOBEX) (GLO)','British Pound -- GLOBEX')
INSERT INTO [dbo].[GMI_Contracts](PEXCH,PFC,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('16','ES','EMINI S&P 500','EP','CME (GLOBEX) (GLO)','S&P 500 Index - E-Mini -- GLOBEX')

SELECT COUNT(*) "Records Loaded"
FROM [dbo].[GMI_Contracts]

SET NOCOUNT OFF