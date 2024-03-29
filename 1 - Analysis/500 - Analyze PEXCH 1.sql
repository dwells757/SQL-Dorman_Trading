USE [GMIDATA]
GO

SET NOCOUNT ON

--************************************************************************
-- Create #PEXCH
--************************************************************************
CREATE TABLE #PEXCH
(PEXCH VARCHAR(2),
Records INT,
IN_GMI_Exchanges_YN VARCHAR(1) DEFAULT 'N')

--************************************************************************
-- Load #PEXCH
--************************************************************************
INSERT INTO #PEXCH
(PEXCH,
Records)
SELECT
PEXCH,
COUNT(*) --Records
FROM [dbo].[GMIPOSF1_File_Current]
GROUP BY PEXCH
ORDER BY PEXCH

--************************************************************************
-- Update IN_GMI_Exchanges_YN
--************************************************************************
UPDATE A
SET IN_GMI_Exchanges_YN='Y'
FROM #PEXCH A
INNER JOIN [dbo].[GMI_Exchanges] B
ON (A.PEXCH=B.GMI_Exchange)

SELECT *
FROM #PEXCH
ORDER BY PEXCH

DROP TABLE #PEXCH

SET NOCOUNT OFF