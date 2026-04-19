--------------DROP TABLE [dbo].[GMI_Contracts_History]
--------------GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Contracts_History](
	[GMI_Exchange] [varchar](2) NOT NULL,
	[GMI_Symbol] [varchar](2) NOT NULL,
	[GMI_Security_Type] [varchar](10) NOT NULL,
	[GMI_Multiplier] [numeric](18,9) NOT NULL,
	[GMI_Currency_Code] [varchar](3) NOT NULL,
	[DateLoaded] [datetime] NOT NULL,
	[Processing_Date_Loaded] [varchar](8) NOT NULL,
	[Days_In_GMIPOSF1_File] [int] NOT NULL,
	[Date_Updated] [datetime] NOT NULL,
	[Processing_Date_Updated] [varchar](8) NOT NULL
	
	PRIMARY KEY CLUSTERED
	(
		[GMI_Exchange] ASC,
		[GMI_Symbol] ASC,
		[GMI_Security_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO