USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_GMI_Information]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GMI_Information]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Information] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

DECLARE
@str_Current_Processing_Date VARCHAR(8),
@dte_Current_Processing_Date DATE

SELECT @str_Current_Processing_Date=MAX(PTDATE)
FROM [dbo].[GMIPOSF1_File_Current]
WHERE (Record_Number<>1)

SET @dte_Current_Processing_Date=CONVERT(DATE,@str_Current_Processing_Date)

SELECT 
@str_Current_Processing_Date "@str_Current_Processing_Date",
@dte_Current_Processing_Date "@dte_Current_Processing_Date"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GMI_Information]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[GMI_Information]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[GMI_Information]'
PRINT '**************************************************************************'
INSERT INTO [dbo].[GMI_Information]
(Current_Processing_Date)
VALUES
(@dte_Current_Processing_Date)

SELECT @@ROWCOUNT "Records Loaded"

SELECT *
FROM [dbo].[GMI_Information]

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GMI_Information] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"


SET NOCOUNT OFF

GO