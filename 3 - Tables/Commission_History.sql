USE [GMIDATA]
GO

DROP TABLE [dbo].[Commission_History]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Commission_History](
	[Processing_Date] [date] NOT NULL,
	[PRR] [varchar](5) NOT NULL,
	[PFIRM] [varchar](1) NOT NULL,
	[POFFIC] [varchar](3) NOT NULL,
	[PACCT] [varchar](5) NOT NULL,
	[PCLASS] [varchar](1) NOT NULL,
	[PSUBCL] [varchar](1) NOT NULL,
	[PSTYPE] [varchar](1) NOT NULL,
	[PTYPE] [varchar](1) NOT NULL,
	[PRECID] [varchar](1) NOT NULL,
	[PCOMM] [numeric](15,2) NOT NULL,
	[PATYPE] [varchar](2) NOT NULL,
	[PCURAT] [varchar](3) NOT NULL,
	[ST4F1_File_Records] [int] NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Commission_History] PRIMARY KEY CLUSTERED
	(
		[Processing_Date] ASC,
		[PRR] ASC,
		[PFIRM] ASC,
		[POFFIC] ASC,
		[PACCT] ASC,
		[PCLASS] ASC,
		[PSUBCL] ASC,
		[PSTYPE] ASC,
		[PTYPE] ASC,
		[PRECID] ASC,
		[PATYPE] ASC,
		[PCURAT] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO