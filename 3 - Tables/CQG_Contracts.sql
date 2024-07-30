DROP TABLE [dbo].[CQG_Contracts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CQG_Contracts](
	[ContractSymbol] [varchar](255) NOT NULL DEFAULT '',
	[GMI_Record_Number] [varchar](255) NOT NULL DEFAULT '',
	[PEXCH] [varchar](255) NOT NULL DEFAULT '',
	[PFC] [varchar](255) NOT NULL DEFAULT '',
	[PCTYM] [varchar](255) NOT NULL DEFAULT '', --5
	[PCLOSE] [varchar](255) NOT NULL DEFAULT '',
	[StatusCode] [varchar](255) NOT NULL DEFAULT '',
	[Level] [varchar](255) NOT NULL DEFAULT '',
	[ScaledPrice] [varchar](255) NOT NULL DEFAULT '',
	[CorrectPriceScale] [varchar](255) NOT NULL DEFAULT '', --10
	[CQG_to_GMI_Price_Multiplier] [varchar](255) NOT NULL DEFAULT '', --10
	[CQG_Price] [varchar](255) NOT NULL DEFAULT '',
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	--CONSTRAINT [PK_CQG_Contracts] PRIMARY KEY CLUSTERED
	--(
	--	[Field_1] ASC,
	--	[Field_2] ASC,
	--	[Field_3] ASC
	--)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO