DROP PROCEDURE [dbo].[PROC_Load_DOREMAILA3_File_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Load_DOREMAILA3_File_Current]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_DOREMAILA3_File_Current] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

PRINT '**************************************************************************'
PRINT ' TRUNCATE TABLE [dbo].[DOREMAILA3_File_Current]'
PRINT '**************************************************************************'
TRUNCATE TABLE [dbo].[DOREMAILA3_File_Current]

PRINT '**************************************************************************'
PRINT ' Load [dbo].[DOREMAILA3_File_Current]'
PRINT ' with [dbo].[DOREMAILA3_File_Raw]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

INSERT INTO [dbo].[DOREMAILA3_File_Current]
(MFUNC,
MSEQ,
MFIRM,
MOFFIC,
MACCT,
YRR,
MTRMID,
MADRS1,
MADRS2,
MADRS3,
MADRS4)
SELECT --TOP 10000
CONVERT(VARCHAR(10),REPLACE(MFUNC,'"','')), --MFUNC
CONVERT(VARCHAR(10),MSEQ), --MSEQ
CONVERT(VARCHAR(1),MFIRM), --MFIRM
CONVERT(VARCHAR(3),MOFFIC), --MOFFIC
CONVERT(VARCHAR(5),MACCT), --MACCT
CONVERT(VARCHAR(5),YRR), --YRR
CONVERT(VARCHAR(255),MTRMID), --MTRMID
CONVERT(VARCHAR(255),MADRS1), --MADRS1
CONVERT(VARCHAR(255),MADRS2), --MADRS2
CONVERT(VARCHAR(255),MADRS3), --MADRS3
CONVERT(VARCHAR(255),MADRS4) --MADRS4
FROM [dbo].[DOREMAILA3_File_Raw]

SELECT @@ROWCOUNT "Records Loaded"

SELECT GETDATE() "End Time"

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Load_DOREMAILA3_File_Current] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO