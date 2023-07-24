USE [GMIDATA]
GO

SET NOCOUNT ON

DECLARE
@Processing_Date_Current DATE,
@Processing_Date_Prior_Day DATE

SET @Processing_Date_Current='5/24/23'
SET @Processing_Date_Prior_Day='5/23/23'

--***************************************************************
-- Create #Commission_History
--***************************************************************
CREATE TABLE #Commission_History
(PRR VARCHAR(5),
PFIRM VARCHAR(1),
POFFIC VARCHAR(3),
PACCT VARCHAR(5),
PCLASS VARCHAR(1),
PSUBCL VARCHAR(1),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
PRECID VARCHAR(1),
Processing_Date DATE,
PCOMM NUMERIC(15,2),
PATYPE VARCHAR(2),
PCURAT VARCHAR(3),
ST4F1_File_Records INT)

--***************************************************************
-- Load #Commission_History
--***************************************************************
INSERT INTO #Commission_History
(PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
Processing_Date,
PCOMM,
PATYPE,
PCURAT,
ST4F1_File_Records)
SELECT
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
Processing_Date,
PCOMM,
PATYPE,
PCURAT,
ST4F1_File_Records
FROM [dbo].[Commission_History]
WHERE (Processing_Date IN(@Processing_Date_Current,@Processing_Date_Prior_Day))

SELECT *
FROM #Commission_History
ORDER BY
PRR,
PFIRM,
POFFIC,
PACCT,
PCLASS,
PSUBCL,
PSTYPE,
PTYPE,
PRECID,
Processing_Date

SELECT
PRR,
PATYPE,
PCURAT,
SUM(CASE WHEN Processing_Date=@Processing_Date_Current THEN PCOMM ELSE 0 END) "Current Commissions",
SUM(CASE WHEN Processing_Date=@Processing_Date_Prior_Day THEN PCOMM ELSE 0 END) "Prior Day Commissions"
FROM #Commission_History
GROUP BY 
PRR,
PATYPE,
PCURAT
ORDER BY 
PRR,
PATYPE,
PCURAT

DROP TABLE #Commission_History

SET NOCOUNT OFF