USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Log_Batch]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Log_Batch]
									@Batch_Name varchar(255),
									@Batch_Status VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Log_Batch] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--***1***
IF (@Batch_Status='START') BEGIN

	INSERT INTO [dbo].[Batch_Logs]
	(Batch_Name,
	Batch_Status)
	VALUES
	(@Batch_Name, --Batch_Name,
	@Batch_Status) --Batch_Status)

--***1***
END
--***1***
ELSE BEGIN

	DECLARE
	@MAX_Batch_ID INT,
	@Start_Time DATETIME

	SELECT @MAX_Batch_ID=MAX(Batch_ID)
	FROM [dbo].[Batch_Logs]
	WHERE (Batch_Name=@Batch_Name)

	--***2***
	IF (@MAX_Batch_ID IS NOT NULL) BEGIN
		SELECT @Start_Time=Start_Time
		FROM [dbo].[Batch_Logs]
		WHERE (Batch_ID=@MAX_Batch_ID)
	--***2***
	END

	--***3***
	IF (@Start_Time IS NOT NULL) BEGIN
		DECLARE
		@End_Time DATETIME,
		@Duration TIME

		SET @End_Time = GETDATE()
		SET @Duration = @End_Time - @Start_Time

		UPDATE [dbo].[Batch_Logs]
		SET
		Batch_Status=@Batch_Status,
		End_Time=@End_Time,
		Duration=@Duration
		WHERE (Batch_ID=@MAX_Batch_ID)
	--***3***
	END

--***1***
END

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Log_Batch] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO