USE [master]
GO
/****** Object:  Database [web_person_creditcard_tracker]    Script Date: 4/4/2021 2:10:20 PM ******/
CREATE DATABASE [web_person_creditcard_tracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hb_person_creditcard_traker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\hb_person_creditcard_traker.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'hb_person_creditcard_traker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\hb_person_creditcard_traker_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [web_person_creditcard_tracker] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [web_person_creditcard_tracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [web_person_creditcard_tracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET RECOVERY FULL 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET  MULTI_USER 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [web_person_creditcard_tracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [web_person_creditcard_tracker] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'web_person_creditcard_tracker', N'ON'
GO
USE [web_person_creditcard_tracker]
GO
/****** Object:  User [springstudent]    Script Date: 4/4/2021 2:10:20 PM ******/
CREATE USER [springstudent] FOR LOGIN [springstudent] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [springstudent]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [springstudent]
GO
ALTER ROLE [db_datareader] ADD MEMBER [springstudent]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [springstudent]
GO
/****** Object:  Table [dbo].[Credit_Card]    Script Date: 4/4/2021 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credit_Card](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](255) NULL,
	[type] [varchar](255) NULL,
	[person_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/4/2021 2:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[money] [float] NULL,
 CONSTRAINT [PK__Person__3213E83FD9055FE1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Credit_Card] ON 

INSERT [dbo].[Credit_Card] ([id], [number], [type], [person_id]) VALUES (1, N'123456111', N'VisaDebit', 1)
INSERT [dbo].[Credit_Card] ([id], [number], [type], [person_id]) VALUES (3, N'88888', N'Master Card', 1)
INSERT [dbo].[Credit_Card] ([id], [number], [type], [person_id]) VALUES (4, N'123456', N'Viettin Visa card', 1)
INSERT [dbo].[Credit_Card] ([id], [number], [type], [person_id]) VALUES (5, N'123456', N'VisaDebit', 3)
INSERT [dbo].[Credit_Card] ([id], [number], [type], [person_id]) VALUES (6, N'123456', N'VisaDebit', 1004)
SET IDENTITY_INSERT [dbo].[Credit_Card] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([id], [first_name], [last_name], [money]) VALUES (1, N'Pham', N'Quang', 1)
INSERT [dbo].[Person] ([id], [first_name], [last_name], [money]) VALUES (2, N'Minh 1', N'Quang', 111)
INSERT [dbo].[Person] ([id], [first_name], [last_name], [money]) VALUES (3, N'Pham', N'Quang', 0)
INSERT [dbo].[Person] ([id], [first_name], [last_name], [money]) VALUES (1004, N'Tuấn', N'Trần', 666666)
SET IDENTITY_INSERT [dbo].[Person] OFF
ALTER TABLE [dbo].[Credit_Card]  WITH CHECK ADD  CONSTRAINT [FK61kx9l7mu2tcdrs6opvn8o0qm] FOREIGN KEY([person_id])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Credit_Card] CHECK CONSTRAINT [FK61kx9l7mu2tcdrs6opvn8o0qm]
GO
USE [master]
GO
ALTER DATABASE [web_person_creditcard_tracker] SET  READ_WRITE 
GO
