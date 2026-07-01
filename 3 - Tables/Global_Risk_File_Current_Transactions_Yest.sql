IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Global_Risk_File_Current_Transactions_Yest]') AND type in (N'U'))
DROP TABLE [dbo].[Global_Risk_File_Current_Transactions_Yest]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Global_Risk_File_Current_Transactions_Yest](
	[PRECNO] [int] NOT NULL,
	[PRECID] [varchar](1) NOT NULL,
	[PFIRM] [varchar](1) NOT NULL,
	[POFFIC] [varchar](3) NOT NULL,
	[PACCT] [varchar](5) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL,
	[Common_Ownership_Account] [varchar](30) NOT NULL,
	[PEXCH] [varchar](2) NOT NULL,
	[PFC] [varchar](2) NOT NULL,
	[PCTYM] [varchar](6) NOT NULL,
	[PSBCUS] [varchar](2) NOT NULL,
	[PSTRIK] [numeric](15, 8) NOT NULL,
	[PSUBTY] [varchar](1) NOT NULL,
	[GMI_Security_Type] [varchar](10) NOT NULL,
	[Product] [varchar](50) NOT NULL,
	[GMI_Description] [varchar](30) NOT NULL,
	[PBS] [varchar](1) NOT NULL,
	[PQTY] [numeric](18, 0) NOT NULL,
	[GMI_Trade_Price] [numeric](15, 8) NOT NULL,
	[GMI_Multiplier] [numeric](18, 9) NOT NULL,
	[GMI_Currency_Code] [varchar](3) NOT NULL,
	[IN_GMI_Contracts_History] [varchar](1) NOT NULL,
	[PCLASS] [varchar](1) NOT NULL,
	[PEXPDT] [varchar](8) NOT NULL,
	[PSTYPE] [varchar](1) NOT NULL,
	[PCUSP2] [varchar](12) NOT NULL,
	[PLEAVQ] [numeric](18, 0) NOT NULL,
	[PBUSTQ] [numeric](18, 0) NOT NULL,
	[GMI_CFTC_Number] [varchar](5) NOT NULL,
	[GMI_CFTC_Number_2] [varchar](5) NOT NULL,
	[YOMNBF] [varchar](1) NOT NULL,
	[YCFTSB] [varchar](2) NOT NULL,
	[PATYPE] [varchar](2) NOT NULL,
	[PROUT3] [varchar](1) NOT NULL,
	[PPCNTY] [varchar](2) NOT NULL,
	[PCARD] [varchar](4) NOT NULL,
	[PSYMBL] [varchar](6) NOT NULL,
	[PSUBTY_UFC_UNSYMB] [varchar](6) NOT NULL,
	[PSTAT5] [varchar](8) NOT NULL,
	[PPTYPE] [varchar](1) NOT NULL,
	[PCABCD] [varchar](1) NOT NULL,
	[PCMNT2] [varchar](2) NOT NULL,
	[PSTAT7] [varchar](8) NOT NULL,
	[PDELET] [varchar](1) NOT NULL,
	[PDEST] [varchar](1) NOT NULL,
	[PCLOSE] [numeric](15, 8) NOT NULL,
	[PSDATE] [varchar](8) NOT NULL,
	[PNET] [numeric](15, 2) NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[Processing_Date] [date] NOT NULL,
	[DateLoaded] [datetime] NOT NULL,
	[DateLoaded_Local] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PRECNO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Global_Risk_File_Current_Transactions_Yest] ADD  DEFAULT (getdate()) FOR [DateLoaded_Local]
GO


