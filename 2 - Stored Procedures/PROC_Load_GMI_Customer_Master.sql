USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_GMI_Customer_Master]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Customer_Master]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Customer_Master] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

--**************************************************************************
-- Create #GMI_Customer_Master
--**************************************************************************
CREATE TABLE #GMI_Customer_Master
(YFIRM VARCHAR(1),
YOFFIC VARCHAR(5),
YACCT VARCHAR(5),
Account VARCHAR(20) DEFAULT '',
YREL1F VARCHAR(1),
YREL1O VARCHAR(3),
YREL1A VARCHAR(5),
Related_Account VARCHAR(20) DEFAULT '',
GMI_CFTC_Number VARCHAR(5),
GMI_CFTC_Number_2 VARCHAR(5),
Common_Ownership_Account VARCHAR(30) DEFAULT '',
YSNAME VARCHAR(50),
YINACT VARCHAR(1),
YCLASS VARCHAR(1),
YSUBCL VARCHAR(1),
YOMNBF VARCHAR(1),
YWOWND VARCHAR(1),
YCFTSB VARCHAR(2),
YRR VARCHAR(10),
--YCGMAO VARCHAR(5),
YCNTRY VARCHAR(2),
YGRPAC VARCHAR(5),
YHEDGE VARCHAR(1),
CUST_LINE_1 VARCHAR(40),
CUST_LINE_2 VARCHAR(40),
CUST_LINE_3 VARCHAR(40),
CUST_LINE_4 VARCHAR(75),
CUST_LINE_5 VARCHAR(40))
--YRSKC1 VARCHAR(10))

PRINT '**************************************************************************'
PRINT ' Load #GMI_Customer_Master'
PRINT ' with [dbo].[GMIPOSF1_File_Current]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_Customer_Master
(YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YSNAME,
YINACT,
YCLASS,
YSUBCL,
YOMNBF,
YWOWND,
YCFTSB,
YRR,
YCNTRY,
YGRPAC,
YHEDGE,
CUST_LINE_1,
CUST_LINE_2,
CUST_LINE_3,
CUST_LINE_4,
CUST_LINE_5)
SELECT
YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A,
YCFTAC,
YCFTA2,
YSNAME,
YINACT,
YCLASS,
YSUBCL,
YOMNBF,
YWOWND,
YCFTSB,
YRR,
YCNTRY,
YGRPAC,
YHEDGE,
YNA1, --CUST_LINE_1,
YNA2, --CUST_LINE_2,
YNA3, --CUST_LINE_3,
YNA4, --CUST_LINE_4,
YNA5 --CUST_LINE_5
FROM [dbo].[GNACMFF1_File_Current]
WHERE (YINACT='') --"Active" Accounts ONLY

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' Generate Account'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Customer_Master
SET Account = 
	CASE YOFFIC
		WHEN '' THEN RTRIM(YFIRM) + '-' + RTRIM(YACCT)
		ELSE RTRIM(YFIRM) + '-' + RTRIM(YOFFIC) + '-' + RTRIM(YACCT)
	END

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' Generate Related_Account'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Customer_Master
SET Related_Account =
	CASE YREL1O
		WHEN '' THEN RTRIM(YREL1F) + '-' + RTRIM(YREL1A)
		ELSE RTRIM(YREL1F) + '-' + RTRIM(YREL1O) + '-' + RTRIM(YREL1A)
	END
WHERE (YREL1F<>'')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

/*
--***************************************************************************************************************************
-- START - Generate Common_Ownership_Account
--***************************************************************************************************************************

PRINT '******************************************************************************************************************'
PRINT ' SET Common_Ownership_Account = RTRIM(YFIRM) + "-" + RTRIM(YACCT) (DEFAULT) '
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Customer_Master
SET Common_Ownership_Account = RTRIM(YFIRM) + '-' + RTRIM(YACCT)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' SET Common_Ownership_Account = RTRIM(YFIRM) + "-" + RTRIM(GMI_CFTC_Number) + RTRIM(YCFTSB)'
PRINT ' WHERE (GMI_CFTC_Number<>"")'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Customer_Master
SET Common_Ownership_Account = RTRIM(YFIRM) + '-' + RTRIM(GMI_CFTC_Number) + RTRIM(YCFTSB)
WHERE (GMI_CFTC_Number<>'') --non-blank

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' SET Common_Ownership_Account = RTRIM(YFIRM) + "-" + RTRIM(GMI_CFTC_Number_2) + RTRIM(YCFTSB)'
PRINT ' WHERE (GMI_CFTC_Number<>"")'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Customer_Master
SET Common_Ownership_Account = RTRIM(YFIRM) + '-' + RTRIM(GMI_CFTC_Number_2) + RTRIM(YCFTSB)
WHERE (GMI_CFTC_Number_2<>'') --non-blank

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' SET Common_Ownership_Account = RTRIM(YFIRM) + "-" + RTRIM(YACCT) + "-N"'
PRINT ' WHERE (YWOWND="N")'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Customer_Master
SET Common_Ownership_Account = RTRIM(YFIRM) + '-' + RTRIM(YACCT) + '-N'
WHERE (YWOWND='N')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '******************************************************************************************************************'
PRINT ' SET Common_Ownership_Account = RTRIM(YFIRM) + "-" + RTRIM(YACCT) + "-O"'
PRINT ' WHERE (YOMNBF="O")'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE #GMI_Customer_Master
SET Common_Ownership_Account = RTRIM(YFIRM) + '-' + RTRIM(YACCT) + '-O'
WHERE (YOMNBF='O')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

--***************************************************************************************************************************
-- END - Generate Common_Ownership_Account
--***************************************************************************************************************************
*/

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Customer_Master]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Customer_Master]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_Customer_Master]'
PRINT ' with #GMI_Customer_Master'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_Customer_Master]
(YFIRM,
YOFFIC,
YACCT,
Account,
YREL1F,
YREL1O,
YREL1A,
Related_Account,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
Common_Ownership_Account,
YSNAME,
YINACT,
YCLASS,
YSUBCL,
YOMNBF,
YWOWND,
YCFTSB,
YRR,
YCNTRY,
YGRPAC,
YHEDGE,
CUST_LINE_1,
CUST_LINE_2,
CUST_LINE_3,
CUST_LINE_4,
CUST_LINE_5)
SELECT
YFIRM,
YOFFIC,
YACCT,
Account,
YREL1F,
YREL1O,
YREL1A,
Related_Account,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
Common_Ownership_Account,
YSNAME,
YINACT,
YCLASS,
YSUBCL,
YOMNBF,
YWOWND,
YCFTSB,
YRR,
YCNTRY,
YGRPAC,
YHEDGE,
CUST_LINE_1,
CUST_LINE_2,
CUST_LINE_3,
CUST_LINE_4,
CUST_LINE_5
FROM #GMI_Customer_Master

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Customer_Master

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Customer_Master] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO