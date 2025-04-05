DROP PROCEDURE [dbo].[PROC_Load_GNACMFF4_File_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_GNACMFF4_File_Current]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GNACMFF4_File_Current] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[GNACMFF4_File_Current]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[GNACMFF4_File_Current]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[GNACMFF4_File_Current]'
PRINT ' with [dbo].[GNACMFF4_File_Raw]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[GNACMFF4_File_Current]
(YRECID,
YFIRM,
YOFFIC,
YACCT,
YFLDID,
YDAT50,
YDSTFL,
YMSTFL,
YOPTFL,
YTRDFL,
YDUMF1,
YDUMF2,
YUSER,
YCHGDT)
SELECT --TOP 10000
CONVERT(VARCHAR(1),REPLACE(YRECID,'"','')), --YRECID
CONVERT(VARCHAR(1),YFIRM), --YFIRM
CONVERT(VARCHAR(3),YOFFIC), --YOFFIC
CONVERT(VARCHAR(5),YACCT), --YACCT
CONVERT(VARCHAR(255),YFLDID), --YFLDID
CONVERT(VARCHAR(255),YDAT50), --YDAT50
CONVERT(VARCHAR(255),YDSTFL), --YDSTFL
CONVERT(VARCHAR(255),YMSTFL), --YMSTFL
CONVERT(VARCHAR(255),YOPTFL), --YOPTFL
CONVERT(VARCHAR(255),YTRDFL), --YTRDFL
CONVERT(VARCHAR(255),YDUMF1), --YDUMF1
CONVERT(VARCHAR(255),YDUMF2), --YDUMF2
CONVERT(VARCHAR(255),YUSER), --YUSER
CONVERT(VARCHAR(255),YCHGDT) --YCHGDT
FROM [dbo].[GNACMFF4_File_Raw]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_GNACMFF4_File_Current] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO