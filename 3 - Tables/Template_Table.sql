USE [GMIDATA]
GO

DROP TABLE [dbo].[Template_Table]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Template_Table](
	[Field_1] [varchar](255) NOT NULL,
	[Field_2] [varchar](255) NOT NULL,
	[Field_3] [varchar](255) NOT NULL,
	[Field_4] [varchar](255) NOT NULL,
	[Field_5] [varchar](255) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_Template_Table] PRIMARY KEY CLUSTERED
	(
		[Field_1] ASC,
		[Field_2] ASC,
		[Field_3] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO