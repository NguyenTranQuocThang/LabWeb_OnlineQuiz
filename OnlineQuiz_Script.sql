USE [master]
GO
/****** Object:  Database [OnlineQuiz]    Script Date: 4/5/2020 1:38:36 AM ******/
CREATE DATABASE [OnlineQuiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineQuiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineQuiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineQuiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineQuiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineQuiz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineQuiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineQuiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineQuiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineQuiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineQuiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineQuiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineQuiz] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineQuiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineQuiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineQuiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineQuiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineQuiz] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineQuiz', N'ON'
GO
ALTER DATABASE [OnlineQuiz] SET QUERY_STORE = OFF
GO
USE [OnlineQuiz]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/5/2020 1:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 4/5/2020 1:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](250) NOT NULL,
	[Option1] [nvarchar](50) NOT NULL,
	[Option2] [nvarchar](50) NOT NULL,
	[Option3] [nvarchar](50) NOT NULL,
	[Option4] [nvarchar](50) NOT NULL,
	[Answer] [nvarchar](50) NOT NULL,
	[DateCreated] [date] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [PassWord], [UserType], [Email]) VALUES (N'abc', N'123', N'Normal User', N'abc@gmail.com')
INSERT [dbo].[Account] ([UserName], [PassWord], [UserType], [Email]) VALUES (N'xyz', N'123', N'Teacher', N'xyz@gmail.com')
INSERT [dbo].[Account] ([UserName], [PassWord], [UserType], [Email]) VALUES (N'abd', N'1', N'Normal User', N'a@gmail.com')
INSERT [dbo].[Account] ([UserName], [PassWord], [UserType], [Email]) VALUES (N'abcde', N'123', N'Teacher', N'a@gmail.com')
INSERT [dbo].[Account] ([UserName], [PassWord], [UserType], [Email]) VALUES (N'abc123', N'1', N'Normal User', N'a@gmail.com')
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (36, N'1+1=?', N'2', N'3', N'4', N'5', N'1', CAST(N'2020-03-18' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1036, N'1+2=?', N'3', N'4', N'5', N'7', N'1', CAST(N'2020-03-21' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1043, N'6+5=?', N'11', N'10', N'15', N'20', N'1', CAST(N'2020-03-22' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1045, N'6+5=?', N'11', N'10', N'15', N'20', N'1', CAST(N'2020-03-22' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1046, N'6+5=?', N'11', N'10', N'15', N'20', N'1', CAST(N'2020-03-22' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1047, N'6+5=?', N'11', N'10', N'15', N'20', N'1', CAST(N'2020-03-22' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1048, N'6+5=?', N'11', N'10', N'15', N'20', N'1', CAST(N'2020-03-22' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1065, N'a', N'a', N'a', N'a', N'a', N'123', CAST(N'2020-03-25' AS Date))
INSERT [dbo].[Quiz] ([ID], [Question], [Option1], [Option2], [Option3], [Option4], [Answer], [DateCreated]) VALUES (1068, N'a', N'a', N'a', N'a', N'a', N'1', CAST(N'2020-03-25' AS Date))
SET IDENTITY_INSERT [dbo].[Quiz] OFF
USE [master]
GO
ALTER DATABASE [OnlineQuiz] SET  READ_WRITE 
GO
