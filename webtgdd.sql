USE [webtgdd]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 15/12/2023 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avartar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/12/2023 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avartar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15/12/2023 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 15/12/2023 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Pice] [float] NULL,
	[PiceDiscount] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/12/2023 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avartar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Pice] [float] NULL,
	[PiceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/12/2023 19:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Apple', N'apple.jpg', N'apple', 1, 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Samsung', N'Samsung.jpg', N'samsung', 1, 2, NULL, NULL, 0)
INSERT [dbo].[Brand] ([id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'bao1', N'git_20231016120817.png', N'dsdad', 1, 3, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Điện thoại', N'icon fa fa-shopping-bag                                                                             ', N'dienthoai.jpg', 1, 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Laptop', N'icon fa fa-laptop                                                                                   ', N'laptop.jpg', 1, 2, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Mac', N'icon fa fa-laptop                                                                                   ', N'mac.jpg', 1, 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Tivi', N'icon fa fa-laptop                                                                                   ', N'tivi.jpg', 1, 4, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'bao', N'z4791750660500_f3a163cffc401d377d5e5c78e95b203d_20231109041624.jpg                                  ', N'fsdf', NULL, 6, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'baoDonhang20231014173143', 1002, 1, CAST(N'2023-10-14T17:31:43.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'Donhang20231014173914', 1002, 1, CAST(N'2023-10-14T17:39:14.403' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang-20231016102210', 1003, 1, CAST(N'2023-10-16T10:22:10.687' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang-20231016102220', 1003, 1, CAST(N'2023-10-16T10:22:20.397' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (6, N'DonHang-20231016102609', 1003, 1, CAST(N'2023-10-16T10:26:09.313' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (7, N'DonHang-20231016102657', 1003, 1, CAST(N'2023-10-16T10:26:57.947' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (8, N'DonHang-20231016102725', 1003, 1, CAST(N'2023-10-16T10:27:25.983' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (9, N'DonHang-20231016102815', 1003, 1, CAST(N'2023-10-16T10:28:15.923' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (10, N'DonHang-20231016103230', 1003, 1, CAST(N'2023-10-16T10:32:30.547' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (11, N'DonHang-20231016103243', 1003, 1, CAST(N'2023-10-16T10:32:43.300' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (12, N'DonHang-20231016112640', 1003, 1, CAST(N'2023-10-16T11:26:40.523' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (13, N'DonHang-20231016135242', 1003, 1, CAST(N'2023-10-16T13:52:42.227' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (14, N'DonHang-20231016135631', 1003, 1, CAST(N'2023-10-16T13:56:31.090' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (15, N'DonHang-20231016135633', 1003, 1, CAST(N'2023-10-16T13:56:33.480' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'DonHang-20231016140240', 1003, 1, CAST(N'2023-10-16T14:02:40.497' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (17, N'DonHang-20231016140342', 1003, 1, CAST(N'2023-10-16T14:03:42.407' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (18, N'DonHang-20231016140404', 1003, 1, CAST(N'2023-10-16T14:04:04.320' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (19, N'DonHang-20231016195910', 1005, 1, CAST(N'2023-10-16T19:59:10.037' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (20, N'DonHang-20231023174541', 1005, 1, CAST(N'2023-10-23T17:45:41.347' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (21, N'DonHang-20231024115352', 1005, 1, CAST(N'2023-10-24T11:53:52.990' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (22, N'DonHang-20231024115439', 1005, 1, CAST(N'2023-10-24T11:54:39.797' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (23, N'DonHang-20231024115512', 1005, 1, CAST(N'2023-10-24T11:55:12.270' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (24, N'DonHang-20231106151944', 1005, 1, CAST(N'2023-11-06T15:19:44.180' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1024, N'DonHang-20231110174534', 1005, 1, CAST(N'2023-11-10T17:45:34.453' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1025, N'DonHang-20231111142916', 2006, 1, CAST(N'2023-11-11T14:29:16.457' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2024, N'DonHang-20231214181439', 2006, 1, CAST(N'2023-12-14T18:14:39.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (2, 3, 4, 2, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (3, 3, 3, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (4, 4, 3, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (5, 5, 3, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (6, 6, 3, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (7, 7, 3, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (8, 8, 4, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (9, 9, 4, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (10, 9, 1, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (11, 10, 5, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (12, 11, 5, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (13, 12, 3, 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (14, 13, 3, 1, 60000, 500)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (15, 14, 3, 1, 60000, 500)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (16, 15, 3, 1, 60000, 500)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (17, 16, 3, 1, 60000, 500)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (18, 17, 3, 1, 60000, 500)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (19, 18, 3, 1, 60000, 500)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (20, 19, 2, 1, 5000, 250)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (21, 20, 1, 1, 1000, 120)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (22, 21, 1, 1, 1000, 120)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (23, 22, 1010, 1, 50000, 10000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (24, 23, 2, 1, 5000, 250)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (25, 24, 1, 1, 1000, 120)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (1025, 1024, 2, 1, 5000, 250)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (1026, 1025, 1, 1, 1000, 120)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Pice], [PiceDiscount]) VALUES (2025, 2024, 1, 1, 1000, 120)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (1, N'iPhone 15 Pro Max 256GB Chính Hãng VN/A', N'shopping_20231016110720.jpg                                                                         ', 1, N'5', N'hot', 1000, 120, 1, N'iphone-15', 1, NULL, NULL, NULL, NULL, NULL, 10)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2, N'Iphone 15 blue', N'download_20231016110842.jpg                                                                         ', 1, N'10', N'new', 5000, 250, 1, N'iphone-blu-15', 1, NULL, NULL, NULL, NULL, NULL, 20)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (3, N'Iphone 15 pink', N'download_20231016110523.png                                                                         ', 1, N'20', N'sale', 60000, 500, 2, N'iphone-blu-15', 1, NULL, NULL, NULL, NULL, NULL, 30)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (4, N'Iphone 15 yellow', N'shopping_20231016110552.png                                                                         ', 1, N'30', N'sale', 9000, 900, 2, N'iphone-blu-15', 1, NULL, NULL, NULL, NULL, NULL, 40)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (1006, N'Macbook Pro 16 inch 2021 Ultra-thin Case', N'macpro16_20231016105053.jpg                                                                         ', 3, N'1', N'new', 25000, 24000, 2, N'mac-pro-16', 1, NULL, NULL, NULL, NULL, NULL, 15)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (1007, N'Smart Tivi Samsung 4K 50 Inch 50AU7700KXXV', N'50AU7700KXXV_2_20231016105518.jpg                                                                   ', 4, N'1', N'sale', 30000, 25000, 2, N'tivi-samsung', 2, NULL, NULL, NULL, NULL, NULL, 10)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (1008, N'Samsung Galaxy Z Flip5 5G F731 512GB Ram 8GB Chính Hãng', N'samsung-galaxy-z-flip5-5g-f731-512gb-ram-8gb-chinh-hang-01690885167_20231016105814.jpg              ', 1, N'1', N'new', 50000, 40000, 2, N'samsung-galaxy-z-flip5-5g', 2, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (1009, N'Samsung Galaxy M34 5G M346 128GB Ram 8GB', N'638182970630939004_samsung-galaxy-s23-plus-tim-dd-tragop_20231016110230.jpg                         ', 1, N'1', N'hot', 20000, 15000, 2, N'samsung-galaxy-m34-5g', 2, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (1010, N'Samsung Galaxy Book Pro', N'Samsung-Galaxy-Book-Pro-360-15-inch-Bronze-4-600x600_20231016112550.png                             ', 2, N'1', N'hot', 50000, 10000, 2, N'Samsung-Galaxy-Book-Pro', 2, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (1012, N'bao', N'z4791750660500_f3a163cffc401d377d5e5c78e95b203d_20231109045008.jpg                                  ', 1, N'2', N'ewqewew', 12222, 232, 23, N'ewq', 4, NULL, NULL, NULL, NULL, NULL, 23)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2011, N'Google Tivi Xiaomi A HD 32 Inch L32M8-P2SEA', N'google-tivi-xia_main_24_1020.png (1)_20231111013732.jpg                                             ', 4, N'1', N'Google Tivi Xiaomi A HD 32 Inch L32M8-P2SEA', 50000, 20000, 2, N'tivi', 4, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2012, N'Smart Tivi QLED Samsung 4K 65 inch QA65Q60BAKXXV', N'10051659-smart-tivi-qled-samsung-4k-65-inch-qa65q60bakxxv-2_wcqk-zo_20231111014745.jpg              ', 4, N'1', N'Smart Tivi QLED Samsung 4K 65 inch QA65Q60BAKXXV', 70000, 30000, 2, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2013, N'Smart Tivi Samsung Crystal UHD 4K 55 inch UA55AU7002KXXV', N'10052134-smart-tivi-samsung-crystal-uhd-4k-55-inch-ua55au7002kxxv-1_20231111014840.jpg              ', 4, N'1', N'Smart Tivi Samsung Crystal UHD 4K 55 inch UA55AU7002KXXV', 90000, 40000, 2, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2014, N'Smart Tivi Samsung 4K 55 inch UA55AU7700KXXV', N'10052134-smart-tivi-samsung-crystal-uhd-4k-55-inch-ua55au7002kxxv-1_20231111014919.jpg              ', 4, N'1', N'Smart Tivi Samsung 4K 55 inch UA55AU7700KXXV', 80000, 50000, 1, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2015, N'Smart Tivi Crystal Samsung UHD 4K 43 inch UA43BU8000KXXV', N'10052134-smart-tivi-samsung-crystal-uhd-4k-55-inch-ua55au7002kxxv-1_20231111015110.jpg              ', 4, N'1', N'Smart Tivi Crystal Samsung UHD 4K 43 inch UA43BU8000KXXV', 100000, 80000, 1, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2016, N'Smart Tivi QLED Samsung 4K 55 inch QA55Q60BAKXXV', N'10051685-smart-tivi-crystal-samsung-uhd-4k-43-inch-ua43bu8000kxxv-1_20231111015155.jpg              ', 4, N'1', N'Smart Tivi QLED Samsung 4K 55 inch QA55Q60BAKXXV', 100000, 80000, 1, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2017, N'Smart Tivi QLED Samsung 4K 43 inch QA43Q60BAKXXV', N'10051662-smart-tivi-qled-samsung-4k-43-inch-qa43q60bakxxv-1a_20231111015302.jpg                     ', 4, N'1', N'Smart Tivi QLED Samsung 4K 43 inch QA43Q60BAKXXV', 100000, 85000, 2, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2018, N'Smart Tivi Samsung 4K 43 inch UA43AU7700KXXV', N'10049956-smart-tivi-samsung-4k-43-inch-ua43au7700kxxv-1_20231111015422.jpg                          ', 4, N'1', N'Smart Tivi Samsung 4K 43 inch UA43AU7700KXXV', 100000, 85000, 2, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2019, N'Smart Tivi Crystal Samsung UHD 4K 65 inch UA65BU8000KXXV', N'10051662-smart-tivi-qled-samsung-4k-43-inch-qa43q60bakxxv-1a_20231111015533.jpg                     ', 4, N'1', N'Smart Tivi Crystal Samsung UHD 4K 65 inch UA65BU8000KXXV', 100000, 85000, 1, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2020, N'Smart Tivi Crystal Samsung UHD 4K 50 inch UA50BU8000KXXV', N'10051684-smart-tivi-crystal-samsung-uhd-4k-50-inch-ua50bu8000kxxv-1_20231111015626.jpg              ', 4, N'1', N'Smart Tivi Crystal Samsung UHD 4K 50 inch UA50BU8000KXXV', 100000, 85000, 2, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2021, N'Smart Tivi Samsung Crystal UHD 4K 43 inch UA43AU7002KXXV', N'10052136-smart-tivi-samsung-crystal-uhd-4k-43-inch-ua43au7002kxxv_20231111015657.jpg                ', 4, N'1', N'Smart Tivi Samsung Crystal UHD 4K 43 inch UA43AU7002KXXV', 100000, 85000, 2, N'tivi', 2, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2022, N'iPhone 14 512GB Chính Hãng (VN/A)', N'iphone-14-512gb-likenew-didongviet_1_20231111015944.jpg                                             ', 4, N'1', N'iPhone 14 512GB Chính Hãng (VN/A)', 14000000, 5000000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2023, N'iPhone 14 128GB', N'1699349595998-ip14-128-98_20231111020229.jpg                                                        ', 1, N'1', N'iPhone 14 128GB', 31000000, 30000000, 1, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2024, N'iPhone 14 256GB | Full Box 100% New | Đầy Đủ Màu | VN – ZA – ZP – LL', N'iphone-14-mau-tim-purple-128gb-256gb-512gb-trang-thien-long-mobile-510x510_20231111020348.jpg       ', 1, N'1', N'iPhone 14 256GB | Full Box 100% New | Đầy Đủ Màu | VN – ZA – ZP – LL', 18000000, 15000000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2025, N'iPhone 13 128GB', N'1699350053482-ip13-98_20231111020500.jpg                                                            ', 1, N'1', N'iPhone 13 128GB', 16000000, 12000000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2026, N'iPhone 13 128GB Chính Hãng VN/A', N'1675239264852-600x600-ip13-new-1 (1)_20231111020546.jpg                                             ', 1, N'1', N'iPhone 13 128GB Chính Hãng VN/A', 13000000, 11000000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2027, N'iPhone 13 128GB', N'iphone-13-mau-hong-pink-128gb-256gb-512gb-trang-thien-long-mobile-510x510_20231111020628.jpg        ', 1, N'1', N'iPhone 13 128GB', 10000000, 9000000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2028, N'iPhone 12 128GB (Likenew)', N'1682664664335_iphone_12_xanh_la_didongviet_20231111020732.jpg                                       ', 1, N'1', N'iPhone 12 128GB (Likenew)', 12000000, 10000000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2029, N'sdasdad', N'1682664664335_iphone_12_xanh_la_didongviet_20231111022034.jpg                                       ', 1, N'1', N'sale', 50000, 40000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Pice], [PiceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Quantity]) VALUES (2030, N'bao1', N'iphone-13-mau-hong-pink-128gb-256gb-512gb-trang-thien-long-mobile-510x510_20231111023011.jpg        ', 1, N'1', N'iPhone 13 128GB', 500000, 5000, 2, N'iphone', 1, NULL, NULL, NULL, NULL, NULL, 12)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'dangbao1', N'bao', N'bao@gmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'sdad', N'dsadsd', N'nguyendangbao17042003@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'dffgh', N'fghj', N'sdfghj@gmail.com', N'202cb962ac59075b964b07152d234b70', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'baoooo2', N'dsadfghjk', N'abc@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1002, N'test2', N'test2', N'test2@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1003, N'bao', N'baoss', N'baobao2003@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1004, N'test1', N'tesst1', N'test1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1005, N'dat', N'dat1', N'dat@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2006, N'bao1', N'nguyen', N'bao123@gmail.com', N'202cb962ac59075b964b07152d234b70', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3006, N'bao', N'nguyen', N'nguyendangba321321332132@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Giảm gia sốc, 2: Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
