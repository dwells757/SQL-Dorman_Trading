USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_Exchanges]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Exchanges](
	[GMI_Exchange] [varchar](2) NOT NULL,
	[Clearing_House_Exchange] [varchar](10) NOT NULL,
	[Market_Identifier_Code] [varchar](4) NOT NULL,
	[Clearing_House] [varchar](30) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Exchanges] PRIMARY KEY CLUSTERED
	(
		[GMI_Exchange] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO