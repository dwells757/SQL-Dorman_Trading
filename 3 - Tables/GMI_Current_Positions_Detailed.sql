DROP TABLE [dbo].[GMI_Current_Positions_Detailed]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Current_Positions_Detailed](
	[Account] [varchar](20) NOT NULL, --PRIMARY KEY
	[Related_Account] [varchar](20) NOT NULL, --WARNING: This may cause a PRIMARY KEY violation!!!
	[Product] [varchar](50) NOT NULL, --PRIMARY KEY
	[GMI_Security_Type] [varchar](30) NOT NULL,
	[GMI_Description] [varchar](30) NOT NULL,
	[PBS] [varchar](1) NOT NULL, --PRIMARY KEY
	--[Buy_Sell] [varchar](7) NOT NULL,
	[Quantity] [numeric](18) NOT NULL,
	[GMI_Trade_Price] [numeric](18,9) NOT NULL, --PRIMARY KEY
	[GMI_Last_Closing_Price] [numeric](18,9) NOT NULL,
	[GMI_Current_Price] [numeric](18,9) NOT NULL,
	[GMI_Multiplier] [numeric](18,9) NOT NULL,
	[Trade_Date] [date] NOT NULL,
	[OTE_SOD] [money] NOT NULL,
	[OTE_Top_Day] [money] NOT NULL,
	[OTE_Current] [money] NOT NULL,
	[OTE_Change] [money] NOT NULL,
	[Market_Value] [money] NOT NULL,
	[Option_Unrealized_SOD] [money] NOT NULL,
	[Option_Unrealized_Top_Day] [money] NOT NULL,
	[Option_Unrealized_Current] [money] NOT NULL,
	[Option_Unrealized_Change] [money] NOT NULL,
	[GMI_Currency_Code] [varchar](3) NOT NULL,
	[GMI_Expiration_Date] [varchar](8) NOT NULL,
	[Source_Table] [varchar](100) NOT NULL, --PRIMARY KEY
	[IN_GMI_Products_YN] [varchar](1) NOT NULL,
	[Account_Type] [varchar](2) NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[Account_Balance] [money] NOT NULL,
	[LOV] [money] NOT NULL,
	[SOV] [money] NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Current_Positions_Detailed] PRIMARY KEY CLUSTERED
	(
		[Account] ASC,
		[Product] ASC,
		[PBS] ASC,
		[GMI_Trade_Price] ASC,
		[Trade_Date] ASC,
		[Source_Table] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO