USE [GMIDATA]
GO

DROP TABLE [dbo].[Groups]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Groups](
	[Group_ID] [varchar](30) NOT NULL,
	[Group_Type] [varchar](30) NOT NULL,
	[Group_Name] [varchar](50) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED
	(
		[Group_ID] ASC
	)

	CONSTRAINT FK_Groups_Group_Type FOREIGN KEY (Group_Type)
        REFERENCES [dbo].[Group_Types] (Group_Type)
        ON DELETE CASCADE
        ON UPDATE CASCADE

) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO