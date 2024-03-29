/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Positions]') AND type in (N'U'))
ALTER TABLE [dbo].[Positions] DROP CONSTRAINT IF EXISTS [FK_Positions_Categories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Positions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Location]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
ALTER TABLE [dbo].[Location] DROP CONSTRAINT IF EXISTS [FK_Location_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_OpenPositions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_ApplicationStatus]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Positions]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[OpenPositions]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Location]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatus]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [JobBoard]    Script Date: 12/11/2019 8:53:55 AM ******/
DROP DATABASE IF EXISTS [JobBoard]
GO
/****** Object:  Database [JobBoard]    Script Date: 12/11/2019 8:53:55 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'JobBoard')
BEGIN
CREATE DATABASE [JobBoard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobBoard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JobBoard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobBoard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JobBoard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [JobBoard] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobBoard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobBoard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobBoard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobBoard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobBoard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobBoard] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobBoard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobBoard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobBoard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobBoard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobBoard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobBoard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobBoard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobBoard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobBoard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobBoard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobBoard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobBoard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobBoard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobBoard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobBoard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobBoard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobBoard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobBoard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JobBoard] SET  MULTI_USER 
GO
ALTER DATABASE [JobBoard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobBoard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobBoard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobBoard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobBoard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobBoard] SET QUERY_STORE = OFF
GO
USE [JobBoard]
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[OpenPositionID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ApplicationDate] [datetime] NOT NULL,
	[ManagerNotes] [varchar](2000) NULL,
	[ApplicationStatusID] [int] NOT NULL,
	[ResumeFileName] [varchar](75) NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationStatus](
	[ApplicationStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
 CONSTRAINT [PK_ApplicationStatus] PRIMARY KEY CLUSTERED 
(
	[ApplicationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDescription] [varchar](500) NOT NULL,
	[IconFileName] [varchar](75) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[ManagerID] [nvarchar](128) NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
	[Latitude] [decimal](38, 7) NOT NULL,
	[Longitude] [decimal](38, 7) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[PhotoFileName] [varchar](75) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpenPositions](
	[OpenPositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_OpenPositions] PRIMARY KEY CLUSTERED 
(
	[OpenPositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Positions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[JobDescription] [varchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PhotoFileName] [varchar](75) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/11/2019 8:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ResumeFileName] [varchar](75) NULL,
	[PhotoFileName] [varchar](75) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912031620297_InitialCreate', N'IdentitySample.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2D31E6F9C1D5F306D2FF236604BECB63012A99528AF8D60BF6C1FF249F9851475E74D976EB9BBBD5860E116C953C5E221592C16E77FBFFF77FAC37318584F384E7C4ACEECA3C9A16D61E252CF27AB333B65CBEF3ED83F7CFFE73F4D3F79E1B3F57359EF84D783962439B31F198B4E1D27711F71889249E8BB314DE8924D5C1A3AC8A3CEF1E1E13F9CA3230703840D589635FD9212E68738FB013F6794B83862290AAEA98783A4F80E25F30CD5BA41214E22E4E233FBCAC3D096BDCC511805789237B0ADF3C047A0CC1C074BDB4284508618A87AFA90E0398B2959CD23F88082FB970843BD250A125C74E1B4AEDEB73787C7BC374EDDB08472D384D17020E0D149611E476EBE9691EDCA7C60C04F99B178AF3323D6F6FB420330802CF07416C4BCF2997D5D89384FA21BCC2665C3490E791903DCAF34FE3669221E58BDDB1D54743A9E1CF2FF0EAC591AB034C66704A72C46C18175972E02DFFD09BFDCD36F989C9D1C2D96271FDEBD47DEC9FBBFE39377CD9E425FA19EF0013EDDC534C231E8869755FF6DCB11DB3972C3AA59A34D6E15E012CC0CDBBA46CF9F3159B1479833C71F6CEBD27FC65EF9A520D703F16122412316A7F0F3260D02B4087055EEB4CAE4FF6F917AFCEEFD28526FD093BFCA865E920F13278679F505075969F2E847F9F412C6FB6B51ED32A621FF2DF22B2FFD3AA769ECF2CE5063957B14AF3013B59B3A35797B519A438D4FEB1275FFA9CD3555E9ADADCA3BB4CE4C28456C7B3694FABEAEDCDE8C3B8F2218BC8C5ADC226D84D3EE571309E0C0FA175D7CA428F6260F57357B8EFAB28740AFFEC88BE1A710F9C108AB610F29E08B2CFD38C4552F3F52E01E228375BE4349028B81F74F943CB6A80E7F8EA0FA1CBB69CC59C68066AF2EEDEE91127C93860B4EFDEDC91A6D68EE7FA597C86534FE4478AB8DF13E53F71B4DD927E25D20861F985B02F29FF77ED81F601475CE5D1727C92590197B330AAE76097845D8C9F16038BE40EDDA1B9905C80FF5EE88B4947E2DABD62E89BE86E29618AAE95C9336553FD3954FFAA95A5635AB9AD7E854B5A83654550ED64FD3A2A659D1AC42A79E79ADD19CBD6C84C6F7F632D8FD77F736DBBC4D6B41C38C735821F18F98E0189631EF0E318663528F409F756317CE42367C5CE8ABEF4D99A49F51908E2D6AADD9902D02E3CF860C76FF6743A6267C7EF23DEE95F43803959501BE577DFDF1AA7BCE499A6D7B3A08DDDCB6F0EDAC01A6E9729E24D4F5B359A0897E15B10B517FF0E1ACEE4046DE1B3918021D03A2FB7CCB832FD0375B26D52DB9C00166D83A77F3E8E00C252EF254334287BC018A953BAA46B13A28222AF7374526301DC7BC11E287A00466AA4F983A2D7CE2FA110A3AAD24B5ECB985F1BE5732E4920B1C61C205765AA28F707D0C842B50C99106A5CB4253A7C1B876221ABC56D39877B9B0F5B82BA189AD70B2C37736F0B2F0DF5E8598ED16DB0239DB4DD24701633C6F17042DCE2A7D09201F5CF68DA0D289C940D0C2A5DA0A41458BED80A0A249DE1C41F3236ADFF197CEABFB464FF1A0BCFD6DBDD55C3BE0A6608F3DA366EE7B421B062D70ACD2F362C10BF133D31CCE40CFE27C9614AEAE4C91ECF20033316453FBBB5A3FD469079149D4065813AD03B4B809548094093540B93296D7AA5DE1450C802DE36EADB0C5DA2FC13638A062376F441B15CDF7A632397B9D3EAA9E556C5048DEEBB0D0C0D110425EBCC48EF7308A292EAB1AA68F2F3CC41B6E74AC188C16037578AE0623959D19DD4A2535BBADA473C886B8641B5949729F0C562A3B33BA950A8E761B49E3140C700B363291B8858F34D9CA4847B5DB54655327CF952A3E4C1D4352D5F41A45914F568D24ABE28B35CF33AC66DFCD87E71D853986E3269AF4A34ADB4A12A3315A61A9144483A6977E9CB00BC4D002F138CFCC0B956ADABDD5B0FC97229BDBA73A88E53E50D6E67F8B6BBB787F2F6CB7AA3F52C05C422743EED46491740D05F4CD2D9EF78602146B82F7331AA42131FB58E6D6F9155EB37DFE4545983A92FE8A0FA5184CF17445EBF71A1B755E8C374E9517B3FE5899214C162F7DD0A6CD4D7EA919A50C5335514CA1AB9D8D9DC99D193A5EB2B3387CB83A115E677615192A4D80E2D3408C46928302D628EB8F2AE6A13431C592FE8852B24913522A1AA06533A54450B259B0169EC1A2FA1AFD25A849244D74B5B43FB2269DA409AD295E035BA3B35CD61F559371D204D614F7C7AED34FE475748FF72FE31166930D2C3FE86EB68319305E67511C67036CDCE737811A9F07621537F60A58F17D2F09653CED6D42A83CC4B119A10C18E6F547B80C17979FD61B7C33A670C32D2CF16D37FC66BC61B47D557228E73DB94A25BD3AF749E7BB6971D6EA7E59A31CBEF22AB6559A11B6F79784E170C22B4CE6BF04B3C0C77C312F2B5C23E22F71C2F2AC0EFBF8F0E8587A99B33FAF649C24F102CD59D5F454461CB32D2468912714BB8F2856D32536784952832A91E82BE2E1E733FB3F59ABD32CA8C1FFCA3E1F5857C903F17F49A1E03E4EB1F59B9AFE394E667D8FB71C95A2BFBD894712FD4D7EF5EFAF79D303EB3686E9746A1D4A865E67F8C5A71383B4C99B6EA0CDDA0F2ADEEE6C139E2A6851A5D9B2FECB8485CF467995506AF997103DFF75A86ADA97071B216A5E178C85378A094DAF07D6C132BE1CF0E027CB5E0E0CEBACFE25C13AAA195F11F8643898FC86A0FF3254B6DCE13EA439336D6349CAECDC9983BD5142E6AEF72625557BA389AEA6630F801B35E57A3317E58DA5328FB6756A329547C3DE25EF5F3D3D795F32926BA77DB789C8DBCC3D6EB959FA43A51CEF41929C26E967F789C5DBE69A2908BCE7D999C3D287F78C6CC536BFFB24E16D93CD1420DE73B20D4A05DE33AEED6AFFDC31D37A6FA13B4FEC5573940C9739BA287257E26E1E7287E3FF820209728F327F6FA9CF143309ABC962145857310B35A7A8C9829589A3C8556AB48B1DD6D762C36FED6C51A75DAC21B1B34D76B1FEB7CA2EEAB4CB36A44BEE22E5589BB0A84B03EF58C7DAF2A8DE528AB1D0938E8CF62E9FB5F566FE2D65148F621461F6186E97DF4E02F128261973EA0C4818562F8A61EF6CFC438DB07F27FEAA86E0FF6C23C1AEB06B5675AEC892969BB7A45159458AD05C63863CD852CF63E62F91CBA09807A0B307E359508F5F832CB077456E5316A50CBA8CC3452004BCB813D0263FCB8A16759EDE46FC57324617404D9F07EE6FC9C7D40FBC4AEF4B4D4CC800C1BD8B22DCCBC792F1B0EFEAA542BAA1A4275061BECA29BAC761140058724BE6E809AFA31BD0EF335E21F7A58E009A40BA074234FBF4C247AB1885498151B7879FC0612F7CFEFEFF871BC4DDAF540000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationID], [OpenPositionID], [UserID], [ApplicationDate], [ManagerNotes], [ApplicationStatusID], [ResumeFileName]) VALUES (1, 1, N'cbe0a15f-7f3f-4c9b-b30c-735c689a8ad2', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'', 1, N'/Content/Uploaded/resume/ef6fb753-1432-4f54-aac1-ec69904b2924.pdf')
INSERT [dbo].[Applications] ([ApplicationID], [OpenPositionID], [UserID], [ApplicationDate], [ManagerNotes], [ApplicationStatusID], [ResumeFileName]) VALUES (3, 1, N'd19d9d51-32fa-49f6-a859-6b56ee11793f', CAST(N'2019-12-06T09:23:56.187' AS DateTime), N'hi there', 1, NULL)
SET IDENTITY_INSERT [dbo].[Applications] OFF
SET IDENTITY_INSERT [dbo].[ApplicationStatus] ON 

INSERT [dbo].[ApplicationStatus] ([ApplicationStatusID], [StatusName], [StatusDescription]) VALUES (1, N'Pending', N'Pending')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusID], [StatusName], [StatusDescription]) VALUES (2, N'Rejected', N'Rejected')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusID], [StatusName], [StatusDescription]) VALUES (3, N'Accepted', N'Accepted')
SET IDENTITY_INSERT [dbo].[ApplicationStatus] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c417a10c-6c67-4719-9460-dd4590b0c297', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ece9dd37-09ad-45d2-9081-03026203bf33', N'Employees')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'093e18f0-4797-4d18-9552-e43a8ea6b019', N'Managers')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'499773ec-1006-4ff9-9ed6-44a5eda6f82f', N'093e18f0-4797-4d18-9552-e43a8ea6b019')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e48b187e-cd60-4e6a-9407-41a47fa41085', N'093e18f0-4797-4d18-9552-e43a8ea6b019')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cbe0a15f-7f3f-4c9b-b30c-735c689a8ad2', N'c417a10c-6c67-4719-9460-dd4590b0c297')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9dc0ff45-f875-499e-b46b-14fc501653c4', N'ece9dd37-09ad-45d2-9081-03026203bf33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd19d9d51-32fa-49f6-a859-6b56ee11793f', N'ece9dd37-09ad-45d2-9081-03026203bf33')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'499773ec-1006-4ff9-9ed6-44a5eda6f82f', N'manager2@test.com', 0, N'AGil10SUYIBuvwEf1QzLzNVUswL1X1Z0FN5wqZDAqgNLW2xQYy/6aNHzuNCy+MzIYQ==', N'8aba3fc3-157f-4ca9-a408-745c94d0e1e6', NULL, 0, 0, NULL, 1, 0, N'manager2@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9dc0ff45-f875-499e-b46b-14fc501653c4', N'employee2@test.com', 0, N'AGNEisQP2EsLovKvOBU4UCR7cLtM7E9Yd2TY+JDEw73aEglygOTL520AA3CjcaZxXQ==', N'877d4a84-d4da-4a5c-870e-37048096e52b', NULL, 0, 0, NULL, 1, 0, N'employee2@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cbe0a15f-7f3f-4c9b-b30c-735c689a8ad2', N'admin@example.com', 0, N'AHEjK75KwqNbFf7Q1c4TUQvx1ghRusx0cPh/r1dr8db0YeeYmzJmekqYwZamXbb7oQ==', N'e1bd73be-ed8a-4464-8996-4f694199f0b2', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd19d9d51-32fa-49f6-a859-6b56ee11793f', N'employee@test.com', 0, N'AMa4fmQEzhjJnms5Nkh21OtcMDtPLMPSWOvpcMqst864SASZ5qfY8RGxcXa8jCNzXQ==', N'04662dbc-46e4-4d00-8c24-d596287ce6aa', NULL, 0, 0, NULL, 1, 0, N'employee@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e48b187e-cd60-4e6a-9407-41a47fa41085', N'manager@test.com', 0, N'ANwPWAHnQUK3I3unW9iD22aGIOhn5NivSIP/JpunosR1zBtY8NkqbwmIK+JCcJqtGA==', N'aef607b2-1a2d-4ad9-b00b-7834add3039f', NULL, 0, 0, NULL, 1, 0, N'manager@test.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [IconFileName]) VALUES (1, N'Accounting', N'Accounting', N'/Content/Uploaded/img/43532d32-4d8f-43d0-904d-decd1312f066.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [IconFileName]) VALUES (2, N'Software Development', N'Create computer Programs.', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [IconFileName]) VALUES (3, N'Information Technology', N'Setup and maintain electronic equipment. ', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [IconFileName]) VALUES (4, N'Graphic & UI/UX Design', N'Make things that look nice.', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [IconFileName]) VALUES (5, N'Human Resources', N'Manage people.', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [IconFileName]) VALUES (6, N'Test Subjet', N'Help advance science.', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [IconFileName]) VALUES (7, N'Research and Development', N'Make science happen.  ', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [ManagerID], [LocationName], [Latitude], [Longitude], [Address], [PhotoFileName]) VALUES (0, N'e48b187e-cd60-4e6a-9407-41a47fa41085', N'Centriq', CAST(38.9600000 AS Decimal(38, 7)), CAST(-94.6100000 AS Decimal(38, 7)), N'1740 W 92 St, Kansas City, MO 64114', N'/Content/Uploaded/img/1c91c458-e4b8-4ae3-a8ea-afead4669166.jpg')
INSERT [dbo].[Location] ([LocationID], [ManagerID], [LocationName], [Latitude], [Longitude], [Address], [PhotoFileName]) VALUES (5, N'499773ec-1006-4ff9-9ed6-44a5eda6f82f', N'Valve', CAST(47.6139980 AS Decimal(38, 7)), CAST(-122.1949990 AS Decimal(38, 7)), N'10900 NE 4th street, 500 Bellevue, WA 98004', NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[OpenPositions] ON 

INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (1, 1, 0)
INSERT [dbo].[OpenPositions] ([OpenPositionID], [PositionID], [LocationID]) VALUES (2, 1, 5)
SET IDENTITY_INSERT [dbo].[OpenPositions] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription], [CategoryID], [PhotoFileName]) VALUES (1, N'Programmer', N'create programs ', 2, NULL)
INSERT [dbo].[Positions] ([PositionID], [Title], [JobDescription], [CategoryID], [PhotoFileName]) VALUES (6, N'Accountant ', N'Manage finances.', 1, NULL)
SET IDENTITY_INSERT [dbo].[Positions] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [PhotoFileName]) VALUES (N'499773ec-1006-4ff9-9ed6-44a5eda6f82f', N'gabe ', N'newell', NULL, NULL)
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [PhotoFileName]) VALUES (N'cbe0a15f-7f3f-4c9b-b30c-735c689a8ad2', N'Bruce', N'Smith', N'/Content/Uploaded/resume/ef6fb753-1432-4f54-aac1-ec69904b2924.pdf', N'/Content/Uploaded/img/2d6ddbc2-06a2-478c-b173-4f18102370ef.png')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [PhotoFileName]) VALUES (N'd19d9d51-32fa-49f6-a859-6b56ee11793f', N'joe', N'joe', NULL, NULL)
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [ResumeFileName], [PhotoFileName]) VALUES (N'e48b187e-cd60-4e6a-9407-41a47fa41085', N'bob', N'smith', NULL, NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/11/2019 8:53:55 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2019 8:53:55 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2019 8:53:55 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/11/2019 8:53:55 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/11/2019 8:53:55 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/11/2019 8:53:55 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStatus] FOREIGN KEY([ApplicationStatusID])
REFERENCES [dbo].[ApplicationStatus] ([ApplicationStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenPositions] FOREIGN KEY([OpenPositionID])
REFERENCES [dbo].[OpenPositions] ([OpenPositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenPositions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenPositions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_UserDetails] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Location]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Positions] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenPositions_Positions]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenPositions]'))
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Positions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Positions_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Positions]'))
ALTER TABLE [dbo].[Positions]  WITH CHECK ADD  CONSTRAINT [FK_Positions_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Positions_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Positions]'))
ALTER TABLE [dbo].[Positions] CHECK CONSTRAINT [FK_Positions_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
ALTER DATABASE [JobBoard] SET  READ_WRITE 
GO
