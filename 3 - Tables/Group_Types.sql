DROP TABLE [dbo].[Group_Types]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Group_Types](
	[Group_Type] [varchar](30) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Group_Types] PRIMARY KEY CLUSTERED
	(
		[Group_Type] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO