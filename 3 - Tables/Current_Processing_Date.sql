USE [GMIDATA]
GO

DROP TABLE [dbo].[Current_Processing_Date]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Current_Processing_Date](
	[Current_Processing_Date] [varchar](8) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Current_Processing_Date] PRIMARY KEY CLUSTERED
	(
		[Current_Processing_Date] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO