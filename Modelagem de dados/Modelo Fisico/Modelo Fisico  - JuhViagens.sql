USE [JuhMesquitaViagens]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/12/2021 15:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destiny]    Script Date: 17/12/2021 15:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destiny](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[country] [nvarchar](max) NOT NULL,
	[state] [nvarchar](max) NOT NULL,
	[municipality] [nvarchar](max) NOT NULL,
	[valueDaily] [float] NOT NULL,
	[promotion] [bit] NOT NULL,
 CONSTRAINT [PK_Destiny] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 17/12/2021 15:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[origin] [nvarchar](max) NOT NULL,
	[destinyid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[kids] [int] NOT NULL,
	[adults] [int] NOT NULL,
	[payment] [float] NOT NULL,
	[dateGoing] [datetime2](7) NOT NULL,
	[dateReturn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17/12/2021 15:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[CPF] [nvarchar](11) NOT NULL,
	[phone] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[administrator] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211216031604_JuhMesquitaViagens', N'6.0.1')
GO
SET IDENTITY_INSERT [dbo].[Destiny] ON 

INSERT [dbo].[Destiny] ([id], [title], [country], [state], [municipality], [valueDaily], [promotion]) VALUES (1, N'Pacote de Viagem - Rio de Janeiro - 2022', N'Brasil', N'Rio de janeiro', N'Rio de janeiro', 490, 1)
INSERT [dbo].[Destiny] ([id], [title], [country], [state], [municipality], [valueDaily], [promotion]) VALUES (2, N'Pacote de Viagem - Itacaré', N'Brasil', N'Bahia', N'Itacaré', 849, 0)
INSERT [dbo].[Destiny] ([id], [title], [country], [state], [municipality], [valueDaily], [promotion]) VALUES (3, N'Pacote de Viagem - Península de Maraú', N'Brasil', N'Bahia', N'Maraú', 1909, 0)
INSERT [dbo].[Destiny] ([id], [title], [country], [state], [municipality], [valueDaily], [promotion]) VALUES (4, N'Pacote de Viagem de Data Fixa - Gramado ou Canela - 1º Semestre 2022', N'Brasil', N'Rio grande do sul', N'Gramado', 799, 1)
SET IDENTITY_INSERT [dbo].[Destiny] OFF
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Destiny_destinyid] FOREIGN KEY([destinyid])
REFERENCES [dbo].[Destiny] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Destiny_destinyid]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_User_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_User_userid]
GO
