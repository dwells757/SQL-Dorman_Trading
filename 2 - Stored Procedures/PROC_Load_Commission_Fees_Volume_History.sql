USE [GMIDATA]
GO

--DROP PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History]
--GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--CREATE PROCEDURE [dbo].[PROC_Load_Commission_Fees_Volume_History]

--AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

DECLARE
@dte_Current_Processing_Date DATE

SELECT @dte_Current_Processing_Date=Current_Processing_Date
FROM [dbo].[Current_Information]

SELECT @dte_Current_Processing_Date "@dte_Current_Processing_Date"

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Load_Commission_Fees_Volume_History] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

--GO