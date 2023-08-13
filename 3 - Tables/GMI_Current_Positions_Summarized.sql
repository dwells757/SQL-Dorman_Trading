USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_Current_Positions_Summarized]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Current_Positions_Summarized](
	[Account] [varchar](20) NOT NULL, --PRIMARY KEY
	[Related_Account] [varchar](20) NOT NULL, --WARNING: This may cause a PRIMARY KEY violation!!!
	[Product] [varchar](50) NOT NULL, --PRIMARY KEY
	[GMI_Description] [varchar](30) NOT NULL,
	[Long_Quantity] [numeric](18) NOT NULL,
	[Short_Quantity] [numeric](18) NOT NULL,
	[NET_Quantity] [numeric](18) NOT NULL,
	[Quantity_Times_Price] [numeric](18,9) NOT NULL,
	[Total_Quantity] [numeric](18) NOT NULL,
	[Average_Trade_Price] [numeric](18,9) NOT NULL,
	[Market_Price] [numeric](18,9) NOT NULL,
	[OTE_SOD] [money] NOT NULL,
	[OTE_Current] [money] NOT NULL,
	[OTE_Change] [money] NOT NULL,
	[Market_Value] [money] NOT NULL,
	[Option_Unrealized_SOD] [money] NOT NULL,
	[Option_Unrealized_Current] [money] NOT NULL,
	[Option_Unrealized_Change] [money] NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[Expiration_Date] [varchar](8) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Current_Positions_Summarized] PRIMARY KEY CLUSTERED
	(
		[Account] ASC,
		[Product] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO