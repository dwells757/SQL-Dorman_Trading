USE [GMIDATA]
GO

SET NOCOUNT ON

DECLARE
@Start_Date DATE,
@End_Date DATE

SET @Start_Date='6/1/25'
SET @End_Date='6/30/25'

--******************************************************************************
-- Create #Commission_Fees_Volume_History_2
--******************************************************************************
CREATE TABLE #Commission_Fees_Volume_History_2
(Processing_Date DATE,
Account VARCHAR(20),
PRR VARCHAR(5),
Currency VARCHAR(3),
PEXCH VARCHAR(2),
PFC VARCHAR(2),
Expiry VARCHAR(8),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
Security_Type VARCHAR(10),
Product_Description VARCHAR(50), --PSDSC1
PSPRED VARCHAR(1),
Quantity NUMERIC(18),
COMM_AMOUNT NUMERIC(15,2),
--COMM_Curr VARCHAR(3), --PATCOM_Currency_Code
CLF_FEE NUMERIC(15,2),
--CLF_FEE_Curr VARCHAR(3), --PATFE1_Currency_Code
EXF_FEE NUMERIC(15,2),
--EXF_FEE_Curr VARCHAR(3), --PATCOM_Currency_Code
NFA_FEE NUMERIC(15,2),
--NFA_FEE_Curr VARCHAR(3), --PATCOM_Currency_Code
TRN_FEE NUMERIC(15,2),
--TRN_FEE_Curr VARCHAR(3), --PATCOM_Currency_Code
BKG_FEE NUMERIC(15,2)) --,
--BKG_FEE_Curr VARCHAR(3)) --PATCOM_Currency_Code)

--******************************************************************************
-- Load #Commission_Fees_Volume_History_2
--******************************************************************************
INSERT INTO #Commission_Fees_Volume_History_2
(Processing_Date,
Account,
PRR,
Currency,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
Product_Description,
PSPRED,
Quantity,
COMM_AMOUNT,
CLF_FEE,
EXF_FEE,
NFA_FEE,
TRN_FEE,
BKG_FEE)
SELECT
Processing_Date,
Account,
PRR,
PCURAT, --Currency,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
PSDSC1, --Product_Description,
PSPRED,
SUM(Quantity), --Quantity,
SUM(PCOMM), --COMM_AMOUNT,
SUM(PFEE1), --CLF_FEE,
SUM(PFEE2 + PFEE8), --EXF_FEE,
SUM(PFEE3), --NFA_FEE,
SUM(POTHER), --TRN_FEE,
SUM(PBKCHG) --BKG_FEE
FROM [dbo].[Commission_Fees_Volume_History_2]
WHERE (Processing_Date BETWEEN @Start_Date AND @End_Date)
AND (Account IN(
'D-205-PC140',
'D-205-PC141',
'D-205-PC142',
'D-205-PC143',
'D-205-PC144',
'D-205-PC145'))
GROUP BY
Processing_Date,
Account,
PRR,
PCURAT,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
PSDSC1,
PSPRED

--******************************************************************************
-- Return records
--******************************************************************************
SELECT *
FROM #Commission_Fees_Volume_History_2
ORDER BY
Processing_Date,
Account,
PRR,
Currency,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
Product_Description,
PSPRED

DROP TABLE #Commission_Fees_Volume_History_2

SET NOCOUNT OFF