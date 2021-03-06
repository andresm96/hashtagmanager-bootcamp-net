USE [master]
GO
/****** Object:  Database [HashtagManager]    Script Date: 22/5/2018 21:13:12 ******/
CREATE DATABASE [HashtagManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HashtagManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\HashtagManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HashtagManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\HashtagManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HashtagManager] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HashtagManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HashtagManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HashtagManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HashtagManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HashtagManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HashtagManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [HashtagManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HashtagManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HashtagManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HashtagManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HashtagManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HashtagManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HashtagManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HashtagManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HashtagManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HashtagManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HashtagManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HashtagManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HashtagManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HashtagManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HashtagManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HashtagManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HashtagManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HashtagManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HashtagManager] SET  MULTI_USER 
GO
ALTER DATABASE [HashtagManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HashtagManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HashtagManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HashtagManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HashtagManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HashtagManager] SET QUERY_STORE = OFF
GO
USE [HashtagManager]
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
USE [HashtagManager]
GO
/****** Object:  Table [dbo].[Entry]    Script Date: 22/5/2018 21:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entry](
	[ID] [int] NOT NULL,
	[message] [nvarchar](200) NULL,
	[date] [datetime] NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_Entry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entry_hashtag]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entry_hashtag](
	[id_entry] [int] NOT NULL,
	[id_hashtag] [int] NOT NULL,
 CONSTRAINT [PK_entry_hashtag] PRIMARY KEY CLUSTERED 
(
	[id_entry] ASC,
	[id_hashtag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hashtag]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hashtag](
	[ID] [int] NOT NULL,
	[name] [nvarchar](20) NULL,
 CONSTRAINT [PK_Hashtag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[userName] [nvarchar](15) NULL,
	[password] [nvarchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (0, N'sadasd', CAST(N'2018-05-21T14:51:45.920' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (1, N'First entry.', CAST(N'2018-05-21T00:34:09.000' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (2, N'#test 2', CAST(N'2012-06-18T10:34:09.000' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (3, N'#jeje 1', CAST(N'2018-05-21T00:48:35.937' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (4, N'#jeje 2', CAST(N'2018-05-21T00:48:41.680' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (5, N'#Globant I''ve learned so much in this bootcamp.', CAST(N'2018-05-21T12:39:56.603' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (6, N'#Globant This app rocks!', CAST(N'2018-05-21T12:49:53.630' AS DateTime), 2)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (7, N'#NBA LeBron James is awesome', CAST(N'2018-05-21T12:51:42.710' AS DateTime), 2)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (8, N'#NBA Manu Ginobili is the #1', CAST(N'2018-05-21T12:54:17.483' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (9, N'asdas', CAST(N'2018-05-21T16:25:05.470' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (10, N'#Hashtag test1', CAST(N'2018-05-22T19:47:40.397' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (11, N'#Hashtag test1', CAST(N'2018-05-22T19:49:38.660' AS DateTime), 1)
INSERT [dbo].[Entry] ([ID], [message], [date], [id_user]) VALUES (12, N'#Hashtag test2', CAST(N'2018-05-22T19:49:49.613' AS DateTime), 1)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (3, 4)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (4, 4)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (5, 5)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (6, 5)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (7, 6)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (8, 6)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (8, 7)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (10, 8)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (11, 8)
INSERT [dbo].[entry_hashtag] ([id_entry], [id_hashtag]) VALUES (12, 8)
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (1, N'#test')
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (2, N'#test2')
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (3, N'#asd')
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (4, N'#jeje')
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (5, N'#Globant')
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (6, N'#NBA')
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (7, N'#1')
INSERT [dbo].[Hashtag] ([ID], [name]) VALUES (8, N'#Hashtag')
INSERT [dbo].[User] ([ID], [userName], [password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[User] ([ID], [userName], [password]) VALUES (2, N'Andrew', N'Andrew')
ALTER TABLE [dbo].[Entry]  WITH CHECK ADD  CONSTRAINT [FK_Entry_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Entry] CHECK CONSTRAINT [FK_Entry_User]
GO
ALTER TABLE [dbo].[entry_hashtag]  WITH CHECK ADD  CONSTRAINT [FK_entry_hashtag_Entry] FOREIGN KEY([id_entry])
REFERENCES [dbo].[Entry] ([ID])
GO
ALTER TABLE [dbo].[entry_hashtag] CHECK CONSTRAINT [FK_entry_hashtag_Entry]
GO
ALTER TABLE [dbo].[entry_hashtag]  WITH CHECK ADD  CONSTRAINT [FK_entry_hashtag_Hashtag] FOREIGN KEY([id_hashtag])
REFERENCES [dbo].[Hashtag] ([ID])
GO
ALTER TABLE [dbo].[entry_hashtag] CHECK CONSTRAINT [FK_entry_hashtag_Hashtag]
GO
/****** Object:  StoredProcedure [dbo].[pub_AddEntry]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Andrés Malvestiti
-- Create date: 21/05/2018
-- Description: Validate user exists.
-- =============================================
CREATE PROCEDURE [dbo].[pub_AddEntry]
@NewID INT,
@Message NVARCHAR(15),
@Date DATETIME,
@UserID INT

AS
BEGIN 
SET NOCOUNT ON;

INSERT INTO [dbo].[Entry]
           ([ID]
           ,[message]
           ,[date]
           ,[id_user])
     VALUES
           (@NewID
           ,@Message
           ,@Date
           ,@UserID)
END
GO
/****** Object:  StoredProcedure [dbo].[pub_GetAllEntries]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Andrés Malvestiti
-- Create date: 21/05/2018
-- Description: Get all entries.
-- =============================================
CREATE PROCEDURE [dbo].[pub_GetAllEntries]

AS
BEGIN 
SET NOCOUNT ON;

SELECT e.ID,
	   e.[message],
	   e.[date],
	   e.id_user
FROM [Entry] e
ORDER BY e.[date] DESC;

END
GO
/****** Object:  StoredProcedure [dbo].[pub_GetEntriesByHashtagName]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Andrés Malvestiti
-- Create date: 20/05/2018
-- Description: Get entries by hashtag names.
-- =============================================
CREATE PROCEDURE [dbo].[pub_GetEntriesByHashtagName]
@HashtagName NVARCHAR(20)

AS
BEGIN 
SET NOCOUNT ON;
SELECT 
e.ID, 
e.[message], 
e.[date], 
e.id_user
FROM [Entry] e
INNER JOIN [User] u
ON e.id_user = u.ID
INNER JOIN entry_hashtag eh
ON e.ID = eh.id_entry
INNER JOIN Hashtag h
ON h.ID = eh.id_hashtag
WHERE h.[name] = @HashtagName
ORDER BY e.[date];

END
GO
/****** Object:  StoredProcedure [dbo].[pub_GetLastEntryID]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Andrés Malvestiti
-- Create date: 21/05/2018
-- Description: Get all entries.
-- =============================================
CREATE PROCEDURE [dbo].[pub_GetLastEntryID]

AS
BEGIN 
SET NOCOUNT ON;

SELECT TOP 1 e.ID
FROM [Entry] e
ORDER BY e.ID DESC;

END
GO
/****** Object:  StoredProcedure [dbo].[pub_Insert_entry_hashtag]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Andrés Malvestiti
-- Create date: 21/05/2018
-- Description: Insert entry_hashtag
-- =============================================
CREATE PROCEDURE [dbo].[pub_Insert_entry_hashtag]
@id_entry INT,
@id_hashtag INT

AS
BEGIN 

INSERT INTO [dbo].[entry_hashtag]
           ([id_entry]
           ,[id_hashtag])
     VALUES
           (@id_entry
           ,@id_hashtag)

END
GO
/****** Object:  StoredProcedure [dbo].[pub_ValidateUser]    Script Date: 22/5/2018 21:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Andrés Malvestiti
-- Create date: 21/05/2018
-- Description: Validate user exists.
-- =============================================
CREATE PROCEDURE [dbo].[pub_ValidateUser]
@User NVARCHAR(15),
@Password NVARCHAR(20)

AS
BEGIN 
SET NOCOUNT ON;

SELECT u.ID,
	   u.userName,
	   u.[password]
FROM [User] u
WHERE u.userName = @User AND u.[password] = @Password;

END
GO
USE [master]
GO
ALTER DATABASE [HashtagManager] SET  READ_WRITE 
GO
