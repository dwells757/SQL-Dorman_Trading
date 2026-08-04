IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Global_Risk_File_Raw_Yest]') AND type in (N'U'))
DROP TABLE [dbo].[Global_Risk_File_Raw_Yest]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Global_Risk_File_Raw_Yest](
	[PRECID] [varchar](255) NOT NULL,
	[PRECNO] [varchar](255) NOT NULL,
	[PFIRM] [varchar](255) NOT NULL,
	[POFFIC] [varchar](255) NOT NULL,
	[PACCT] [varchar](255) NOT NULL,
	[PATYPE] [varchar](255) NOT NULL,
	[PCLASS] [varchar](255) NOT NULL,
	[PROUT3] [varchar](255) NOT NULL,
	[PPCNTY] [varchar](255) NOT NULL,
	[PCARD] [varchar](255) NOT NULL,
	[PEXCH] [varchar](255) NOT NULL,
	[PFC] [varchar](255) NOT NULL,
	[PSYMBL] [varchar](255) NOT NULL,
	[PSUBTY_UFC_UNSYMB] [varchar](255) NOT NULL,
	[PCUSP2] [varchar](255) NOT NULL,
	[Undefined_1] [varchar](255) NOT NULL,
	[PSTAT5] [varchar](255) NOT NULL,
	[PSTYPE] [varchar](255) NOT NULL,
	[PSUBTY] [varchar](255) NOT NULL,
	[PSDSC1] [varchar](255) NOT NULL,
	[PPTYPE] [varchar](255) NOT NULL,
	[PBS] [varchar](255) NOT NULL,
	[PQTY] [varchar](255) NOT NULL,
	[PBUSTQ] [varchar](255) NOT NULL,
	[PLEAVQ] [varchar](255) NOT NULL,
	[PCTYM] [varchar](255) NOT NULL,
	[PSBCUS] [varchar](255) NOT NULL,
	[PSTRIK] [varchar](255) NOT NULL,
	[PEXPDT] [varchar](255) NOT NULL,
	[PTPRIC] [varchar](255) NOT NULL,
	[PCABCD] [varchar](255) NOT NULL,
	[PCMNT2] [varchar](255) NOT NULL,
	[PSTAT7] [varchar](255) NOT NULL,
	[PDELET] [varchar](255) NOT NULL,
	[PDEST] [varchar](255) NOT NULL,
	[PCLOSE] [varchar](255) NOT NULL,
	[PSDATE] [varchar](255) NOT NULL,
	[PNET] [varchar](255) NOT NULL,
	[Record_Number] [int] NOT NULL,
	[DateLoaded] [datetime] NOT NULL,
	[DateLoaded_Local] [datetime] NOT NULL DEFAULT GETDATE()
PRIMARY KEY CLUSTERED 
(
	[Record_Number] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO