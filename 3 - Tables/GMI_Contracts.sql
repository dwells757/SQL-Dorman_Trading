USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_Contracts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Contracts](
	[PEXCH] [varchar](2) NOT NULL,
	[PFC] [varchar](2) NOT NULL,
	--[PTYPE] [varchar](1) NOT NULL,
	[GMI_Description] [varchar](30) NOT NULL,
	[CQG_Symbol] [varchar](10) NOT NULL,
	[CQG_Exchange] [varchar](100) NOT NULL,
	[CQG_Description] [varchar](100) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Contracts] PRIMARY KEY CLUSTERED
	(
		[PEXCH] ASC,
		[PFC] ASC--,
		--[PTYPE] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO