/****** Object:  StoredProcedure [dbo].[PROC_Load_Yest_Tables]    Script Date: 6/30/2026 5:58:08 PM ******/
DROP PROCEDURE [dbo].[PROC_Load_Yest_Tables]
GO

/****** Object:  StoredProcedure [dbo].[PROC_Load_Yest_Tables]    Script Date: 6/30/2026 5:58:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PROC_Load_Yest_Tables]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Yest_Tables] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_SOD_Positions_Detailed_Yest]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[GMI_SOD_Positions_Detailed_Yest]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[GMI_SOD_Positions_Detailed_Yest]'
PRINT ' with [dbo].[GMI_SOD_Positions_Detailed]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_SOD_Positions_Detailed_Yest]
(Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
GMI_Sub_Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
OTE,
Market_Value,
Option_Unrealized,
Securities_on_Deposit,
GMI_Currency_Code,
PTDATE,
Expiration_Date,
PCLASS,
PEXPDT,
PSTYPE,
PLTDAT,
PCUSP2,
PLEAVQ,
PBUSTQ,
PBROKR,
PGIVIO,
PSPRED,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Account_Type,
Currency_Code,
DateLoaded)
SELECT
Processing_Date,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
GMI_Sub_Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Last_Closing_Price,
OTE,
Market_Value,
Option_Unrealized,
Securities_on_Deposit,
GMI_Currency_Code,
PTDATE,
Expiration_Date,
PCLASS,
PEXPDT,
PSTYPE,
PLTDAT,
PCUSP2,
PLEAVQ,
PBUSTQ,
PBROKR,
PGIVIO,
PSPRED,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
Account_Type,
Currency_Code,
DateLoaded
FROM [dbo].[GMI_SOD_Positions_Detailed]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Cash_Yest]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Cash_Yest]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Global_Risk_File_Current_Cash_Yest]'
PRINT ' with [dbo].[Global_Risk_File_Current_Cash]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Global_Risk_File_Current_Cash_Yest]
(Processing_Date,
Record_Number,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
PATYPE,
GMI_Description,
PNET,
Currency_Code,
DateLoaded)
SELECT
Processing_Date,
Record_Number,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
PATYPE,
GMI_Description,
PNET,
Currency_Code,
DateLoaded
FROM [dbo].[Global_Risk_File_Current_Cash]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Transactions_Yest]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Transactions_Yest]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Global_Risk_File_Current_Transactions_Yest]'
PRINT ' with [dbo].[Global_Risk_File_Current_Transactions]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Global_Risk_File_Current_Transactions_Yest]
(PRECNO,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Currency_Code,
IN_GMI_Contracts_History,
PCLASS,
PEXPDT,
PSTYPE,
PCUSP2,
PLEAVQ,
PBUSTQ,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
PATYPE,
PROUT3,
PPCNTY,
PCARD,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PSTAT5,
PPTYPE,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET,
Currency_Code,
Processing_Date,
DateLoaded)
SELECT
PRECNO,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Currency_Code,
IN_GMI_Contracts_History,
PCLASS,
PEXPDT,
PSTYPE,
PCUSP2,
PLEAVQ,
PBUSTQ,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
PATYPE,
PROUT3,
PPCNTY,
PCARD,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PSTAT5,
PPTYPE,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET,
Currency_Code,
Processing_Date,
DateLoaded
FROM [dbo].[Global_Risk_File_Current_Transactions]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Transactions_2_Yest]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[Global_Risk_File_Current_Transactions_2_Yest]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[Global_Risk_File_Current_Transactions_2_Yest]'
PRINT ' with [dbo].[Global_Risk_File_Current_Transactions_2]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[Global_Risk_File_Current_Transactions_2_Yest]
(PRECNO,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Currency_Code,
IN_GMI_Contracts_History,
PCLASS,
PEXPDT,
PSTYPE,
PCUSP2,
PLEAVQ,
PBUSTQ,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
PATYPE,
PROUT3,
PPCNTY,
PCARD,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PSTAT5,
PPTYPE,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET,
Currency_Code,
Processing_Date,
DateLoaded)
SELECT
PRECNO,
PRECID,
PFIRM,
POFFIC,
PACCT,
Account,
Related_Account,
Common_Ownership_Account,
PEXCH,
PFC,
PCTYM,
PSBCUS,
PSTRIK,
PSUBTY,
GMI_Security_Type,
Product,
GMI_Description,
PBS,
PQTY,
GMI_Trade_Price,
GMI_Multiplier,
GMI_Currency_Code,
IN_GMI_Contracts_History,
PCLASS,
PEXPDT,
PSTYPE,
PCUSP2,
PLEAVQ,
PBUSTQ,
GMI_CFTC_Number,
GMI_CFTC_Number_2,
YOMNBF,
YCFTSB,
PATYPE,
PROUT3,
PPCNTY,
PCARD,
PSYMBL,
PSUBTY_UFC_UNSYMB,
PSTAT5,
PPTYPE,
PCABCD,
PCMNT2,
PSTAT7,
PDELET,
PDEST,
PCLOSE,
PSDATE,
PNET,
Currency_Code,
Processing_Date,
DateLoaded
FROM [dbo].[Global_Risk_File_Current_Transactions_2]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Yest_Tables] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO


