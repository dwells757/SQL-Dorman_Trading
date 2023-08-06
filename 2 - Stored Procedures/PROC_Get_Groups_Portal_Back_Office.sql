USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Groups_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Groups_Portal_Back_Office]
														@Group_Type VARCHAR(30)

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Groups_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #Groups
--******************************************************************************
CREATE TABLE #Groups
(Id INT IDENTITY(1,1),
Group_ID VARCHAR(30),
Group_Type VARCHAR(30))

--******************************************************************************
-- Load #Groups
--******************************************************************************
INSERT INTO #Groups
(Group_ID,
Group_Type)
SELECT
Group_ID,
Group_Type
FROM [dbo].[Groups]
WHERE (Group_Type=@Group_Type)
AND (Group_ID NOT LIKE '%$%')
ORDER BY Group_ID

--******************************************************************************
-- Return Records
--******************************************************************************
SELECT
Id,
Group_ID,
Group_Type
FROM #Groups
ORDER BY Id

DROP TABLE #Groups

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Groups_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO