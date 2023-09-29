USE [GMIDATA]
GO

DROP TABLE [dbo].[Registered_Representatives_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Registered_Representatives_Current](
	[Registered_Representative_ID] [varchar](5) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Registered_Representatives_Current] PRIMARY KEY CLUSTERED
	(
		[Registered_Representative_ID] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO