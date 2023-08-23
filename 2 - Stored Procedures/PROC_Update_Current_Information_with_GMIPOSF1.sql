USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Update_Current_Information_with_GMIPOSF1]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Update_Current_Information_with_GMIPOSF1]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_Current_Information_with_GMIPOSF1] STARTED'
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
	PRINT ' Update [dbo].[Current_Information]'
	PRINT '**************************************************************************'
	UPDATE [dbo].[Current_Information]
	SET Current_Processing_Date = @dte_Current_Processing_Date

	SELECT @@ROWCOUNT "Records Updated"
END
ELSE BEGIN
	PRINT '**************************************************************************'
	PRINT ' @str_Current_Processing_Date IS NULL!!!!!!!'
	PRINT ' @str_Current_Processing_Date IS NULL!!!!!!!'
	PRINT ' @str_Current_Processing_Date IS NULL!!!!!!!'
	PRINT ' @str_Current_Processing_Date IS NULL!!!!!!!'
	PRINT ' @str_Current_Processing_Date IS NULL!!!!!!!'
	PRINT ' @str_Current_Processing_Date IS NULL!!!!!!!'
	PRINT ' @str_Current_Processing_Date IS NULL!!!!!!!'
	PRINT ' '
	PRINT ' Update [dbo].[Current_Information]'
	PRINT '**************************************************************************'
	UPDATE [dbo].[Current_Information]
	SET Current_Processing_Date = GETDATE() --This is to avoid deleting any historical data

	SELECT @@ROWCOUNT "Records Updated"
END

SELECT *
FROM [dbo].[Current_Information]

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_Current_Information_with_GMIPOSF1] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO