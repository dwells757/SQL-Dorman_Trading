USE [GMIDATA]
GO

DROP TABLE [dbo].[Group_Members]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Group_Members](
	[Group_ID] [varchar](30) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Group_Members] PRIMARY KEY CLUSTERED
	(
		[Group_ID] ASC,
		[Account] ASC
	)

	--CONSTRAINT FK_Group_Members_Group_ID FOREIGN KEY (Group_ID)
 --       REFERENCES [dbo].[Groups] (Group_ID)
 --       ON DELETE CASCADE
 --       ON UPDATE CASCADE

) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO