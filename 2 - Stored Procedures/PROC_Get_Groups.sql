USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Groups]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Groups]
									@Group_Type VARCHAR(30)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Groups] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

SELECT
Group_ID,
Group_Type
FROM [dbo].[Groups]
WHERE (Group_Type=@Group_Type)
AND (Group_ID NOT LIKE '%$%')
ORDER BY Group_ID

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Groups] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO