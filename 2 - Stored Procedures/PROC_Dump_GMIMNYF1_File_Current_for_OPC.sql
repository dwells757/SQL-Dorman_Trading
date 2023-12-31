USE [GMIDATA]
GO

DROP PROCEDURE [dbo].[PROC_Dump_GMIMNYF1_File_Current_for_OPC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_Dump_GMIMNYF1_File_Current_for_OPC]

AS

SET NOCOUNT ON

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Dump_GMIMNYF1_File_Current_for_OPC] STARTED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "Start Time"

--***************************************************************************************************
-- Create #GMIMNYF1_File_Current
--***************************************************************************************************
CREATE TABLE #GMIMNYF1_File_Current
(Record_Number INT IDENTITY(1,1),
MRECID VARCHAR(255),
MFIRM VARCHAR(255),
MOFFIC VARCHAR(255),
MACCT VARCHAR(255),
MATYPE VARCHAR(255),
MRR VARCHAR(255),
MCLASS VARCHAR(255),
MSUBCL VARCHAR(255),
MCURAT VARCHAR(255),
MCURCD VARCHAR(255),
MCURAC VARCHAR(255),
MCURFM VARCHAR(255),
MCPCOD VARCHAR(255),
MNCALL VARCHAR(255),
MCAGE VARCHAR(255),
MFILL1 VARCHAR(255),
MAVDYS VARCHAR(255),
MDSCCD VARCHAR(255),
MOMNCD VARCHAR(255),
MACNTY VARCHAR(255),
MMPGMN VARCHAR(255),
MSNAME VARCHAR(255),
MNA1 VARCHAR(255),
MDLACT VARCHAR(255),
MDLACW VARCHAR(255),
MREL1F VARCHAR(255),
MREL1O VARCHAR(255),
MREL1A VARCHAR(255),
MREL1T VARCHAR(255),
MREL2F VARCHAR(255),
MREL2O VARCHAR(255),
MREL2A VARCHAR(255),
MREL2T VARCHAR(255),
MREL3F VARCHAR(255),
MREL3O VARCHAR(255),
MREL3A VARCHAR(255),
MREL3T VARCHAR(255),
MGRPFM VARCHAR(255),
MGRPOF VARCHAR(255),
MGRPRR VARCHAR(255),
MGRPAC VARCHAR(255),
MBAL VARCHAR(255),
MLMV VARCHAR(255),
MSMV VARCHAR(255),
MLOV VARCHAR(255),
MSOV VARCHAR(255),
MTC VARCHAR(255),
MWF VARCHAR(255),
MFIR VARCHAR(255),
MFMR VARCHAR(255),
MFEXIR VARCHAR(255),
MME VARCHAR(255),
MOTE VARCHAR(255),
MSMA VARCHAR(255),
MLOOTE VARCHAR(255),
MSOOTE VARCHAR(255),
MAVGEQ VARCHAR(255),
MMTDCM VARCHAR(255),
MUNLMV VARCHAR(255),
MTDBAL VARCHAR(255),
MUNSMV VARCHAR(255),
MMMHC VARCHAR(255),
MUNDPC VARCHAR(255),
MMTDPL VARCHAR(255),
MSEGLV VARCHAR(255),
MSEGSV VARCHAR(255),
MEIR VARCHAR(255),
MEMR VARCHAR(255),
MCVTFB VARCHAR(255),
MDVBAL VARCHAR(255),
MJPUPL VARCHAR(255),
MFOOTE VARCHAR(255),
MLOANV VARCHAR(255),
MBYPWR VARCHAR(255),
MPNDIV VARCHAR(255),
MPNINT VARCHAR(255),
MLQVAL VARCHAR(255),
MMRGVL VARCHAR(255),
MOTECR VARCHAR(255),
MOTEDR VARCHAR(255),
MPREM VARCHAR(255),
MOOTEC VARCHAR(255),
MAVSOD VARCHAR(255),
MLOPRM VARCHAR(255),
MUNUPL VARCHAR(255),
MAVGME VARCHAR(255),
MJPIR VARCHAR(255),
MJPIRC VARCHAR(255),
MJPMR VARCHAR(255),
MJPRT2 VARCHAR(255),
MTAR VARCHAR(255),
MEPOTE VARCHAR(255),
MLVUST VARCHAR(255),
MTE VARCHAR(255),
MAVGBL VARCHAR(255),
MAVGOV VARCHAR(255),
MCVTAB VARCHAR(255),
MCMACR VARCHAR(255),
MCMACU VARCHAR(255),
MSPNOV VARCHAR(255),
MEEXM VARCHAR(255),
MEIRT VARCHAR(255),
MEOIR VARCHAR(255),
MEOMR VARCHAR(255),
MFEXMR VARCHAR(255),
MGEUDC VARCHAR(255),
MNCOTE VARCHAR(255),
MCCDNT VARCHAR(255),
MEQPCT VARCHAR(255),
MREGCV VARCHAR(255),
MCVTAF VARCHAR(255),
MTDVAL VARCHAR(255),
MTCC VARCHAR(255),
MMRGLM VARCHAR(255),
MPNOTH VARCHAR(255),
MIRCIC VARCHAR(255),
MIRCEC VARCHAR(255),
MDEFOT VARCHAR(255),
MSECAM VARCHAR(255),
MCLMGN VARCHAR(255),
MCLOTE VARCHAR(255),
MSPNAE VARCHAR(255),
MMVUCI VARCHAR(255),
MACRET VARCHAR(255),
MPOOTE VARCHAR(255),
MUNDEP VARCHAR(255),
MPRTC VARCHAR(255),
MPRSMA VARCHAR(255),
MLVTM4 VARCHAR(255),
MLVTM3 VARCHAR(255),
MLVTM2 VARCHAR(255),
MPREOI VARCHAR(255),
MPREIR VARCHAR(255),
MPRFXM VARCHAR(255),
MPRFXI VARCHAR(255),
MPRFIR VARCHAR(255),
MPROTE VARCHAR(255),
MPRTE VARCHAR(255),
MPRLQV VARCHAR(255),
MPRRCV VARCHAR(255),
MPRBAL VARCHAR(255),
MBNRY1 VARCHAR(255),
MBNRY2 VARCHAR(255),
MBNRY3 VARCHAR(255),
MBNRY4 VARCHAR(255),
MBNRY5 VARCHAR(255),
MMISC1 VARCHAR(255),
MMISC2 VARCHAR(255),
MMISC3 VARCHAR(255),
MMISC4 VARCHAR(255),
MMISC5 VARCHAR(255),
MMISC6 VARCHAR(255),
MMISC7 VARCHAR(255),
MMISC8 VARCHAR(255),
MMISC9 VARCHAR(255),
MMISC0 VARCHAR(255),
MCND01 VARCHAR(255),
MCND02 VARCHAR(255),
MCND03 VARCHAR(255),
MCND04 VARCHAR(255),
MCND05 VARCHAR(255),
MCND06 VARCHAR(255),
MCND07 VARCHAR(255),
MCND08 VARCHAR(255),
MCND09 VARCHAR(255),
MCND10 VARCHAR(255),
MUSFL1 VARCHAR(255),
MUSFL2 VARCHAR(255),
MUSFL3 VARCHAR(255),
MUSFL4 VARCHAR(255),
MUSFL5 VARCHAR(255),
MUSFL6 VARCHAR(255),
MUSFL7 VARCHAR(255),
MUSFL8 VARCHAR(255),
MUSFL9 VARCHAR(255),
MUSFLA VARCHAR(255),
MUKFL1 VARCHAR(255),
MUKFL2 VARCHAR(255),
MUKFL3 VARCHAR(255),
MUKFL4 VARCHAR(255),
MFRFL1 VARCHAR(255),
MFRFL2 VARCHAR(255),
MFRFL3 VARCHAR(255),
MJPFL1 VARCHAR(255),
MJPFL2 VARCHAR(255),
MJPFL3 VARCHAR(255),
MHKFL1 VARCHAR(255),
MGEFL1 VARCHAR(255),
MITFL1 VARCHAR(255))

