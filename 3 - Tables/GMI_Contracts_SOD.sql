DROP TABLE [dbo].[GMI_Contracts_SOD]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Contracts_SOD](
	[GMI_Exchange] [varchar](2) NOT NULL,
	[GMI_Symbol] [varchar](2) NOT NULL,
	[GMI_Security_Type] [varchar](10) NOT NULL,
	[GMI_Multiplier] [numeric](18,9) NOT NULL,
	[GMI_Currency_Code] [varchar](3) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Contracts_SOD] PRIMARY KEY CLUSTERED
	(
		[GMI_Exchange] ASC,
		[GMI_Symbol] ASC,
		[GMI_Security_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO