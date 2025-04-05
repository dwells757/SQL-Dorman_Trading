DROP TABLE [dbo].[GNACMFF4_File_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GNACMFF4_File_Current](
	[YRECID] [varchar](1) NOT NULL,
	[YFIRM] [varchar](1) NOT NULL,
	[YOFFIC] [varchar](3) NOT NULL,
	[YACCT] [varchar](5) NOT NULL,
	[YFLDID] [varchar](255) NOT NULL,
	[YDAT50] [varchar](255) NOT NULL,
	[YDSTFL] [varchar](255) NOT NULL,
	[YMSTFL] [varchar](255) NOT NULL,
	[YOPTFL] [varchar](255) NOT NULL,
	[YTRDFL] [varchar](255) NOT NULL,
	[YDUMF1] [varchar](255) NOT NULL,
	[YDUMF2] [varchar](255) NOT NULL,
	[YUSER] [varchar](255) NOT NULL,
	[YCHGDT] [varchar](255) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO