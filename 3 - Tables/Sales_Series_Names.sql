USE [GMIDATA]
GO

DROP TABLE [dbo].[Sales_Series_Names]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Sales_Series_Names](
	[RR] [varchar](5) NOT NULL,
	[RR_Name] [varchar](100) NOT NULL,
	[Master_Common_Name] [varchar](100) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO