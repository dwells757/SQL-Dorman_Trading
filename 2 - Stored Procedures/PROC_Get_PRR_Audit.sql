USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_PRR_Audit]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PROC_Get_PRR_Audit]
										@GMI_Table VARCHAR(8)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_PRR_Audit] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

SELECT
Id,
PRR,
Master_Common_Name
FROM [dbo].[PRR_Audit]
WHERE (GMI_Table=@GMI_Table)
AND (Master_Common_Name='')
ORDER BY PRR

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_PRR_Audit] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"


SET NOCOUNT OFF

GO