--***************************************************************************************************
-- Load #GMIMNYF1_File_Current with "Header" Record
--***************************************************************************************************
INSERT INTO #GMIMNYF1_File_Current
(MRECID,
MFIRM,
MOFFIC,
MACCT,
MATYPE,
MRR,
MCLASS,
MSUBCL,
MCURAT,
MCURCD,
MCURAC,
MCURFM,
MCPCOD,
MNCALL,
MCAGE,
MFILL1,
MAVDYS,
MDSCCD,
MOMNCD,
MACNTY,
MMPGMN,
MSNAME,
MNA1,
MDLACT,
MDLACW,
MREL1F,
MREL1O,
MREL1A,
MREL1T,
MREL2F,
MREL2O,
MREL2A,
MREL2T,
MREL3F,
MREL3O,
MREL3A,
MREL3T,
MGRPFM,
MGRPOF,
MGRPRR,
MGRPAC,
MBAL,
MLMV,
MSMV,
MLOV,
MSOV,
MTC,
MWF,
MFIR,
MFMR,
MFEXIR,
MME,
MOTE,
MSMA,
MLOOTE,
MSOOTE,
MAVGEQ,
MMTDCM,
MUNLMV,
MTDBAL,
MUNSMV,
MMMHC,
MUNDPC,
MMTDPL,
MSEGLV,
MSEGSV,
MEIR,
MEMR,
MCVTFB,
MDVBAL,
MJPUPL,
MFOOTE,
MLOANV,
MBYPWR,
MPNDIV,
MPNINT,
MLQVAL,
MMRGVL,
MOTECR,
MOTEDR,
MPREM,
MOOTEC,
MAVSOD,
MLOPRM,
MUNUPL,
MAVGME,
MJPIR,
MJPIRC,
MJPMR,
MJPRT2,
MTAR,
MEPOTE,
MLVUST,
MTE,
MAVGBL,
MAVGOV,
MCVTAB,
MCMACR,
MCMACU,
MSPNOV,
MEEXM,
MEIRT,
MEOIR,
MEOMR,
MFEXMR,
MGEUDC,
MNCOTE,
MCCDNT,
MEQPCT,
MREGCV,
MCVTAF,
MTDVAL,
MTCC,
MMRGLM,
MPNOTH,
MIRCIC,
MIRCEC,
MDEFOT,
MSECAM,
MCLMGN,
MCLOTE,
MSPNAE,
MMVUCI,
MACRET,
MPOOTE,
MUNDEP,
MPRTC,
MPRSMA,
MLVTM4,
MLVTM3,
MLVTM2,
MPREOI,
MPREIR,
MPRFXM,
MPRFXI,
MPRFIR,
MPROTE,
MPRTE,
MPRLQV,
MPRRCV,
MPRBAL,
MBNRY1,
MBNRY2,
MBNRY3,
MBNRY4,
MBNRY5,
MMISC1,
MMISC2,
MMISC3,
MMISC4,
MMISC5,
MMISC6,
MMISC7,
MMISC8,
MMISC9,
MMISC0,
MCND01,
MCND02,
MCND03,
MCND04,
MCND05,
MCND06,
MCND07,
MCND08,
MCND09,
MCND10,
MUSFL1,
MUSFL2,
MUSFL3,
MUSFL4,
MUSFL5,
MUSFL6,
MUSFL7,
MUSFL8,
MUSFL9,
MUSFLA,
MUKFL1,
MUKFL2,
MUKFL3,
MUKFL4,
MFRFL1,
MFRFL2,
MFRFL3,
MJPFL1,
MJPFL2,
MJPFL3,
MHKFL1,
MGEFL1,
MITFL1)
VALUES
('"MRECID',
'MFIRM',
'MOFFIC',
'MACCT',
'MATYPE',
'MRR',
'MCLASS',
'MSUBCL',
'MCURAT',
'MCURCD',
'MCURAC',
'MCURFM',
'MCPCOD',
'MNCALL',
'MCAGE',
'MFILL1',
'MAVDYS',
'MDSCCD',
'MOMNCD',
'MACNTY',
'MMPGMN',
'MSNAME',
'MNA1',
'MDLACT',
'MDLACW',
'MREL1F',
'MREL1O',
'MREL1A',
'MREL1T',
'MREL2F',
'MREL2O',
'MREL2A',
'MREL2T',
'MREL3F',
'MREL3O',
'MREL3A',
'MREL3T',
'MGRPFM',
'MGRPOF',
'MGRPRR',
'MGRPAC',
'MBAL',
'MLMV',
'MSMV',
'MLOV',
'MSOV',
'MTC',
'MWF',
'MFIR',
'MFMR',
'MFEXIR',
'MME',
'MOTE',
'MSMA',
'MLOOTE',
'MSOOTE',
'MAVGEQ',
'MMTDCM',
'MUNLMV',
'MTDBAL',
'MUNSMV',
'MMMHC',
'MUNDPC',
'MMTDPL',
'MSEGLV',
'MSEGSV',
'MEIR',
'MEMR',
'MCVTFB',
'MDVBAL',
'MJPUPL',
'MFOOTE',
'MLOANV',
'MBYPWR',
'MPNDIV',
'MPNINT',
'MLQVAL',
'MMRGVL',
'MOTECR',
'MOTEDR',
'MPREM',
'MOOTEC',
'MAVSOD',
'MLOPRM',
'MUNUPL',
'MAVGME',
'MJPIR',
'MJPIRC',
'MJPMR',
'MJPRT2',
'MTAR',
'MEPOTE',
'MLVUST',
'MTE',
'MAVGBL',
'MAVGOV',
'MCVTAB',
'MCMACR',
'MCMACU',
'MSPNOV',
'MEEXM',
'MEIRT',
'MEOIR',
'MEOMR',
'MFEXMR',
'MGEUDC',
'MNCOTE',
'MCCDNT',
'MEQPCT',
'MREGCV',
'MCVTAF',
'MTDVAL',
'MTCC',
'MMRGLM',
'MPNOTH',
'MIRCIC',
'MIRCEC',
'MDEFOT',
'MSECAM',
'MCLMGN',
'MCLOTE',
'MSPNAE',
'MMVUCI',
'MACRET',
'MPOOTE',
'MUNDEP',
'MPRTC',
'MPRSMA',
'MLVTM4',
'MLVTM3',
'MLVTM2',
'MPREOI',
'MPREIR',
'MPRFXM',
'MPRFXI',
'MPRFIR',
'MPROTE',
'MPRTE',
'MPRLQV',
'MPRRCV',
'MPRBAL',
'MBNRY1',
'MBNRY2',
'MBNRY3',
'MBNRY4',
'MBNRY5',
'MMISC1',
'MMISC2',
'MMISC3',
'MMISC4',
'MMISC5',
'MMISC6',
'MMISC7',
'MMISC8',
'MMISC9',
'MMISC0',
'MCND01',
'MCND02',
'MCND03',
'MCND04',
'MCND05',
'MCND06',
'MCND07',
'MCND08',
'MCND09',
'MCND10',
'MUSFL1',
'MUSFL2',
'MUSFL3',
'MUSFL4',
'MUSFL5',
'MUSFL6',
'MUSFL7',
'MUSFL8',
'MUSFL9',
'MUSFLA',
'MUKFL1',
'MUKFL2',
'MUKFL3',
'MUKFL4',
'MFRFL1',
'MFRFL2',
'MFRFL3',
'MJPFL1',
'MJPFL2',
'MJPFL3',
'MHKFL1',
'MGEFL1',
'MITFL1')

--***************************************************************************************************
-- Load #GMIMNYF1_File_Current with "Detail" Records
--***************************************************************************************************
INSERT INTO #GMIMNYF1_File_Current
(MRECID,
MFIRM,
MOFFIC,
MACCT,
MATYPE,
MRR,
MCLASS,
MSUBCL,
MCURAT,
MCURCD,
MCURAC,
MCURFM,
MCPCOD,
MNCALL,
MCAGE,
MFILL1,
MAVDYS,
MDSCCD,
MOMNCD,
MACNTY,
MMPGMN,
MSNAME,
MNA1,
MDLACT,
MDLACW,
MREL1F,
MREL1O,
MREL1A,
MREL1T,
MREL2F,
MREL2O,
MREL2A,
MREL2T,
MREL3F,
MREL3O,
MREL3A,
MREL3T,
MGRPFM,
MGRPOF,
MGRPRR,
MGRPAC,
MBAL,
MLMV,
MSMV,
MLOV,
MSOV,
MTC,
MWF,
MFIR,
MFMR,
MFEXIR,
MME,
MOTE,
MSMA,
MLOOTE,
MSOOTE,
MAVGEQ,
MMTDCM,
MUNLMV,
MTDBAL,
MUNSMV,
MMMHC,
MUNDPC,
MMTDPL,
MSEGLV,
MSEGSV,
MEIR,
MEMR,
MCVTFB,
MDVBAL,
MJPUPL,
MFOOTE,
MLOANV,
MBYPWR,
MPNDIV,
MPNINT,
MLQVAL,
MMRGVL,
MOTECR,
MOTEDR,
MPREM,
MOOTEC,
MAVSOD,
MLOPRM,
MUNUPL,
MAVGME,
MJPIR,
MJPIRC,
MJPMR,
MJPRT2,
MTAR,
MEPOTE,
MLVUST,
MTE,
MAVGBL,
MAVGOV,
MCVTAB,
MCMACR,
MCMACU,
MSPNOV,
MEEXM,
MEIRT,
MEOIR,
MEOMR,
MFEXMR,
MGEUDC,
MNCOTE,
MCCDNT,
MEQPCT,
MREGCV,
MCVTAF,
MTDVAL,
MTCC,
MMRGLM,
MPNOTH,
MIRCIC,
MIRCEC,
MDEFOT,
MSECAM,
MCLMGN,
MCLOTE,
MSPNAE,
MMVUCI,
MACRET,
MPOOTE,
MUNDEP,
MPRTC,
MPRSMA,
MLVTM4,
MLVTM3,
MLVTM2,
MPREOI,
MPREIR,
MPRFXM,
MPRFXI,
MPRFIR,
MPROTE,
MPRTE,
MPRLQV,
MPRRCV,
MPRBAL,
MBNRY1,
MBNRY2,
MBNRY3,
MBNRY4,
MBNRY5,
MMISC1,
MMISC2,
MMISC3,
MMISC4,
MMISC5,
MMISC6,
MMISC7,
MMISC8,
MMISC9,
MMISC0,
MCND01,
MCND02,
MCND03,
MCND04,
MCND05,
MCND06,
MCND07,
MCND08,
MCND09,
MCND10,
MUSFL1,
MUSFL2,
MUSFL3,
MUSFL4,
MUSFL5,
MUSFL6,
MUSFL7,
MUSFL8,
MUSFL9,
MUSFLA,
MUKFL1,
MUKFL2,
MUKFL3,
MUKFL4,
MFRFL1,
MFRFL2,
MFRFL3,
MJPFL1,
MJPFL2,
MJPFL3,
MHKFL1,
MGEFL1,
MITFL1)
SELECT
'"' + MRECID,
MFIRM,
MOFFIC,
MACCT,
MATYPE,
MRR,
MCLASS,
MSUBCL,
MCURAT,
MCURCD,
MCURAC,
MCURFM,
MCPCOD,
MNCALL,
MCAGE,
MFILL1,
MAVDYS,
MDSCCD,
MOMNCD,
MACNTY,
MMPGMN,
MSNAME,
MNA1,
MDLACT,
MDLACW,
MREL1F,
MREL1O,
MREL1A,
MREL1T,
MREL2F,
MREL2O,
MREL2A,
MREL2T,
MREL3F,
MREL3O,
MREL3A,
MREL3T,
MGRPFM,
MGRPOF,
MGRPRR,
MGRPAC,
MBAL,
MLMV,
MSMV,
MLOV,
MSOV,
MTC,
MWF,
MFIR,
MFMR,
MFEXIR,
MME,
MOTE,
MSMA,
MLOOTE,
MSOOTE,
MAVGEQ,
MMTDCM,
MUNLMV,
MTDBAL,
MUNSMV,
MMMHC,
MUNDPC,
MMTDPL,
MSEGLV,
MSEGSV,
MEIR,
MEMR,
MCVTFB,
MDVBAL,
MJPUPL,
MFOOTE,
MLOANV,
MBYPWR,
MPNDIV,
MPNINT,
MLQVAL,
MMRGVL,
MOTECR,
MOTEDR,
MPREM,
MOOTEC,
MAVSOD,
MLOPRM,
MUNUPL,
MAVGME,
MJPIR,
MJPIRC,
MJPMR,
MJPRT2,
MTAR,
MEPOTE,
MLVUST,
MTE,
MAVGBL,
MAVGOV,
MCVTAB,
MCMACR,
MCMACU,
MSPNOV,
MEEXM,
MEIRT,
MEOIR,
MEOMR,
MFEXMR,
MGEUDC,
MNCOTE,
MCCDNT,
MEQPCT,
MREGCV,
MCVTAF,
MTDVAL,
MTCC,
MMRGLM,
MPNOTH,
MIRCIC,
MIRCEC,
MDEFOT,
MSECAM,
MCLMGN,
MCLOTE,
MSPNAE,
MMVUCI,
MACRET,
MPOOTE,
MUNDEP,
MPRTC,
MPRSMA,
MLVTM4,
MLVTM3,
MLVTM2,
MPREOI,
MPREIR,
MPRFXM,
MPRFXI,
MPRFIR,
MPROTE,
MPRTE,
MPRLQV,
MPRRCV,
MPRBAL,
MBNRY1,
MBNRY2,
MBNRY3,
MBNRY4,
MBNRY5,
MMISC1,
MMISC2,
MMISC3,
MMISC4,
MMISC5,
MMISC6,
MMISC7,
MMISC8,
MMISC9,
MMISC0,
MCND01,
MCND02,
MCND03,
MCND04,
MCND05,
MCND06,
MCND07,
MCND08,
MCND09,
MCND10,
MUSFL1,
MUSFL2,
MUSFL3,
MUSFL4,
MUSFL5,
MUSFL6,
MUSFL7,
MUSFL8,
MUSFL9,
MUSFLA,
MUKFL1,
MUKFL2,
MUKFL3,
MUKFL4,
MFRFL1,
MFRFL2,
MFRFL3,
MJPFL1,
MJPFL2,
MJPFL3,
MHKFL1,
MGEFL1,
MITFL1
FROM [dbo].[GMIMNYF1_File_Current]
WHERE (MOFFIC IN(
'205',
'OPC'))

SELECT
NULLIF(MRECID, '') as MRECID,
NULLIF(MFIRM, '') as MFIRM,
NULLIF(MOFFIC, '') as MOFFIC,
NULLIF(MACCT, '') as MACCT,
NULLIF(MATYPE, '') as MATYPE,
NULLIF(MRR, '') as MRR,
NULLIF(MCLASS, '') as MCLASS,
NULLIF(MSUBCL, '') as MSUBCL,
NULLIF(MCURAT, '') as MCURAT,
NULLIF(MCURCD, '') as MCURCD,
NULLIF(MCURAC, '') as MCURAC,
NULLIF(MCURFM, '') as MCURFM,
NULLIF(MCPCOD, '') as MCPCOD,
NULLIF(MNCALL, '') as MNCALL,
NULLIF(MCAGE, '') as MCAGE,
NULLIF(MFILL1, '') as MFILL1,
NULLIF(MAVDYS, '') as MAVDYS,
NULLIF(MDSCCD, '') as MDSCCD,
NULLIF(MOMNCD, '') as MOMNCD,
NULLIF(MACNTY, '') as MACNTY,
NULLIF(MMPGMN, '') as MMPGMN,
NULLIF(MSNAME, '') as MSNAME,
NULLIF(MNA1, '') as MNA1,
NULLIF(MDLACT, '') as MDLACT,
NULLIF(MDLACW, '') as MDLACW,
NULLIF(MREL1F, '') as MREL1F,
NULLIF(MREL1O, '') as MREL1O,
NULLIF(MREL1A, '') as MREL1A,
NULLIF(MREL1T, '') as MREL1T,
NULLIF(MREL2F, '') as MREL2F,
NULLIF(MREL2O, '') as MREL2O,
NULLIF(MREL2A, '') as MREL2A,
NULLIF(MREL2T, '') as MREL2T,
NULLIF(MREL3F, '') as MREL3F,
NULLIF(MREL3O, '') as MREL3O,
NULLIF(MREL3A, '') as MREL3A,
NULLIF(MREL3T, '') as MREL3T,
NULLIF(MGRPFM, '') as MGRPFM,
NULLIF(MGRPOF, '') as MGRPOF,
NULLIF(MGRPRR, '') as MGRPRR,
NULLIF(MGRPAC, '') as MGRPAC,
NULLIF(MBAL, '') as MBAL,
NULLIF(MLMV, '') as MLMV,
NULLIF(MSMV, '') as MSMV,
NULLIF(MLOV, '') as MLOV,
NULLIF(MSOV, '') as MSOV,
NULLIF(MTC, '') as MTC,
NULLIF(MWF, '') as MWF,
NULLIF(MFIR, '') as MFIR,
NULLIF(MFMR, '') as MFMR,
NULLIF(MFEXIR, '') as MFEXIR,
NULLIF(MME, '') as MME,
NULLIF(MOTE, '') as MOTE,
NULLIF(MSMA, '') as MSMA,
NULLIF(MLOOTE, '') as MLOOTE,
NULLIF(MSOOTE, '') as MSOOTE,
NULLIF(MAVGEQ, '') as MAVGEQ,
NULLIF(MMTDCM, '') as MMTDCM,
NULLIF(MUNLMV, '') as MUNLMV,
NULLIF(MTDBAL, '') as MTDBAL,
NULLIF(MUNSMV, '') as MUNSMV,
NULLIF(MMMHC, '') as MMMHC,
NULLIF(MUNDPC, '') as MUNDPC,
NULLIF(MMTDPL, '') as MMTDPL,
NULLIF(MSEGLV, '') as MSEGLV,
NULLIF(MSEGSV, '') as MSEGSV,
NULLIF(MEIR, '') as MEIR,
NULLIF(MEMR, '') as MEMR,
NULLIF(MCVTFB, '') as MCVTFB,
NULLIF(MDVBAL, '') as MDVBAL,
NULLIF(MJPUPL, '') as MJPUPL,
NULLIF(MFOOTE, '') as MFOOTE,
NULLIF(MLOANV, '') as MLOANV,
NULLIF(MBYPWR, '') as MBYPWR,
NULLIF(MPNDIV, '') as MPNDIV,
NULLIF(MPNINT, '') as MPNINT,
NULLIF(MLQVAL, '') as MLQVAL,
NULLIF(MMRGVL, '') as MMRGVL,
NULLIF(MOTECR, '') as MOTECR,
NULLIF(MOTEDR, '') as MOTEDR,
NULLIF(MPREM, '') as MPREM,
NULLIF(MOOTEC, '') as MOOTEC,
NULLIF(MAVSOD, '') as MAVSOD,
NULLIF(MLOPRM, '') as MLOPRM,
NULLIF(MUNUPL, '') as MUNUPL,
NULLIF(MAVGME, '') as MAVGME,
NULLIF(MJPIR, '') as MJPIR,
NULLIF(MJPIRC, '') as MJPIRC,
NULLIF(MJPMR, '') as MJPMR,
NULLIF(MJPRT2, '') as MJPRT2,
NULLIF(MTAR, '') as MTAR,
NULLIF(MEPOTE, '') as MEPOTE,
NULLIF(MLVUST, '') as MLVUST,
NULLIF(MTE, '') as MTE,
NULLIF(MAVGBL, '') as MAVGBL,
NULLIF(MAVGOV, '') as MAVGOV,
NULLIF(MCVTAB, '') as MCVTAB,
NULLIF(MCMACR, '') as MCMACR,
NULLIF(MCMACU, '') as MCMACU,
NULLIF(MSPNOV, '') as MSPNOV,
NULLIF(MEEXM, '') as MEEXM,
NULLIF(MEIRT, '') as MEIRT,
NULLIF(MEOIR, '') as MEOIR,
NULLIF(MEOMR, '') as MEOMR,
NULLIF(MFEXMR, '') as MFEXMR,
NULLIF(MGEUDC, '') as MGEUDC,
NULLIF(MNCOTE, '') as MNCOTE,
NULLIF(MCCDNT, '') as MCCDNT,
NULLIF(MEQPCT, '') as MEQPCT,
NULLIF(MREGCV, '') as MREGCV,
NULLIF(MCVTAF, '') as MCVTAF,
NULLIF(MTDVAL, '') as MTDVAL,
NULLIF(MTCC, '') as MTCC,
NULLIF(MMRGLM, '') as MMRGLM,
NULLIF(MPNOTH, '') as MPNOTH,
NULLIF(MIRCIC, '') as MIRCIC,
NULLIF(MIRCEC, '') as MIRCEC,
NULLIF(MDEFOT, '') as MDEFOT,
NULLIF(MSECAM, '') as MSECAM,
NULLIF(MCLMGN, '') as MCLMGN,
NULLIF(MCLOTE, '') as MCLOTE,
NULLIF(MSPNAE, '') as MSPNAE,
NULLIF(MMVUCI, '') as MMVUCI,
NULLIF(MACRET, '') as MACRET,
NULLIF(MPOOTE, '') as MPOOTE,
NULLIF(MUNDEP, '') as MUNDEP,
NULLIF(MPRTC, '') as MPRTC,
NULLIF(MPRSMA, '') as MPRSMA,
NULLIF(MLVTM4, '') as MLVTM4,
NULLIF(MLVTM3, '') as MLVTM3,
NULLIF(MLVTM2, '') as MLVTM2,
NULLIF(MPREOI, '') as MPREOI,
NULLIF(MPREIR, '') as MPREIR,
NULLIF(MPRFXM, '') as MPRFXM,
NULLIF(MPRFXI, '') as MPRFXI,
NULLIF(MPRFIR, '') as MPRFIR,
NULLIF(MPROTE, '') as MPROTE,
NULLIF(MPRTE, '') as MPRTE,
NULLIF(MPRLQV, '') as MPRLQV,
NULLIF(MPRRCV, '') as MPRRCV,
NULLIF(MPRBAL, '') as MPRBAL,
NULLIF(MBNRY1, '') as MBNRY1,
NULLIF(MBNRY2, '') as MBNRY2,
NULLIF(MBNRY3, '') as MBNRY3,
NULLIF(MBNRY4, '') as MBNRY4,
NULLIF(MBNRY5, '') as MBNRY5,
NULLIF(MMISC1, '') as MMISC1,
NULLIF(MMISC2, '') as MMISC2,
NULLIF(MMISC3, '') as MMISC3,
NULLIF(MMISC4, '') as MMISC4,
NULLIF(MMISC5, '') as MMISC5,
NULLIF(MMISC6, '') as MMISC6,
NULLIF(MMISC7, '') as MMISC7,
NULLIF(MMISC8, '') as MMISC8,
NULLIF(MMISC9, '') as MMISC9,
NULLIF(MMISC0, '') as MMISC0,
NULLIF(MCND01, '') as MCND01,
NULLIF(MCND02, '') as MCND02,
NULLIF(MCND03, '') as MCND03,
NULLIF(MCND04, '') as MCND04,
NULLIF(MCND05, '') as MCND05,
NULLIF(MCND06, '') as MCND06,
NULLIF(MCND07, '') as MCND07,
NULLIF(MCND08, '') as MCND08,
NULLIF(MCND09, '') as MCND09,
NULLIF(MCND10, '') as MCND10,
NULLIF(MUSFL1, '') as MUSFL1,
NULLIF(MUSFL2, '') as MUSFL2,
NULLIF(MUSFL3, '') as MUSFL3,
NULLIF(MUSFL4, '') as MUSFL4,
NULLIF(MUSFL5, '') as MUSFL5,
NULLIF(MUSFL6, '') as MUSFL6,
NULLIF(MUSFL7, '') as MUSFL7,
NULLIF(MUSFL8, '') as MUSFL8,
NULLIF(MUSFL9, '') as MUSFL9,
NULLIF(MUSFLA, '') as MUSFLA,
NULLIF(MUKFL1, '') as MUKFL1,
NULLIF(MUKFL2, '') as MUKFL2,
NULLIF(MUKFL3, '') as MUKFL3,
NULLIF(MUKFL4, '') as MUKFL4,
NULLIF(MFRFL1, '') as MFRFL1,
NULLIF(MFRFL2, '') as MFRFL2,
NULLIF(MFRFL3, '') as MFRFL3,
NULLIF(MJPFL1, '') as MJPFL1,
NULLIF(MJPFL2, '') as MJPFL2,
NULLIF(MJPFL3, '') as MJPFL3,
NULLIF(MHKFL1, '') as MHKFL1,
NULLIF(MGEFL1, '') as MGEFL1,
NULLIF(MITFL1, '') as MITFL1
FROM #GMIMNYF1_File_Current
ORDER BY Record_Number

DROP TABLE #GMIMNYF1_File_Current

--PRINT '************************************************************************************************************'
--PRINT ' [dbo].[PROC_Dump_GMIMNYF1_File_Current_for_OPC] ENDED'
--PRINT '************************************************************************************************************'
--SELECT GETDATE() "End Time"

SET NOCOUNT OFF

GO