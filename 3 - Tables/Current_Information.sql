USE [GMIDATA]
GO

DROP TABLE [dbo].[Current_Information]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Current_Information](
	[Current_Processing_Date] [date] NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO