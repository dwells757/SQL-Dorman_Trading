USE [GMIDATA]
GO

DROP TABLE [dbo].[GMI_File_Layouts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GMI_File_Layouts](
	[Record_Number] [int] IDENTITY(1,1) NOT NULL,
	[GMI_File_Name] [varchar](10) NOT NULL,
	[GMI_Field_Name] [varchar](10) NOT NULL,
	[GMI_Field_From] [int] NOT NULL,
	[GMI_Field_To] [int] NOT NULL,
	[GMI_Field_Len] [int] NOT NULL,
	[GMI_Field_Dec] [varchar](1) NOT NULL,
	[GMI_Field_Pkd] [varchar](1) NOT NULL,
	[GMI_Field_Description] [varchar](100) NOT NULL,
	[DateLoaded] [datetime] NOT NULL DEFAULT GETDATE()
	
	CONSTRAINT [PK_GMI_File_Layouts] PRIMARY KEY CLUSTERED
	(
		[Record_Number] ASC
	)
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO