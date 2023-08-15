USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Current_Information]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Current_Information]

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Information] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

SELECT 
1 "Id",
CONVERT(VARCHAR,Current_Processing_Date,101) "Current_Processing_Date",
CONVERT(VARCHAR,Snapshot_Time,109) "Snapshot_Time"
FROM [dbo].[Current_Information]

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Current_Information] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO