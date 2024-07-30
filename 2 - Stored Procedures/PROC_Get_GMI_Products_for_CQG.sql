DROP PROCEDURE [dbo].[PROC_Get_GMI_Products_for_CQG]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_GMI_Products_for_CQG]
												@IN_GMI_to_CQG_Mappings_YN VARCHAR(1)='Y'

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
(GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
GMI_Type VARCHAR(1),
Expiry VARCHAR(8),
PSDSC1 VARCHAR(255),
PCLOSE NUMERIC(15,8),
GMIPOS_Records INT,
IN_GMI_to_CQG_Mappings_YN VARCHAR(1) DEFAULT 'N',
GMI_LONGDESC VARCHAR(255) DEFAULT '',
CQG_Symbol VARCHAR(10),
CQG_Exchange VARCHAR(100),
CQG_Description VARCHAR(100),
CQG_Contract VARCHAR(100),
YY VARCHAR(2) DEFAULT '??',
MM VARCHAR(2) DEFAULT '??',
Month_Code VARCHAR(1) DEFAULT '?',
CQG_Product VARCHAR(20) DEFAULT 'UNDEFINED',
CQG_to_GMI_Price_Multiplier NUMERIC(19,9) DEFAULT 1)

--***********************************************************************************************************
-- Load #GMIPOSF1_File_Current
--***********************************************************************************************************
INSERT INTO #GMIPOSF1_File_Current
(GMI_Exchange,
GMI_Symbol,
GMI_Type,
Expiry,
PSDSC1,
PCLOSE,
GMIPOS_Records)
SELECT
PEXCH, --GMI_Exchange,
PFC, --GMI_Symbol,
PTYPE, --GMI_Type,
RTRIM(PCTYM) + RTRIM(PSBCUS), --Expiry,
PSDSC1,
PCLOSE,
COUNT(*) --GMIPOS_Records
FROM [dbo].[GMIPOSF1_File_Raw]
WHERE (PSTYPE='F')
AND (PTYPE='')
--AND (PSBCUS<>'')
GROUP BY
PEXCH,
PFC,
PTYPE,
PCTYM,
PSBCUS,
PSDSC1,
PCLOSE

--***********************************************************************************************************
-- Update #GMIPOSF1_File_Current
-- with [dbo].[GMI_to_CQG_Mappings]
--***********************************************************************************************************
UPDATE A
SET
IN_GMI_to_CQG_Mappings_YN='Y',
GMI_LONGDESC=B.GMI_LONGDESC,
CQG_Symbol=B.CQG_Symbol,
CQG_Exchange=B.CQG_Exchange,
CQG_Description=B.CQG_Description,
CQG_Contract=B.CQG_Contract,
CQG_to_GMI_Price_Multiplier=B.CQG_to_GMI_Price_Multiplier
FROM #GMIPOSF1_File_Current A
INNER JOIN [dbo].[GMI_to_CQG_Mappings] B
ON (A.GMI_Exchange=B.GMI_Exchange)
AND (A.GMI_Symbol=B.GMI_Symbol)
AND (A.GMI_Type=B.GMI_Type)

--***********************************************************************************************************
-- Generate YY and MM
--***********************************************************************************************************
UPDATE #GMIPOSF1_File_Current
SET
YY = SUBSTRING(Expiry,3,2),
MM = SUBSTRING(Expiry,5,2)

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

--***********************************************************************************************************
-- Create #GMI_Products_for_CQG
--***********************************************************************************************************
CREATE TABLE #GMI_Products_for_CQG
(Record_Number INT IDENTITY(1,1),
GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
GMI_Type VARCHAR(1),
Expiry VARCHAR(8),
PSDSC1 VARCHAR(255),
GMI_LONGDESC VARCHAR(255),
CQG_Symbol VARCHAR(10),
CQG_Exchange VARCHAR(100),
CQG_Description VARCHAR(100),
CQG_Product VARCHAR(20),
CQG_to_GMI_Price_Multiplier NUMERIC(19,9),
PCLOSE NUMERIC(15,8),
CQG_Price NUMERIC(18,9) DEFAULT 0)

--***********************************************************************************************************
-- Load #GMI_Products_for_CQG
--***********************************************************************************************************
INSERT INTO #GMI_Products_for_CQG
(GMI_Exchange,
GMI_Symbol,
GMI_Type,
Expiry,
PSDSC1,
GMI_LONGDESC,
CQG_Symbol,
CQG_Exchange,
CQG_Description,
CQG_Product,
CQG_to_GMI_Price_Multiplier,
PCLOSE)
SELECT
GMI_Exchange,
GMI_Symbol,
GMI_Type,
Expiry,
PSDSC1,
GMI_LONGDESC,
CQG_Symbol,
CQG_Exchange,
CQG_Description,
CQG_Product,
CQG_to_GMI_Price_Multiplier,
PCLOSE
FROM #GMIPOSF1_File_Current
WHERE (IN_GMI_to_CQG_Mappings_YN=@IN_GMI_to_CQG_Mappings_YN)
ORDER BY
GMI_Exchange,
GMI_Symbol,
GMI_Type,
Expiry

DROP TABLE #GMIPOSF1_File_Current

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