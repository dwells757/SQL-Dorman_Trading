USE [GMIDATA]
GO

SET NOCOUNT ON

--********************************************************************
-- Create #GMIMNYF1_File_Current
--********************************************************************
CREATE TABLE #GMIMNYF1_File_Current
(MRR VARCHAR(5),
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
-- Load #GMIMNYF1_File_Current
--********************************************************************
INSERT INTO #GMIMNYF1_File_Current
(MRR,
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
FROM [dbo].[GMIMNYF1_File_Current]
WHERE (MCLASS='R')
AND (MATYPE='9Z')
AND (MRR IN(
'00118',
'00120'))

--********************************************************************
-- Return Details
--********************************************************************
SELECT *
FROM #GMIMNYF1_File_Current
ORDER BY MRR

--********************************************************************
-- Return Summary
--********************************************************************
SELECT
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
FROM #GMIMNYF1_File_Current
GROUP BY
MRR,
MCLASS,
MATYPE
ORDER BY
MRR,
MCLASS,
MATYPE

DROP TABLE #GMIMNYF1_File_Current

SET NOCOUNT OFF