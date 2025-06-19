USE [GMIDATA]
GO

DROP TABLE [dbo].[Commission_Fees_Volume_History_2_Excluded_Records]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Commission_Fees_Volume_History_2_Excluded_Records](
	[Processing_Date] [date] NOT NULL,
	[USE_THIS_RECORD_YN] [varchar](1) NOT NULL,
	[Exclusion_Reason] [varchar](255) NOT NULL,
	--[Account] [varchar](20) NOT NULL,
	[PFIRM] [varchar](1) NOT NULL,
	[POFFIC] [varchar](3) NOT NULL,
	[PACCT] [varchar](5) NOT NULL,
	--[Related_Account] [varchar](20) NOT NULL,
	[PRR] [varchar](5) NOT NULL,
	[PEXCH] [varchar](2) NOT NULL,
	[PFC] [varchar](2) NOT NULL,
	[Expiry] [varchar](8) NOT NULL,
	[PSTRIK] [numeric](15,8) NOT NULL,
	[PSUBTY] [varchar](1) NOT NULL,
	[PSDSC1] [varchar](50) NOT NULL,
	[PSTYPE] [varchar](1) NOT NULL,
	[PTYPE] [varchar](1) NOT NULL,
	--[Security_Type] [varchar](10) NOT NULL,
	[PRECID] [varchar](1) NOT NULL,
	[PCLASS] [varchar](1) NOT NULL,
	[PSUBCL] [varchar](1) NOT NULL,
	[PATYPE] [varchar](2) NOT NULL,
	[PCURAT] [varchar](3) NOT NULL,
	[PLOC] [varchar](1) NOT NULL,
	[PCARD] [varchar](4) NOT NULL,

	[PCOMM] [numeric](15,2) NOT NULL,
	[PATCOM] [varchar](2) NOT NULL,
	--[PATCOM_Currency_Code] [varchar](3) NOT NULL,

	[PFEE1] [numeric](15,2) NOT NULL,
	[PATFE1] [varchar](2) NOT NULL,
	--[PATFE1_Currency_Code] [varchar](3) NOT NULL,
	[PFEE2] [numeric](15,2) NOT NULL,
	[PATFE2] [varchar](2) NOT NULL,
	--[PATFE2_Currency_Code] [varchar](3) NOT NULL,
	[PFEE3] [numeric](15,2) NOT NULL,
	[PATFE3] [varchar](2) NOT NULL,
	--[PATFE3_Currency_Code] [varchar](3) NOT NULL,
	[PFEE4] [numeric](15,2) NOT NULL,
	[PATFE4] [varchar](2) NOT NULL,
	--[PATFE4_Currency_Code] [varchar](3) NOT NULL,
	[PFEE5] [numeric](15,2) NOT NULL,
	[PATFE5] [varchar](2) NOT NULL,
	--[PATFE5_Currency_Code] [varchar](3) NOT NULL,
	[PFEE6] [numeric](15,2) NOT NULL,
	[PATFE6] [varchar](2) NOT NULL,
	--[PATFE6_Currency_Code] [varchar](3) NOT NULL,
	[PFEE7] [numeric](15,2) NOT NULL,
	[PATFE7] [varchar](2) NOT NULL,
	--[PATFE7_Currency_Code] [varchar](3) NOT NULL,
	[PFEE8] [numeric](15,2) NOT NULL,
	[PATFE8] [varchar](2) NOT NULL,
	--[PATFE8_Currency_Code] [varchar](3) NOT NULL,
	[PFEE9] [numeric](15,2) NOT NULL,
	[PATFE9] [varchar](2) NOT NULL,
	--[PATFE9_Currency_Code] [varchar](3) NOT NULL,

	[PGICHG] [numeric](15,2) NOT NULL,
	[PATGIV] [varchar](2) NOT NULL,
	--[PATGIV_Currency_Code] [varchar](3) NOT NULL,
	[PBKCHG] [numeric](15,2) NOT NULL,
	[PATBKG] [varchar](2) NOT NULL,
	--[PATBKG_Currency_Code] [varchar](3) NOT NULL,
	[POTHER] [numeric](15,2) NOT NULL,
	[PATOTH] [varchar](2) NOT NULL,
	--[PATOTH_Currency_Code] [varchar](3) NOT NULL,
	[PMBKOF] [numeric](15,2) NOT NULL,
	[PATBKO] [varchar](2) NOT NULL,
	--[PATBKO_Currency_Code] [varchar](3) NOT NULL,
	[PMFLOR] [numeric](15,2) NOT NULL,
	[PATFLR] [varchar](2) NOT NULL,
	--[PATFLR_Currency_Code] [varchar](3) NOT NULL,
	[PMORDR] [numeric](15,2) NOT NULL,
	[PATORD] [varchar](2) NOT NULL,
	--[PATORD_Currency_Code] [varchar](3) NOT NULL,
	[PMWIRE] [numeric](15,2) NOT NULL,
	[PATWIR] [varchar](2) NOT NULL,
	--[PATWIR_Currency_Code] [varchar](3) NOT NULL,
	[PMOTHR] [numeric](15,2) NOT NULL,
	[PATALO] [varchar](2) NOT NULL,
	--[PATALO_Currency_Code] [varchar](3) NOT NULL,

	[Transactions] [int] NOT NULL,
	[Quantity] [numeric](18) NOT NULL,
	--[Commission_Quantity] [numeric](18) NOT NULL,

	--[USD_Commission_Amount] [numeric](15,2) NOT NULL,
	--[USD_Total_Fees] [numeric](15,2) NOT NULL,
	--[EUR_Total_Fees] [numeric](15,2) NOT NULL,
	--[USD_Transaction_Fees] [numeric](15,2) NOT NULL,
	--[EUR_Transaction_Fees] [numeric](15,2) NOT NULL,

	--[GMI_Account_Type_Description] [varchar](255) NOT NULL,

	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	--CONSTRAINT [PK_Commission_Fees_Volume_History_2_Excluded_Records] PRIMARY KEY CLUSTERED
	--(
	--	[Processing_Date] ASC,
	--	[PRR] ASC,
	--	[PFIRM] ASC,
	--	[POFFIC] ASC,
	--	[PACCT] ASC,
	--	[PCLASS] ASC,
	--	[PSUBCL] ASC,
	--	[PSTYPE] ASC,
	--	[PTYPE] ASC,
	--	[PRECID] ASC,
	--	[PATYPE] ASC,
	--	[PCURAT] ASC
	--)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO