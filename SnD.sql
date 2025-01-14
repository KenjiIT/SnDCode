USE [SnD]
GO
/****** Object:  Database [SnD]    Script Date: 21/03/2023 1:17:26 CH ******/
CREATE DATABASE [SnD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SnD', FILENAME = N'C:\Users\ASUS\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\SnD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SnD_log', FILENAME = N'C:\Users\ASUS\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\SnD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SnD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SnD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SnD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SnD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SnD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SnD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SnD] SET ARITHABORT OFF 
GO
ALTER DATABASE [SnD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SnD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SnD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SnD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SnD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SnD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SnD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SnD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SnD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SnD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SnD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SnD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SnD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SnD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SnD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SnD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SnD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SnD] SET RECOVERY FULL 
GO
ALTER DATABASE [SnD] SET  MULTI_USER 
GO
ALTER DATABASE [SnD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SnD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SnD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SnD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SnD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SnD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SnD] SET QUERY_STORE = ON
GO
ALTER DATABASE [SnD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SnD]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 21/03/2023 1:17:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [nvarchar](50) NOT NULL,
	[Book_Title] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrow_List]    Script Date: 21/03/2023 1:17:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow_List](
	[Borrow_List_ID] [nvarchar](50) NOT NULL,
	[C_ID] [nvarchar](50) NOT NULL,
	[Call_Day] [date] NOT NULL,
	[Due_Date] [date] NOT NULL,
	[Total_Price] [float] NOT NULL,
	[Return_Day] [date] NULL,
	[Fine] [float] NULL,
 CONSTRAINT [PK_Borrow_List] PRIMARY KEY CLUSTERED 
(
	[Borrow_List_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21/03/2023 1:17:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[C_ID] [nvarchar](50) NOT NULL,
	[Lend_Status] [int] NOT NULL,
	[Phone_numb] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Date_Create] [date] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21/03/2023 1:17:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[E_ID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[DOB] [date] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import_List]    Script Date: 21/03/2023 1:17:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_List](
	[Import_List_ID] [nvarchar](50) NOT NULL,
	[Supplier_ID] [nvarchar](50) NOT NULL,
	[Date_Import] [date] NOT NULL,
 CONSTRAINT [PK_Import_List] PRIMARY KEY CLUSTERED 
(
	[Import_List_ID] ASC,
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplier]    Script Date: 21/03/2023 1:17:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplier](
	[Sup_ID] [nvarchar](50) NOT NULL,
	[Sup_Name] [nvarchar](50) NOT NULL,
	[Sup_Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suplier] PRIMARY KEY CLUSTERED 
(
	[Sup_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B01', N'Dac Nhan Tam', N'Tam ly & Ki nang song', 60000, 20)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B02', N'Tam Ly Toi Pham', N'Tam ly & Ki nang song', 79000, 15)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B03', N'Hanh Trinh Thai Giao', N'Nuoi day con', 53000, 7)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B04', N'Atlat Dia Li Viet Nam', N'Giao khoa - Tham khao', 31000, 10)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B05', N'Ngu Van 9', N'Giao khoa - Tham khao', 12000, 50)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B06', N'Conan-Tham tu lung danh', N'Sach thieu nhi', 16000, 70)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B07', N'Cong chua Ori', N'Sach thieu nhi', 16000, 60)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B08', N'Toan 12', N'Giao khoa - Tham khao', 12000, 30)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B09', N'100 Mon Ngon Danh Cho Con Nho', N'Nuoi day con', 32000, 28)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B10', N'Lich Su Van Minh A Rap', N'Tieu su - Hoi Ky', 115000, 6)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B11', N'Putin-Logic Cua Quyen Luc', N'Tieu su - Hoi Ky', 142000, 6)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B12', N'Giai Thich Ngu Phap Tieng Anh', N'Sach hoc ngoai ngu', 169000, 17)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B13', N'Nghĩ Giau & Lam Giau', N'Kinh te', 71200, 19)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B14', N'Chien Tranh Tien Te', N'Kinh te', 94400, 10)
INSERT [dbo].[Book] ([BookID], [Book_Title], [Type], [Price], [Quantity]) VALUES (N'B15', N'Giai Thich Ngu Phap Tieng Han', N'Sach hoc ngoại ngu', 178900, 15)
GO
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL01', N'C1', CAST(N'2023-03-21' AS Date), CAST(N'2023-04-21' AS Date), 30000, CAST(N'2023-04-15' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL02', N'C5', CAST(N'2021-03-22' AS Date), CAST(N'2021-04-22' AS Date), 10000, CAST(N'2021-04-04' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL03', N'C3', CAST(N'2021-02-10' AS Date), CAST(N'2021-03-10' AS Date), 50000, CAST(N'2021-02-27' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL04', N'C3', CAST(N'2022-11-18' AS Date), CAST(N'2022-12-18' AS Date), 10000, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL05', N'C2', CAST(N'2019-05-15' AS Date), CAST(N'2019-06-15' AS Date), 60000, CAST(N'2019-06-10' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL06', N'C2', CAST(N'2020-12-30' AS Date), CAST(N'2021-01-30' AS Date), 30000, CAST(N'2021-01-29' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL07', N'C4', CAST(N'2017-01-01' AS Date), CAST(N'2017-02-01' AS Date), 10000, CAST(N'2017-01-06' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL08', N'C6', CAST(N'2017-07-06' AS Date), CAST(N'2017-08-06' AS Date), 50000, CAST(N'2017-08-05' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL09', N'C6', CAST(N'2023-09-18' AS Date), CAST(N'2023-10-18' AS Date), 40000, CAST(N'2023-09-30' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL10', N'C4', CAST(N'2023-06-23' AS Date), CAST(N'2023-07-23' AS Date), 90000, CAST(N'2023-07-17' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL11', N'C1', CAST(N'2016-12-25' AS Date), CAST(N'2017-01-25' AS Date), 100000, CAST(N'2017-01-25' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL12', N'C7', CAST(N'2015-06-26' AS Date), CAST(N'2015-07-26' AS Date), 70000, CAST(N'2015-07-20' AS Date), NULL)
INSERT [dbo].[Borrow_List] ([Borrow_List_ID], [C_ID], [Call_Day], [Due_Date], [Total_Price], [Return_Day], [Fine]) VALUES (N'BL13', N'C4', CAST(N'2022-08-19' AS Date), CAST(N'2022-09-19' AS Date), 30000, CAST(N'2022-08-23' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([C_ID], [Lend_Status], [Phone_numb], [Email], [Date_Create]) VALUES (N'C1', 0, N'0123456789', N'c1@gmail.com', CAST(N'2016-12-01' AS Date))
INSERT [dbo].[Customer] ([C_ID], [Lend_Status], [Phone_numb], [Email], [Date_Create]) VALUES (N'C2', 1, N'0234567891', N'c2@gmail.com', CAST(N'2019-05-15' AS Date))
INSERT [dbo].[Customer] ([C_ID], [Lend_Status], [Phone_numb], [Email], [Date_Create]) VALUES (N'C3', 1, N'0345678912', N'c3@gmail.com', CAST(N'2021-01-10' AS Date))
INSERT [dbo].[Customer] ([C_ID], [Lend_Status], [Phone_numb], [Email], [Date_Create]) VALUES (N'C4', 0, N'0456789123', N'c4@gmail.com', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[Customer] ([C_ID], [Lend_Status], [Phone_numb], [Email], [Date_Create]) VALUES (N'C5', 1, N'0567891234', N'c5@gmail.com', CAST(N'2021-03-20' AS Date))
INSERT [dbo].[Customer] ([C_ID], [Lend_Status], [Phone_numb], [Email], [Date_Create]) VALUES (N'C6', 0, N'0678912345', N'c6@gmail.com', CAST(N'2017-06-17' AS Date))
INSERT [dbo].[Customer] ([C_ID], [Lend_Status], [Phone_numb], [Email], [Date_Create]) VALUES (N'C7', 1, N'0789123456', N'c7@gmail.com', CAST(N'2015-04-01' AS Date))
GO
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP1', N'123', N'Danh', 21, N'TPHCM', CAST(N'2002-07-03' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP2', N'234', N'Bao', 21, N'TPHCM', CAST(N'2002-07-09' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP3', N'345', N'Khoi', 20, N'TPHCM', CAST(N'2003-02-03' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP4', N'456', N'Linh', 21, N'TPHCM', CAST(N'2002-11-15' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP5', N'567', N'Bao Toan', 21, N'TPHCM', CAST(N'2002-09-22' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP6', N'678', N'Ha', 22, N'HaNoi', CAST(N'2001-04-30' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP7', N'789', N'Dung', 18, N'QuyNhon', CAST(N'2005-07-05' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP8', N'891', N'Tu', 23, N'DaLat', CAST(N'2000-07-17' AS Date))
INSERT [dbo].[Employee] ([E_ID], [Password], [Name], [Age], [Address], [DOB]) VALUES (N'EP9', N'912', N'Cuc', 20, N'NhaTrang', CAST(N'2003-08-06' AS Date))
GO
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL1', N'SL01', CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL1', N'SL03', CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL2', N'SL05', CAST(N'2023-04-05' AS Date))
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL3', N'SL01', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL3', N'SL03', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL3', N'SL04', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL4', N'SL06', CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Import_List] ([Import_List_ID], [Supplier_ID], [Date_Import]) VALUES (N'IL4', N'SL7', CAST(N'2023-04-30' AS Date))
GO
INSERT [dbo].[Suplier] ([Sup_ID], [Sup_Name], [Sup_Email]) VALUES (N'SL01', N'NXB Kim Dong', N'kimdong1@gmail.com')
INSERT [dbo].[Suplier] ([Sup_ID], [Sup_Name], [Sup_Email]) VALUES (N'SL02', N'NXB Tre', NULL)
INSERT [dbo].[Suplier] ([Sup_ID], [Sup_Name], [Sup_Email]) VALUES (N'SL03', N'NXB Van Hoc', NULL)
INSERT [dbo].[Suplier] ([Sup_ID], [Sup_Name], [Sup_Email]) VALUES (N'SL04', N'NXB Am Nhac', NULL)
INSERT [dbo].[Suplier] ([Sup_ID], [Sup_Name], [Sup_Email]) VALUES (N'SL05', N'NXB Tai Chinh', NULL)
INSERT [dbo].[Suplier] ([Sup_ID], [Sup_Name], [Sup_Email]) VALUES (N'SL06', N'NXB Khoa hoc tu nhien va Cong nghe', NULL)
INSERT [dbo].[Suplier] ([Sup_ID], [Sup_Name], [Sup_Email]) VALUES (N'SL07', N'NXB Tai Chinh', NULL)
GO
USE [master]
GO
ALTER DATABASE [SnD] SET  READ_WRITE 
GO
