USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Update_GMIPOSF1_File_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Update_GMIPOSF1_File_Current]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMIPOSF1_File_Current] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

UPDATE [dbo].[GMIPOSF1_File_Current]
SET
PRECID=REPLACE(PRECID,'"',''),
PCCNTY=REPLACE(PCCNTY,'"','')

SELECT @@ROWCOUNT "Records Updated"

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Update_GMIPOSF1_File_Current] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"


SET NOCOUNT OFF

GO