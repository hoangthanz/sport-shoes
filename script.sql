USE [master]
GO
/****** Object:  Database [SportShoesDb]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE DATABASE [SportShoesDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportShoesDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.THANHOANGSERVER\MSSQL\DATA\SportShoesDb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SportShoesDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.THANHOANGSERVER\MSSQL\DATA\SportShoesDb_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SportShoesDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportShoesDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportShoesDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportShoesDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportShoesDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportShoesDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportShoesDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportShoesDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SportShoesDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportShoesDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportShoesDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportShoesDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportShoesDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportShoesDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportShoesDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportShoesDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportShoesDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportShoesDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportShoesDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportShoesDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportShoesDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportShoesDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportShoesDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SportShoesDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportShoesDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportShoesDb] SET  MULTI_USER 
GO
ALTER DATABASE [SportShoesDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportShoesDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportShoesDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportShoesDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SportShoesDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SportShoesDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/15/2021 4:56:02 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Announcements]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcements](
	[Id] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](250) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Announcements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AnnouncementUsers]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnouncementUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnnouncementId] [nvarchar](450) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[HasRead] [bit] NULL,
 CONSTRAINT [PK_AnnouncementUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppConfigs]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConfigs](
	[Key] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AppConfigs] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppRoleClaims]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppRoles]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AppRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUserClaims]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUserLogins]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserLogins](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUserRoles]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AppUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[RefRegisterLink] [nvarchar](max) NULL,
	[NickName] [nvarchar](max) NOT NULL,
	[TransactionPassword] [nvarchar](max) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[WalletId] [nvarchar](max) NULL,
	[RootUserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUserTokens]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankCards]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankCards](
	[Id] [nvarchar](450) NOT NULL,
	[BankName] [nvarchar](max) NOT NULL,
	[BankBranch] [nvarchar](max) NOT NULL,
	[FullNameOwner] [nvarchar](max) NULL,
	[BankAccountNumber] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BankCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brands]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [nvarchar](450) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[AppUserId] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[Id] [nvarchar](450) NOT NULL,
	[CartId] [nvarchar](450) NULL,
	[Quantity] [int] NOT NULL,
	[Color] [nvarchar](max) NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[ProductId] [nvarchar](450) NULL,
 CONSTRAINT [PK_CartDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Carts]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [nvarchar](450) NOT NULL,
	[AppUserId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Website] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Other] [nvarchar](max) NULL,
	[Lat] [float] NULL,
	[Lng] [float] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[Message] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[Resources] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [nvarchar](450) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AppUserId] [uniqueidentifier] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OperationHistories]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationHistories](
	[Id] [nvarchar](450) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_OperationHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [nvarchar](450) NOT NULL,
	[OrderId] [nvarchar](450) NULL,
	[ProductId] [nvarchar](450) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [nvarchar](450) NOT NULL,
	[OrderDate] [datetime2](7) NULL,
	[BuyerId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AppUserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OwnerBanks]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnerBanks](
	[Id] [uniqueidentifier] NOT NULL,
	[FullNameOwner] [nvarchar](max) NULL,
	[Branch] [nvarchar](max) NULL,
	[AccountNumber] [nvarchar](max) NULL,
	[BankName] [nvarchar](max) NULL,
 CONSTRAINT [PK_OwnerBanks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [nvarchar](450) NOT NULL,
	[FunctionId] [nvarchar](450) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NULL,
	[AppUserId] [uniqueidentifier] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageFile] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[UnitsInStock] [int] NULL,
	[Star] [float] NOT NULL,
	[BrandId] [nvarchar](450) NULL,
	[ProductCategoryId] [nvarchar](450) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductWishlists]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWishlists](
	[Id] [nvarchar](450) NOT NULL,
	[ProductId] [nvarchar](450) NULL,
	[WishlistId] [nvarchar](450) NULL,
 CONSTRAINT [PK_ProductWishlists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[FromDate] [datetime2](7) NOT NULL,
	[ToDate] [datetime2](7) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[EMail] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[Star] [float] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
	[ProductId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionHistories]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistories](
	[Id] [nvarchar](450) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[TransactionHistoryType] [int] NOT NULL,
	[BillStatus] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
	[Coin] [float] NOT NULL,
	[BankCardId] [nvarchar](max) NULL,
	[OwnerBankId] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactionHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [nvarchar](450) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[BillStatus] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
	[Coin] [float] NOT NULL,
	[BankCardId] [nvarchar](max) NULL,
	[OwnerBankId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wallets]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[Id] [nvarchar](450) NOT NULL,
	[WalletId] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[AppUserId] [uniqueidentifier] NULL,
	[Coin] [float] NOT NULL,
	[PromotionCoin] [float] NOT NULL,
	[PendingCoin] [float] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wishlists]    Script Date: 4/15/2021 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlists](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AppUserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Wishlists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210415080159_initialize', N'3.1.3')
INSERT [dbo].[AppUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [DateOfBirth], [RefRegisterLink], [NickName], [TransactionPassword], [Avatar], [WalletId], [RootUserId]) VALUES (N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', N'admin', N'ADMIN', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELZ4eu3kNbjd2JmhMfAECO16sfrIjpkMZY9GkpvGImXaETZAmnnzjm7yVKCuFlyKYA==', N'5OEO7VVO54HKVLNYJHKAWCPR3VA4ALUI', N'b064bd10-efad-467b-b31b-057432a88369', N'0900000000', 0, 0, NULL, 1, 0, N'Admin', N'Lottery', CAST(N'2021-04-15 15:06:08.7384073' AS DateTime2), N'', N'Adminstrator', N'123456', N'', N'JKUMYATWVH', NULL)
INSERT [dbo].[Brands] ([Id], [UserId], [AppUserId], [Name], [DateCreated], [DateModified], [Status]) VALUES (N'05f59a59-14bb-42ff-a43a-ceebfb67992d', NULL, NULL, N'Adidas', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Brands] ([Id], [UserId], [AppUserId], [Name], [DateCreated], [DateModified], [Status]) VALUES (N'096e2066-2115-45aa-9888-1598a52d83b5', NULL, NULL, N'Puma', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Brands] ([Id], [UserId], [AppUserId], [Name], [DateCreated], [DateModified], [Status]) VALUES (N'71b6d7f6-7972-4b84-bac1-003888e32e20', NULL, NULL, N'Nike', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'02b4c1f3-4a4a-44b9-a7a7-d6bd2f01b934', N'', N'Account.Write', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'14e29ef4-e089-4ff7-aa43-60b14d98f1b3', N'', N'Transaction.Delete', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'35ee53ea-a9dd-458d-9490-a5eeeb67c6d3', N'', N'Account.Delete', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'5715376b-2717-4e4d-af26-4b03e18071dc', N'Điều chỉnh tài khoản', N'Admin', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'59347b87-c04c-4f32-8085-6360be1013e1', N'', N'Transaction.Read', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'71574af5-0e07-41f9-9ccb-1f99b7c13117', N'', N'ProfitPercent.Write', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'8c7c1086-d3a7-46ca-bd18-4c4b3523de11', N'', N'Player', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'95521bf3-b276-4fe5-a588-cf57f66056ae', N'Quyền Admin', N'ExportXLS', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'bca956b8-d9ce-4d61-be46-d5fd06f8a5bb', N'', N'Transaction.Write', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'ce72999c-34a2-4090-b609-5d345bbb78bf', N'', N'ProfitPercent.Read', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'f93f1572-9ab8-42a9-a54a-573c4f5ca523', N'', N'ProfitPercent.Delete', 1)
INSERT [dbo].[Functions] ([Id], [Name], [Code], [Status]) VALUES (N'fa2aa2f3-fba8-4a63-93d1-4c55ffaecb1b', N'', N'Account.Read', 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'5aad841a-e7d5-46b9-a3c5-ae627c88372a', N'707e28fc-166a-4d2d-a27b-16388466f73e', NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'5ccf4f94-a3bf-4f72-9528-ca7b5106c82a', N'776e8337-fe98-4b07-97fe-85b08bc04f80', NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'6df72224-6a0d-4447-80c1-9f228b4f9657', N'cc0f060f-de8c-41aa-a8ce-ebb0dc2d1d91', NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'77de1e7d-af3e-4138-9e44-cbb88df8fd72', N'776e8337-fe98-4b07-97fe-85b08bc04f80', NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'c483247c-f391-4018-b836-526dac3cc479', N'5e331089-06a3-42db-bb4f-df230bfe15ec', NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'e0fe1245-692b-4351-9707-c65c2aed4096', N'cc0f060f-de8c-41aa-a8ce-ebb0dc2d1d91', NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'e339c023-5a92-4ae8-a67d-88fe954346bf', N'707e28fc-166a-4d2d-a27b-16388466f73e', NULL, 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerId], [DateCreated], [DateModified], [Status], [UserId], [AppUserId]) VALUES (N'5e331089-06a3-42db-bb4f-df230bfe15ec', NULL, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', NULL)
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerId], [DateCreated], [DateModified], [Status], [UserId], [AppUserId]) VALUES (N'707e28fc-166a-4d2d-a27b-16388466f73e', NULL, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', NULL)
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerId], [DateCreated], [DateModified], [Status], [UserId], [AppUserId]) VALUES (N'776e8337-fe98-4b07-97fe-85b08bc04f80', NULL, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', NULL)
INSERT [dbo].[Orders] ([Id], [OrderDate], [BuyerId], [DateCreated], [DateModified], [Status], [UserId], [AppUserId]) VALUES (N'cc0f060f-de8c-41aa-a8ce-ebb0dc2d1d91', NULL, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1, N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', NULL)
INSERT [dbo].[OwnerBanks] ([Id], [FullNameOwner], [Branch], [AccountNumber], [BankName]) VALUES (N'7ebb6d64-4906-49be-02c8-08d8ffe55510', N'Adminstrator', N'Chi nhánh VN', N'xxxx xxxx xxxx xxxx', N'Ngân hàng ABC')
INSERT [dbo].[OwnerBanks] ([Id], [FullNameOwner], [Branch], [AccountNumber], [BankName]) VALUES (N'2d009232-245e-4570-02c9-08d8ffe55510', N'Adminstrator', N'Chi nhánh VN', N'xxxx xxxx xxxx xxxx', N'Ngân hàng ABC 1')
INSERT [dbo].[OwnerBanks] ([Id], [FullNameOwner], [Branch], [AccountNumber], [BankName]) VALUES (N'b5432aed-8aea-4fa1-02ca-08d8ffe55510', N'Adminstrator', N'Chi nhánh VN', N'xxxx xxxx xxxx xxxx', N'Ngân hàng ABC 2')
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'1e342cdb-9a6e-4441-bc50-ee0a3a299ec3', N'59347b87-c04c-4f32-8085-6360be1013e1', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232050' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'36679bb9-3b93-433f-abe2-ee0500fbcc42', N'14e29ef4-e089-4ff7-aa43-60b14d98f1b3', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232025' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'36cbc76b-1ba0-472d-9e82-87c5228343a4', N'bca956b8-d9ce-4d61-be46-d5fd06f8a5bb', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232089' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'37b6b114-f0db-4047-b8dc-6908f9d1e664', N'fa2aa2f3-fba8-4a63-93d1-4c55ffaecb1b', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232104' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'3f43b9f9-4f9f-4f07-bceb-63a528e898cb', N'8c7c1086-d3a7-46ca-bd18-4c4b3523de11', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232062' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'518ec045-0161-400d-8f6a-e1f693be0ed3', N'35ee53ea-a9dd-458d-9490-a5eeeb67c6d3', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232040' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'615b88a7-f40c-4a64-896c-5af5d9079aad', N'02b4c1f3-4a4a-44b9-a7a7-d6bd2f01b934', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6227367' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'6832cfc0-6cb6-49da-a6a3-f2bae48e7ca3', N'f93f1572-9ab8-42a9-a54a-573c4f5ca523', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232100' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'77b60c2a-5562-4a6e-8eeb-82fbc4bdbf11', N'5715376b-2717-4e4d-af26-4b03e18071dc', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232046' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'941c793d-28ef-4640-a257-66797a57ae70', N'ce72999c-34a2-4090-b609-5d345bbb78bf', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232096' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'bf743898-4b2d-4624-ad47-1e706eb9731c', N'71574af5-0e07-41f9-9ccb-1f99b7c13117', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232057' AS DateTime2), NULL, 1)
INSERT [dbo].[Permissions] ([Id], [FunctionId], [UserId], [DateCreated], [DateModified], [Status]) VALUES (N'dfc5c620-806d-4416-acb2-16ec7b6d3ff5', N'95521bf3-b276-4fe5-a588-cf57f66056ae', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', CAST(N'2021-04-15 15:11:17.6232085' AS DateTime2), NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [UserId], [AppUserId], [DateCreated], [DateModified], [Status]) VALUES (N'27df2612-b67f-48df-8506-21482787d605', N'Giày Nike', NULL, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [UserId], [AppUserId], [DateCreated], [DateModified], [Status]) VALUES (N'3761dbe4-1e5c-446a-b497-2cfdc68ac3f4', N'Giày Puma', NULL, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [UserId], [AppUserId], [DateCreated], [DateModified], [Status]) VALUES (N'396a9a02-1781-4d0d-8d58-63e51eef3319', N'Áo thun', NULL, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [UserId], [AppUserId], [DateCreated], [DateModified], [Status]) VALUES (N'4806bd85-49ea-4304-b8f0-83bb2e56a27b', N'Băng trán', NULL, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [UserId], [AppUserId], [DateCreated], [DateModified], [Status]) VALUES (N'9de3e65a-05e9-4ab3-a779-2987eb47c577', N'Băng đeo tay', NULL, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [UserId], [AppUserId], [DateCreated], [DateModified], [Status]) VALUES (N'c243a3b7-de5c-4a38-99e6-f989c55900a9', N'Giày Adidas', NULL, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [Name], [UserId], [AppUserId], [DateCreated], [DateModified], [Status]) VALUES (N'cf75e70f-2d2f-45e3-b89b-d4070f402f36', N'Túi xách', NULL, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'2ceb02d4-1ea4-4b37-91c4-9eafd1239d64', N'Sản phẩm 11', NULL, N'', NULL, N'images/11.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'3bc22ed9-f35d-4489-85ce-264ea4853bcf', N'Sản phẩm 10', NULL, N'', NULL, N'images/10.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'67c297b1-989e-4f40-8863-1c5ab6128931', N'Sản phẩm 4', NULL, N'', NULL, N'images/4.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'705619a1-1e41-4ee1-ad20-bbd1199fba34', N'Sản phẩm 9', NULL, N'', NULL, N'images/9.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'a8323147-47a9-43bb-958a-1e4baec38f41', N'Sản phẩm 1', NULL, N'', NULL, N'images/1.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'b1b42392-6920-4cdf-b2ea-83a5b253107f', N'Sản phẩm 7', NULL, N'', NULL, N'images/7.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'b9a845c5-1a3b-4449-8c05-b331ae03e995', N'Sản phẩm 6', NULL, N'', NULL, N'images/6.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'de7ae839-4049-457d-b64d-16046fcf7996', N'Sản phẩm 2', NULL, N'', NULL, N'images/2.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'e802d53b-a11b-46c2-8639-2f8d00cffb39', N'Sản phẩm 5', NULL, N'', NULL, N'images/5.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'e961fe3b-0d68-4dad-9e52-a5c4311dc891', N'Sản phẩm 3', NULL, N'', NULL, N'images/3.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Summary], [Description], [ImageFile], [Price], [UnitsInStock], [Star], [BrandId], [ProductCategoryId], [DateCreated], [DateModified], [Status]) VALUES (N'f6f0614d-15dc-4794-a1e1-c9f012887b98', N'Sản phẩm 8', NULL, N'', NULL, N'images/8.jpg', CAST(100000.00 AS Decimal(18, 2)), 10, 5, N'05f59a59-14bb-42ff-a43a-ceebfb67992d', N'27df2612-b67f-48df-8506-21482787d605', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Wallets] ([Id], [WalletId], [UserId], [AppUserId], [Coin], [PromotionCoin], [PendingCoin], [DateCreated], [DateModified], [Status]) VALUES (N'a39c8c34-a75d-449a-acf2-430d7bb22c39', N'JKUMYATWVH', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', NULL, 999999999, 0, 0, CAST(N'2021-04-15 15:06:11.2193255' AS DateTime2), CAST(N'2021-04-15 15:06:11.2193282' AS DateTime2), 1)
INSERT [dbo].[Wishlists] ([Id], [UserName], [UserId], [AppUserId]) VALUES (N'6040deb8-b4bf-4147-9b4b-7b208d08faf8', N'admin', N'0e3a75cc-ed78-4b5c-1303-08d8ffe553b5', NULL)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AnnouncementUsers_AnnouncementId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnnouncementUsers_AnnouncementId] ON [dbo].[AnnouncementUsers]
(
	[AnnouncementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnnouncementUsers_UserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnnouncementUsers_UserId] ON [dbo].[AnnouncementUsers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUsers_RootUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AppUsers_RootUserId] ON [dbo].[AppUsers]
(
	[RootUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankCards_UserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_BankCards_UserId] ON [dbo].[BankCards]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Brands_AppUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Brands_AppUserId] ON [dbo].[Brands]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CartDetails_CartId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartDetails_CartId] ON [dbo].[CartDetails]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CartDetails_ProductId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartDetails_ProductId] ON [dbo].[CartDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_AppUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_AppUserId] ON [dbo].[Carts]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Messages_AppUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_AppUserId] ON [dbo].[Messages]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_AppUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_AppUserId] ON [dbo].[Orders]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_BuyerId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_BuyerId] ON [dbo].[Orders]
(
	[BuyerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Permissions_FunctionId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_FunctionId] ON [dbo].[Permissions]
(
	[FunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permissions_UserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_UserId] ON [dbo].[Permissions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductCategories_AppUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductCategories_AppUserId] ON [dbo].[ProductCategories]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Products_ProductCategoryId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductCategoryId] ON [dbo].[Products]
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ProductWishlists_ProductId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductWishlists_ProductId] ON [dbo].[ProductWishlists]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ProductWishlists_WishlistId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductWishlists_WishlistId] ON [dbo].[ProductWishlists]
(
	[WishlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Reviews_ProductId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_ProductId] ON [dbo].[Reviews]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Wallets_AppUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Wallets_AppUserId] ON [dbo].[Wallets]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Wishlists_AppUserId]    Script Date: 4/15/2021 4:56:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Wishlists_AppUserId] ON [dbo].[Wishlists]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnnouncementUsers]  WITH CHECK ADD  CONSTRAINT [FK_AnnouncementUsers_Announcements_AnnouncementId] FOREIGN KEY([AnnouncementId])
REFERENCES [dbo].[Announcements] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnnouncementUsers] CHECK CONSTRAINT [FK_AnnouncementUsers_Announcements_AnnouncementId]
GO
ALTER TABLE [dbo].[AnnouncementUsers]  WITH CHECK ADD  CONSTRAINT [FK_AnnouncementUsers_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnnouncementUsers] CHECK CONSTRAINT [FK_AnnouncementUsers_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AppUsers]  WITH CHECK ADD  CONSTRAINT [FK_AppUsers_AppUsers_RootUserId] FOREIGN KEY([RootUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[AppUsers] CHECK CONSTRAINT [FK_AppUsers_AppUsers_RootUserId]
GO
ALTER TABLE [dbo].[BankCards]  WITH CHECK ADD  CONSTRAINT [FK_BankCards_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BankCards] CHECK CONSTRAINT [FK_BankCards_AppUsers_UserId]
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD  CONSTRAINT [FK_Brands_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Brands] CHECK CONSTRAINT [FK_Brands_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Carts_CartId]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AppUsers_BuyerId] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AppUsers_BuyerId]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_AppUsers_UserId]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Functions_FunctionId] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Functions_FunctionId]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories_ProductCategoryId]
GO
ALTER TABLE [dbo].[ProductWishlists]  WITH CHECK ADD  CONSTRAINT [FK_ProductWishlists_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductWishlists] CHECK CONSTRAINT [FK_ProductWishlists_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductWishlists]  WITH CHECK ADD  CONSTRAINT [FK_ProductWishlists_Wishlists_WishlistId] FOREIGN KEY([WishlistId])
REFERENCES [dbo].[Wishlists] ([Id])
GO
ALTER TABLE [dbo].[ProductWishlists] CHECK CONSTRAINT [FK_ProductWishlists_Wishlists_WishlistId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products_ProductId]
GO
ALTER TABLE [dbo].[Wallets]  WITH CHECK ADD  CONSTRAINT [FK_Wallets_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Wallets] CHECK CONSTRAINT [FK_Wallets_AppUsers_AppUserId]
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD  CONSTRAINT [FK_Wishlists_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
GO
ALTER TABLE [dbo].[Wishlists] CHECK CONSTRAINT [FK_Wishlists_AppUsers_AppUserId]
GO
USE [master]
GO
ALTER DATABASE [SportShoesDb] SET  READ_WRITE 
GO
