DROP PROCEDURE [dbo].[PROC_Scrub_GMI_Micro_Contracts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Scrub_GMI_Micro_Contracts]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Scrub_GMI_Micro_Contracts] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

PRINT '**************************************************************************'
PRINT ' UPDATE GMI_Exchange'
PRINT ' in [dbo].[GMI_Micro_Contracts]'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE [dbo].[GMI_Micro_Contracts]
SET GMI_Exchange = RIGHT('00' + SUBSTRING([Concat],1,CHARINDEX('/',[Concat])-1),2)

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Scrub_GMI_Micro_Contracts] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO