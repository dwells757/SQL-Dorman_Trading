USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_GMI_Contracts_SOD]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Contracts_SOD]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Contracts_SOD] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************
-- Create #GMIPOSF1_File_Current
--**************************************************************
CREATE TABLE #GMIPOSF1_File_Current
(GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
GMI_Security_Type VARCHAR(10) DEFAULT 'UNDEFINED',
GMI_Multiplier NUMERIC(18,9),
GMI_Currency_Code VARCHAR(3),
PSTYPE VARCHAR(1),
PSUBTY VARCHAR(1))

PRINT '**************************************************************************'
PRINT ' Load #GMIPOSF1_File_Current'
PRINT ' with [dbo].[GMIPOSF1_File_Current]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMIPOSF1_File_Current
(GMI_Exchange,
GMI_Symbol,
GMI_Multiplier,
GMI_Currency_Code,
PSTYPE,
PSUBTY)
SELECT
PEXCH, --GMI_Exchange,
PFC, --GMI_Symbol,
PMULTF, --GMI_Multiplier,
PCURCD, --GMI_Currency_Code,
PSTYPE,
PSUBTY
FROM [dbo].[GMIPOSF1_File_Current]
WHERE (PRECID='P')
AND (PTRACE NOT LIKE '%*%')
AND (PSTYPE<>'')
GROUP BY
PEXCH,
PFC,
PMULTF,
PCURCD,
PSTYPE,
PSUBTY

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Generate GMI_Security_Type'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMIPOSF1_File_Current
SET GMI_Security_Type =
	CASE PSTYPE
		WHEN 'B' THEN 'TBILL'
		WHEN 'F' THEN
			CASE PSUBTY
				WHEN '' THEN 'FUT'
				WHEN 'C' THEN 'OOF'
				WHEN 'P' THEN 'OOF'
				ELSE GMI_Security_Type --Leave as-is
			END
		ELSE GMI_Security_Type --Leave as-is
	END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--SELECT *
--FROM #GMIPOSF1_File_Current
--ORDER BY
--GMI_Exchange,
--GMI_Symbol,
--GMI_Multiplier,
--PSTYPE,
--PSUBTY

--**************************************************************
-- Create #GMI_Contracts_SOD
--**************************************************************
CREATE TABLE #GMI_Contracts_SOD
(GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
GMI_Security_Type VARCHAR(10),
GMI_Multiplier NUMERIC(18,9),
GMI_Currency_Code VARCHAR(3))

PRINT '**************************************************************************'
PRINT ' Load #GMI_Contracts_SOD'
PRINT ' with #GMIPOSF1_File_Current'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Contracts_SOD
(GMI_Exchange,
GMI_Symbol,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code)
SELECT
GMI_Exchange,
GMI_Symbol,
GMI_Security_Type,
MAX(GMI_Multiplier), --GMI_Multiplier,
MAX(GMI_Currency_Code) --GMI_Currency_Code
FROM #GMIPOSF1_File_Current
GROUP BY
GMI_Exchange,
GMI_Symbol,
GMI_Security_Type

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMIPOSF1_File_Current

--SELECT *
--FROM #GMI_Contracts_SOD
--ORDER BY
--GMI_Exchange,
--GMI_Symbol,
--GMI_Security_Type

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Contracts_SOD]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Contracts_SOD]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_Contracts_SOD]'
PRINT ' with #GMI_Contracts_SOD'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Contracts_SOD]
(GMI_Exchange,
GMI_Symbol,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code)
SELECT
GMI_Exchange,
GMI_Symbol,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code
FROM #GMI_Contracts_SOD

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Contracts_SOD

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Contracts_SOD] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO