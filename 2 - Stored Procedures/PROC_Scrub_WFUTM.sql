DROP PROCEDURE [dbo].[PROC_Scrub_WFUTM]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Scrub_WFUTM]

AS

SET NOCOUNT ON

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Scrub_WFUTM] STARTED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "Start Time"

PRINT '**************************************************************************'
PRINT ' Get rid of "="'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE [dbo].[WFUTM]
SET 
GMIEX=REPLACE(GMIEX,'=',''),
EXCHDESC=REPLACE(EXCHDESC,'=',''),
GMIFC=REPLACE(GMIFC,'=',''),
[TYPE]=REPLACE([TYPE],'=',''),
PRODTYP=REPLACE(PRODTYP,'=',''),
PROMPT=REPLACE(PROMPT,'=',''),
[DESC]=REPLACE([DESC],'=',''),
LONGDESC=REPLACE(LONGDESC,'=',''),
EXALTFC=REPLACE(EXALTFC,'=',''),
OTHERDESC=REPLACE(OTHERDESC,'=',''),
EXPCOMM=REPLACE(EXPCOMM,'=',''),
SPANCOMM=REPLACE(SPANCOMM,'=',''),
CFTCFC=REPLACE(CFTCFC,'=','')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Get rid of " "'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE [dbo].[WFUTM]
SET 
GMIEX=REPLACE(GMIEX,' ',''),
--EXCHDESC=REPLACE(EXCHDESC,' ',''),
GMIFC=REPLACE(GMIFC,' ',''),
[TYPE]=REPLACE([TYPE],' ',''),
PRODTYP=REPLACE(PRODTYP,' ',''),
PROMPT=REPLACE(PROMPT,' ',''),
--[DESC]=REPLACE([DESC],' ',''),
--LONGDESC=REPLACE(LONGDESC,' ',''),
EXALTFC=REPLACE(EXALTFC,' ',''),
--OTHERDESC=REPLACE(OTHERDESC,' ',''),
EXPCOMM=REPLACE(EXPCOMM,' ',''),
SPANCOMM=REPLACE(SPANCOMM,' ',''),
CFTCFC=REPLACE(CFTCFC,' ','')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '**************************************************************************'
PRINT ' Get rid of "="'
PRINT '**************************************************************************'

SELECT GETDATE() "Start Time"

UPDATE [dbo].[WFUTM]
SET 
GMIEX=REPLACE(GMIEX,'"',''),
EXCHDESC=REPLACE(EXCHDESC,'"',''),
GMIFC=REPLACE(GMIFC,'"',''),
[TYPE]=REPLACE([TYPE],'"',''),
PRODTYP=REPLACE(PRODTYP,'"',''),
PROMPT=REPLACE(PROMPT,'"',''),
[DESC]=REPLACE([DESC],'"',''),
LONGDESC=REPLACE(LONGDESC,'"',''),
EXALTFC=REPLACE(EXALTFC,'"',''),
OTHERDESC=REPLACE(OTHERDESC,'"',''),
EXPCOMM=REPLACE(EXPCOMM,'"',''),
SPANCOMM=REPLACE(SPANCOMM,'"',''),
CFTCFC=REPLACE(CFTCFC,'"','')

SELECT @@ROWCOUNT "Records Updated"

SELECT GETDATE() "End Time"

PRINT '************************************************************************************************************'
PRINT ' [dbo].[PROC_Scrub_WFUTM] ENDED'
PRINT '************************************************************************************************************'
SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO