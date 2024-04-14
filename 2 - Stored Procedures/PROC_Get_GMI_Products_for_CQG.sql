USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_GMI_Products_for_CQG]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Products_for_CQG]

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Products_for_CQG] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--***********************************************************************************************************
-- Create #GMIPOSF1_File_Current
--***********************************************************************************************************
CREATE TABLE #GMIPOSF1_File_Current
(PEXCH VARCHAR(2),
PFC VARCHAR(2),
PCTYM VARCHAR(6),
PCLOSE NUMERIC(15,8),
GMI_Description VARCHAR(30),
CQG_Symbol VARCHAR(10),
CQG_Exchange VARCHAR(100),
CQG_Description VARCHAR(100),
YY VARCHAR(2) DEFAULT '??',
MM VARCHAR(2) DEFAULT '??',
Month_Code VARCHAR(1) DEFAULT '?',
CQG_Product VARCHAR(20) DEFAULT 'UNDEFINED')

--***********************************************************************************************************
-- Load #GMIPOSF1_File_Current
--***********************************************************************************************************
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','27','202405',99.49000000,'ICEUS SUGAR11','SBE','ICE Futures US (NBE)','Sugar World #11 -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','43','202405',94.66000000,'ICEUS COFFEEC','KCE','ICE Futures US (NBE)','Coffee -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','43','202412',87.92000000,'ICEUS COFFEEC','KCE','ICE Futures US (NBE)','Coffee -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','43','202503',78.28000000,'ICEUS COFFEEC','KCE','ICE Futures US (NBE)','Coffee -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','CY','202405',90.81000000,'ICEUS COFFEEC','CCE','ICE Futures US (NBE)','Cocoa -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','CY','202407',104.56200000,'ICEUS COFFEEC','CCE','ICE Futures US (NBE)','Cocoa -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','CY','202409',197.75000000,'ICEUS COFFEEC','CCE','ICE Futures US (NBE)','Cocoa -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','CY','202412',195.60000000,'ICEUS COFFEEC','CCE','ICE Futures US (NBE)','Cocoa -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('06','RS','202411',195.65000000,'ICEUS CANOLA','WR','ICE Futures US-Canadian Grains (WCE)','Canola (Rape Seed) -- ICECAN')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('13','28','202405',368.75000000,'ICEUS COTTON2','CTE','ICE Futures US (NBE)','Cotton -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('13','96','202405',22.32000000,'ICEUS FCOJ-A','OJE','ICE Futures US (NBE)','Orange Juice A(FCOJ-A) -- NYBOT/ICE')
INSERT INTO #GMIPOSF1_File_Current(PEXCH,PFC,PCTYM,PCLOSE,GMI_Description,CQG_Symbol,CQG_Exchange,CQG_Description)VALUES('13','XD','202406',652.10000000,'ICEUS USD INDX','DXE','ICE Futures US (NBE)','Dollar Index -- NYBOT/ICE')

--***********************************************************************************************************
-- Generate YY and MM
--***********************************************************************************************************
UPDATE #GMIPOSF1_File_Current
SET
YY = SUBSTRING(PCTYM,3,2),
MM = SUBSTRING(PCTYM,5,2)

--***********************************************************************************************************
-- Generate Month_Code
--***********************************************************************************************************
UPDATE #GMIPOSF1_File_Current
SET Month_Code = 
	CASE MM
		WHEN '01' THEN 'F'
		WHEN '02' THEN 'G'
		WHEN '03' THEN 'H'
		WHEN '04' THEN 'J'
		WHEN '05' THEN 'K'
		WHEN '06' THEN 'M'
		WHEN '07' THEN 'N'
		WHEN '08' THEN 'Q'
		WHEN '09' THEN 'U'
		WHEN '10' THEN 'V'
		WHEN '11' THEN 'X'
		WHEN '12' THEN 'Z'
		ELSE Month_Code --leave as-is
	END

--***********************************************************************************************************
-- Generate CQG_Product
--***********************************************************************************************************
UPDATE #GMIPOSF1_File_Current
SET CQG_Product = 'F.US.' + REPLACE(CQG_Symbol,' ','') + Month_Code + YY

--SELECT *
--FROM #GMIPOSF1_File_Current

--***********************************************************************************************************
-- Create #GMI_Products_for_CQG
--***********************************************************************************************************
CREATE TABLE #GMI_Products_for_CQG
(Record_Number INT IDENTITY(1,1),
PEXCH VARCHAR(2),
PFC VARCHAR(2),
PCTYM VARCHAR(6),
GMI_Description VARCHAR(30),
CQG_Symbol VARCHAR(10),
CQG_Exchange VARCHAR(100),
CQG_Description VARCHAR(100),
CQG_Product VARCHAR(20),
PCLOSE NUMERIC(15,8),
CQG_Price NUMERIC(18,9) DEFAULT 0)

--***********************************************************************************************************
-- Load #GMI_Products_for_CQG
--***********************************************************************************************************
INSERT INTO #GMI_Products_for_CQG
(PEXCH,
PFC,
PCTYM,
GMI_Description,
CQG_Symbol,
CQG_Exchange,
CQG_Description,
CQG_Product,
PCLOSE)
SELECT
PEXCH,
PFC,
PCTYM,
GMI_Description,
CQG_Symbol,
CQG_Exchange,
CQG_Description,
CQG_Product,
PCLOSE
FROM #GMIPOSF1_File_Current
ORDER BY
PEXCH,
PFC,
PCTYM

--SELECT
----'F.US.' + REPLACE(CQG_Symbol,' ','') "CQG_Symbol"
--'F.US.' + REPLACE(CQG_Symbol,' ','') + 'K24' "CQG_Symbol"
--FROM [dbo].[GMI_Contracts]
--WHERE (CQG_Symbol='SBE') --DWH Test 4/2/24
--ORDER BY CQG_Symbol

DROP TABLE #GMIPOSF1_File_Current

--SELECT TOP 4 *
SELECT *
FROM #GMI_Products_for_CQG
ORDER BY Record_Number

DROP TABLE #GMI_Products_for_CQG

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_GMI_Products_for_CQG] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO