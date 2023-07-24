USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Cash_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Cash_Portal_Back_Office]
															@Account VARCHAR(20)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Cash_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #Global_Risk_File_Current_Cash
--******************************************************************************
CREATE TABLE #Global_Risk_File_Current_Cash
(Id INT IDENTITY(1,1),
Account VARCHAR(20),
GMI_Description VARCHAR(30),
PNET NUMERIC(15,2),
Currency_Code VARCHAR(3),
Snapshot_Time VARCHAR(30))

--******************************************************************************
-- Load #Global_Risk_File_Current_Cash
--******************************************************************************
INSERT INTO #Global_Risk_File_Current_Cash
(Account,
GMI_Description,
PNET,
Currency_Code,
Snapshot_Time)
SELECT
Account,
GMI_Description,
PNET,
Currency_Code,
CONVERT(VARCHAR,DateLoaded,100) --Snapshot_Time
FROM [dbo].[Global_Risk_File_Current_Cash]
WHERE (Account=@Account)
ORDER BY
GMI_Description,
PATYPE

SELECT
Id,
Account,
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