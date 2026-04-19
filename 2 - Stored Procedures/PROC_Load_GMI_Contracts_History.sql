USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_GMI_Contracts_History]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Contracts_History]
													@Current_Processing_Date VARCHAR(8)=''

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Contracts_History] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

IF (@Current_Processing_Date='') BEGIN
	SELECT @Current_Processing_Date=Current_Processing_Date
	FROM [dbo].[Current_Processing_Date]
END

SELECT @Current_Processing_Date "@Current_Processing_Date"

--**************************************************************
-- Create #GMI_Contracts_SOD
--**************************************************************
CREATE TABLE #GMI_Contracts_SOD
(GMI_Exchange VARCHAR(2),
GMI_Symbol VARCHAR(2),
GMI_Security_Type VARCHAR(10),
GMI_Multiplier NUMERIC(18,9),
GMI_Currency_Code VARCHAR(3),
IN_GMI_Contracts_History_YN VARCHAR(1) DEFAULT 'N',
Processing_Date_Updated VARCHAR(8) DEFAULT '')

PRINT '**************************************************************************'
PRINT ' Load #GMI_Contracts_SOD'
PRINT ' with [dbo].[GMI_Contracts_SOD]'
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
GMI_Multiplier,
GMI_Currency_Code
FROM [dbo].[GMI_Contracts_SOD]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_Contracts_SOD'
PRINT ' with [dbo].[GMI_Contracts_History]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
IN_GMI_Contracts_History_YN='Y',
Processing_Date_Updated=A.Processing_Date_Updated
FROM [dbo].[GMI_Contracts_History] A
INNER JOIN #GMI_Contracts_SOD B
ON (A.GMI_Exchange=B.GMI_Exchange)
AND (A.GMI_Symbol=B.GMI_Symbol)
AND (A.GMI_Security_Type=B.GMI_Security_Type)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Load [dbo].[GMI_Contracts_History]'
PRINT ' with #GMI_Contracts_SOD'
PRINT ' WHERE (IN_GMI_Contracts_History_YN="N")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Contracts_History]
(GMI_Exchange,
GMI_Symbol,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code,
DateLoaded,
Processing_Date_Loaded,
Days_In_GMIPOSF1_File,
Date_Updated,
Processing_Date_Updated)
SELECT
GMI_Exchange,
GMI_Symbol,
GMI_Security_Type,
GMI_Multiplier,
GMI_Currency_Code,
GETDATE(), --DateLoaded
@Current_Processing_Date, --Processing_Date_Loaded,
1, --Days_In_GMIPOSF1_File,
GETDATE(), --Date_Updated
@Current_Processing_Date --Processing_Date_Updated
FROM #GMI_Contracts_SOD
WHERE (IN_GMI_Contracts_History_YN='N')

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update [dbo].[GMI_Contracts_History]'
PRINT ' with #GMI_Contracts_SOD'
PRINT ' WHERE (IN_GMI_Contracts_History_YN="Y")'
PRINT ' AND (Processing_Date_Updated<>"' + @Current_Processing_Date + '")'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
GMI_Multiplier = A.GMI_Multiplier,
GMI_Currency_Code = A.GMI_Currency_Code,
Days_In_GMIPOSF1_File = Days_In_GMIPOSF1_File + 1,
Processing_Date_Updated = @Current_Processing_Date,
Date_Updated = GETDATE()
FROM #GMI_Contracts_SOD A
INNER JOIN [dbo].[GMI_Contracts_History] B
ON (A.GMI_Exchange=B.GMI_Exchange)
AND (A.GMI_Symbol=B.GMI_Symbol)
AND (A.GMI_Security_Type=B.GMI_Security_Type)
WHERE (A.IN_GMI_Contracts_History_YN = 'Y')
AND (A.Processing_Date_Updated <> @Current_Processing_Date)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Contracts_SOD

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Contracts_History] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO