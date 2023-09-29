USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Fee_Report_Summary_1]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Fee_Report_Summary_1]
											@Start_Date DATE,
											@End_Date DATE

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Fee_Report_Summary_1] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--SELECT
--@Start_Date "@Start_Date",
--@End_Date "@End_Date"

--******************************************************************************
-- Create #PROC_Fee_Report_Summary
--******************************************************************************
CREATE TABLE #PROC_Fee_Report_Summary
(PRR VARCHAR(5),
[Year] INT,
[Month] INT,
Currency VARCHAR(3),
PEXCH VARCHAR(2),
PFC VARCHAR(2),
Expiry VARCHAR(8),
PSTYPE VARCHAR(1),
PTYPE VARCHAR(1),
Security_Type VARCHAR(10),
Product_Description VARCHAR(50), --PSDSC1
Quantity NUMERIC(18),
COMM_AMOUNT NUMERIC(15,2),
CLF_FEE NUMERIC(15,2),
EXF_FEE NUMERIC(15,2),
NFA_FEE NUMERIC(15,2),
TRN_FEE NUMERIC(15,2),
BKG_FEE NUMERIC(15,2))

--******************************************************************************
-- Load #PROC_Fee_Report_Summary
--******************************************************************************
INSERT INTO #PROC_Fee_Report_Summary
(PRR,
[Year],
[Month],
Currency,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
Product_Description,
Quantity,
COMM_AMOUNT,
CLF_FEE,
EXF_FEE,
NFA_FEE,
TRN_FEE,
BKG_FEE)
SELECT
PRR,
DATEPART(YYYY,Processing_Date), --[Year]
DATEPART(MM,Processing_Date), --[Month]
PCURAT, --Currency,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
PSDSC1, --Product_Description,
SUM(Quantity), --Quantity,
SUM(PCOMM), --COMM_AMOUNT,
SUM(PFEE1), --CLF_FEE,
SUM(PFEE2 + PFEE8), --EXF_FEE,
SUM(PFEE3), --NFA_FEE,
SUM(POTHER), --TRN_FEE,
SUM(PBKCHG) --BKG_FEE
FROM [dbo].[Commission_Fees_Volume_History]
WHERE (Processing_Date BETWEEN @Start_Date AND @End_Date)
--AND (PRR=@Registered_Rep)
GROUP BY
PRR,
DATEPART(YYYY,Processing_Date),
DATEPART(MM,Processing_Date),
PCURAT,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
PSDSC1

--******************************************************************************
-- Return records
--******************************************************************************
SELECT *
FROM #PROC_Fee_Report_Summary
ORDER BY
PRR,
[Year],
[Month],
Currency,
PEXCH,
PFC,
Expiry,
PSTYPE,
PTYPE,
Security_Type,
Product_Description

DROP TABLE #PROC_Fee_Report_Summary

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Fee_Report_Summary_1] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO