USE [GMIDATA]
GO

DROP TABLE [dbo].[CME_Group_Contracts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CME_Group_Contracts](
	[CME_Group_Product_Name] [varchar](255) NOT NULL DEFAULT '',
	[Futures_Options] [varchar](255) NOT NULL DEFAULT '',
	[Globex] [varchar](255) NOT NULL DEFAULT '',
	[Clearport] [varchar](255) NOT NULL DEFAULT '',
	[Bloomberg] [varchar](255) NOT NULL DEFAULT '', --5
	[CQG] [varchar](255) NOT NULL DEFAULT '',
	[DTN] [varchar](255) NOT NULL DEFAULT '',
	[Fidessa] [varchar](255) NOT NULL DEFAULT '',
	[FIS_Global] [varchar](255) NOT NULL DEFAULT '',
	[ION_Group] [varchar](255) NOT NULL DEFAULT '', --10
	[Itiviti] [varchar](255) NOT NULL DEFAULT '',
	[Refinitiv] [varchar](255) NOT NULL DEFAULT '',
	[Trading_Technologies] [varchar](255) NOT NULL DEFAULT '',
	[Vela_Trading_Systems] [varchar](255) NOT NULL DEFAULT '', --14
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	--CONSTRAINT [PK_CME_Group_Contracts] PRIMARY KEY CLUSTERED
	--(
	--	[Field_1] ASC,
	--	[Field_2] ASC,
	--	[Field_3] ASC
	--)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO