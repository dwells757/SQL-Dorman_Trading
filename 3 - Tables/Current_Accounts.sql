USE [GMIDATA]
GO

DROP TABLE [dbo].[Current_Accounts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Current_Accounts](
	[Account] [varchar](20) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL, --WARNING: This may cause a PRIMARY KEY violation!!!
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Current_Accounts] PRIMARY KEY CLUSTERED
	(
		[Account] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO