USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Update_Current_Information_Snapshot_Time]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Update_Current_Information_Snapshot_Time]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_Current_Information_Snapshot_Time] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

PRINT '**************************************************************************'
PRINT ' Update [dbo].[Current_Information]'
PRINT '**************************************************************************'
UPDATE [dbo].[Current_Information]
SET Snapshot_Time = GETDATE()

SELECT @@ROWCOUNT "Records Updated"

SELECT *
FROM [dbo].[Current_Information]

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_Current_Information_Snapshot_Time] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO