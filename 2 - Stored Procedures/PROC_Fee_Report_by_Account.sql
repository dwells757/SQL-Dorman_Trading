USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Fee_Report_by_Account]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Fee_Report_by_Account]
												@Start_Date DATE,
												@End_Date DATE

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Fee_Report_by_Account] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #Fee_Report_by_Account
--******************************************************************************
CREATE TABLE #Fee_Report_by_Account
(Account VARCHAR(20),
Currency VARCHAR(3),
COMM_AMOUNT NUMERIC(15,2),
CLF_FEE NUMERIC(15,2),
EXF_FEE NUMERIC(15,2),
NFA_FEE NUMERIC(15,2),
TRN_FEE NUMERIC(15,2),
Related_Account VARCHAR(20),
PRR VARCHAR(5))

--******************************************************************************
-- Load #Fee_Report_by_Account
--******************************************************************************
INSERT INTO #Fee_Report_by_Account
(Account,
Currency,
COMM_AMOUNT,
CLF_FEE,
EXF_FEE,
NFA_FEE,
TRN_FEE,
Related_Account,
PRR)
SELECT
Account,
PCURAT, --Currency,
SUM(PCOMM), --COMM_AMOUNT,
SUM(PFEE1), --CLF_FEE,
SUM(PFEE2 + PFEE8), --EXF_FEE,
SUM(PFEE3), --NFA_FEE,
SUM(POTHER), --TRN_FEE,
Related_Account,
PRR
FROM [dbo].[Commission_Fees_Volume_History]
--WHERE (Account='D-T7841')
WHERE (Processing_Date BETWEEN @Start_Date AND @End_Date)
GROUP BY 
Account,
PCURAT,
Related_Account,
PRR
ORDER BY
Account,
PCURAT,
Related_Account,
PRR

SELECT *
FROM #Fee_Report_by_Account
ORDER BY
Account,
Currency

DROP TABLE #Fee_Report_by_Account

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Fee_Report_by_Account] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO