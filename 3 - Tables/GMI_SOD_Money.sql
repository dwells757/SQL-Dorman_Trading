USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_SOD_Money]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_SOD_Money](
	[Processing_Date] [date] NOT NULL,
	[MRECID] [varchar](1) NOT NULL,
	[MFIRM] [varchar](1) NOT NULL,
	[MOFFIC] [varchar](3) NOT NULL,
	[MACCT] [varchar](5) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL,
	[Account_Type] [varchar](2) NOT NULL,
	[Account_Type_Currency_Code_Symbol] [varchar](3) NOT NULL,
	[Product_Currency_Code] [varchar](2) NOT NULL,
	[Account_Base_Currency_Code_Symbol] [varchar](3) NOT NULL,
	[Firm_Base_Currency_Code_Symbol] [varchar](3) NOT NULL,
	[Currency_Processing_Code] [varchar](1) NOT NULL,
	[Account_Balance] [numeric](15,2) NOT NULL,
	[Long_Market_Value_of_Securities_on_Deposit] [numeric](15,2) NOT NULL,
	[Short_Market_Value_of_Securities_on_Deposit] [numeric](15,2) NOT NULL,
	[Long_Option_Market_Value] [numeric](15,2) NOT NULL,
	[Short_Option_Market_Value] [numeric](15,2) NOT NULL,
	[Futures_Initial_Margin_Requirement] [numeric](15,2) NOT NULL,
	[Futures_Maintenance_Margin_Requirement] [numeric](15,2) NOT NULL,
	[Margin_Excess_Deficit] [numeric](15,2) NOT NULL,
	[Open_Trade_Equity] [numeric](15,2) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO