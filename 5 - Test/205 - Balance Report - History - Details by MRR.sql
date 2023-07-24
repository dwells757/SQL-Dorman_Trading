USE [GMIDATA]
GO

SET NOCOUNT ON

DECLARE
@MRR VARCHAR(5),
@Processing_Date_Start DATE,
@Processing_Date_End DATE

SET @MRR='TJM01'
SET @Processing_Date_Start='5/1/23'
SET @Processing_Date_End='5/31/23'

--********************************************************************
-- Create #MNYF1_File_History
--********************************************************************
CREATE TABLE #MNYF1_File_History
(Processing_Date DATE,
MRECID VARCHAR(1),
MRR VARCHAR(5),
MFIRM VARCHAR(1),
MOFFIC VARCHAR(3),
MACCT VARCHAR(5),
MTE NUMERIC(15,2),
MLQVAL NUMERIC(15,2),
MFIR NUMERIC(15,2),
MFMR NUMERIC(15,2),
MME NUMERIC(15,2),
MLMV NUMERIC(15,2),
MCLASS VARCHAR(1),
MATYPE VARCHAR(2),
MCURAT VARCHAR(3))

--********************************************************************
-- Load #MNYF1_File_History
--********************************************************************
INSERT INTO #MNYF1_File_History
(Processing_Date,
MRECID,
MRR,
MFIRM,
MOFFIC,
MACCT,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE,
MCURAT)
SELECT
Processing_Date,
MRECID,
MRR,
MFIRM,
MOFFIC,
MACCT,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE,
MCURAT
FROM [dbo].[MNYF1_File_History]
WHERE (MRECID='M')
AND (MRR=@MRR)
AND (Processing_Date BETWEEN @Processing_Date_Start AND @Processing_Date_End)
--AND (MATYPE='9Z')
--AND (MRR IN(
--'00118',
--'00120'))

--********************************************************************
-- Return Summary
--********************************************************************
SELECT
Processing_Date,
MRECID,
MRR,
--MFIRM,
--MOFFIC,
--MACCT,
SUM(MTE) "MTE",
SUM(MLQVAL) "MLQVAL",
SUM(MFIR) "MFIR",
SUM(MFMR) "MFMR",
SUM(MME) "MME",
SUM(MLMV) "MLMV",
MCLASS,
MATYPE,
MCURAT
FROM #MNYF1_File_History
GROUP BY
Processing_Date,
MRECID,
MRR,
MCLASS,
MATYPE,
MCURAT
ORDER BY
Processing_Date,
MRECID,
MRR,
MCLASS,
MATYPE,
MCURAT

--********************************************************************
-- Return Details
--********************************************************************
SELECT
Processing_Date,
MRECID,
MRR,
--MFIRM,
MOFFIC,
MACCT,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE,
MCURAT
FROM #MNYF1_File_History
ORDER BY
Processing_Date,
MRECID,
MRR,
--MFIRM,
MOFFIC,
MACCT,
MCLASS,
MATYPE,
MCURAT

DROP TABLE #MNYF1_File_History

SET NOCOUNT OFF