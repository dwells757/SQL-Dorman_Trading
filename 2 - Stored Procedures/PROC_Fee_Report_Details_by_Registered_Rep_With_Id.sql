USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Fee_Report_Details_by_Registered_Rep_With_Id]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Fee_Report_Details_by_Registered_Rep_With_Id]
																	@Registered_Rep VARCHAR(5),
																	@Start_Date DATE,
																	@End_Date DATE
																	

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Fee_Report_Details_by_Registered_Rep_With_Id] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--SELECT
--@Start_Date "@Start_Date",
--@End_Date "@End_Date",
--@Registered_Rep "@Registered_Rep"

--******************************************************************************
-- Create #Fee_Report_Details_by_Registered_Rep
--******************************************************************************
CREATE TABLE #Fee_Report_Details_by_Registered_Rep
(Id INT IDENTITY(1,1),
Processing_Date DATE,
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
Quantity NUMERIC(18),
COMM_AMOUNT NUMERIC(15,2),
CLF_FEE NUMERIC(15,2),
EXF_FEE NUMERIC(15,2),
NFA_FEE NUMERIC(15,2),
TRN_FEE NUMERIC(15,2),
BKG_FEE NUMERIC(15,2))

--******************************************************************************
-- Load #Fee_Report_Details_by_Registered_Rep
--******************************************************************************
INSERT INTO #Fee_Report_Details_by_Registered_Rep
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
SUM(Quantity), --Quantity,
SUM(PCOMM), --COMM_AMOUNT,
SUM(PFEE1), --CLF_FEE,
SUM(PFEE2 + PFEE8), --EXF_FEE,
SUM(PFEE3), --NFA_FEE,
SUM(POTHER), --TRN_FEE,
SUM(PBKCHG) --BKG_FEE
FROM [dbo].[Commission_Fees_Volume_History]
WHERE (PRR=@Registered_Rep)
AND (Processing_Date BETWEEN @Start_Date AND @End_Date)
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
PSDSC1
ORDER BY
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
PSDSC1

--******************************************************************************
-- Return records
--******************************************************************************
SELECT
Id,
CONVERT(VARCHAR,Processing_Date,101) "Processing_Date",
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
CONVERT(VARCHAR,Quantity) "Quantity",
COMM_AMOUNT,
CLF_FEE,
EXF_FEE,
NFA_FEE,
TRN_FEE,
BKG_FEE
FROM #Fee_Report_Details_by_Registered_Rep
ORDER BY Id

DROP TABLE #Fee_Report_Details_by_Registered_Rep

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Fee_Report_Details_by_Registered_Rep_With_Id] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO