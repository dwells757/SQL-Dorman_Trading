DROP TABLE [dbo].[GMIMNYF1_File_Raw]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMIMNYF1_File_Raw](
	[MRECID] [varchar](255) NOT NULL DEFAULT '',
	[MFIRM] [varchar](255) NOT NULL DEFAULT '',
	[MOFFIC] [varchar](255) NOT NULL DEFAULT '',
	[MACCT] [varchar](255) NOT NULL DEFAULT '',
	[MATYPE] [varchar](255) NOT NULL DEFAULT '',
	[MRR] [varchar](255) NOT NULL DEFAULT '',
	[MCLASS] [varchar](255) NOT NULL DEFAULT '',
	[MSUBCL] [varchar](255) NOT NULL DEFAULT '',
	[MCURAT] [varchar](255) NOT NULL DEFAULT '',
	[MCURCD] [varchar](255) NOT NULL DEFAULT '',
	[MCURAC] [varchar](255) NOT NULL DEFAULT '',
	[MCURFM] [varchar](255) NOT NULL DEFAULT '',
	[MCPCOD] [varchar](255) NOT NULL DEFAULT '',
	[MNCALL] [varchar](255) NOT NULL DEFAULT '',
	[MCAGE] [varchar](255) NOT NULL DEFAULT '',
	[MFILL1] [varchar](255) NOT NULL DEFAULT '',
	[MAVDYS] [varchar](255) NOT NULL DEFAULT '',
	[MDSCCD] [varchar](255) NOT NULL DEFAULT '',
	[MOMNCD] [varchar](255) NOT NULL DEFAULT '',
	[MACNTY] [varchar](255) NOT NULL DEFAULT '',
	[MMPGMN] [varchar](255) NOT NULL DEFAULT '',
	[MSNAME] [varchar](255) NOT NULL DEFAULT '',
	[MNA1] [varchar](255) NOT NULL DEFAULT '',
	[MDLACT] [varchar](255) NOT NULL DEFAULT '',
	[MDLACW] [varchar](255) NOT NULL DEFAULT '',
	[MREL1F] [varchar](255) NOT NULL DEFAULT '',
	[MREL1O] [varchar](255) NOT NULL DEFAULT '',
	[MREL1A] [varchar](255) NOT NULL DEFAULT '',
	[MREL1T] [varchar](255) NOT NULL DEFAULT '',
	[MREL2F] [varchar](255) NOT NULL DEFAULT '',
	[MREL2O] [varchar](255) NOT NULL DEFAULT '',
	[MREL2A] [varchar](255) NOT NULL DEFAULT '',
	[MREL2T] [varchar](255) NOT NULL DEFAULT '',
	[MREL3F] [varchar](255) NOT NULL DEFAULT '',
	[MREL3O] [varchar](255) NOT NULL DEFAULT '',
	[MREL3A] [varchar](255) NOT NULL DEFAULT '',
	[MREL3T] [varchar](255) NOT NULL DEFAULT '',
	[MGRPFM] [varchar](255) NOT NULL DEFAULT '',
	[MGRPOF] [varchar](255) NOT NULL DEFAULT '',
	[MGRPRR] [varchar](255) NOT NULL DEFAULT '',
	[MGRPAC] [varchar](255) NOT NULL DEFAULT '',
	[MBAL] [varchar](255) NOT NULL DEFAULT '',
	[MLMV] [varchar](255) NOT NULL DEFAULT '',
	[MSMV] [varchar](255) NOT NULL DEFAULT '',
	[MLOV] [varchar](255) NOT NULL DEFAULT '',
	[MSOV] [varchar](255) NOT NULL DEFAULT '',
	[MTC] [varchar](255) NOT NULL DEFAULT '',
	[MWF] [varchar](255) NOT NULL DEFAULT '',
	[MFIR] [varchar](255) NOT NULL DEFAULT '',
	[MFMR] [varchar](255) NOT NULL DEFAULT '',
	[MFEXIR] [varchar](255) NOT NULL DEFAULT '',
	[MME] [varchar](255) NOT NULL DEFAULT '',
	[MOTE] [varchar](255) NOT NULL DEFAULT '',
	[MSMA] [varchar](255) NOT NULL DEFAULT '',
	[MLOOTE] [varchar](255) NOT NULL DEFAULT '',
	[MSOOTE] [varchar](255) NOT NULL DEFAULT '',
	[MAVGEQ] [varchar](255) NOT NULL DEFAULT '',
	[MMTDCM] [varchar](255) NOT NULL DEFAULT '',
	[MUNLMV] [varchar](255) NOT NULL DEFAULT '',
	[MTDBAL] [varchar](255) NOT NULL DEFAULT '',
	[MUNSMV] [varchar](255) NOT NULL DEFAULT '',
	[MMMHC] [varchar](255) NOT NULL DEFAULT '',
	[MUNDPC] [varchar](255) NOT NULL DEFAULT '',
	[MMTDPL] [varchar](255) NOT NULL DEFAULT '',
	[MSEGLV] [varchar](255) NOT NULL DEFAULT '',
	[MSEGSV] [varchar](255) NOT NULL DEFAULT '',
	[MEIR] [varchar](255) NOT NULL DEFAULT '',
	[MEMR] [varchar](255) NOT NULL DEFAULT '',
	[MCVTFB] [varchar](255) NOT NULL DEFAULT '',
	[MDVBAL] [varchar](255) NOT NULL DEFAULT '',
	[MJPUPL] [varchar](255) NOT NULL DEFAULT '',
	[MFOOTE] [varchar](255) NOT NULL DEFAULT '',
	[MLOANV] [varchar](255) NOT NULL DEFAULT '',
	[MBYPWR] [varchar](255) NOT NULL DEFAULT '',
	[MPNDIV] [varchar](255) NOT NULL DEFAULT '',
	[MPNINT] [varchar](255) NOT NULL DEFAULT '',
	[MLQVAL] [varchar](255) NOT NULL DEFAULT '',
	[MMRGVL] [varchar](255) NOT NULL DEFAULT '',
	[MOTECR] [varchar](255) NOT NULL DEFAULT '',
	[MOTEDR] [varchar](255) NOT NULL DEFAULT '',
	[MPREM] [varchar](255) NOT NULL DEFAULT '',
	[MOOTEC] [varchar](255) NOT NULL DEFAULT '',
	[MAVSOD] [varchar](255) NOT NULL DEFAULT '',
	[MLOPRM] [varchar](255) NOT NULL DEFAULT '',
	[MUNUPL] [varchar](255) NOT NULL DEFAULT '',
	[MAVGME] [varchar](255) NOT NULL DEFAULT '',
	[MJPIR] [varchar](255) NOT NULL DEFAULT '',
	[MJPIRC] [varchar](255) NOT NULL DEFAULT '',
	[MJPMR] [varchar](255) NOT NULL DEFAULT '',
	[MJPRT2] [varchar](255) NOT NULL DEFAULT '',
	[MTAR] [varchar](255) NOT NULL DEFAULT '',
	[MEPOTE] [varchar](255) NOT NULL DEFAULT '',
	[MLVUST] [varchar](255) NOT NULL DEFAULT '',
	[MTE] [varchar](255) NOT NULL DEFAULT '',
	[MAVGBL] [varchar](255) NOT NULL DEFAULT '',
	[MAVGOV] [varchar](255) NOT NULL DEFAULT '',
	[MCVTAB] [varchar](255) NOT NULL DEFAULT '',
	[MCMACR] [varchar](255) NOT NULL DEFAULT '',
	[MCMACU] [varchar](255) NOT NULL DEFAULT '',
	[MSPNOV] [varchar](255) NOT NULL DEFAULT '',
	[MEEXM] [varchar](255) NOT NULL DEFAULT '',
	[MEIRT] [varchar](255) NOT NULL DEFAULT '',
	[MEOIR] [varchar](255) NOT NULL DEFAULT '',
	[MEOMR] [varchar](255) NOT NULL DEFAULT '',
	[MFEXMR] [varchar](255) NOT NULL DEFAULT '',
	[MGEUDC] [varchar](255) NOT NULL DEFAULT '',
	[MNCOTE] [varchar](255) NOT NULL DEFAULT '',
	[MCCDNT] [varchar](255) NOT NULL DEFAULT '',
	[MEQPCT] [varchar](255) NOT NULL DEFAULT '',
	[MREGCV] [varchar](255) NOT NULL DEFAULT '',
	[MCVTAF] [varchar](255) NOT NULL DEFAULT '',
	[MTDVAL] [varchar](255) NOT NULL DEFAULT '',
	[MTCC] [varchar](255) NOT NULL DEFAULT '',
	[MMRGLM] [varchar](255) NOT NULL DEFAULT '',
	[MPNOTH] [varchar](255) NOT NULL DEFAULT '',
	[MIRCIC] [varchar](255) NOT NULL DEFAULT '',
	[MIRCEC] [varchar](255) NOT NULL DEFAULT '',
	[MDEFOT] [varchar](255) NOT NULL DEFAULT '',
	[MSECAM] [varchar](255) NOT NULL DEFAULT '',
	[MCLMGN] [varchar](255) NOT NULL DEFAULT '',
	[MCLOTE] [varchar](255) NOT NULL DEFAULT '',
	[MSPNAE] [varchar](255) NOT NULL DEFAULT '',
	[MMVUCI] [varchar](255) NOT NULL DEFAULT '',
	[MACRET] [varchar](255) NOT NULL DEFAULT '',
	[MPOOTE] [varchar](255) NOT NULL DEFAULT '',
	[MUNDEP] [varchar](255) NOT NULL DEFAULT '',
	[MPRTC] [varchar](255) NOT NULL DEFAULT '',
	[MPRSMA] [varchar](255) NOT NULL DEFAULT '',
	[MLVTM4] [varchar](255) NOT NULL DEFAULT '',
	[MLVTM3] [varchar](255) NOT NULL DEFAULT '',
	[MLVTM2] [varchar](255) NOT NULL DEFAULT '',
	[MPREOI] [varchar](255) NOT NULL DEFAULT '',
	[MPREIR] [varchar](255) NOT NULL DEFAULT '',
	[MPRFXM] [varchar](255) NOT NULL DEFAULT '',
	[MPRFXI] [varchar](255) NOT NULL DEFAULT '',
	[MPRFIR] [varchar](255) NOT NULL DEFAULT '',
	[MPROTE] [varchar](255) NOT NULL DEFAULT '',
	[MPRTE] [varchar](255) NOT NULL DEFAULT '',
	[MPRLQV] [varchar](255) NOT NULL DEFAULT '',
	[MPRRCV] [varchar](255) NOT NULL DEFAULT '',
	[MPRBAL] [varchar](255) NOT NULL DEFAULT '',
	[MBNRY1] [varchar](255) NOT NULL DEFAULT '',
	[MBNRY2] [varchar](255) NOT NULL DEFAULT '',
	[MBNRY3] [varchar](255) NOT NULL DEFAULT '',
	[MBNRY4] [varchar](255) NOT NULL DEFAULT '',
	[MBNRY5] [varchar](255) NOT NULL DEFAULT '',
	[MMISC1] [varchar](255) NOT NULL DEFAULT '',
	[MMISC2] [varchar](255) NOT NULL DEFAULT '',
	[MMISC3] [varchar](255) NOT NULL DEFAULT '',
	[MMISC4] [varchar](255) NOT NULL DEFAULT '',
	[MMISC5] [varchar](255) NOT NULL DEFAULT '',
	[MMISC6] [varchar](255) NOT NULL DEFAULT '',
	[MMISC7] [varchar](255) NOT NULL DEFAULT '',
	[MMISC8] [varchar](255) NOT NULL DEFAULT '',
	[MMISC9] [varchar](255) NOT NULL DEFAULT '',
	[MMISC0] [varchar](255) NOT NULL DEFAULT '',
	[MCND01] [varchar](255) NOT NULL DEFAULT '',
	[MCND02] [varchar](255) NOT NULL DEFAULT '',
	[MCND03] [varchar](255) NOT NULL DEFAULT '',
	[MCND04] [varchar](255) NOT NULL DEFAULT '',
	[MCND05] [varchar](255) NOT NULL DEFAULT '',
	[MCND06] [varchar](255) NOT NULL DEFAULT '',
	[MCND07] [varchar](255) NOT NULL DEFAULT '',
	[MCND08] [varchar](255) NOT NULL DEFAULT '',
	[MCND09] [varchar](255) NOT NULL DEFAULT '',
	[MCND10] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL1] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL2] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL3] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL4] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL5] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL6] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL7] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL8] [varchar](255) NOT NULL DEFAULT '',
	[MUSFL9] [varchar](255) NOT NULL DEFAULT '',
	[MUSFLA] [varchar](255) NOT NULL DEFAULT '',
	[MUKFL1] [varchar](255) NOT NULL DEFAULT '',
	[MUKFL2] [varchar](255) NOT NULL DEFAULT '',
	[MUKFL3] [varchar](255) NOT NULL DEFAULT '',
	[MUKFL4] [varchar](255) NOT NULL DEFAULT '',
	[MFRFL1] [varchar](255) NOT NULL DEFAULT '',
	[MFRFL2] [varchar](255) NOT NULL DEFAULT '',
	[MFRFL3] [varchar](255) NOT NULL DEFAULT '',
	[MJPFL1] [varchar](255) NOT NULL DEFAULT '',
	[MJPFL2] [varchar](255) NOT NULL DEFAULT '',
	[MJPFL3] [varchar](255) NOT NULL DEFAULT '',
	[MHKFL1] [varchar](255) NOT NULL DEFAULT '',
	[MGEFL1] [varchar](255) NOT NULL DEFAULT '',
	[MITFL1] [varchar](255) NOT NULL DEFAULT ''

) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO