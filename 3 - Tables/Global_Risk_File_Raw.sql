DROP TABLE [dbo].[Global_Risk_File_Raw]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Global_Risk_File_Raw](
	[PRECID] [varchar](255) NOT NULL DEFAULT '',
	[PRECNO] [varchar](255) NOT NULL DEFAULT '',
	[PFIRM] [varchar](255) NOT NULL DEFAULT '',
	[POFFIC] [varchar](255) NOT NULL DEFAULT '',
	[PACCT] [varchar](255) NOT NULL DEFAULT '',
	[PATYPE] [varchar](255) NOT NULL DEFAULT '',
	[PCLASS] [varchar](255) NOT NULL DEFAULT '',
	[PROUT3] [varchar](255) NOT NULL DEFAULT '',
	[PPCNTY] [varchar](255) NOT NULL DEFAULT '',
	[PCARD] [varchar](255) NOT NULL DEFAULT '',
	[PEXCH] [varchar](255) NOT NULL DEFAULT '',
	[PFC] [varchar](255) NOT NULL DEFAULT '',
	[PSYMBL] [varchar](255) NOT NULL DEFAULT '',
	[PSUBTY_UFC_UNSYMB] [varchar](255) NOT NULL DEFAULT '',
	[PCUSP2] [varchar](255) NOT NULL DEFAULT '',
	[Undefined_1] [varchar](255) NOT NULL DEFAULT '',
	[PSTAT5] [varchar](255) NOT NULL DEFAULT '',
	[PSTYPE] [varchar](255) NOT NULL DEFAULT '',
	[PSUBTY] [varchar](255) NOT NULL DEFAULT '',
	[PSDSC1] [varchar](255) NOT NULL DEFAULT '',
	[PPTYPE] [varchar](255) NOT NULL DEFAULT '',
	[PBS] [varchar](255) NOT NULL DEFAULT '',
	[PQTY] [varchar](255) NOT NULL DEFAULT '',
	[PBUSTQ] [varchar](255) NOT NULL DEFAULT '',
	[PLEAVQ] [varchar](255) NOT NULL DEFAULT '',
	[PCTYM] [varchar](255) NOT NULL DEFAULT '',
	[PSBCUS] [varchar](255) NOT NULL DEFAULT '',
	[PSTRIK] [varchar](255) NOT NULL DEFAULT '',
	[PEXPDT] [varchar](255) NOT NULL DEFAULT '',
	[PTPRIC] [varchar](255) NOT NULL DEFAULT '',
	[PCABCD] [varchar](255) NOT NULL DEFAULT '',
	[PCMNT2] [varchar](255) NOT NULL DEFAULT '',
	[PSTAT7] [varchar](255) NOT NULL DEFAULT '',
	[PDELET] [varchar](255) NOT NULL DEFAULT '',
	[PDEST] [varchar](255) NOT NULL DEFAULT '',
	[PCLOSE] [varchar](255) NOT NULL DEFAULT '',
	[PSDATE] [varchar](255) NOT NULL DEFAULT '',
	[PNET] [varchar](255) NOT NULL DEFAULT '',
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO