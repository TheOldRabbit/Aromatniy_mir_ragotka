USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 08.10.2022 13:01:51 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08.10.2022 13:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 08.10.2022 13:01:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08.10.2022 13:01:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NOT NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 08.10.2022 13:01:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08.10.2022 13:01:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Константинова ', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Меркушев ', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Казаков ', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Карпов ', N'Улеб', N'Леонидович', N'loginDEcph2018', N'7YpE0p', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Королёв ', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Юдин ', N'Герман', N'Кондратович', N'loginDEwjg2018', N'9UfqWQ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Беляева ', N'Анна', N'Вячеславовна', N'loginDEjbz2018', N'xIAWNI', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Беляев ', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Семёнов ', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Шестаков ', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Власов ', N'Вадим', N'Васильевич', N'loginDEtfj2018', N'{{ksPn', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Савельев ', N'Арсений', N'Авксентьевич', N'loginDEpnb2018', N'{ADBdc', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Ефимов ', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Бурова ', N'Марфа', N'Федотовна', N'loginDEiin2018', N'y9l*b}', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Селезнёв ', N'Александр', N'Никитевич', N'loginDEqda2018', N'|h+r}I', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Кулакова ', N'Виктория', N'Георгьевна', N'loginDEbnj2018', N'dv5DCs', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Дорофеева ', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Сафонова ', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Ситникова ', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Медведев ', N'Ириней', N'Геннадьевич', N'loginDEjis2018', N'A9K++2', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Суханова ', N'Евгения', N'Улебовна', N'loginDExvv2018', N'R1zh}|', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Игнатьев ', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Ефремов ', N'Христофор', N'Владиславович', N'loginDEyzn2018', N'P1v24R', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Кошелев ', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Галкина ', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Журавлёва ', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Савина ', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Иванов ', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Лыткин ', N'Ким', N'Алексеевич', N'loginDEwqc2018', N'vRtAP*', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Логинов ', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Русакова ', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Константинов ', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Поляков ', N'Анатолий', N'Игоревич', N'loginDEtfz2018', N'uQY0ZQ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Панфилова ', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Воробьёв ', N'Герман', N'Романович', N'loginDEdmi2018', N'HOGFbU', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Андреев ', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Бобров ', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Лапин ', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Шестаков ', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Гаврилова ', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Жуков ', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Пономарёв ', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Осипов ', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Лапин ', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Зуев ', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Коновалова ', N'Агафья', N'Митрофановна', N'loginDEisp2018', N'dfz5Ii', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Исаев ', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Самсонов ', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
