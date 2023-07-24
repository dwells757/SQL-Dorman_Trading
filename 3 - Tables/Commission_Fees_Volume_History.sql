USE [GMIDATA]
GO

DROP TABLE [dbo].[Commission_Fees_Volume_History]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Commission_Fees_Volume_History](
	[Processing_Date] [date] NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[PFIRM] [varchar](1) NOT NULL,
	[POFFIC] [varchar](3) NOT NULL,
	[PACCT] [varchar](5) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL,
	[PRR] [varchar](5) NOT NULL,
	[PEXCH] [varchar](2) NOT NULL,
	[PFC] [varchar](2) NOT NULL,
	[Expiry] [varchar](8) NOT NULL,
	[PSTRIK] [numeric](15,8) NOT NULL,
	[PSUBTY] [varchar](1) NOT NULL,
	[PSDSC1] [varchar](50) NOT NULL,
	[PSTYPE] [varchar](1) NOT NULL,
	[PTYPE] [varchar](1) NOT NULL,
	[Security_Type] [varchar](10) NOT NULL,
	[PRECID] [varchar](1) NOT NULL,
	[PCLASS] [varchar](1) NOT NULL,
	[PSUBCL] [varchar](1) NOT NULL,
	[PATYPE] [varchar](2) NOT NULL,
	[PCURAT] [varchar](3) NOT NULL,

	[PCOMM] [numeric](15,2) NOT NULL,

	[PFEE1] [numeric](15,2) NOT NULL,
	[PFEE2] [numeric](15,2) NOT NULL,
	[PFEE3] [numeric](15,2) NOT NULL,
	[PFEE4] [numeric](15,2) NOT NULL,
	[PFEE5] [numeric](15,2) NOT NULL,
	[PFEE6] [numeric](15,2) NOT NULL,
	[PFEE7] [numeric](15,2) NOT NULL,
	[PFEE8] [numeric](15,2) NOT NULL,
	[PFEE9] [numeric](15,2) NOT NULL,

	[PGICHG] [numeric](15,2) NOT NULL,
	[PBKCHG] [numeric](15,2) NOT NULL,
	[POTHER] [numeric](15,2) NOT NULL,
	[PMBKOF] [numeric](15,2) NOT NULL,
	[PMFLOR] [numeric](15,2) NOT NULL,
	[PMORDR] [numeric](15,2) NOT NULL,
	[PMWIRE] [numeric](15,2) NOT NULL,
	[PMOTHR] [numeric](15,2) NOT NULL,

	[Transactions] [int] NOT NULL,
	[Quantity] [numeric](18) NOT NULL,

	[Commission_Amount] [numeric](15,2) NOT NULL,
	[Total_Fees] [numeric](15,2) NOT NULL,

	[GMI_Account_Type_Description] [varchar](255) NOT NULL,

	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	--CONSTRAINT [PK_Commission_Fees_Volume_History] PRIMARY KEY CLUSTERED
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