USE [GMIDATA]
GO

--DROP TABLE [dbo].[Registered_Representatives]
--GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Registered_Representatives](
	[Registered_Representative] [varchar](5) NOT NULL,
	[Master_Common_Name] [varchar](100) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()

	CONSTRAINT [PK_Template_Table] PRIMARY KEY CLUSTERED
	(
		[Registered_Representative] ASC
	)
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO