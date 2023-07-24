USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Balance_Report_Details]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Balance_Report_Details]
													@Start_Date DATE,
													@End_Date DATE,
													@Registered_Rep VARCHAR(5)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Balance_Report_Details] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--********************************************************************
-- Create #MNYF1_File_History
--********************************************************************
CREATE TABLE #MNYF1_File_History
(Processing_Date DATE,
MRECID VARCHAR(1),
MRR VARCHAR(5),
MFIRM VARCHAR(1),
MOFFIC VARCHAR(3),
MACCT VARCHAR(5),
MTE NUMERIC(15,2),
MLQVAL NUMERIC(15,2),
MFIR NUMERIC(15,2),
MFMR NUMERIC(15,2),
MME NUMERIC(15,2),
MLMV NUMERIC(15,2),
MCLASS VARCHAR(1),
MATYPE VARCHAR(2),
MCURAT VARCHAR(3),
GMI_Account_Type_Description VARCHAR(255) DEFAULT 'UNDEFINED')

--********************************************************************
-- Load #MNYF1_File_History
--********************************************************************
INSERT INTO #MNYF1_File_History
(Processing_Date,
MRECID,
MRR,
MFIRM,
MOFFIC,
MACCT,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE,
MCURAT)
SELECT
Processing_Date,
MRECID,
MRR,
MFIRM,
MOFFIC,
MACCT,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE,
MCURAT
FROM [dbo].[MNYF1_File_History]
WHERE (MRECID IN(
'M',
'R'))
AND (Processing_Date BETWEEN @Start_Date AND @End_Date)
AND (MRR=@Registered_Rep)

--********************************************************************
-- Update #MNYF1_File_History
--********************************************************************
UPDATE B
SET GMI_Account_Type_Description = A.GMI_Account_Type_Description
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #MNYF1_File_History B
ON (A.GMI_Account_Type=B.MATYPE)

--********************************************************************
-- Return Details
--********************************************************************
SELECT
Processing_Date,
MRECID,
MRR,
--MFIRM,
MOFFIC,
MACCT,
MTE,
MLQVAL,
MFIR,
MFMR,
MME,
MLMV,
MCLASS,
MATYPE,
MCURAT,
GMI_Account_Type_Description
FROM #MNYF1_File_History
ORDER BY
Processing_Date,
MRECID,
MRR,
--MFIRM,
MOFFIC,
MACCT,
MCLASS,
MATYPE,
MCURAT

DROP TABLE #MNYF1_File_History

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Balance_Report_Details] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO