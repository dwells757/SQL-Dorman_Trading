USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_Snapshot_Current]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Snapshot_Current](
	[Account] [varchar](20) NOT NULL,
	[Account_Type] [varchar](2) NOT NULL,
	--[Related_Account] [varchar](20) NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[Balance_SOD] [money] NOT NULL,
	[Balance_Top_Day] [money] NOT NULL,
	[Balance_Current] [money] NOT NULL,
	[Balance_Change] [money] NOT NULL,
	[OTE_SOD] [money] NOT NULL,
	[OTE_Top_Day] [money] NOT NULL,
	[OTE_Current] [money] NOT NULL,
	[OTE_Change] [money] NOT NULL,
	[Total_Equity_SOD] [money] NOT NULL, ---
	[Total_Equity_Top_Day] [money] NOT NULL, ---
	[Total_Equity_Current] [money] NOT NULL, ---
	[Total_Equity_Change] [money] NOT NULL, ---
	[LOV_SOD] [money] NOT NULL,
	[LOV_Top_Day] [money] NOT NULL,
	[LOV_Current] [money] NOT NULL,
	[LOV_Change] [money] NOT NULL,
	[SOV_SOD] [money] NOT NULL,
	[SOV_Top_Day] [money] NOT NULL,
	[SOV_Current] [money] NOT NULL,
	[SOV_Change] [money] NOT NULL,
	[NOV_SOD] [money] NOT NULL, ---
	[NOV_Top_Day] [money] NOT NULL, ---
	[NOV_Current] [money] NOT NULL, ---
	[NOV_Change] [money] NOT NULL, ---
	[Liquidating_Value_SOD] [money] NOT NULL, ---
	[Liquidating_Value_Top_Day] [money] NOT NULL, ---
	[Liquidating_Value_Current] [money] NOT NULL, ---
	[Liquidating_Value_Change] [money] NOT NULL, ---
	[Option_Unrealized_SOD] [money] NOT NULL,
	[Option_Unrealized_Top_Day] [money] NOT NULL,
	[Option_Unrealized_Current] [money] NOT NULL,
	[Option_Unrealized_Change] [money] NOT NULL,
	[FMR] [numeric](15,2) NOT NULL,
	[FIR] [numeric](15,2) NOT NULL,
	[Margin_Excess_Deficit] [numeric](15,2) NOT NULL,
	[Securities_on_Deposit] [numeric](15,2) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Snapshot_Current] PRIMARY KEY CLUSTERED
	(
		[Account] ASC,
		[Account_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO