USE [GMIDATA]
GO

SET NOCOUNT ON

--********************************************************************
-- Create #MNYF1_File_History
--********************************************************************
CREATE TABLE #MNYF1_File_History
(Processing_Date DATE,
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
MATYPE VARCHAR(2))

--********************************************************************
-- Load #MNYF1_File_History
--********************************************************************
INSERT INTO #MNYF1_File_History
(Processing_Date,
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
MATYPE)
SELECT
Processing_Date,
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
MATYPE
FROM [dbo].[MNYF1_File_History]
WHERE (MCLASS='R')
AND (Processing_Date BETWEEN '5/1/23' AND '5/31/23')
--AND (MATYPE='9Z')
--AND (MRR IN(
--'00118',
--'00120'))

----********************************************************************
---- Return Details
----********************************************************************
--SELECT *
--FROM #MNYF1_File_History
--ORDER BY
--Processing_Date,
--MRR,
--MFIRM,
--MOFFIC,
--MACCT,
--MCLASS,
--MATYPE

--********************************************************************
-- Return Summary
--********************************************************************
SELECT
Processing_Date,
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
MATYPE
FROM #MNYF1_File_History
GROUP BY
Processing_Date,
MRR,
MCLASS,
MATYPE
ORDER BY
Processing_Date,
MRR,
MCLASS,
MATYPE

DROP TABLE #MNYF1_File_History

SET NOCOUNT OFF