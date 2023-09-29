DROP TABLE [dbo].[GMI_Products]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Products](
	[Product] [varchar](50) NOT NULL,
	[GMI_Exchange] [varchar](2) NOT NULL,
	[GMI_Symbol] [varchar](2) NOT NULL,
	[GMI_Expiry] [varchar](8) NOT NULL,
	[GMI_Strike_Price] [numeric](18,9) NOT NULL,
	[GMI_Put_Call] [varchar](8) NOT NULL,
	[GMI_Expiration_Date] [varchar](8) NOT NULL,
	[GMI_Description] [varchar](30) NOT NULL,
	[GMI_Security_Type] [varchar](10) NOT NULL,
	[GMI_Multiplier] [numeric](18,9) NOT NULL,
	[GMI_Currency_Code] [varchar](3) NOT NULL,
	[GMI_Last_Closing_Price] [numeric](18,9) NOT NULL,
	[GMI_Current_Price] [numeric](18,9) NOT NULL,
	[Price_Updated_YN] [varchar](1) NOT NULL DEFAULT 'N',
	[Price_Update_Time] [datetime] NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Products] PRIMARY KEY CLUSTERED
	(
		[Product] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO