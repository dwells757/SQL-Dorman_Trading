USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Balance_Report_Summary]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Balance_Report_Summary]
													@Start_Date DATE,
													@End_Date DATE

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Balance_Report_Summary] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--********************************************************************
-- Create #MNYF1_File_History
--********************************************************************
CREATE TABLE #MNYF1_File_History
(Processing_Date DATE,
MRR VARCHAR(5),
MRECID VARCHAR(1),
--MFIRM VARCHAR(1),
--MOFFIC VARCHAR(3),
--MACCT VARCHAR(5),
MTE NUMERIC(15,2),
MLQVAL NUMERIC(15,2),
MFIR NUMERIC(15,2),
MFMR NUMERIC(15,2),
MME NUMERIC(15,2),
MLMV NUMERIC(15,2),
MCLASS VARCHAR(1),
MATYPE VARCHAR(2),
GMI_Account_Type_Description VARCHAR(255) DEFAULT 'UNDEFINED')

--********************************************************************
-- Load #MNYF1_File_History
--********************************************************************
INSERT INTO #MNYF1_File_History
(Processing_Date,
MRR,
MRECID,
--MFIRM,
--MOFFIC,
--MACCT,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE)
SELECT
Processing_Date,
MRR,
MRECID,
--MFIRM,
--MOFFIC,
--MACCT,
SUM(MTE), --MTE,
SUM(MLQVAL), --MLQVAL,
SUM(MFIR), --MFIR,
SUM(MFMR), --MFMR,
SUM(MME), --MME,
SUM(MLMV), --MLMV,
MCLASS,
MATYPE
FROM [dbo].[MNYF1_File_History]
WHERE (MCLASS='R')
AND (Processing_Date BETWEEN @Start_Date AND @End_Date)
GROUP BY
Processing_Date,
MRR,
MRECID,
MCLASS,
MATYPE

--********************************************************************
-- Update #MNYF1_File_History
--********************************************************************
UPDATE B
SET GMI_Account_Type_Description = A.GMI_Account_Type_Description
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #MNYF1_File_History B
ON (A.GMI_Account_Type=B.MATYPE)

SELECT
Processing_Date,
MRR,
MRECID,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE,
GMI_Account_Type_Description
FROM #MNYF1_File_History
ORDER BY
Processing_Date,
MRR,
MRECID,
MCLASS,
MATYPE

DROP TABLE #MNYF1_File_History

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Balance_Report_Summary] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO