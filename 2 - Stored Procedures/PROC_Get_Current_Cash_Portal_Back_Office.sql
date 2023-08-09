USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Cash_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Cash_Portal_Back_Office]
															--@Account VARCHAR(20)
															@Group_ID VARCHAR(30)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Cash_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

DECLARE
@Group_Type VARCHAR(30)

--******************************************************************************
-- Create #Global_Risk_File_Current_Cash
--******************************************************************************
CREATE TABLE #Global_Risk_File_Current_Cash
(Id INT IDENTITY(1,1),
--Account VARCHAR(20),
Group_ID VARCHAR(30),
Group_Type VARCHAR(30),
GMI_Description VARCHAR(30),
PNET NUMERIC(15,2),
Currency_Code VARCHAR(3),
Snapshot_Time VARCHAR(30))

--******************************************************************************
-- Try to get @Group_Type
--******************************************************************************
SELECT @Group_Type=Group_Type
FROM [dbo].[Groups]
WHERE (Group_ID=@Group_ID)

--*********************************************************************************************************************************************************************************
-- START - Load #Global_Risk_File_Current_Cash
--*********************************************************************************************************************************************************************************
--***1***
IF (@Group_Type='Account') BEGIN

	INSERT INTO #Global_Risk_File_Current_Cash
	(--Account,
	Group_ID,
	Group_Type,
	GMI_Description,
	PNET,
	Currency_Code,
	Snapshot_Time)
	SELECT
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
	GMI_Description,
	PNET,
	Currency_Code,
	CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
	FROM [dbo].[Global_Risk_File_Current_Cash]
	WHERE (Account=@Group_ID)
	ORDER BY
	GMI_Description,
	PATYPE

--***1***
END

--***2***
IF (@Group_Type='Related_Account') BEGIN

	INSERT INTO #Global_Risk_File_Current_Cash
	(--Account,
	Group_ID,
	Group_Type,
	GMI_Description,
	PNET,
	Currency_Code,
	Snapshot_Time)
	SELECT
	--Account,
	@Group_ID, --Group_ID,
	@Group_Type, --Group_Type,
	GMI_Description,
	PNET,
	Currency_Code,
	CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
	FROM [dbo].[Global_Risk_File_Current_Cash]
	WHERE (Related_Account=@Group_ID)
	ORDER BY
	GMI_Description,
	PATYPE

--***2***
END

SELECT
Id,
--Account,
Group_ID,
Group_Type,
GMI_Description "Description",
PNET, --NUMERIC(15,2)
Currency_Code,
Snapshot_Time
FROM #Global_Risk_File_Current_Cash
ORDER BY Id

DROP TABLE #Global_Risk_File_Current_Cash

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Cash_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO