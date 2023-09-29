DROP TABLE [dbo].[GMI_SOD_Positions_Detailed]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_SOD_Positions_Detailed](
	[Processing_Date] [date] NOT NULL,
	[PRECID] [varchar](1) NOT NULL,
	[PFIRM] [varchar](1) NOT NULL,
	[POFFIC] [varchar](3) NOT NULL,
	[PACCT] [varchar](5) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[GMI_Sub_Account] [varchar](10) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL,
	[Common_Ownership_Account] [varchar](30) NOT NULL,
	[PEXCH] [varchar](2) NOT NULL,
	[PFC] [varchar](2) NOT NULL,
	[PCTYM] [varchar](6) NOT NULL,
	[PSBCUS] [varchar](2) NOT NULL,
	[PSTRIK] [numeric](18,9) NOT NULL,
	[PSUBTY] [varchar](1) NOT NULL,
	[GMI_Security_Type] [varchar](10) NOT NULL,
	[Product] [varchar](50) NOT NULL,
	[GMI_Description] [varchar](30) NOT NULL,
	[PBS] [varchar](1) NOT NULL,
	[PQTY] [numeric](18) NOT NULL,
	[GMI_Trade_Price] [numeric](18,9) NOT NULL,
	[GMI_Multiplier] [numeric](18,9) NOT NULL,
	[GMI_Last_Closing_Price] [numeric](18,9) NOT NULL,
	[OTE] [money] NOT NULL,
	[Market_Value] [numeric](15,2) NOT NULL,
	[Option_Unrealized] [numeric](15,2) NOT NULL,
	[Securities_on_Deposit] [numeric](15,2) NOT NULL,
	[GMI_Currency_Code] [varchar](3) NOT NULL,
	[PTDATE] [varchar](8) NOT NULL,
	[Expiration_Date] [varchar](8) NOT NULL,
	[PCLASS] [varchar](2) NOT NULL,
	[PEXPDT] [varchar](8) NOT NULL,
	[PSTYPE] [varchar](1) NOT NULL,
	[PLTDAT] [varchar](8) NOT NULL,
	[PCUSP2] [varchar](12) NOT NULL,
	[PLEAVQ] [numeric](18) NOT NULL,
	[PBUSTQ] [numeric](18) NOT NULL,
	[PBROKR] [varchar](1) NOT NULL,
	[PGIVIO] [varchar](2) NOT NULL,
	[PSPRED] [varchar](1) NOT NULL,
	[GMI_CFTC_Number] [varchar](5) NOT NULL,
	[GMI_CFTC_Number_2] [varchar](5) NOT NULL,
	[YOMNBF] [varchar](1) NOT NULL,
	[YCFTSB] [varchar](2) NOT NULL,
	[Account_Type] [varchar](2) NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO