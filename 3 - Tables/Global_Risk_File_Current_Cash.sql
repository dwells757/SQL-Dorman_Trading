DROP TABLE [dbo].[Global_Risk_File_Current_Cash]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Global_Risk_File_Current_Cash](
	[Processing_Date] [date] NOT NULL,
	[Record_Number] [int] IDENTITY(1,1),
	[PRECID] [varchar](1) NOT NULL,
	[PFIRM] [varchar](1) NOT NULL,
	[POFFIC] [varchar](3) NOT NULL,
	[PACCT] [varchar](5) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	--[GMI_Sub_Account] [varchar](10) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL,
	[PATYPE] [varchar](2) NOT NULL,
	[GMI_Description] [varchar](30) NOT NULL,
	[PNET] [numeric](15,2) NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO