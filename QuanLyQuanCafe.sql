CREATE DATABASE [QuanLyQuanCafe]
GO
USE [QuanLyQuanCafe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL,
	[Email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [datetime2](0) NULL,
	[DateCheckOut] [datetime2](0) NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL,
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL,
	[IsDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](100) NOT NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationCodes]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationCodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](6) NOT NULL,
	[ExpirationTime] [datetime] NOT NULL,
	[IsUsed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type], [Email]) VALUES (N'admin', N'Administrator', N'12345', 1, N'2224802010757@student.tdmu.edu.vn')
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type], [Email]) VALUES (N'hagiaminhadmin', N'Hà Gia Minh', N'1', 1, N'2224802010326@student.tdmu.edu.vn')
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type], [Email]) VALUES (N'hagiaminhstaff', N'Hà Gia Minh', N'1', 2, N'minhgiaha0123@gmail.com')
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type], [Email]) VALUES (N'staff', N'Trần Huy Vũ', N'12345', 2, N'tranhuyvubao123@gmail.com')
GO
INSERT [dbo].[AccountType] ([ID], [Name]) VALUES (1, N'Quản lý')
INSERT [dbo].[AccountType] ([ID], [Name]) VALUES (2, N'Nhân viên')
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1073, CAST(N'2024-10-26T13:36:45.0000000' AS DateTime2), CAST(N'2024-10-26T13:36:48.0000000' AS DateTime2), 56, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1074, CAST(N'2024-10-31T13:25:24.0000000' AS DateTime2), CAST(N'2024-10-31T13:25:28.0000000' AS DateTime2), 62, 1, 0, 250000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1075, CAST(N'2024-10-31T13:25:30.0000000' AS DateTime2), CAST(N'2024-10-31T13:25:33.0000000' AS DateTime2), 37, 1, 0, 150000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1076, CAST(N'2024-10-31T13:25:34.0000000' AS DateTime2), CAST(N'2024-10-31T13:25:36.0000000' AS DateTime2), 58, 1, 0, 150000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1077, CAST(N'2024-10-31T13:25:37.0000000' AS DateTime2), CAST(N'2024-10-31T13:25:40.0000000' AS DateTime2), 41, 1, 0, 150000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1078, CAST(N'2024-10-31T13:25:44.0000000' AS DateTime2), CAST(N'2024-10-31T13:25:52.0000000' AS DateTime2), 59, 1, 0, 2999997)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1079, CAST(N'2024-10-31T13:25:56.0000000' AS DateTime2), CAST(N'2024-10-31T13:26:11.0000000' AS DateTime2), 42, 1, 0, 3239997)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1080, CAST(N'2024-10-31T13:26:14.0000000' AS DateTime2), CAST(N'2024-10-31T13:26:16.0000000' AS DateTime2), 41, 1, 0, 500000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1081, CAST(N'2024-10-31T13:26:20.0000000' AS DateTime2), CAST(N'2024-10-31T13:26:23.0000000' AS DateTime2), 39, 1, 0, 60000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1082, CAST(N'2024-10-31T13:28:40.0000000' AS DateTime2), CAST(N'2024-10-31T13:28:43.0000000' AS DateTime2), 37, 1, 0, 48000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1083, CAST(N'2024-10-31T13:28:51.0000000' AS DateTime2), CAST(N'2024-10-31T13:28:54.0000000' AS DateTime2), 37, 1, 0, 300000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1084, CAST(N'2024-10-31T13:29:06.0000000' AS DateTime2), CAST(N'2024-10-31T13:29:10.0000000' AS DateTime2), 37, 1, 0, 300000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1085, CAST(N'2024-10-31T13:32:03.0000000' AS DateTime2), CAST(N'2024-10-31T13:32:30.0000000' AS DateTime2), 62, 1, 0, 32479970)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1086, CAST(N'2024-10-31T17:40:45.0000000' AS DateTime2), CAST(N'2024-11-01T23:03:06.0000000' AS DateTime2), 62, 1, 0, 100000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1087, CAST(N'2024-11-01T23:06:00.0000000' AS DateTime2), CAST(N'2024-11-01T23:06:02.0000000' AS DateTime2), 62, 1, 0, 100000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1088, CAST(N'2024-11-01T23:57:50.0000000' AS DateTime2), CAST(N'2024-11-01T23:58:07.0000000' AS DateTime2), 62, 1, 0, 45000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1089, CAST(N'2024-11-01T23:57:56.0000000' AS DateTime2), CAST(N'2024-11-01T23:58:05.0000000' AS DateTime2), 36, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1090, CAST(N'2024-11-01T23:58:00.0000000' AS DateTime2), CAST(N'2024-11-01T23:58:02.0000000' AS DateTime2), 38, 1, 0, 1999998)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1091, CAST(N'2024-11-02T00:04:13.0000000' AS DateTime2), CAST(N'2024-11-02T00:04:17.0000000' AS DateTime2), 62, 1, 0, 60000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1092, CAST(N'2024-11-02T15:03:07.0000000' AS DateTime2), CAST(N'2024-11-02T15:03:21.0000000' AS DateTime2), 62, 1, 0, 150000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1093, CAST(N'2024-11-02T16:00:11.0000000' AS DateTime2), CAST(N'2024-11-02T16:00:18.0000000' AS DateTime2), 62, 1, 0, 305098000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1094, CAST(N'2024-11-02T21:24:20.0000000' AS DateTime2), CAST(N'2024-11-02T22:46:03.0000000' AS DateTime2), 68, 1, 5, 515850)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1095, CAST(N'2024-11-02T21:25:58.0000000' AS DateTime2), CAST(N'2024-11-02T21:26:11.0000000' AS DateTime2), 36, 1, 44, 600000000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1096, CAST(N'2024-11-02T21:50:30.0000000' AS DateTime2), CAST(N'2024-11-02T21:51:47.0000000' AS DateTime2), 63, 1, 0, 1000000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1097, CAST(N'2024-11-02T21:50:39.0000000' AS DateTime2), CAST(N'2024-11-02T21:51:44.0000000' AS DateTime2), 41, 1, 0, 50012000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1098, CAST(N'2024-11-03T00:02:07.0000000' AS DateTime2), CAST(N'2024-11-03T00:02:17.0000000' AS DateTime2), 68, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1099, CAST(N'2024-11-03T00:42:30.0000000' AS DateTime2), CAST(N'2024-11-03T00:42:33.0000000' AS DateTime2), 68, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1100, CAST(N'2024-11-03T00:45:04.0000000' AS DateTime2), CAST(N'2024-11-03T00:45:20.0000000' AS DateTime2), 38, 1, 100, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1101, CAST(N'2024-11-03T00:50:36.0000000' AS DateTime2), CAST(N'2024-11-03T00:51:50.0000000' AS DateTime2), 88, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1102, CAST(N'2024-11-03T00:50:40.0000000' AS DateTime2), CAST(N'2024-11-03T00:51:46.0000000' AS DateTime2), 85, 1, 0, 48000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1103, CAST(N'2024-11-03T00:56:12.0000000' AS DateTime2), NULL, 59, 0, NULL, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1104, CAST(N'2024-11-03T00:56:12.0000000' AS DateTime2), CAST(N'2024-11-13T07:20:16.0000000' AS DateTime2), 63, 1, 0, 150000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1105, CAST(N'2024-11-03T01:09:32.0000000' AS DateTime2), CAST(N'2024-11-03T01:09:43.0000000' AS DateTime2), 84, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1106, CAST(N'2024-11-03T22:38:34.0000000' AS DateTime2), CAST(N'2024-11-03T22:38:42.0000000' AS DateTime2), 42, 1, 11, 26700)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1107, CAST(N'2024-11-03T22:43:43.0000000' AS DateTime2), NULL, 77, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1108, CAST(N'2024-11-03T22:44:15.0000000' AS DateTime2), NULL, 79, 0, NULL, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1109, CAST(N'2024-11-03T22:44:15.0000000' AS DateTime2), CAST(N'2024-11-03T22:45:08.0000000' AS DateTime2), 36, 1, 100, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1110, CAST(N'2024-11-03T22:45:01.0000000' AS DateTime2), CAST(N'2024-11-09T14:04:38.0000000' AS DateTime2), 37, 1, 100, 79000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1111, CAST(N'2024-11-03T22:45:41.0000000' AS DateTime2), NULL, 43, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1112, CAST(N'2024-11-03T22:45:52.0000000' AS DateTime2), CAST(N'2024-11-12T18:53:12.0000000' AS DateTime2), 36, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1113, CAST(N'2024-11-09T00:34:16.0000000' AS DateTime2), CAST(N'2024-11-09T00:34:19.0000000' AS DateTime2), 68, 1, 0, 28000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1114, CAST(N'2024-11-09T13:48:48.0000000' AS DateTime2), CAST(N'2024-11-09T13:49:18.0000000' AS DateTime2), 68, 1, 4, 26880)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1115, CAST(N'2024-11-09T13:49:21.0000000' AS DateTime2), CAST(N'2024-11-09T15:29:59.0000000' AS DateTime2), 68, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1116, CAST(N'2024-11-09T13:49:29.0000000' AS DateTime2), CAST(N'2024-11-09T13:50:55.0000000' AS DateTime2), 80, 1, 0, 224000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1117, CAST(N'2024-11-09T14:05:08.0000000' AS DateTime2), CAST(N'2024-11-09T14:05:25.0000000' AS DateTime2), 37, 1, 100, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1118, CAST(N'2024-11-09T14:05:35.0000000' AS DateTime2), CAST(N'2024-11-09T14:05:50.0000000' AS DateTime2), 37, 1, 0, 237000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1119, CAST(N'2024-11-09T14:06:18.0000000' AS DateTime2), CAST(N'2024-11-09T14:06:58.0000000' AS DateTime2), 37, 1, 0, 79000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1120, CAST(N'2024-11-09T14:07:05.0000000' AS DateTime2), CAST(N'2024-11-09T14:07:08.0000000' AS DateTime2), 37, 1, 0, 79000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1121, CAST(N'2024-11-12T18:53:21.0000000' AS DateTime2), CAST(N'2024-11-12T18:53:23.0000000' AS DateTime2), 36, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1122, CAST(N'2024-11-12T18:53:36.0000000' AS DateTime2), CAST(N'2024-11-14T13:12:27.0000000' AS DateTime2), 61, 1, 0, 39000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1123, CAST(N'2024-11-12T18:54:25.0000000' AS DateTime2), CAST(N'2024-11-12T18:54:29.0000000' AS DateTime2), 68, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1124, CAST(N'2024-11-12T18:57:57.0000000' AS DateTime2), CAST(N'2024-11-12T18:58:01.0000000' AS DateTime2), 68, 1, 0, 15000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1125, CAST(N'2024-11-12T18:58:33.0000000' AS DateTime2), CAST(N'2024-11-12T18:58:53.0000000' AS DateTime2), 68, 1, 0, 15000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1126, CAST(N'2024-11-12T18:59:34.0000000' AS DateTime2), CAST(N'2024-11-12T18:59:35.0000000' AS DateTime2), 68, 1, 0, 28000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1127, CAST(N'2024-11-12T19:02:20.0000000' AS DateTime2), CAST(N'2024-12-12T12:15:33.0000000' AS DateTime2), 38, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1128, CAST(N'2024-11-12T20:34:14.0000000' AS DateTime2), CAST(N'2024-11-12T20:46:39.0000000' AS DateTime2), 68, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1129, CAST(N'2024-11-12T20:46:46.0000000' AS DateTime2), CAST(N'2024-11-12T22:06:12.0000000' AS DateTime2), 68, 1, 0, 144000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1130, CAST(N'2024-11-12T20:46:57.0000000' AS DateTime2), NULL, 74, 0, NULL, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1131, CAST(N'2024-11-12T20:47:32.0000000' AS DateTime2), CAST(N'2024-11-12T20:48:57.0000000' AS DateTime2), 36, 1, 16, 25200)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1132, CAST(N'2024-11-12T20:47:32.0000000' AS DateTime2), CAST(N'2024-11-12T21:34:52.0000000' AS DateTime2), 36, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1133, CAST(N'2024-11-12T20:48:32.0000000' AS DateTime2), NULL, 84, 0, NULL, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1134, CAST(N'2024-11-12T22:04:32.0000000' AS DateTime2), CAST(N'2024-11-12T22:06:10.0000000' AS DateTime2), 36, 1, 0, 90000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1135, CAST(N'2024-11-12T22:04:52.0000000' AS DateTime2), CAST(N'2024-11-12T22:06:05.0000000' AS DateTime2), 101, 1, 10, 203400)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1136, CAST(N'2024-11-13T07:20:00.0000000' AS DateTime2), CAST(N'2024-11-13T07:20:03.0000000' AS DateTime2), 85, 1, 0, 100000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1137, CAST(N'2024-11-13T07:20:36.0000000' AS DateTime2), CAST(N'2024-11-13T07:20:39.0000000' AS DateTime2), 63, 1, 0, 96000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1138, CAST(N'2024-11-13T07:20:46.0000000' AS DateTime2), CAST(N'2024-11-13T07:20:50.0000000' AS DateTime2), 63, 1, 0, 128000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1139, CAST(N'2024-11-13T07:20:57.0000000' AS DateTime2), CAST(N'2024-11-13T07:21:04.0000000' AS DateTime2), 63, 1, 0, 183000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1140, CAST(N'2024-11-13T10:26:33.0000000' AS DateTime2), CAST(N'2024-11-13T10:26:52.0000000' AS DateTime2), 68, 1, 10, 587000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1141, CAST(N'2024-11-13T10:26:38.0000000' AS DateTime2), CAST(N'2024-11-13T10:26:55.0000000' AS DateTime2), 36, 1, 0, 232000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1142, CAST(N'2024-11-13T10:27:08.0000000' AS DateTime2), CAST(N'2024-11-14T13:24:49.0000000' AS DateTime2), 68, 1, 3, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1143, CAST(N'2024-11-13T10:27:45.0000000' AS DateTime2), CAST(N'2024-11-13T10:28:03.0000000' AS DateTime2), 63, 1, 0, 384000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1144, CAST(N'2024-11-13T10:27:51.0000000' AS DateTime2), CAST(N'2024-11-13T10:28:17.0000000' AS DateTime2), 75, 1, 0, 384000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1145, CAST(N'2024-11-13T10:28:13.0000000' AS DateTime2), CAST(N'2024-11-13T10:28:15.0000000' AS DateTime2), 63, 1, 0, 128000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1146, CAST(N'2024-11-13T10:28:18.0000000' AS DateTime2), CAST(N'2024-11-13T10:28:20.0000000' AS DateTime2), 75, 1, 0, 128000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1147, CAST(N'2024-11-13T10:28:21.0000000' AS DateTime2), CAST(N'2024-11-13T10:28:23.0000000' AS DateTime2), 75, 1, 0, 128000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1148, CAST(N'2024-11-13T10:28:23.0000000' AS DateTime2), CAST(N'2024-11-13T10:28:25.0000000' AS DateTime2), 75, 1, 0, 128000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1149, CAST(N'2024-11-13T10:28:26.0000000' AS DateTime2), CAST(N'2024-11-13T10:28:28.0000000' AS DateTime2), 75, 1, 0, 128000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1150, CAST(N'2024-11-14T13:10:03.0000000' AS DateTime2), CAST(N'2024-11-14T13:12:23.0000000' AS DateTime2), 36, 1, 100, 32000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1151, CAST(N'2024-11-16T16:01:24.0000000' AS DateTime2), CAST(N'2024-11-16T16:02:17.0000000' AS DateTime2), 105, 1, 0, 90000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1152, CAST(N'2024-11-16T16:09:39.0000000' AS DateTime2), CAST(N'2024-11-16T16:09:50.0000000' AS DateTime2), 105, 1, 0, 72000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1153, CAST(N'2024-11-16T16:10:55.0000000' AS DateTime2), CAST(N'2024-11-17T12:55:39.0000000' AS DateTime2), 40, 1, 0, 18000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1154, CAST(N'2024-11-16T16:11:00.0000000' AS DateTime2), CAST(N'2024-11-17T13:12:11.0000000' AS DateTime2), 105, 1, 0, 36000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1155, CAST(N'2024-11-17T12:56:28.0000000' AS DateTime2), CAST(N'2024-11-17T13:01:17.0000000' AS DateTime2), 36, 1, 0, 45000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1156, CAST(N'2024-11-17T13:01:24.0000000' AS DateTime2), CAST(N'2024-11-21T08:02:24.0000000' AS DateTime2), 39, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1157, CAST(N'2024-11-17T13:12:23.0000000' AS DateTime2), CAST(N'2024-11-17T13:20:22.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1158, CAST(N'2024-11-17T13:23:43.0000000' AS DateTime2), CAST(N'2024-11-17T13:27:04.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1159, CAST(N'2024-11-17T13:27:30.0000000' AS DateTime2), CAST(N'2024-11-17T13:31:56.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1160, CAST(N'2024-11-17T13:32:09.0000000' AS DateTime2), CAST(N'2024-11-17T13:32:17.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1161, CAST(N'2024-11-17T13:32:42.0000000' AS DateTime2), CAST(N'2024-11-17T13:35:55.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1162, CAST(N'2024-11-17T13:36:10.0000000' AS DateTime2), CAST(N'2024-11-17T13:36:17.0000000' AS DateTime2), 105, 1, 0, 60000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1163, CAST(N'2024-11-17T13:36:35.0000000' AS DateTime2), CAST(N'2024-11-17T13:36:58.0000000' AS DateTime2), 105, 1, 0, 60000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1164, CAST(N'2024-11-17T13:38:53.0000000' AS DateTime2), CAST(N'2024-11-17T13:39:08.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1165, CAST(N'2024-11-17T13:40:47.0000000' AS DateTime2), CAST(N'2024-11-17T13:41:01.0000000' AS DateTime2), 105, 1, 0, 84000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1166, CAST(N'2024-11-17T13:42:42.0000000' AS DateTime2), CAST(N'2024-11-17T13:42:45.0000000' AS DateTime2), 105, 1, 0, 90000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1167, CAST(N'2024-11-17T13:42:49.0000000' AS DateTime2), CAST(N'2024-11-17T13:45:28.0000000' AS DateTime2), 105, 1, 0, 90000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1168, CAST(N'2024-11-17T13:48:48.0000000' AS DateTime2), CAST(N'2024-11-17T13:49:09.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1169, CAST(N'2024-11-21T08:02:45.0000000' AS DateTime2), CAST(N'2024-11-21T08:02:56.0000000' AS DateTime2), 105, 1, 0, 60000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1170, CAST(N'2024-11-21T08:03:04.0000000' AS DateTime2), CAST(N'2024-11-21T08:05:33.0000000' AS DateTime2), 105, 1, 0, 75000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1171, CAST(N'2024-11-21T08:05:39.0000000' AS DateTime2), CAST(N'2024-11-21T08:05:54.0000000' AS DateTime2), 105, 1, 0, 30000)
GO
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1172, CAST(N'2024-11-21T11:09:47.0000000' AS DateTime2), CAST(N'2024-11-21T11:10:37.0000000' AS DateTime2), 75, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1173, CAST(N'2024-11-23T13:02:59.0000000' AS DateTime2), CAST(N'2024-11-23T13:03:07.0000000' AS DateTime2), 93, 1, 10, 27000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1174, CAST(N'2024-11-23T14:39:40.0000000' AS DateTime2), CAST(N'2024-12-05T07:35:57.0000000' AS DateTime2), 103, 1, 0, 18000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1175, CAST(N'2024-11-23T14:40:02.0000000' AS DateTime2), CAST(N'2024-11-23T14:40:24.0000000' AS DateTime2), 76, 1, 10, 54000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1176, CAST(N'2024-11-23T14:40:58.0000000' AS DateTime2), CAST(N'2024-11-23T14:41:06.0000000' AS DateTime2), 105, 1, 0, 114000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1177, CAST(N'2024-11-23T14:41:22.0000000' AS DateTime2), CAST(N'2024-11-23T14:41:36.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1178, CAST(N'2024-12-05T07:36:05.0000000' AS DateTime2), CAST(N'2024-12-05T07:36:09.0000000' AS DateTime2), 103, 1, 0, 18000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1179, CAST(N'2024-12-05T07:36:23.0000000' AS DateTime2), CAST(N'2024-12-05T07:36:26.0000000' AS DateTime2), 103, 1, 0, 32000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1180, CAST(N'2024-12-05T07:36:48.0000000' AS DateTime2), CAST(N'2024-12-05T07:37:07.0000000' AS DateTime2), 103, 1, 20, 192000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1181, CAST(N'2024-12-05T07:37:11.0000000' AS DateTime2), CAST(N'2024-12-05T07:37:17.0000000' AS DateTime2), 91, 1, 10, 288000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1182, CAST(N'2024-12-05T09:07:29.0000000' AS DateTime2), CAST(N'2024-12-05T09:07:37.0000000' AS DateTime2), 103, 1, 3, 34920)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1183, CAST(N'2024-12-05T09:07:39.0000000' AS DateTime2), NULL, 103, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1184, CAST(N'2024-12-05T09:07:45.0000000' AS DateTime2), CAST(N'2024-12-12T12:15:26.0000000' AS DateTime2), 36, 1, 0, 36000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1185, CAST(N'2024-12-12T12:15:35.0000000' AS DateTime2), CAST(N'2024-12-12T12:15:38.0000000' AS DateTime2), 105, 1, 0, 30000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1186, CAST(N'2024-12-12T12:15:41.0000000' AS DateTime2), CAST(N'2024-12-12T12:15:47.0000000' AS DateTime2), 105, 1, 0, 30000)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1110, 1073, 62, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1111, 1074, 74, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1112, 1075, 74, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1113, 1076, 74, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1114, 1077, 74, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1115, 1078, 61, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1116, 1079, 61, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1117, 1079, 60, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1118, 1080, 75, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1119, 1081, 62, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1120, 1082, 63, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1121, 1083, 75, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1122, 1084, 59, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1123, 1085, 83, 8)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1124, 1085, 84, 32)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1125, 1086, 74, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1126, 1087, 74, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1127, 1088, 62, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1128, 1089, 59, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1129, 1090, 61, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1130, 1091, 62, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1131, 1092, 74, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1132, 1093, 62, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1133, 1093, 63, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1134, 1093, 82, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1135, 1095, 81, 12)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1136, 1096, 80, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1137, 1097, 63, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1138, 1097, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1139, 1094, 96, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1140, 1094, 80, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1141, 1094, 91, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1142, 1094, 92, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1143, 1094, 93, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1144, 1094, 94, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1145, 1094, 95, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1146, 1094, 60, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1147, 1094, 75, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1148, 1094, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1149, 1094, 85, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1150, 1094, 87, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1151, 1094, 88, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1153, 1099, 139, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1154, 1100, 87, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1155, 1101, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1156, 1102, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1157, 1102, 87, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1158, 1105, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1159, 1106, 62, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1160, 1109, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1164, 1113, 123, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1165, 1114, 124, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1166, 1116, 124, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1167, 1116, 125, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1168, 1116, 127, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1169, 1110, 105, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1170, 1117, 105, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1171, 1118, 105, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1173, 1119, 105, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1174, 1120, 105, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1175, 1115, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1176, 1112, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1177, 1121, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1179, 1123, 129, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1180, 1124, 62, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1182, 1125, 62, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1183, 1126, 125, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1185, 1128, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1186, 1132, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1187, 1129, 81, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1188, 1134, 81, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1189, 1129, 87, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1190, 1135, 110, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1191, 1135, 106, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1192, 1135, 107, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1193, 1136, 106, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1194, 1104, 108, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1195, 1104, 59, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1196, 1137, 59, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1197, 1138, 59, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1198, 1139, 83, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1199, 1139, 110, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1200, 1140, 103, 7)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1201, 1141, 103, 8)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1202, 1140, 59, 12)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1203, 1144, 59, 12)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1204, 1145, 59, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1205, 1146, 59, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1206, 1147, 59, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1207, 1148, 59, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1208, 1149, 59, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1209, 1122, 96, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1210, 1150, 61, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1211, 1151, 122, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1212, 1152, 87, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1213, 1153, 87, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1214, 1154, 87, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1215, 1155, 62, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1216, 1155, 82, 1)
GO
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1217, 1156, 62, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1218, 1157, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1219, 1158, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1220, 1159, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1221, 1160, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1222, 1161, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1223, 1162, 81, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1224, 1163, 122, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1225, 1164, 122, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1226, 1165, 123, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1227, 1166, 81, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1228, 1167, 81, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1229, 1168, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1230, 1169, 81, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1231, 1170, 81, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1232, 1170, 62, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1233, 1171, 62, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1234, 1172, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1235, 1173, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1236, 1175, 122, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1237, 1176, 123, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1238, 1176, 128, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1239, 1177, 128, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1240, 1174, 87, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1241, 1178, 87, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1242, 1179, 90, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1243, 1180, 90, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1244, 1181, 90, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1245, 1182, 87, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1246, 1184, 87, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1247, 1127, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1248, 1185, 81, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1249, 1186, 81, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (59, N'Nước ép cam', 27, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (60, N'Trà Đào', 42, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (61, N'Sinh tố bơ', 29, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (62, N'Bánh tráng bùi nhùi', 30, 15000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (63, N'Cơm cháy chà bông', 30, 20000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (74, N'Nước ép dưa hấu', 27, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (75, N'Trà Dưa Lưới', 42, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (80, N'Trà Dâu', 42, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (81, N'Caffe sữa muối ', 58, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (82, N'Bánh Căng', 30, 15000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (83, N'Nước ép Táo', 27, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (84, N'Sinh tố dâu', 29, 38000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (85, N'Deleted - Caffe muối - 1', 31, 25000, 1)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (87, N'Caffe đen', 58, 18000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (88, N'Bạc xỉu ', 58, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (90, N'Bạc xỉu muối', 58, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (91, N'Trà cam quế', 42, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (92, N'Trà tắc xí muội', 42, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (93, N'Trà lài dưa hấu', 42, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (94, N'Trà đào cam sả', 42, 38000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (95, N'Trà trái cây ', 42, 38000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (96, N'Trà thanh đào sữa trân châu trắng ', 42, 39000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (97, N'Trà lài sữa sương sáo/trân châu trắng', 42, 39000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (98, N'Trà chanh muối ', 42, 29000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (99, N'Nước ép thơm', 27, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (100, N'Nước ép bưởi', 27, 35000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (101, N'Nước ép dưa lưới', 27, 38000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (102, N'Nước ép ổi ', 27, 35000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (103, N'Strongbow (lon)', 40, 29000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (104, N'Goegaarden (Chai)', 40, 39000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (105, N'Soju (Chai)', 40, 79000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (106, N'Khô mực bento', 30, 20000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (107, N'Bánh tráng xì ke', 30, 10000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (108, N'Khô gà lá chanh', 30, 18000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (109, N'Soda chanh đường', 43, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (110, N'Soda việt quất', 43, 29000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (111, N'Soda cam dứa', 43, 29000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (112, N'Soda kiwi dâu', 43, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (113, N'Soda chanh bạc hà', 43, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (114, N'Soda phúc bồn tử', 43, 29000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (115, N'Soda chanh dây', 43, 29000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (116, N'Soda nhiệt đới', 43, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (117, N'Soda biển xanh', 43, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (118, N'Sinh tố mãng cầu ', 29, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (119, N'Sinh tố xoài', 29, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (120, N'Sinh tố việt quất', 29, 31000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (121, N'Sinh tố nha đam &  cam', 29, 32000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (122, N'Đá xay dâu', 44, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (123, N'Đá xay socola', 44, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (124, N'Đá xay matcha', 44, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (125, N'Đá xay đào', 44, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (126, N'Đá xay kiwi', 44, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (127, N'Đá xay latte trà xanh', 44, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (128, N'Sting ', 55, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (129, N'Pepsi', 55, 30000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (130, N'7 up', 55, 25000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (131, N'Numberone vàng ', 55, 25000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (132, N'Numberone chanh', 55, 25000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (133, N'247', 55, 28000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (134, N'Fanta cam', 55, 20000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (135, N'Fanta soda kem', 55, 25000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (136, N'Mirinda xá xị', 55, 25000, 0)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (139, N'Deleted - test - 1', 31, 30000, 1)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price], [IsDelete]) VALUES (140, N'Test', 58, 33000, 0)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (31, N'<<None>>')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (58, N'Caffe')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (44, N'Đá xay')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (30, N'Đồ Ăn Vặt')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (40, N'Đồ uống có cồn')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (55, N'Nước có gas')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (27, N'Nước Ép')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (29, N'Sinh Tố')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (43, N'Soda')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (42, N'Trà')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (36, N'Bàn 2', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (37, N'Bàn 3', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (38, N'Bàn 4', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (39, N'Bàn 5', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (40, N'Bàn 6', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (41, N'Bàn 7', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (42, N'Bàn 8', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (43, N'Bàn 9', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (55, N'Delete - Bàn 13', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (56, N'Delete - Bàn 1', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (57, N'Bàn 10', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (58, N'Bàn 11', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (59, N'Bàn 12', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (61, N'Bàn 14', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (62, N'Delete - Table 62 - 1', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (63, N'Bàn 15', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (64, N'Delete - Bàn 16', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (68, N'Delete - Bàn 1 - 1', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (69, N'Delete - Bàn 16 - 1', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (71, N'Delete - Bàn 16 - 2', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (72, N'Delete - Bàn 16 - 3', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (73, N'Delete - Bàn 16 - 4', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (74, N'Bàn 25', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (75, N'Bàn 16', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (76, N'Bàn 17', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (77, N'Bàn 18', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (78, N'Bàn 19', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (79, N'Bàn 20', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (80, N'Bàn 21', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (81, N'Bàn 22', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (82, N'Bàn 23', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (83, N'Bàn 24', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (84, N'Bàn 26', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (85, N'Bàn 27', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (86, N'Bàn 28', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (87, N'Bàn 29', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (88, N'Bàn 30', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (89, N'Bàn 31', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (90, N'Bàn 32', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (91, N'Bàn 36', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (92, N'Bàn 37', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (93, N'Bàn 38', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (94, N'Bàn 39', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (95, N'Bàn 40', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (96, N'Bàn 41', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (97, N'Bàn 42', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (98, N'Bàn 43', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (99, N'Bàn 44', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (100, N'Bàn 45', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (101, N'Bàn 46', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (103, N'Bàn 1', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (105, N'Mang Về', N'Trống', 0)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (106, N'Delete - Bàn 47 - 1', N'Trống', 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [isDeleted]) VALUES (107, N'Delete - Bàn 47 - 2', N'Trống', 1)
SET IDENTITY_INSERT [dbo].[TableFood] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationCodes] ON 

INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (4, N'staff', N'tranhuyvubao123@gmail.com', N'642956', CAST(N'2024-11-02T14:58:19.027' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (5, N'staff', N'tranhuyvubao123@gmail.com', N'870087', CAST(N'2024-11-02T14:58:55.457' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (6, N'staff', N'tranhuyvubao123@gmail.com', N'611538', CAST(N'2024-11-02T15:00:51.933' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (7, N'staff', N'tranhuyvubao123@gmail.com', N'410692', CAST(N'2024-11-02T15:02:38.130' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (8, N'staff', N'tranhuyvubao123@gmail.com', N'374260', CAST(N'2024-11-02T15:34:12.027' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (9, N'staff', N'tranhuyvubao123@gmail.com', N'861502', CAST(N'2024-11-02T15:36:04.707' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (10, N'staff', N'tranhuyvubao123@gmail.com', N'999757', CAST(N'2024-11-02T15:38:24.653' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (11, N'staff', N'tranhuyvubao123@gmail.com', N'882697', CAST(N'2024-11-02T15:39:20.837' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (12, N'staff', N'tranhuyvubao123@gmail.com', N'967729', CAST(N'2024-11-02T15:42:42.090' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (13, N'staff', N'tranhuyvubao123@gmail.com', N'606926', CAST(N'2024-11-02T15:43:11.807' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (14, N'staff', N'tranhuyvubao123@gmail.com', N'559040', CAST(N'2024-11-02T17:27:43.073' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (15, N'staff', N'tranhuyvubao123@gmail.com', N'917165', CAST(N'2024-11-02T17:30:04.773' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (16, N'staff', N'Tranhuyvubao123@gmail.com', N'874192', CAST(N'2024-11-02T17:32:57.357' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (17, N'staff', N'tranhuyvubao123@gmail.com', N'740661', CAST(N'2024-11-02T17:34:05.900' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (18, N'staff', N'tranhuyvubao123@gmail.com', N'533316', CAST(N'2024-11-02T17:36:21.547' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (19, N'staff', N'tranhuyvubao123@gmail.com', N'470067', CAST(N'2024-11-02T17:38:21.447' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (20, N'hagiaminhstaff', N'minhgiaha0123@gmail.com', N'782887', CAST(N'2024-11-02T21:43:22.037' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (21, N'hagiaminhadmin', N'2224802010326@student.tdmu.edu.vn', N'118009', CAST(N'2024-11-02T21:46:40.553' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (22, N'hagiaminhadmin', N'2224802010326@student.tdmu.edu.vn', N'771816', CAST(N'2024-11-03T22:45:15.957' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (23, N'hagiaminhadmin', N'2224802010326@student.tdmu.edu.vn', N'486868', CAST(N'2024-11-03T22:52:27.743' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (24, N'staff', N'tranhuyvubao123@gmail.com', N'971684', CAST(N'2024-11-09T13:57:16.403' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (25, N'staff', N'tranhuyvubao123@gmail.com', N'963922', CAST(N'2024-11-13T08:00:43.647' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (26, N'staff', N'tranhuyvubao123@gmail.com', N'502998', CAST(N'2024-11-13T08:03:47.393' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (27, N'staff', N'tranhuyvubao123@gmail.com', N'387021', CAST(N'2024-11-14T00:43:57.950' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (28, N'staff', N'tranhuyvubao123@gmail.com', N'246872', CAST(N'2024-11-21T08:32:01.230' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (29, N'staff', N'tranhuyvubao123@gmail.com', N'893341', CAST(N'2024-11-21T08:36:40.113' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (30, N'staff', N'tranhuyvubao123@gmail.com', N'209609', CAST(N'2024-11-21T08:42:16.287' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (31, N'staff', N'tranhuyvubao123@gmail.com', N'729433', CAST(N'2024-12-12T12:24:46.237' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (32, N'staff', N'tranhuyvubao123@gmail.com', N'561480', CAST(N'2024-12-12T12:25:54.133' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (33, N'staff', N'tranhuyvubao123@gmail.com', N'183335', CAST(N'2024-12-12T12:28:03.493' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (1031, N'staff', N'tranhuyvubao123@gmail.com', N'906450', CAST(N'2024-12-12T12:32:54.570' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (1032, N'staff', N'tranhuyvubao123@gmail.com', N'179417', CAST(N'2024-12-12T12:39:35.557' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (1033, N'staff', N'tranhuyvubao123@gmail.com', N'735013', CAST(N'2024-12-12T12:43:28.860' AS DateTime), 0)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (1034, N'staff', N'tranhuyvubao123@gmail.com', N'526280', CAST(N'2024-12-12T12:45:08.010' AS DateTime), 1)
INSERT [dbo].[VerificationCodes] ([Id], [UserName], [Email], [Code], [ExpirationTime], [IsUsed]) VALUES (1035, N'staff', N'tranhuyvubao123@gmail.com', N'571081', CAST(N'2024-12-12T13:30:28.023' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[VerificationCodes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Food_Name]    Script Date: 1/6/2025 10:35:39 PM ******/
ALTER TABLE [dbo].[Food] ADD  CONSTRAINT [UQ_Food_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Category_Name]    Script Date: 1/6/2025 10:35:39 PM ******/
ALTER TABLE [dbo].[FoodCategory] ADD  CONSTRAINT [UQ_Category_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_TableFood_Name]    Script Date: 1/6/2025 10:35:39 PM ******/
ALTER TABLE [dbo].[TableFood] ADD  CONSTRAINT [UQ_TableFood_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Kter') FOR [DisplayName]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [PassWord]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_DateCheckIn]  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[FoodCategory] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Bàn chưa có tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Trống') FOR [status]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[VerificationCodes] ADD  DEFAULT ((0)) FOR [IsUsed]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([Type])
REFERENCES [dbo].[AccountType] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
ALTER TABLE [dbo].[VerificationCodes]  WITH CHECK ADD  CONSTRAINT [FK_VerificationCodes_Account] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VerificationCodes] CHECK CONSTRAINT [FK_VerificationCodes_Account]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetAccountByUserName]
@userName nvarchar(100)
AS 
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetBillInfoByID]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetBillInfoByID]
    @billId INT
AS
BEGIN
    SELECT 
		Bill.ID,
        Food.Name AS 'Tên món ăn', 
		FoodCategory.name AS 'Danh mục',
        BillInfo.Count AS 'Số lượng', 
        Food.Price AS 'Giá'
    FROM 
        BillInfo
	
    INNER JOIN Food ON BillInfo.idFood = Food.id
	INNER JOIN FoodCategory on Food.idCategory = FoodCategory.id
	INNER JOIN Bill on Bill.ID = BillInfo.idBill
    WHERE 
        BillInfo.idBill = @billId;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetListBillByDate]
    @checkIn datetime, 
    @checkOut datetime
AS
BEGIN
    SELECT b.id, t.name, b.totalPrice, DateCheckIn, DateCheckOut, discount
    FROM dbo.Bill b
    JOIN dbo.TableFood t ON t.id = b.idTable
    WHERE DateCheckIn >= @checkIn 
        AND DateCheckOut <= @checkOut 
        AND b.status = 1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetTableList]
AS 
SELECT ID, Name, status
FROM dbo.TableFood
WHERE isDeleted = 0
ORDER BY 
    CASE 
        WHEN Name = 'Mang Về' THEN 0  -- Đặt bàn "Mang Về" vào đầu
        ELSE 
            CASE 
                WHEN ISNUMERIC(SUBSTRING(Name, 5, LEN(Name) - 4)) = 1 
                THEN CAST(SUBSTRING(Name, 5, LEN(Name) - 4) AS INT)
                ELSE 9999  -- Xử lý bàn không có số, đặt nó vào cuối
            END
    END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTop8MostOrderedDrinks]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetTop8MostOrderedDrinks]
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT TOP 8 
        f.name AS FoodName, 
        SUM(bi.count) AS TotalOrdered
    FROM BillInfo AS bi
    JOIN Bill AS b ON bi.idBill = b.id
    JOIN Food AS f ON bi.idFood = f.id
    WHERE b.DateCheckIn >= @StartDate AND b.DateCheckIn <= @EndDate And f.idCategory != 30
    GROUP BY f.name
    ORDER BY TotalOrdered DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTop8MostOrderedFoods]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetTop8MostOrderedFoods]
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT TOP 8 
        f.name AS FoodName, 
        SUM(bi.count) AS TotalOrdered
    FROM BillInfo AS bi
    JOIN Bill AS b ON bi.idBill = b.id
    JOIN Food AS f ON bi.idFood = f.id
    WHERE b.DateCheckIn >= @StartDate AND b.DateCheckIn <= @EndDate And f.idCategory = 30
    GROUP BY f.name
    ORDER BY TotalOrdered DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBill]
@idTable INT
AS
Begin
Insert dbo.Bill(DateCheckIn,DateCheckOut,idTable,status,discount)
values(GETDATE(),null,@idTable,0,0)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBillInfo]
    @idBill INT,
    @idFood INT,
    @count INT
AS
BEGIN
    DECLARE @isExistBillInfo INT;
    DECLARE @foodCount INT;

    -- Check if the food item already exists in the bill and get its count
    SELECT @isExistBillInfo = id, @foodCount = b.count 
    FROM dbo.BillInfo AS b 
    WHERE idBill = @idBill AND idFood = @idFood;

    IF (@isExistBillInfo IS NOT NULL) 
    BEGIN
        -- Calculate the new count
        DECLARE @newCount INT = @foodCount + @count;

        -- Update the count if it's greater than zero; otherwise, delete the entry
        IF (@newCount > 0)
            UPDATE dbo.BillInfo SET count = @newCount WHERE idBill = @idBill AND idFood = @idFood;
        ELSE
            DELETE FROM dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood;
    END
    ELSE
    BEGIN
        -- If the item does not exist, insert it with the given count
        INSERT INTO dbo.BillInfo (idBill, idFood, count)
        VALUES (@idBill, @idFood, @count);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_Login]
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SwitchTable]
@idTable1 INT, @idTable2 int
AS BEGIN

	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill INT
	
	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1
	
	
	SELECT @idSeconrdBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idFirstBill IS NULL)
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
	END
	
	SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		PRINT '0000002'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
		SELECT @idSeconrdBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'

	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable
	
	IF (@isFirstTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable2
		
	IF (@isSecondTablEmty= 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[USP_UpdateAccount]
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END
GO
/****** Object:  Trigger [dbo].[trg_UpdateVerificationEmail]    Script Date: 1/6/2025 10:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateVerificationEmail]
ON [dbo].[Account]
AFTER UPDATE
AS
BEGIN
    -- Kiểm tra xem email có bị thay đổi không
    IF UPDATE(Email)
    BEGIN
        UPDATE VerificationCodes
        SET Email = i.Email
        FROM VerificationCodes vc
        INNER JOIN Account i ON vc.UserName = i.UserName
        WHERE vc.Email <> i.Email;  -- Chỉ cập nhật khi email thực sự thay đổi
    END
END;

GO
ALTER TABLE [dbo].[Account] ENABLE TRIGGER [trg_UpdateVerificationEmail]
GO
/****** Object:  Trigger [dbo].[UTG_UpdateBill]    Script Date: 1/6/2025 10:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UTG_UpdateBill]
ON [dbo].[Bill] FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = id FROM Inserted	
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count int = 0
	
	SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO
ALTER TABLE [dbo].[Bill] ENABLE TRIGGER [UTG_UpdateBill]
GO
/****** Object:  Trigger [dbo].[UTG_DeleteBillInfo]    Script Date: 1/6/2025 10:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UTG_DeleteBillInfo]
ON [dbo].[BillInfo] FOR DELETE
AS 
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT
	SELECT @idBillInfo = id, @idBill = Deleted.idBill FROM Deleted
	
	DECLARE @idTable INT
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count INT = 0
	
	SELECT @count = COUNT(*) FROM dbo.BillInfo AS bi, dbo.Bill AS b WHERE b.id = bi.idBill AND b.id = @idBill AND b.status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO
ALTER TABLE [dbo].[BillInfo] ENABLE TRIGGER [UTG_DeleteBillInfo]
GO
/****** Object:  Trigger [dbo].[UTG_UpdateBillInfo]    Script Date: 1/6/2025 10:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UTG_UpdateBillInfo]
ON [dbo].[BillInfo] FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = idBill FROM Inserted
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0
	
	UPDATE dbo.TableFood SET status = N'Có người' WHERE id = @idTable
END
GO
ALTER TABLE [dbo].[BillInfo] ENABLE TRIGGER [UTG_UpdateBillInfo]
GO
/****** Object:  Trigger [dbo].[UpdateFoodCategoryBeforeDelete]    Script Date: 1/6/2025 10:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateFoodCategoryBeforeDelete]
ON [dbo].[FoodCategory]
INSTEAD OF DELETE
AS
BEGIN
    -- Cập nhật tất cả các Food thuộc về FoodCategory đang bị xóa
    UPDATE dbo.Food
    SET idCategory = (SELECT id FROM dbo.FoodCategory WHERE name = N'<<None>>')
    WHERE idCategory IN (SELECT id FROM deleted);

    -- Sau khi cập nhật, thực hiện xóa FoodCategory
    DELETE FROM dbo.FoodCategory WHERE id IN (SELECT id FROM deleted);
END;

GO
ALTER TABLE [dbo].[FoodCategory] ENABLE TRIGGER [UpdateFoodCategoryBeforeDelete]
GO
