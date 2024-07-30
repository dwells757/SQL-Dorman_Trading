DROP TABLE [dbo].[GMI_Contracts_2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Contracts_2](
	[GMI_Exchange] [varchar](2) NOT NULL,
	[GMI_Symbol] [varchar](2) NOT NULL,
	[GMI_Type] [varchar](1) NOT NULL,
	[GMIPOS_Records] [int] NOT NULL,
	[Exchange_Symbol] [varchar](4) NOT NULL,
	[CME_Group_Contract_Type] [varchar](10) NOT NULL,
	[CQG_Symbol] [varchar](10) NOT NULL,
	[TT_Symbol] [varchar](10) NOT NULL,
	[GMI_DESC] [varchar](255) NOT NULL,
	[GMI_LONGDESC] [varchar](255) NOT NULL,
	[GMI_EXCHDESC] [varchar](255) NOT NULL,
	[Clearing_House_Exchange] [varchar](10) NOT NULL,
	[Market_Identifier_Code] [varchar](4) NOT NULL,
	[Clearing_House] [varchar](30) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Contracts_2] PRIMARY KEY CLUSTERED
	(
		[GMI_Exchange] ASC,
		[GMI_Symbol] ASC,
		[GMI_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO