DROP TABLE [dbo].[GMI_Account_Types]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_Account_Types](
	[GMI_Account_Type] [varchar](2) NOT NULL,
	[GMI_Account_Type_Description] [varchar](255) NOT NULL,
	[Currency_Code] [varchar](3) NOT NULL,
	[Currency_Name] [varchar](100) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_Account_Types] PRIMARY KEY CLUSTERED
	(
		[GMI_Account_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO