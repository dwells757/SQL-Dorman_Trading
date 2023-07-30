USE [GMIDATA]
GO

SET NOCOUNT ON

--*****************************************************************************
-- Create #GMIMNYF1_File_Current
--*****************************************************************************
CREATE TABLE #GMIMNYF1_File_Current
(FIRM VARCHAR(1),
OFFIC VARCHAR(3),
ACCT VARCHAR(5),
Records INT)

--*****************************************************************************
-- Load #GMIMNYF1_File_Current
--*****************************************************************************
INSERT INTO #GMIMNYF1_File_Current
(FIRM,
OFFIC,
ACCT,
Records)
SELECT
MFIRM, --FIRM,
MOFFIC, --OFFIC,
MACCT, --ACCT,
COUNT(*) --Records
FROM [dbo].[GMIMNYF1_File_Current]
GROUP BY
MFIRM,
MOFFIC,
MACCT

--SELECT *
--FROM #GMIMNYF1_File_Current
--ORDER BY
--FIRM,
--OFFIC,
--ACCT

--*****************************************************************************
-- Create #GMIST4F1_File_Current
--*****************************************************************************
CREATE TABLE #GMIST4F1_File_Current
(FIRM VARCHAR(1),
OFFIC VARCHAR(3),
ACCT VARCHAR(5),
Records INT,
IN_GMIMNYF1_File_Current_YN VARCHAR(1) DEFAULT 'N')

--*****************************************************************************
-- Load #GMIST4F1_File_Current
--*****************************************************************************
INSERT INTO #GMIST4F1_File_Current
(FIRM,
OFFIC,
ACCT,
Records)
SELECT
PFIRM, --FIRM,
POFFIC, --OFFIC,
PACCT, --ACCT,
COUNT(*) --Records
FROM [dbo].[GMIST4F1_File_Current]
GROUP BY
PFIRM,
POFFIC,
PACCT

--*****************************************************************************
-- Update IN_GMIMNYF1_File_Current_YN
--*****************************************************************************
UPDATE A
SET IN_GMIMNYF1_File_Current_YN='Y'
FROM #GMIST4F1_File_Current A
INNER JOIN #GMIMNYF1_File_Current B
ON (A.FIRM=B.FIRM)
AND (A.OFFIC=B.OFFIC)
AND (A.ACCT=B.ACCT)

SELECT *
FROM #GMIST4F1_File_Current
WHERE (IN_GMIMNYF1_File_Current_YN='N')
ORDER BY
FIRM,
OFFIC,
ACCT

--*****************************************************************************
-- Create #GMIPOSF1_File_Current
--*****************************************************************************
CREATE TABLE #GMIPOSF1_File_Current
(FIRM VARCHAR(1),
OFFIC VARCHAR(3),
ACCT VARCHAR(5),
Records INT,
IN_GMIMNYF1_File_Current_YN VARCHAR(1) DEFAULT 'N')

--*****************************************************************************
-- Load #GMIPOSF1_File_Current
--*****************************************************************************
INSERT INTO #GMIPOSF1_File_Current
(FIRM,
OFFIC,
ACCT,
Records)
SELECT
PFIRM, --FIRM,
POFFIC, --OFFIC,
PACCT, --ACCT,
COUNT(*) --Records
FROM [dbo].[GMIPOSF1_File_Current]
GROUP BY
PFIRM,
POFFIC,
PACCT

--*****************************************************************************
-- Update IN_GMIMNYF1_File_Current_YN
--*****************************************************************************
UPDATE A
SET IN_GMIMNYF1_File_Current_YN='Y'
FROM #GMIPOSF1_File_Current A
INNER JOIN #GMIMNYF1_File_Current B
ON (A.FIRM=B.FIRM)
AND (A.OFFIC=B.OFFIC)
AND (A.ACCT=B.ACCT)

SELECT *
FROM #GMIPOSF1_File_Current
WHERE (IN_GMIMNYF1_File_Current_YN='N')
ORDER BY
FIRM,
OFFIC,
ACCT

DROP TABLE #GMIMNYF1_File_Current
DROP TABLE #GMIST4F1_File_Current
DROP TABLE #GMIPOSF1_File_Current

SET NOCOUNT OFF