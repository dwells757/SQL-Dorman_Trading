USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Generate_Risk_Report_With_Id]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Generate_Risk_Report_With_Id]
													@Processing_Date DATE=NULL

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Generate_Risk_Report_With_Id] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--********************************************************************************
-- Create #GMIMNYF1_File_Current
--********************************************************************************
CREATE TABLE #GMIMNYF1_File_Current
(Id INT IDENTITY(1,1),
Processing_Date DATE,
MOFFIC VARCHAR(3),
MACCT VARCHAR(5),
MRR VARCHAR(5),
MCLASS VARCHAR(1),
MSUBCL VARCHAR(1),
MATYPE VARCHAR(2),
MCURAT VARCHAR(3),
MSNAME VARCHAR(20),
MREL1O VARCHAR(3),
MREL1A VARCHAR(5),
MBAL NUMERIC(15,2),
MLMV NUMERIC(15,2),
MLOV NUMERIC(15,2),
MSOV NUMERIC(15,2),
MTC NUMERIC(15,2),
MWF NUMERIC(15,2),
MFIR NUMERIC(15,2),
MFMR NUMERIC(15,2),
MME NUMERIC(15,2),
MOTE NUMERIC(15,2),
MAVGEQ NUMERIC(15,2),
MMTDCM NUMERIC(15,2),
MMTDPL NUMERIC(15,2),
MLQVAL NUMERIC(15,2),
MTE NUMERIC(15,2),
MPRFXM NUMERIC(15,2),
MPRFXI NUMERIC(15,2),
MPROTE NUMERIC(15,2),
MPRTE NUMERIC(15,2),
MPRLQV NUMERIC(15,2),
MPRRCV NUMERIC(15,2),
MDLACT NUMERIC(9))

--***1***
IF (@Processing_Date IS NULL) BEGIN

	DECLARE
	@Current_Processing_Date DATE

	SELECT @Current_Processing_Date=Current_Processing_Date
	FROM [dbo].[Current_Information]

	--********************************************************************************
	-- Load #GMIMNYF1_File_Current
	--********************************************************************************
	INSERT INTO #GMIMNYF1_File_Current
	(Processing_Date,
	MOFFIC,
	MACCT,
	MRR,
	MCLASS,
	MSUBCL,
	MATYPE,
	MCURAT,
	MSNAME,
	MREL1O,
	MREL1A,
	MBAL,
	MLMV,
	MLOV,
	MSOV,
	MTC,
	MWF,
	MFIR,
	MFMR,
	MME,
	MOTE,
	MAVGEQ,
	MMTDCM,
	MMTDPL,
	MLQVAL,
	MTE,
	MPRFXM,
	MPRFXI,
	MPROTE,
	MPRTE,
	MPRLQV,
	MPRRCV,
	MDLACT)
	SELECT
	@Current_Processing_Date, --Processing_Date,
	MOFFIC,
	MACCT,
	MRR,
	MCLASS,
	MSUBCL,
	MATYPE,
	MCURAT,
	MSNAME,
	MREL1O,
	MREL1A,
	MBAL,
	MLMV,
	MLOV,
	MSOV,
	MTC,
	MWF,
	MFIR,
	MFMR,
	MME,
	MOTE,
	MAVGEQ,
	MMTDCM,
	MMTDPL,
	MLQVAL,
	MTE,
	MPRFXM,
	MPRFXI,
	MPROTE,
	MPRTE,
	MPRLQV,
	MPRRCV,
	MDLACT
	FROM [dbo].[GMIMNYF1_File_Current]
	ORDER BY
	MOFFIC,
	MACCT,
	MRR,
	MCLASS,
	MSUBCL,
	MATYPE,
	MCURAT

--***1***
END
--***1***
ELSE BEGIN

	--********************************************************************************
	-- Load #GMIMNYF1_File_Current
	--********************************************************************************
	INSERT INTO #GMIMNYF1_File_Current
	(Processing_Date,
	MOFFIC,
	MACCT,
	MRR,
	MCLASS,
	MSUBCL,
	MATYPE,
	MCURAT,
	MSNAME,
	MREL1O,
	MREL1A,
	MBAL,
	MLMV,
	MLOV,
	MSOV,
	MTC,
	MWF,
	MFIR,
	MFMR,
	MME,
	MOTE,
	MAVGEQ,
	MMTDCM,
	MMTDPL,
	MLQVAL,
	MTE,
	MPRFXM,
	MPRFXI,
	MPROTE,
	MPRTE,
	MPRLQV,
	MPRRCV,
	MDLACT)
	SELECT
	Processing_Date,
	MOFFIC,
	MACCT,
	MRR,
	MCLASS,
	MSUBCL,
	MATYPE,
	MCURAT,
	MSNAME,
	MREL1O,
	MREL1A,
	MBAL,
	MLMV,
	MLOV,
	MSOV,
	MTC,
	MWF,
	MFIR,
	MFMR,
	MME,
	MOTE,
	MAVGEQ,
	MMTDCM,
	MMTDPL,
	MLQVAL,
	MTE,
	MPRFXM,
	MPRFXI,
	MPROTE,
	MPRTE,
	MPRLQV,
	MPRRCV,
	MDLACT
	FROM [dbo].[MNYF1_File_History]
	WHERE (Processing_Date=@Processing_Date)
	ORDER BY
	MOFFIC,
	MACCT,
	MRR,
	MCLASS,
	MSUBCL,
	MATYPE,
	MCURAT

--***1***
END

--********************************************************************************
-- Return Records
--********************************************************************************
SELECT
Id,
CONVERT(VARCHAR,Processing_Date,101) "Processing_Date",
MOFFIC,
MACCT,
MRR,
MCLASS,
MSUBCL,
MATYPE,
MCURAT,
MSNAME,
MREL1O,
MREL1A,
MBAL,
MLMV,
MLOV,
MSOV,
MTC,
MWF,
MFIR,
MFMR,
MME,
MOTE,
MAVGEQ,
MMTDCM,
MMTDPL,
MLQVAL,
MTE,
MPRFXM,
MPRFXI,
MPROTE,
MPRTE,
MPRLQV,
MPRRCV,
CONVERT(VARCHAR,MDLACT) "MDLACT"
FROM #GMIMNYF1_File_Current
ORDER BY Id

DROP TABLE #GMIMNYF1_File_Current

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Generate_Risk_Report_With_Id] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO