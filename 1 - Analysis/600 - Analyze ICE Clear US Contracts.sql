USE [GMIDATA]
GO

SET NOCOUNT ON

--************************************************************************
-- Create #Futures_Contracts
--************************************************************************
CREATE TABLE #Futures_Contracts
(PEXCH VARCHAR(2),
PFC VARCHAR(2),
PTYPE VARCHAR(1),
PSDSC1 VARCHAR(30),
Records INT)

--************************************************************************
-- Load #Futures_Contracts
--************************************************************************
INSERT INTO #Futures_Contracts
(PEXCH,
PFC,
PTYPE,
PSDSC1,
Records)
SELECT
PEXCH,
PFC,
PTYPE,
PSDSC1,
COUNT(*) --Records
FROM [dbo].[GMIPOSF1_File_Current]
WHERE (PEXCH IN(
'06','13'))
GROUP BY
PEXCH,
PFC,
PTYPE,
PSDSC1

SELECT *
FROM #Futures_Contracts
ORDER BY
PEXCH,
PFC,
PTYPE,
PSDSC1

DROP TABLE #Futures_Contracts

SET NOCOUNT OFF