USE [GMIDATA]
GO

SET NOCOUNT ON

--***************************************************************
-- Create #Fees
--***************************************************************
CREATE TABLE #Fees
(PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
PCLASS VARCHAR(1),
PRECID VARCHAR(1),
PCOMM NUMERIC(15,2),
PFEE1 NUMERIC(15,2),
PFEE2 NUMERIC(15,2),
PFEE3 NUMERIC(15,2),
PFEE4 NUMERIC(15,2),
PFEE5 NUMERIC(15,2),
PFEE6 NUMERIC(15,2),
PFEE7 NUMERIC(15,2),
PFEE8 NUMERIC(15,2),
PFEE9 NUMERIC(15,2),
PGICHG NUMERIC(15,2),
PBKCHG NUMERIC(15,2),
POTHER NUMERIC(15,2),
PMBKOF NUMERIC(15,2),
PMFLOR NUMERIC(15,2),
PMORDR NUMERIC(15,2),
PMWIRE NUMERIC(15,2),
PMOTHR NUMERIC(15,2),
Transactions INT,
Quantity NUMERIC(18))

--***************************************************************
-- Futures
--***************************************************************
INSERT INTO #Fees
(PSTYPE,
PTYPE,
PCLASS,
PRECID,
PCOMM,
PFEE1,
PFEE2,
PFEE3,
PFEE4,
PFEE5,
PFEE6,
PFEE7,
PFEE8,
PFEE9,
PGICHG,
PBKCHG,
POTHER,
PMBKOF,
PMFLOR,
PMORDR,
PMWIRE,
PMOTHR,
Transactions,
Quantity)
SELECT
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID,
--PFEECL,
--PFEEEX,
SUM(PCOMM) "PCOMM",
SUM(PFEE1) "PFEE1",
SUM(PFEE2) "PFEE2",
SUM(PFEE3) "PFEE3",
SUM(PFEE4) "PFEE4",
SUM(PFEE5) "PFEE5",
SUM(PFEE6) "PFEE6",
SUM(PFEE7) "PFEE7",
SUM(PFEE8) "PFEE8",
SUM(PFEE9) "PFEE9",
SUM(PGICHG) "PGICHG",
SUM(PBKCHG) "PBKCHG",
SUM(POTHER) "POTHER",
--SUM(PGROSS) "PGROSS",
--SUM(PNET) "PNET",
SUM(PMBKOF) "PMBKOF",
SUM(PMFLOR) "PMFLOR",
SUM(PMORDR) "PMORDR",
SUM(PMWIRE) "PMWIRE",
SUM(PMOTHR) "PMOTHR",
COUNT(*) "Transactions",
SUM(PQTY) "Quantity"
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
AND (PTYPE='') --Futures
AND (PRECID IN(
'T', --"T" = "Transaction"
'V')) --"V" = "Confirm Reversal"
GROUP BY
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID
ORDER BY
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID

--***************************************************************
-- Options
--***************************************************************
INSERT INTO #Fees
(PSTYPE,
PTYPE,
PCLASS,
PRECID,
PCOMM,
PFEE1,
PFEE2,
PFEE3,
PFEE4,
PFEE5,
PFEE6,
PFEE7,
PFEE8,
PFEE9,
PGICHG,
PBKCHG,
POTHER,
PMBKOF,
PMFLOR,
PMORDR,
PMWIRE,
PMOTHR,
Transactions,
Quantity)
SELECT
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID,
--PFEECL,
--PFEEEX,
SUM(PCOMM) "PCOMM",
SUM(PFEE1) "PFEE1",
SUM(PFEE2) "PFEE2",
SUM(PFEE3) "PFEE3",
SUM(PFEE4) "PFEE4",
SUM(PFEE5) "PFEE5",
SUM(PFEE6) "PFEE6",
SUM(PFEE7) "PFEE7",
SUM(PFEE8) "PFEE8",
SUM(PFEE9) "PFEE9",
SUM(PGICHG) "PGICHG",
SUM(PBKCHG) "PBKCHG",
SUM(POTHER) "POTHER",
--SUM(PGROSS) "PGROSS",
--SUM(PNET) "PNET",
SUM(PMBKOF) "PMBKOF",
SUM(PMFLOR) "PMFLOR",
SUM(PMORDR) "PMORDR",
SUM(PMWIRE) "PMWIRE",
SUM(PMOTHR) "PMOTHR",
COUNT(*) "Transactions",
SUM(PQTY) "Quantity"
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
AND (PTYPE='O') --Options
AND (PRECID IN(
'P', --"P" = "P & S Trades"
'Q')) --"Q" = "P & S Reversal"
GROUP BY
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID
ORDER BY
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID

--***************************************************************
-- Adjustments
--***************************************************************
INSERT INTO #Fees
(PSTYPE,
PTYPE,
PCLASS,
PRECID,
PCOMM,
PFEE1,
PFEE2,
PFEE3,
PFEE4,
PFEE5,
PFEE6,
PFEE7,
PFEE8,
PFEE9,
PGICHG,
PBKCHG,
POTHER,
PMBKOF,
PMFLOR,
PMORDR,
PMWIRE,
PMOTHR,
Transactions,
Quantity)
SELECT
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID,
--PFEECL,
--PFEEEX,
SUM(PCOMM) "PCOMM",
SUM(PFEE1) "PFEE1",
SUM(PFEE2) "PFEE2",
SUM(PFEE3) "PFEE3",
SUM(PFEE4) "PFEE4",
SUM(PFEE5) "PFEE5",
SUM(PFEE6) "PFEE6",
SUM(PFEE7) "PFEE7",
SUM(PFEE8) "PFEE8",
SUM(PFEE9) "PFEE9",
SUM(PGICHG) "PGICHG",
SUM(PBKCHG) "PBKCHG",
SUM(POTHER) "POTHER",
--SUM(PGROSS) "PGROSS",
--SUM(PNET) "PNET",
SUM(PMBKOF) "PMBKOF",
SUM(PMFLOR) "PMFLOR",
SUM(PMORDR) "PMORDR",
SUM(PMWIRE) "PMWIRE",
SUM(PMOTHR) "PMOTHR",
COUNT(*) "Transactions",
SUM(PQTY) "Quantity"
FROM [dbo].[GMIST4F1_File_Current]
WHERE (PCLASS IN('C','H')) --"Customer" or "House" Records ONLY
AND (PRECID='A') --"A" = "Adjustments"
GROUP BY
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID

SELECT *
FROM #Fees
ORDER BY
PSTYPE,
--PSUBTY,
PTYPE,
PCLASS,
PRECID

DROP TABLE #Fees

SET NOCOUNT OFF