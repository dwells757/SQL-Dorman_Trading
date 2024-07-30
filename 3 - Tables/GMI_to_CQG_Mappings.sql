DROP TABLE [dbo].[GMI_to_CQG_Mappings]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_to_CQG_Mappings](
	[GMI_Exchange] [varchar](2) NOT NULL,
	[GMI_Symbol] [varchar](2) NOT NULL,
	[GMI_Type] [varchar](1) NOT NULL,
	[GMI_LONGDESC] [varchar](255) NOT NULL,
	[CQG_Symbol] [varchar](10) NOT NULL,
	[CQG_Exchange] [varchar](100) NOT NULL,
	[CQG_Description] [varchar](100) NOT NULL,
	[CQG_Contract] [varchar](100) NOT NULL,
	[CQG_to_GMI_Price_Multiplier] [numeric](19,9) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_to_CQG_Mappings] PRIMARY KEY CLUSTERED
	(
		[GMI_Exchange] ASC,
		[GMI_Symbol] ASC,
		[GMI_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO