USE [GMIDATA]
GO

DROP TABLE [dbo].[Account_Groups]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Account_Groups](
	[Account_Group] [varchar](100) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Account_Groups] PRIMARY KEY CLUSTERED
	(
		[Account_Group] ASC,
		[Account] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO