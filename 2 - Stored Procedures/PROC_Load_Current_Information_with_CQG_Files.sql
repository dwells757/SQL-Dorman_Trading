USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Load_Current_Information_with_CQG_Files]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_Current_Information_with_CQG_Files]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Current_Information_with_CQG_Files] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

DECLARE
@int_MAX_PTDATE NUMERIC(11),
@str_MAX_PTDATE VARCHAR(11),
@dte_MAX_PTDATE DATE

SELECT @int_MAX_PTDATE = MAX(PTDATE)
FROM [dbo].[CQGST4F1_File_Current]

SET @str_MAX_PTDATE = CONVERT(VARCHAR(11),@int_MAX_PTDATE)

SET @dte_MAX_PTDATE = CONVERT(DATE,@str_MAX_PTDATE)

SELECT
@int_MAX_PTDATE "@int_MAX_PTDATE",
@str_MAX_PTDATE "@str_MAX_PTDATE",
@dte_MAX_PTDATE "@dte_MAX_PTDATE"

--***1***
IF (@dte_MAX_PTDATE IS NOT NULL) BEGIN

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
	(@dte_MAX_PTDATE) --Current_Processing_Date

	SELECT @@ROWCOUNT "Records Loaded"
--***1***
END
--***1***
ELSE BEGIN

	DECLARE
	@int_MAX_MDLACT NUMERIC(9),
	@str_MAX_MDLACT VARCHAR(9),
	@dte_MAX_MDLACT DATE

	SELECT @int_MAX_MDLACT = MAX(MDLACT)
	FROM [dbo].[CQGMNYF1_File_Current]

	SET @str_MAX_MDLACT = CONVERT(VARCHAR(11),@int_MAX_MDLACT)

	SET @dte_MAX_MDLACT = CONVERT(DATE,@str_MAX_MDLACT)

	SELECT
	@int_MAX_MDLACT "@int_MAX_MDLACT",
	@str_MAX_MDLACT "@str_MAX_MDLACT",
	@dte_MAX_MDLACT "@dte_MAX_MDLACT"

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
	(@dte_MAX_MDLACT) --Current_Processing_Date

	SELECT @@ROWCOUNT "Records Loaded"

--***1***
END

SELECT *
FROM [dbo].[Current_Information]

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_Current_Information_with_CQG_Files] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO