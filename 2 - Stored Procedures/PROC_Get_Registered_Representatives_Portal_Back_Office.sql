USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Get_Registered_Representatives_Portal_Back_Office]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Get_Registered_Representatives_Portal_Back_Office]

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Registered_Representatives_Portal_Back_Office] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--******************************************************************************
-- Create #Registered_Representatives_Current
--******************************************************************************
CREATE TABLE #Registered_Representatives_Current
(Id INT IDENTITY(1,1),
Registered_Representative_ID VARCHAR(5))

--******************************************************************************
-- Load #Registered_Representatives_Current
--******************************************************************************
INSERT INTO #Registered_Representatives_Current
(Registered_Representative_ID)
SELECT
Registered_Representative_ID
FROM [dbo].[Registered_Representatives_Current]
ORDER BY Registered_Representative_ID

--******************************************************************************
-- Return Records
--******************************************************************************
SELECT
Id,
Registered_Representative_ID
FROM #Registered_Representatives_Current
ORDER BY Id

DROP TABLE #Registered_Representatives_Current

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Get_Registered_Representatives_Portal_Back_Office] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO