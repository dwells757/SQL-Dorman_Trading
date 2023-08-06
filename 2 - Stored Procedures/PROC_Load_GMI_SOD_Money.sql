USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_GMI_SOD_Money]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_SOD_Money]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_SOD_Money] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

DECLARE
@dte_Current_Processing_Date DATE

SELECT @dte_Current_Processing_Date=Current_Processing_Date
FROM [dbo].[Current_Information]

SELECT @dte_Current_Processing_Date "@dte_Current_Processing_Date"

--**************************************************************************
-- Create #GMI_SOD_Money
--**************************************************************************
CREATE TABLE #GMI_SOD_Money
(Processing_Date DATE,
MRECID VARCHAR(1),
MFIRM VARCHAR(1),
MOFFIC VARCHAR(3),
MACCT VARCHAR(5),
MCLASS VARCHAR(1),
Account VARCHAR(20) DEFAULT '',
Related_Account VARCHAR(20) DEFAULT '',
Account_Type VARCHAR(2),
Account_Type_Currency_Code_Symbol VARCHAR(3),
Product_Currency_Code VARCHAR(2),
Account_Base_Currency_Code_Symbol VARCHAR(3),
Firm_Base_Currency_Code_Symbol VARCHAR(3),
Currency_Processing_Code VARCHAR(1),
Account_Balance NUMERIC(15,2),
Long_Market_Value_of_Securities_on_Deposit NUMERIC(15,2),
Short_Market_Value_of_Securities_on_Deposit NUMERIC(15,2),
Long_Option_Market_Value NUMERIC(15,2),
Short_Option_Market_Value NUMERIC(15,2),
Futures_Initial_Margin_Requirement NUMERIC(15,2),
Futures_Maintenance_Margin_Requirement NUMERIC(15,2),
Margin_Excess_Deficit NUMERIC(15,2),
Open_Trade_Equity NUMERIC(15,2))

PRINT '**************************************************************************'
PRINT ' Load #GMI_SOD_Money'
PRINT ' with [dbo].[GMIMNYF1_File_Current]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO #GMI_SOD_Money
(Processing_Date,
MRECID,
MFIRM,
MOFFIC,
MACCT,
MCLASS,
Account_Type,
Account_Type_Currency_Code_Symbol,
Product_Currency_Code,
Account_Base_Currency_Code_Symbol,
Firm_Base_Currency_Code_Symbol,
Currency_Processing_Code,
Account_Balance,
Long_Market_Value_of_Securities_on_Deposit,
Short_Market_Value_of_Securities_on_Deposit,
Long_Option_Market_Value,
Short_Option_Market_Value,
Futures_Initial_Margin_Requirement,
Futures_Maintenance_Margin_Requirement,
Margin_Excess_Deficit,
Open_Trade_Equity)
SELECT
@dte_Current_Processing_Date, --Processing_Date,
MRECID,
MFIRM,
MOFFIC,
MACCT,
MCLASS,
MATYPE, --Account_Type,
MCURAT, --Account_Type_Currency_Code_Symbol,
MCURCD, --Product_Currency_Code,
MCURAC, --Account_Base_Currency_Code_Symbol,
MCURFM, --Firm_Base_Currency_Code_Symbol,
MCPCOD, --Currency_Processing_Code,
MBAL, --Account_Balance,
MLMV, --Long_Market_Value_of_Securities_on_Deposit,
MSMV, --Short_Market_Value_of_Securities_on_Deposit,
MLOV, --Long_Option_Market_Value,
MSOV, --Short_Option_Market_Value,
MFIR, --Futures_Initial_Margin_Requirement,
MFMR, --Futures_Maintenance_Margin_Requirement,
MME, --Margin_Excess_Deficit,
MOTE --Open_Trade_Equity
FROM [dbo].[GMIMNYF1_File_Current]
WHERE (MRECID='M')
AND (MCLASS IN('C','H'))

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
Related_Account VARCHAR(20))

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
Related_Account)
SELECT
YFIRM,
YOFFIC,
YACCT,
Account,
Related_Account
FROM [dbo].[GMI_Customer_Master]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Update #GMI_SOD_Money'
PRINT ' with #GMI_Customer_Master'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE B
SET
Account = A.Account,
Related_Account = A.Related_Account
FROM #GMI_Customer_Master A
INNER JOIN #GMI_SOD_Money B
ON (A.YFIRM=B.MFIRM)
AND (A.YOFFIC=B.MOFFIC)
AND (A.YACCT=B.MACCT)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_Customer_Master

PRINT '******************************************************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_SOD_Money]'
PRINT '******************************************************************************************************************'
TRUNCATE TABLE [dbo].[GMI_SOD_Money]

PRINT '******************************************************************************************************************'
PRINT ' Load [dbo].[GMI_SOD_Money]'
PRINT ' with #GMI_SOD_Money'
PRINT '******************************************************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GMI_SOD_Money]
(Processing_Date,
MRECID,
MFIRM,
MOFFIC,
MACCT,
MCLASS,
Account,
Related_Account,
Account_Type,
Account_Type_Currency_Code_Symbol,
Product_Currency_Code,
Account_Base_Currency_Code_Symbol,
Firm_Base_Currency_Code_Symbol,
Currency_Processing_Code,
Account_Balance,
Long_Market_Value_of_Securities_on_Deposit,
Short_Market_Value_of_Securities_on_Deposit,
Long_Option_Market_Value,
Short_Option_Market_Value,
Futures_Initial_Margin_Requirement,
Futures_Maintenance_Margin_Requirement,
Margin_Excess_Deficit,
Open_Trade_Equity)
SELECT
Processing_Date,
MRECID,
MFIRM,
MOFFIC,
MACCT,
MCLASS,
Account,
Related_Account,
Account_Type,
Account_Type_Currency_Code_Symbol,
Product_Currency_Code,
Account_Base_Currency_Code_Symbol,
Firm_Base_Currency_Code_Symbol,
Currency_Processing_Code,
Account_Balance,
Long_Market_Value_of_Securities_on_Deposit,
Short_Market_Value_of_Securities_on_Deposit,
Long_Option_Market_Value,
Short_Option_Market_Value,
Futures_Initial_Margin_Requirement,
Futures_Maintenance_Margin_Requirement,
Margin_Excess_Deficit,
Open_Trade_Equity
FROM #GMI_SOD_Money

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

DROP TABLE #GMI_SOD_Money

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_SOD_Money] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO