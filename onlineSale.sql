USE [master]
GO
/****** Object:  Database [OnlineSale]    Script Date: 6/29/2020 7:51:21 PM ******/
CREATE DATABASE [OnlineSale]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineSale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnlineSale.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineSale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnlineSale_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineSale] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineSale].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineSale] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineSale] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineSale] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineSale] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineSale] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineSale] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineSale] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineSale] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineSale] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineSale] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineSale] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineSale] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineSale] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineSale] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineSale] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineSale] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineSale] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineSale] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineSale] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineSale] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineSale] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineSale] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineSale] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineSale] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineSale] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineSale] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineSale] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineSale] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineSale] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnlineSale]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/29/2020 7:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[DayOrder] [date] NOT NULL,
	[Total] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillsDetail]    Script Date: 6/29/2020 7:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillsDetail](
	[Bill_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[ProName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_BillsDetail] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/29/2020 7:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/29/2020 7:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/29/2020 7:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[CateID] [int] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Bill_ID], [CustomerName], [Address], [DayOrder], [Total], [Status]) VALUES (1, N'HaiBang', N'TPHCM', CAST(0x49410B00 AS Date), 0, N'Proccessing....')
INSERT [dbo].[Bill] ([Bill_ID], [CustomerName], [Address], [DayOrder], [Total], [Status]) VALUES (2, N'HaiBang1', N'TPHCM', CAST(0x4A410B00 AS Date), 0, N'Proccessing....')
INSERT [dbo].[Bill] ([Bill_ID], [CustomerName], [Address], [DayOrder], [Total], [Status]) VALUES (3, N'abc', N'Ho Chi Minh', CAST(0x4A410B00 AS Date), 0, N'Proccessing....')
INSERT [dbo].[Bill] ([Bill_ID], [CustomerName], [Address], [DayOrder], [Total], [Status]) VALUES (4, N'abc', N'Ho Chi Minh', CAST(0x4A410B00 AS Date), 0, N'Proccessing....')
INSERT [dbo].[Bill] ([Bill_ID], [CustomerName], [Address], [DayOrder], [Total], [Status]) VALUES (5, N'abc', N'Ho Chi Minh', CAST(0x4A410B00 AS Date), 0, N'Proccessing....')
INSERT [dbo].[Bill] ([Bill_ID], [CustomerName], [Address], [DayOrder], [Total], [Status]) VALUES (6, N'HaiBang', N'Ho Chi Minh', CAST(0x4A410B00 AS Date), 0, N'Proccessing....')
INSERT [dbo].[Bill] ([Bill_ID], [CustomerName], [Address], [DayOrder], [Total], [Status]) VALUES (7, N'cssdavsa', N'safdsafa', CAST(0x4B410B00 AS Date), 0, N'Proccessing....')
SET IDENTITY_INSERT [dbo].[Bill] OFF
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (1, 1, N'Camera1', 1, 569)
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (2, 1, N'Camera1', 1, 569)
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (3, 7, N'Camera7', 1, 234)
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (3, 19, N'Shoe3', 2, 749)
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (6, 1, N'Camera1', 2, 569)
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (6, 8, N'Cover1', 1, 125)
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (7, 1, N'Camera1', 4, 569)
INSERT [dbo].[BillsDetail] ([Bill_ID], [Product_ID], [ProName], [Quantity], [Price]) VALUES (7, 11, N'Sandisk1', 2, 124)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CateName]) VALUES (1, N'Shoe')
INSERT [dbo].[Category] ([CategoryID], [CateName]) VALUES (2, N'Camera')
INSERT [dbo].[Category] ([CategoryID], [CateName]) VALUES (3, N'Sandisk')
INSERT [dbo].[Category] ([CategoryID], [CateName]) VALUES (4, N'Laptop')
INSERT [dbo].[Category] ([CategoryID], [CateName]) VALUES (5, N'Cover')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (1, N'bangnguyen', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Nguyễn Hải Bằng', N'bang@gmail.com', N'123456', N'TPHCM')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (2, N'haibang', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Bang', N'bang1@gmail.com', N'123456', N'TPHCM')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (3, N'nguyenhaibang', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Nguyễn Hải Bằng', N'bang2@gmail.com', N'123456', N'PHCM')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (4, N'haibangnguyen', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Hai Bang', N'bang3@gmail.com', N'123456', N'TPHCM')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (5, N'kimcuong', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Kim Cương', N'cuong@gmail.com', N'0345678912', N'Hóc Môn')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (6, N'haibang2506', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Bằng Nguyễn Hải', N'abc@gmail.com', N'0285648880', N'DHHS')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (7, N'asafa', N'A6-65-A4-59-20-42-2F-9D-41-7E-48-67-EF-DC-4F-B8-A0-4A-1F-3F-FF-1F-A0-7E-99-8E-86-F7-F7-A2-7A-E3', N'asd', N'abc@FDSHF.COM', N'0567853543', N'dfWFA')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (8, N'asafaQ', N'A6-65-A4-59-20-42-2F-9D-41-7E-48-67-EF-DC-4F-B8-A0-4A-1F-3F-FF-1F-A0-7E-99-8E-86-F7-F7-A2-7A-E3', N'asd', N'abc@FDSHF.CO1M', N'0567853543', N'dfWFA')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (9, N'homnaytoibuon', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Hôm Nay Tôi Buồn', N'buon@gmail.com', N'0765216047', N'Gò Vấp, TPHCM')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (10, N'muadongbuon', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Mùa Đông Buồn', N'muadongbuon@gmail.com', N'0876543215', N'TP HCM')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (11, N'abcd', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'A', N'a@gmail.com', N'0765215789', N'TPHCM')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (1002, N'bangnguyenhai', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'Nguyễn Hải Bằng', N'haibang123@gmail.com', N'0765478908', N'Gò Vấp')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (1003, N'fdafds', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'aaaa', N'aa@gmail.com', N'0765216047', N'afdsff sfasf')
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Name], [Email], [Phone], [Address]) VALUES (1004, N'fdafdsd', N'8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92', N'aaaa', N'aa1@gmail.com', N'0765216047', N'afdsff sfasf')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (1, N'Camera1', 50, N'569', 1, 2, N'/themes/images/products/1.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (2, N'Camera2', 64, N'455', 0, 2, N'/themes/images/products/2.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (3, N'Camera3', 67, N'345', 1, 2, N'/themes/images/products/3.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (4, N'Camera4', 33, N'249', 0, 2, N'/themes/images/products/4.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (5, N'Camera5', 66, N'789', 1, 2, N'/themes/images/products/5.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (6, N'Camera6', 12, N'1235', 0, 2, N'/themes/images/products/11.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (7, N'Camera7', 43, N'234', 0, 2, N'/themes/images/products/13.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (8, N'Cover1', 125, N'125', 1, 5, N'/themes/images/products/oplung1.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (9, N'Cover2', 341, N'317', 0, 5, N'/themes/images/products/oplung2.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (10, N'Cover3', 124, N'355', 1, 5, N'/themes/images/products/oplung3.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (11, N'Sandisk1', 35, N'124', 0, 3, N'/themes/images/products/6.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (12, N'Sandisk2', 45, N'324', 0, 3, N'/themes/images/products/7.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (13, N'Sandisk3', 56, N'213', 0, 3, N'/themes/images/products/8.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (14, N'Sandisk4', 34, N'121', 0, 3, N'/themes/images/products/9.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (15, N'Sandisk5', 79, N'399', 0, 3, N'/themes/images/products/10.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (16, N'Sandisk6', 88, N'199', 0, 3, N'/themes/images/products/12.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (17, N'Shoe1', 12, N'899', 1, 1, N'/themes/images/products/b1.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (18, N'Shoe2', 69, N'211', 0, 1, N'/themes/images/products/b2.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (19, N'Shoe3', 88, N'749', 1, 1, N'/themes/images/products/b3.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (20, N'Shoe4', 99, N'237', 0, 1, N'/themes/images/products/b4.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (21, N'Shoe5', 67, N'456', 0, 1, N'/themes/images/products/b5.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (22, N'Shoe6', 88, N'569', 0, 1, N'/themes/images/products/b6.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (23, N'Shoe7', 35, N'146', 0, 1, N'/themes/images/products/b7.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (24, N'Shoe8', 68, N'166', 0, 1, N'/themes/images/products/b8.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (25, N'Laptop1', 19, N'3456', 0, 4, N'/themes/images/products/acer1.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (26, N'Laptop2', 77, N'1234', 0, 4, N'/themes/images/products/acer2.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (27, N'Laptop3', 57, N'989', 0, 4, N'/themes/images/products/acer3.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (28, N'Laptop4', 87, N'999', 0, 4, N'/themes/images/products/acer4.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (29, N'Laptop5', 88, N'2245', 0, 4, N'/themes/images/products/mac1.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (30, N'Laptop6', 3, N'2890', 0, 4, N'/themes/images/products/mac2.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (31, N'Laptop7', 21, N'2680', 0, 4, N'/themes/images/products/mac3.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (32, N'Laptop8', 49, N'1457', 0, 4, N'/themes/images/products/asus1.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (33, N'Laptop9', 38, N'1389', 0, 4, N'/themes/images/products/asus2.jpg')
INSERT [dbo].[Products] ([ID], [Name], [Quantity], [Price], [Status], [CateID], [Image]) VALUES (34, N'Laptop10', 72, N'2130', 0, 4, N'/themes/images/products/asus3.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[BillsDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillsDetail_Bill] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([Bill_ID])
GO
ALTER TABLE [dbo].[BillsDetail] CHECK CONSTRAINT [FK_BillsDetail_Bill]
GO
ALTER TABLE [dbo].[BillsDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillsDetail_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[BillsDetail] CHECK CONSTRAINT [FK_BillsDetail_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
USE [master]
GO
ALTER DATABASE [OnlineSale] SET  READ_WRITE 
GO
