USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_Current_Information_with_GMIPOSF1]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Current_Information_with_GMIPOSF1]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Current_Information_with_GMIPOSF1] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

DECLARE
@str_Current_Processing_Date VARCHAR(8),
@dte_Current_Processing_Date DATE

SELECT @str_Current_Processing_Date=MAX(PTDATE)
FROM [dbo].[GMIPOSF1_File_Current]

SET @dte_Current_Processing_Date=CONVERT(DATE,@str_Current_Processing_Date)

SELECT 
@str_Current_Processing_Date "@str_Current_Processing_Date",
@dte_Current_Processing_Date "@dte_Current_Processing_Date"

IF (@str_Current_Processing_Date IS NOT NULL) BEGIN

	PRINT '**************************************************************************'
	PRINT ' TRUNCATE TABLE [dbo].[Current_Information]'
	PRINT '**************************************************************************'
	TRUNCATE TABLE [dbo].[Current_Information]

	PRINT '**************************************************************************'
	PRINT ' Load [dbo].[Current_Information]'
	PRINT '**************************************************************************'
	INSERT INTO [dbo].[Current_Information]
	(Current_Processing_Date)
	VALUES
	(@dte_Current_Processing_Date)

	SELECT @@ROWCOUNT "Records Loaded"
END

SELECT *
FROM [dbo].[Current_Information]

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Current_Information_with_GMIPOSF1] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO