USE [master]
GO
/****** Object:  Database [FlowerDB]    Script Date: 13.05.2024 3:53:17 ******/
CREATE DATABASE [FlowerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlowerDB', FILENAME = N'D:\Programms\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FlowerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlowerDB_log', FILENAME = N'D:\Programms\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FlowerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FlowerDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlowerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlowerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlowerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlowerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlowerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlowerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlowerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlowerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlowerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlowerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlowerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlowerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlowerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlowerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlowerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlowerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlowerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlowerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlowerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlowerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlowerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlowerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlowerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlowerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FlowerDB] SET  MULTI_USER 
GO
ALTER DATABASE [FlowerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlowerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlowerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlowerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlowerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlowerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FlowerDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FlowerDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FlowerDB]
GO
/****** Object:  Table [dbo].[Flower]    Script Date: 13.05.2024 3:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Flower] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlowerInIkebana]    Script Date: 13.05.2024 3:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowerInIkebana](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFlower] [int] NOT NULL,
	[IdIkebana] [int] NOT NULL,
 CONSTRAINT [PK_FlowerInIkebana_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[IdFlower] ASC,
	[IdIkebana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ikebana]    Script Date: 13.05.2024 3:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ikebana](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Ikebana] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IkebanaInUser]    Script Date: 13.05.2024 3:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IkebanaInUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdIkebana] [int] NOT NULL,
 CONSTRAINT [PK_IkebanaInUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[IdUser] ASC,
	[IdIkebana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13.05.2024 3:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 13.05.2024 3:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IdRole] [int] NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Flower] ON 

INSERT [dbo].[Flower] ([Id], [Name], [Description], [Image]) VALUES (1, N'Тюльпан', N'Тюльпан - это красивый, яркий и ароматный цветок. По форме разный. Например, можно встретить бокаловидные, чашевидные и овальные цветы. Разнообразие оттенков цветов тюльпана поражает воображение. Есть даже чёрные (гибридные), а всего официально выделяют 2000 сортов. Тюльпан - многолетнее травянистое растение.

', N'C:\Users\Olya\Desktop\PPNastya\Image\Flower\Тюльпан.jpeg')
INSERT [dbo].[Flower] ([Id], [Name], [Description], [Image]) VALUES (2, N'Флокс «вишневая карамель»', N'Флокс Вишневая карамель — это уникальный и очень красивый цветок, который прекрасно подойдет для оформления сада или букетов. Он имеет свои особенности в выращивании, но при правильном уходе он будет радовать своим ярким цветением на протяжении всего лета и осени.', N'C:\Users\Olya\Desktop\PPNastya\Image\Flower\Флокс.jpg')
INSERT [dbo].[Flower] ([Id], [Name], [Description], [Image]) VALUES (4, N'Мутовчатый рябчик', N'Рябчик, фритиллярия, царская корона — эти все названия относятся к одному растению, которое полюбилось владельцами приусадебных участков. Этот цветок привлекает необычным внешним видом и ранним цветением.', N'C:\Users\Olya\Desktop\PPNastya\Image\Flower\Рябчик.jpg')
SET IDENTITY_INSERT [dbo].[Flower] OFF
GO
SET IDENTITY_INSERT [dbo].[Ikebana] ON 

INSERT [dbo].[Ikebana] ([Id], [Name], [Description], [Image]) VALUES (1, N'Навстречу весне', N'Как показать переход от одного времени года к другому? В этой композиции его символизируют цветоносы декоративной капусты. Они появились на второй год на растении, которое пережило зимние холода и приготовилось дать семена. Аманда и Иванка соединили этот дар зимы с первыми весенними цветами: махровыми тюльпанами и тоненькими стебельками мутовчатого рябчика (Fritillaria verticillata).', N'C:\Users\Olya\Desktop\PPNastya\Image\Ikebana\Навстречу весне.png')
INSERT [dbo].[Ikebana] ([Id], [Name], [Description], [Image]) VALUES (3, N'Посвящение Пине Бауш', N'Флористы сгруппировали флоксы «вишневая карамель» так тесно, что за цветками невозможно разглядеть стебли. Получилась плотная масса из изящных, миниатюрных соцветий, движущихся в едином порыве.', N'C:\Users\Olya\Desktop\PPNastya\Image\Ikebana\Посвящение Пине Бауш.png')
SET IDENTITY_INSERT [dbo].[Ikebana] OFF
GO
SET IDENTITY_INSERT [dbo].[IkebanaInUser] ON 

INSERT [dbo].[IkebanaInUser] ([Id], [IdUser], [IdIkebana]) VALUES (1, 3, 1)
INSERT [dbo].[IkebanaInUser] ([Id], [IdUser], [IdIkebana]) VALUES (2, 3, 3)
SET IDENTITY_INSERT [dbo].[IkebanaInUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [IdRole], [Login], [Password]) VALUES (3, N'Админ', 1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[FlowerInIkebana]  WITH CHECK ADD  CONSTRAINT [FK_FlowerInIkebana_Flower] FOREIGN KEY([IdFlower])
REFERENCES [dbo].[Flower] ([Id])
GO
ALTER TABLE [dbo].[FlowerInIkebana] CHECK CONSTRAINT [FK_FlowerInIkebana_Flower]
GO
ALTER TABLE [dbo].[FlowerInIkebana]  WITH CHECK ADD  CONSTRAINT [FK_FlowerInIkebana_Ikebana] FOREIGN KEY([IdIkebana])
REFERENCES [dbo].[Ikebana] ([Id])
GO
ALTER TABLE [dbo].[FlowerInIkebana] CHECK CONSTRAINT [FK_FlowerInIkebana_Ikebana]
GO
ALTER TABLE [dbo].[IkebanaInUser]  WITH CHECK ADD  CONSTRAINT [FK_IkebanaInUser_Ikebana] FOREIGN KEY([IdIkebana])
REFERENCES [dbo].[Ikebana] ([Id])
GO
ALTER TABLE [dbo].[IkebanaInUser] CHECK CONSTRAINT [FK_IkebanaInUser_Ikebana]
GO
ALTER TABLE [dbo].[IkebanaInUser]  WITH CHECK ADD  CONSTRAINT [FK_IkebanaInUser_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[IkebanaInUser] CHECK CONSTRAINT [FK_IkebanaInUser_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [FlowerDB] SET  READ_WRITE 
GO
