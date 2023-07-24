USE [GMIDATA]
GO

SET NOCOUNT ON

DECLARE
@PACCT VARCHAR(5)

SET @PACCT='T7841'

--************************************************************************
-- Create #Commission_Fees_Volume_History
--************************************************************************
CREATE TABLE #Commission_Fees_Volume_History
(Record_Number INT IDENTITY(1,1),
PACCT VARCHAR(5),
PEXCH VARCHAR(2),
PFC VARCHAR(5),
PSTRIK NUMERIC(15,8),
PSUBTY VARCHAR(1),
Expiry VARCHAR(8),
PSDSC1 VARCHAR(30),
PCURAT VARCHAR(3),
Total_Quantity NUMERIC(18),
Comm_Amt NUMERIC(15,2),
Total_Fees NUMERIC(15,2))

--************************************************************************
-- Load #Commission_Fees_Volume_History
--************************************************************************
INSERT INTO #Commission_Fees_Volume_History
(PACCT,
PEXCH,
PFC,
PSTRIK,
PSUBTY,
Expiry,
PSDSC1,
PCURAT,
Total_Quantity,
Comm_Amt,
Total_Fees)
SELECT
PACCT,
PEXCH,
PFC,
PSTRIK,
PSUBTY,
Expiry,
PSDSC1,
PCURAT,
SUM(Quantity), --Total_Quantity
SUM(PCOMM), --Comm_Amt
SUM(PFEE1 + PFEE2 + PFEE3 + PFEE4 + PFEE5 + PFEE6 + PFEE7 + PFEE8 + PFEE9 + PGICHG + PBKCHG + POTHER + PMBKOF + PMFLOR + PMORDR + PMWIRE + PMOTHR) --Total_Fees
FROM [dbo].[Commission_Fees_Volume_History]
WHERE (PACCT=@PACCT)
GROUP BY
PACCT,
PEXCH,
PFC,
PSTRIK,
PSUBTY,
Expiry,
PSDSC1,
PCURAT
ORDER BY
PACCT,
PEXCH,
PFC,
PSTRIK,
PSUBTY,
Expiry,
PSDSC1,
PCURAT

SELECT
PACCT,
--PEXCH,
--PFC,
--PSTRIK,
--PSUBTY,
--Expiry,
PSDSC1,
PCURAT,
Total_Quantity,
Comm_Amt,
Total_Fees
FROM #Commission_Fees_Volume_History
ORDER BY Record_Number

DROP TABLE #Commission_Fees_Volume_History

SET NOCOUNT OFF