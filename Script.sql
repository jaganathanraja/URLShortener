USE [master]
GO
/****** Object:  Database [UrlShorten]    Script Date: 12/31/2018 12:37:07 PM ******/
CREATE DATABASE [UrlShorten]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UrlShorten', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UrlShorten.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UrlShorten_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UrlShorten_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UrlShorten] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UrlShorten].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UrlShorten] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UrlShorten] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UrlShorten] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UrlShorten] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UrlShorten] SET ARITHABORT OFF 
GO
ALTER DATABASE [UrlShorten] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UrlShorten] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UrlShorten] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UrlShorten] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UrlShorten] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UrlShorten] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UrlShorten] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UrlShorten] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UrlShorten] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UrlShorten] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UrlShorten] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UrlShorten] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UrlShorten] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UrlShorten] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UrlShorten] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UrlShorten] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UrlShorten] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UrlShorten] SET RECOVERY FULL 
GO
ALTER DATABASE [UrlShorten] SET  MULTI_USER 
GO
ALTER DATABASE [UrlShorten] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UrlShorten] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UrlShorten] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UrlShorten] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UrlShorten] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UrlShorten', N'ON'
GO
ALTER DATABASE [UrlShorten] SET QUERY_STORE = OFF
GO
USE [UrlShorten]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [UrlShorten]
GO
/****** Object:  Table [dbo].[SystemUsers]    Script Date: 12/31/2018 12:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URL]    Script Date: 12/31/2018 12:37:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](max) NULL,
	[ShortenURL] [varchar](max) NULL,
	[SystemUserId] [int] NULL,
	[DisableUserCount] [int] NULL,
	[ExpiredDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_URL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URLTracker]    Script Date: 12/31/2018 12:37:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URLTracker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[URLId] [int] NULL,
	[IPAddress] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Browser] [varchar](50) NULL,
	[CreatedDatetime] [datetime] NULL,
 CONSTRAINT [PK_URLTracker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SystemUsers] ON 

INSERT [dbo].[SystemUsers] ([Id], [FirstName], [LastName], [UserName], [EmailAddress], [Password]) VALUES (1, N'mani', N'kandan', N'manikandan', N'manikandan@yopmail.com', N'1234567890')
SET IDENTITY_INSERT [dbo].[SystemUsers] OFF
SET IDENTITY_INSERT [dbo].[URL] ON 

INSERT [dbo].[URL] ([Id], [URL], [ShortenURL], [SystemUserId], [DisableUserCount], [ExpiredDate], [IsDeleted]) VALUES (1, N'https://ipstack.com/product', N'b', NULL, NULL, NULL, 0)
INSERT [dbo].[URL] ([Id], [URL], [ShortenURL], [SystemUserId], [DisableUserCount], [ExpiredDate], [IsDeleted]) VALUES (2, N'https://www.syncfusion.com/xamarin-ui-controls', N'b', NULL, NULL, NULL, 0)
INSERT [dbo].[URL] ([Id], [URL], [ShortenURL], [SystemUserId], [DisableUserCount], [ExpiredDate], [IsDeleted]) VALUES (3, N'https://www.syncfusion.com/javascript-ui-controls', N'1', NULL, NULL, NULL, 0)
INSERT [dbo].[URL] ([Id], [URL], [ShortenURL], [SystemUserId], [DisableUserCount], [ExpiredDate], [IsDeleted]) VALUES (4, N'https://help.syncfusion.com/js/grid/getting-started', N'c', 1, 12, CAST(N'2018-12-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[URL] ([Id], [URL], [ShortenURL], [SystemUserId], [DisableUserCount], [ExpiredDate], [IsDeleted]) VALUES (5, N'https://www.google.com/search?q=yaskawa&rlz=1C1GCEU_enIN819IN819&oq=ya&aqs=chrome.3.69i57j0l5.3947j0j7&sourceid=chrome&ie=UTF-8', N'2', 1, 0, CAST(N'2018-12-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[URL] ([Id], [URL], [ShortenURL], [SystemUserId], [DisableUserCount], [ExpiredDate], [IsDeleted]) VALUES (6, N'https://www.yaskawa.com/downloads?_yasdocumentdownload_WAR_yasdocumentdownloadportlet_productGroup=Controllers', N'd', 1, 0, CAST(N'2018-12-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[URL] ([Id], [URL], [ShortenURL], [SystemUserId], [DisableUserCount], [ExpiredDate], [IsDeleted]) VALUES (7, N'https://syncfusion.atlassian.net/plugins/servlet/ac/com.kaanha.timesheets/jira-reports-timesheet-entry?user.key=manikandan.selvaraj&project.key=CPAAFS&project.id=19800&user.id=manikandan.selvaraj', N'3', 1, 0, CAST(N'2018-12-28T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[URL] OFF
SET IDENTITY_INSERT [dbo].[URLTracker] ON 

INSERT [dbo].[URLTracker] ([Id], [URLId], [IPAddress], [Country], [Browser], [CreatedDatetime]) VALUES (1, 1, N'::1', NULL, N'Chrome', NULL)
INSERT [dbo].[URLTracker] ([Id], [URLId], [IPAddress], [Country], [Browser], [CreatedDatetime]) VALUES (2, 2, N'::1', NULL, N'Chrome', NULL)
INSERT [dbo].[URLTracker] ([Id], [URLId], [IPAddress], [Country], [Browser], [CreatedDatetime]) VALUES (3, 3, N'::1', NULL, N'Chrome', NULL)
INSERT [dbo].[URLTracker] ([Id], [URLId], [IPAddress], [Country], [Browser], [CreatedDatetime]) VALUES (4, 3, N'::1', NULL, N'Chrome', NULL)
INSERT [dbo].[URLTracker] ([Id], [URLId], [IPAddress], [Country], [Browser], [CreatedDatetime]) VALUES (5, 4, N'::1', NULL, N'Chrome', CAST(N'2018-12-28T17:20:19.260' AS DateTime))
INSERT [dbo].[URLTracker] ([Id], [URLId], [IPAddress], [Country], [Browser], [CreatedDatetime]) VALUES (6, 4, N'::1', NULL, N'Chrome', CAST(N'2018-12-28T17:20:27.803' AS DateTime))
SET IDENTITY_INSERT [dbo].[URLTracker] OFF
ALTER TABLE [dbo].[URL] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[URL]  WITH CHECK ADD  CONSTRAINT [FK_URL_SystemUsers] FOREIGN KEY([SystemUserId])
REFERENCES [dbo].[SystemUsers] ([Id])
GO
ALTER TABLE [dbo].[URL] CHECK CONSTRAINT [FK_URL_SystemUsers]
GO
ALTER TABLE [dbo].[URLTracker]  WITH CHECK ADD  CONSTRAINT [FK_URLTracker_URL] FOREIGN KEY([URLId])
REFERENCES [dbo].[URL] ([Id])
GO
ALTER TABLE [dbo].[URLTracker] CHECK CONSTRAINT [FK_URLTracker_URL]
GO
USE [master]
GO
ALTER DATABASE [UrlShorten] SET  READ_WRITE 
GO
