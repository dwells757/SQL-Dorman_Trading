DROP TABLE [dbo].[DOREMAILA3_File_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DOREMAILA3_File_Current](
	[MFUNC] [varchar](10) NOT NULL,
	[MSEQ] [varchar](10) NOT NULL,
	[MFIRM] [varchar](1) NOT NULL,
	[MOFFIC] [varchar](3) NOT NULL,
	[MACCT] [varchar](5) NOT NULL,
	[YRR] [varchar](5) NOT NULL,
	[MTRMID] [varchar](255) NOT NULL,
	[MADRS1] [varchar](255) NOT NULL,
	[MADRS2] [varchar](255) NOT NULL,
	[MADRS3] [varchar](255) NOT NULL,
	[MADRS4] [varchar](255) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO