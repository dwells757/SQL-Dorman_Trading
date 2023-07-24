USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Detail_Com_Report]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Detail_Com_Report]
											@Start_Date DATE,
											@End_Date DATE,
											@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Detail_Com_Report] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--************************************************************************
-- Create #Commission_Fees_Volume_History
--************************************************************************
CREATE TABLE #Commission_Fees_Volume_History
(Record_Number INT IDENTITY(1,1),
Account VARCHAR(20),
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
(Account,
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
Account,
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
WHERE (Processing_Date BETWEEN @Start_Date AND @End_Date)
AND (Account=@Account)
GROUP BY
Account,
PEXCH,
PFC,
PSTRIK,
PSUBTY,
Expiry,
PSDSC1,
PCURAT
ORDER BY
Account,
PEXCH,
PFC,
PSTRIK,
PSUBTY,
Expiry,
PSDSC1,
PCURAT

--************************************************************************
-- Return "Detail" Records
--************************************************************************
SELECT
Account,
--PEXCH,
--PFC,
--PSTRIK,
--PSUBTY,
--Expiry,
PSDSC1 "Decription",
PCURAT "Currency_Code",
Total_Quantity,
Comm_Amt,
Total_Fees
FROM #Commission_Fees_Volume_History
ORDER BY Record_Number

--************************************************************************
-- Return "Summary" Records
--************************************************************************
SELECT
Account,
SUM(Total_Quantity) "Total_Quantity",
SUM(Comm_Amt) "Comm_Amt",
SUM(Total_Fees) "Total_Fees"
FROM #Commission_Fees_Volume_History
GROUP BY Account
ORDER BY Account

DROP TABLE #Commission_Fees_Volume_History

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Detail_Com_Report] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO