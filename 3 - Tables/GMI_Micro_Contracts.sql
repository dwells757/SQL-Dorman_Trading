USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_Micro_Contracts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Micro_Contracts](
	[GMIFC] [varchar](255) NOT NULL DEFAULT '',
	[TYPE] [varchar](255) NOT NULL DEFAULT '',
	[PRODTYP] [varchar](255) NOT NULL DEFAULT '',
	[PROMPT] [varchar](255) NOT NULL DEFAULT '',
	[DESC] [varchar](255) NOT NULL DEFAULT '',
	[LONGDESC] [varchar](255) NOT NULL DEFAULT '',
	[SPANCOMM] [varchar](255) NOT NULL DEFAULT '',
	[CFTCFC] [varchar](255) NOT NULL DEFAULT '',
	[Concat] [varchar](255) NOT NULL DEFAULT '',
	[Category] [varchar](255) NOT NULL DEFAULT '',
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE(),
	[GMI_Exchange] [varchar](2) NOT NULL DEFAULT '??'
	
	--CONSTRAINT [PK_GMI_Micro_Contracts] PRIMARY KEY CLUSTERED
	--(
	--	[Field_1] ASC,
	--	[Field_2] ASC,
	--	[Field_3] ASC
	--)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO