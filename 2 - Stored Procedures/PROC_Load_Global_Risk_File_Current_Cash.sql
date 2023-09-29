DROP PROCEDURE [dbo].[PROC_Load_Global_Risk_File_Current_Cash]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Global_Risk_File_Current_Cash]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Global_Risk_File_Current_Cash] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************************
-- Create #Global_Risk_File_Current_Cash
--**************************************************************************
CREATE TABLE #Global_Risk_File_Current_Cash
(Processing_Date DATE DEFAULT GETDATE(),
PRECID VARCHAR(1),
PFIRM VARCHAR(1),
POFFIC VARCHAR(3),
PACCT VARCHAR(5),
Account VARCHAR(20) DEFAULT '',
--GMI_Sub_Account VARCHAR(10),
Related_Account VARCHAR(20) DEFAULT '',
PATYPE VARCHAR(2),
GMI_Description VARCHAR(30),
PNET NUMERIC(15,2),
Currency_Code VARCHAR(3) DEFAULT '')

PRINT '**************************************************************************'
PRINT ' Load #Global_Risk_File_Current_Cash'
PRINT ' with [dbo].[Global_Risk_File_Raw]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #Global_Risk_File_Current_Cash
(PRECID,
PFIRM,
POFFIC,
PACCT,
PATYPE,
GMI_Description,
PNET)
SELECT
PRECID, --[varchar](1) NOT NULL,
PFIRM, --[varchar](1) NOT NULL,
POFFIC, --[varchar](3) NOT NULL,
PACCT, --[varchar](5) NOT NULL,
PATYPE, --[varchar](2) NOT NULL,
PSDSC1, --GMI_Description, [varchar](30) NOT NULL, 
CONVERT(NUMERIC(15,2),PNET) --0 --PNET --[numeric](15,2) NOT NULL
FROM [dbo].[Global_Risk_File_Raw]
WHERE (PRECID IN(
'A',
'C'))
AND (ISNUMERIC(PNET)=1)

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

--**************************************************************************
-- Create #GMI_Customer_Master
--**************************************************************************
CREATE TABLE #GMI_Customer_Master
(YFIRM VARCHAR(1),
YOFFIC VARCHAR(5),
YACCT VARCHAR(5),
Account VARCHAR(20),
Related_Account VARCHAR(20),
GMI_CFTC_Number VARCHAR(5),
GMI_CFTC_Number_2 VARCHAR(5),
YOMNBF VARCHAR(1),
YCFTSB VARCHAR(2),
Common_Ownership_Account VARCHAR(30))

PRINT '**************************************************************************'
PRINT ' Load #GMI_Customer_Master'
PRINT ' with [dbo].[GMI_Customer_Master]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Customer_Master
(YFIRM,
YOFFIC,
YACCT,
Account,
Related_Account,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Common_Ownership_Account)
SELECT
YFIRM,
YOFFIC,
YACCT,
Account,
Related_Account,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Common_Ownership_Account
FROM [dbo].[GMI_Customer_Master]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #Global_Risk_File_Current_Cash'
PRINT ' with #GMI_Customer_Master'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
Account = A.Account,
Related_Account = A.Related_Account
FROM #GMI_Customer_Master A
INNER JOIN #Global_Risk_File_Current_Cash B
ON (A.YFIRM=B.PFIRM)
AND (A.YOFFIC=B.POFFIC)
AND (A.YACCT=B.PACCT)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Customer_Master

PRINT '**************************************************************************'
PRINT ' Update #Global_Risk_File_Current_Cash'
PRINT ' with [dbo].[GMI_Account_Types]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET Currency_Code=A.Currency_Code
FROM [dbo].[GMI_Account_Types] A
INNER JOIN #Global_Risk_File_Current_Cash B
ON (A.GMI_Account_Type=B.PATYPE)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Cash]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Cash]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Global_Risk_File_Current_Cash]'
PRINT ' with #Global_Risk_File_Current_Cash'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Global_Risk_File_Current_Cash]
(Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
PATYPE,
GMI_Description,
PNET,
Currency_Code)
SELECT
Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
PATYPE,
GMI_Description,
PNET,
Currency_Code
FROM #Global_Risk_File_Current_Cash

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #Global_Risk_File_Current_Cash

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Global_Risk_File_Current_Cash] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO