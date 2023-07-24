USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_Customer_Master]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Customer_Master](
	[YFIRM] [varchar](1) NOT NULL,
	[YOFFIC] [varchar](3) NOT NULL,
	[YACCT] [varchar](5) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[YREL1F] [varchar](1) NOT NULL,
	[YREL1O] [varchar](3) NOT NULL,
	[YREL1A] [varchar](5) NOT NULL,
	[Related_Account] [varchar](20) NOT NULL,
	[GMI_CFTC_Number] [varchar](5) NOT NULL,
	[GMI_CFTC_Number_2] [varchar](5) NOT NULL,
	[Common_Ownership_Account] [varchar](30) NOT NULL,
	[YSNAME] [varchar](50) NOT NULL,
	[YINACT] [varchar](1) NOT NULL,
	[YCLASS] [varchar](1) NOT NULL,
	[YSUBCL] [varchar](1) NOT NULL,
	[YOMNBF] [varchar](1) NOT NULL,
	[YWOWND] [varchar](1) NOT NULL,
	[YCFTSB] [varchar](2) NOT NULL,
	[YRR] [varchar](10) NOT NULL,
	--[YCGMAO] [varchar](5) NOT NULL,
	[YCNTRY] [varchar](2) NOT NULL,
	[YGRPAC] [varchar](2) NOT NULL,
	[YHEDGE] [varchar](1) NOT NULL,
	[CUST_LINE_1] [varchar](40) NOT NULL,
	[CUST_LINE_2] [varchar](40) NOT NULL,
	[CUST_LINE_3] [varchar](40) NOT NULL,
	[CUST_LINE_4] [varchar](75) NOT NULL,
	[CUST_LINE_5] [varchar](40) NOT NULL,
	
	--[YRSKC1] [varchar](10) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Customer_Master] PRIMARY KEY CLUSTERED
	(
		[YFIRM] ASC,
		[YOFFIC] ASC,
		[YACCT] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO