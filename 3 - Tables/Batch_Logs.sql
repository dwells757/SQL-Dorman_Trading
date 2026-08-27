DROP TABLE [dbo].[Batch_Logs]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Batch_Logs](
	[Batch_ID] [int] IDENTITY(1,1),
	[Batch_Name] [varchar](255) NOT NULL,
	[Batch_Status] [varchar](20) NOT NULL,
	[Start_Time] [datetime] NOT NULL DEFAULT GETDATE(),
	[End_Time] [datetime] NULL,
	[Duration] [time] NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	PRIMARY KEY CLUSTERED
	(
		[Batch_ID] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO