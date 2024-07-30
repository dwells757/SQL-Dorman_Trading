DROP PROCEDURE [dbo].[PROC_Load_GMI_Contracts_2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Contracts_2]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Contracts_2] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************
-- Create #GMI_Contracts_2
--**************************************************************
CREATE TABLE #GMI_Contracts_2
(GMI_Exchange VARCHAR(2), --Exchange Code
GMI_Symbol VARCHAR(2), --Futures Code
GMI_Type VARCHAR(1), --Contract Type Code
GMIPOS_Records INT,
Exchange_Symbol VARCHAR(4) DEFAULT '',
CME_Group_Contract_Type VARCHAR(10) DEFAULT '',
CQG_Symbol VARCHAR(10) DEFAULT '',
TT_Symbol VARCHAR(10) DEFAULT '',
GMI_DESC VARCHAR(255) DEFAULT '',
GMI_LONGDESC VARCHAR(255) DEFAULT '',
GMI_EXCHDESC VARCHAR(255) DEFAULT '',
Clearing_House_Exchange VARCHAR(10) DEFAULT '',
Market_Identifier_Code VARCHAR(4) DEFAULT '',
Clearing_House VARCHAR(30) DEFAULT '')

PRINT '**************************************************************************'
PRINT ' Load #GMI_Contracts_2'
PRINT ' with [dbo].[GMIPOSF1_File_Raw]'
PRINT ' WHERE (PSTYPE="F")' --PSTYPE = "Security Type Code"
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Contracts_2
(GMI_Exchange,
GMI_Symbol,
GMI_Type,
GMIPOS_Records)
SELECT
PEXCH, --GMI_Symbol
PFC, --GMI_Symbol
PTYPE, --GMI_Type
COUNT(*) --GMIPOS_Records
FROM [dbo].[GMIPOSF1_File_Raw]
WHERE (PSTYPE='F')
GROUP BY
PEXCH,
PFC,
PTYPE

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_2'
PRINT ' with [dbo].[WFUTM]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET 
GMI_DESC=B.[DESC],
GMI_LONGDESC=B.LONGDESC,
GMI_EXCHDESC=B.EXCHDESC
FROM #GMI_Contracts_2 A
INNER JOIN [dbo].[WFUTM] B
ON (A.GMI_Exchange=B.GMIEX)
AND (A.GMI_Symbol=B.GMIFC)
AND (A.GMI_Type=B.[TYPE])

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_2'
PRINT ' with EXALTFC'
PRINT ' from [dbo].[WFUTM]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET Exchange_Symbol=B.EXALTFC
FROM #GMI_Contracts_2 A
INNER JOIN [dbo].[WFUTM] B
ON (A.GMI_Exchange=B.GMIEX)
AND (A.GMI_Symbol=B.GMIFC)
AND (A.GMI_Type=B.[TYPE])
WHERE (LEN(B.EXALTFC)<=4)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_2'
PRINT ' with EXPCOMM'
PRINT ' from [dbo].[WFUTM], if necessary'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET Exchange_Symbol=B.EXPCOMM
FROM #GMI_Contracts_2 A
INNER JOIN [dbo].[WFUTM] B
ON (A.GMI_Exchange=B.GMIEX)
AND (A.GMI_Symbol=B.GMIFC)
AND (A.GMI_Type=B.[TYPE])
WHERE (Exchange_Symbol='') --has not been previously updated above
AND (LEN(B.EXPCOMM)<=4)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_2'
PRINT ' with OTHERDESC'
PRINT ' from [dbo].[WFUTM], if necessary'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET Exchange_Symbol=REPLACE(B.OTHERDESC,' ','')
FROM #GMI_Contracts_2 A
INNER JOIN [dbo].[WFUTM] B
ON (A.GMI_Exchange=B.GMIEX)
AND (A.GMI_Symbol=B.GMIFC)
AND (A.GMI_Type=B.[TYPE])
WHERE (Exchange_Symbol='') --has not been previously updated above
AND (LEN(REPLACE(B.OTHERDESC,' ',''))<=4)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_2'
PRINT ' with [dbo].[GMI_Exchanges]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET 
Clearing_House_Exchange=B.Clearing_House_Exchange,
Market_Identifier_Code=B.Market_Identifier_Code,
Clearing_House=B.Clearing_House
FROM #GMI_Contracts_2 A
INNER JOIN [dbo].[GMI_Exchanges] B
ON (A.GMI_Exchange=B.GMI_Exchange)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_2'
PRINT ' with [dbo].[GMI_Exchanges_by_GMI_Contract]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET 
Clearing_House_Exchange=B.Clearing_House_Exchange,
Market_Identifier_Code=B.Market_Identifier_Code
FROM #GMI_Contracts_2 A
INNER JOIN [dbo].[GMI_Exchanges_by_GMI_Contract] B
ON (A.GMI_Exchange=B.GMI_Exchange)
AND (A.GMI_Symbol=B.GMI_Symbol)
AND (A.GMI_Type=B.GMI_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update CME_Group_Contract_Type'
PRINT ' in #GMI_Contracts_2'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Contracts_2
SET CME_Group_Contract_Type =
	CASE GMI_Type
		WHEN '' THEN 'Futures'
		WHEN 'O' THEN 'Options'
		ELSE CME_Group_Contract_Type --Leave as-is
	END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_2'
PRINT ' with [dbo].[CME_Group_Contracts]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE A
SET 
CQG_Symbol=B.CQG,
TT_Symbol=B.Trading_Technologies
FROM #GMI_Contracts_2 A
INNER JOIN [dbo].[CME_Group_Contracts] B
--ON (A.Symbol=B.Globex)
ON (A.Exchange_Symbol=B.Clearport)
AND (A.CME_Group_Contract_Type=B.Futures_Options)
WHERE (A.Clearing_House='CME_Group')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Contracts_2]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Contracts_2]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[GMI_Contracts_2]'
PRINT ' with #GMI_Contracts_2'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Contracts_2]
(GMI_Exchange,
GMI_Symbol,
GMI_Type,
GMIPOS_Records,
Exchange_Symbol,
CME_Group_Contract_Type,
CQG_Symbol,
TT_Symbol,
GMI_DESC,
GMI_LONGDESC,
GMI_EXCHDESC,
Clearing_House_Exchange,
Market_Identifier_Code,
Clearing_House)
SELECT
GMI_Exchange,
GMI_Symbol,
GMI_Type,
GMIPOS_Records,
Exchange_Symbol,
CME_Group_Contract_Type,
CQG_Symbol,
TT_Symbol,
GMI_DESC,
GMI_LONGDESC,
GMI_EXCHDESC,
Clearing_House_Exchange,
Market_Identifier_Code,
Clearing_House
FROM #GMI_Contracts_2

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Contracts_2

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Contracts_2] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO