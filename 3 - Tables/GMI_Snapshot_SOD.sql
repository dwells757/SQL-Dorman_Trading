USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_Snapshot_SOD]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Snapshot_SOD](
	[Account] [varchar](20) NOT NULL,
	[Account_Type] [varchar](2) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[Account_Balance] [numeric](15,2) NOT NULL,
	[Open_Trade_Equity] [numeric](15,2) NOT NULL,
	[Total_Equity] [numeric](15,2) NOT NULL,
	[LOV] [numeric](15,2) NOT NULL,
	[SOV] [numeric](15,2) NOT NULL,
	[NOV] [numeric](15,2) NOT NULL,
	[Liquidating_Value] [numeric](15,2) NOT NULL,
	[FMR] [numeric](15,2) NOT NULL,
	[FIR] [numeric](15,2) NOT NULL,
	[Margin_Excess_Deficit] [numeric](15,2) NOT NULL,
	[Securities_on_Deposit] [numeric](15,2) NOT NULL,
	[Option_Unrealized] [numeric](15,2) NOT NULL, --NOTE: This value is NOT in the "GMI Money" file	
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Snapshot_SOD] PRIMARY KEY CLUSTERED
	(
		[Account] ASC,
		[Account_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO