USE [GMIDATA]
GO

--------/****** Object:  Table [dbo].[Registered_Representative]    Script Date: 5/27/2023 5:43:53 AM ******/
--------IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registered_Representative]') AND type in (N'U'))
--------DROP TABLE [dbo].[Registered_Representative]
--------GO

/****** Object:  Table [dbo].[Registered_Representative]    Script Date: 5/27/2023 5:43:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Registered_Representative](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Master_Common_Name] [nvarchar](max) NULL,
	[DateLoaded] [datetime] NOT NULL,
 CONSTRAINT [PK_Registered_Representative] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Registered_Representative] ADD  DEFAULT (getdate()) FOR [DateLoaded]
GO


