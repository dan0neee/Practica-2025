USE [master]
GO
/****** Object:  Database [Склад]    Script Date: 26.02.2025 19:02:37 ******/
CREATE DATABASE [Склад]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Склад', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Склад.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Склад_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Склад_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Склад] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Склад].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Склад] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Склад] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Склад] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Склад] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Склад] SET ARITHABORT OFF 
GO
ALTER DATABASE [Склад] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Склад] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Склад] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Склад] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Склад] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Склад] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Склад] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Склад] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Склад] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Склад] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Склад] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Склад] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Склад] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Склад] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Склад] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Склад] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Склад] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Склад] SET RECOVERY FULL 
GO
ALTER DATABASE [Склад] SET  MULTI_USER 
GO
ALTER DATABASE [Склад] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Склад] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Склад] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Склад] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Склад] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Склад] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Склад', N'ON'
GO
ALTER DATABASE [Склад] SET QUERY_STORE = ON
GO
ALTER DATABASE [Склад] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Склад]
GO
/****** Object:  Table [dbo].[Инвентаризация]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Инвентаризация](
	[id_Инвентаризации] [int] IDENTITY(1,1) NOT NULL,
	[Дата проведения] [date] NULL,
	[id_Сотрудника] [int] NULL,
	[id_Склада] [int] NULL,
 CONSTRAINT [PK_Инвентаризация] PRIMARY KEY CLUSTERED 
(
	[id_Инвентаризации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[id_Клиента] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Телефон] [char](11) NULL,
	[Адрес] [nvarchar](50) NULL,
	[e-mail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[id_Клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[id_Поставщика] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NULL,
	[ИНН/КПП] [char](10) NULL,
	[Телефон] [char](11) NULL,
	[e-mail] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[id_Поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Приходные накладные]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Приходные накладные](
	[id_Приходные] [int] IDENTITY(1,1) NOT NULL,
	[Дата поступления] [date] NULL,
	[id_Поставщика] [int] NULL,
	[Общая сумма] [money] NULL,
 CONSTRAINT [PK_Приходные накладные] PRIMARY KEY CLUSTERED 
(
	[id_Приходные] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Расходные накладные]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расходные накладные](
	[id_Расходной] [int] IDENTITY(1,1) NOT NULL,
	[Дата отгрузки] [date] NULL,
	[id_Клиента] [int] NULL,
	[Общая сумма] [money] NULL,
 CONSTRAINT [PK_Расходные накладные] PRIMARY KEY CLUSTERED 
(
	[id_Расходной] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склады]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склады](
	[id_Склада] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
	[Тип] [nvarchar](50) NULL,
	[Зона хранения] [nvarchar](50) NULL,
 CONSTRAINT [PK_Склады] PRIMARY KEY CLUSTERED 
(
	[id_Склада] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[id_Сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](150) NULL,
	[Должность] [nvarchar](50) NULL,
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[id_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товар]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товар](
	[id_Товара] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Артикул] [int] NULL,
	[Штрихкод] [binary](50) NULL,
	[Категория] [nvarchar](50) NULL,
	[Единица измерения] [nchar](10) NULL,
	[Цена за единицу] [money] NULL,
	[Серийный номер] [int] NULL,
	[Минимальный остаток] [nchar](10) NULL,
	[id_Склада] [int] NULL,
 CONSTRAINT [PK_Товар] PRIMARY KEY CLUSTERED 
(
	[id_Товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары_Приходные]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары_Приходные](
	[id_Товары_Приходные] [int] IDENTITY(1,1) NOT NULL,
	[id_Товара] [int] NULL,
	[id_Приходные] [int] NULL,
	[Стоимость] [money] NULL,
	[Количество] [int] NULL,
 CONSTRAINT [PK_Товары_Приходные] PRIMARY KEY CLUSTERED 
(
	[id_Товары_Приходные] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары_Расходные]    Script Date: 26.02.2025 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары_Расходные](
	[id_Товары_Расходные] [int] IDENTITY(1,1) NOT NULL,
	[id_Товара] [int] NULL,
	[id_Расходной] [int] NULL,
	[Стоимость] [money] NULL,
	[Количество] [int] NULL,
 CONSTRAINT [PK_Товары_Расходные] PRIMARY KEY CLUSTERED 
(
	[id_Товары_Расходные] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Инвентаризация]  WITH CHECK ADD  CONSTRAINT [FK_Инвентаризация_Склады] FOREIGN KEY([id_Склада])
REFERENCES [dbo].[Склады] ([id_Склада])
GO
ALTER TABLE [dbo].[Инвентаризация] CHECK CONSTRAINT [FK_Инвентаризация_Склады]
GO
ALTER TABLE [dbo].[Инвентаризация]  WITH CHECK ADD  CONSTRAINT [FK_Инвентаризация_Сотрудники] FOREIGN KEY([id_Сотрудника])
REFERENCES [dbo].[Сотрудники] ([id_Сотрудника])
GO
ALTER TABLE [dbo].[Инвентаризация] CHECK CONSTRAINT [FK_Инвентаризация_Сотрудники]
GO
ALTER TABLE [dbo].[Приходные накладные]  WITH CHECK ADD  CONSTRAINT [FK_Приходные накладные_Поставщики] FOREIGN KEY([id_Поставщика])
REFERENCES [dbo].[Поставщики] ([id_Поставщика])
GO
ALTER TABLE [dbo].[Приходные накладные] CHECK CONSTRAINT [FK_Приходные накладные_Поставщики]
GO
ALTER TABLE [dbo].[Расходные накладные]  WITH CHECK ADD  CONSTRAINT [FK_Расходные накладные_Клиенты] FOREIGN KEY([id_Клиента])
REFERENCES [dbo].[Клиенты] ([id_Клиента])
GO
ALTER TABLE [dbo].[Расходные накладные] CHECK CONSTRAINT [FK_Расходные накладные_Клиенты]
GO
ALTER TABLE [dbo].[Товар]  WITH CHECK ADD  CONSTRAINT [FK_Товар_Склады] FOREIGN KEY([id_Склада])
REFERENCES [dbo].[Склады] ([id_Склада])
GO
ALTER TABLE [dbo].[Товар] CHECK CONSTRAINT [FK_Товар_Склады]
GO
ALTER TABLE [dbo].[Товары_Приходные]  WITH CHECK ADD  CONSTRAINT [FK_Товары_Приходные_Приходные накладные] FOREIGN KEY([id_Приходные])
REFERENCES [dbo].[Приходные накладные] ([id_Приходные])
GO
ALTER TABLE [dbo].[Товары_Приходные] CHECK CONSTRAINT [FK_Товары_Приходные_Приходные накладные]
GO
ALTER TABLE [dbo].[Товары_Приходные]  WITH CHECK ADD  CONSTRAINT [FK_Товары_Приходные_Товар] FOREIGN KEY([id_Товара])
REFERENCES [dbo].[Товар] ([id_Товара])
GO
ALTER TABLE [dbo].[Товары_Приходные] CHECK CONSTRAINT [FK_Товары_Приходные_Товар]
GO
ALTER TABLE [dbo].[Товары_Расходные]  WITH CHECK ADD  CONSTRAINT [FK_Товары_Расходные_Расходные накладные] FOREIGN KEY([id_Расходной])
REFERENCES [dbo].[Расходные накладные] ([id_Расходной])
GO
ALTER TABLE [dbo].[Товары_Расходные] CHECK CONSTRAINT [FK_Товары_Расходные_Расходные накладные]
GO
ALTER TABLE [dbo].[Товары_Расходные]  WITH CHECK ADD  CONSTRAINT [FK_Товары_Расходные_Товар] FOREIGN KEY([id_Товара])
REFERENCES [dbo].[Товар] ([id_Товара])
GO
ALTER TABLE [dbo].[Товары_Расходные] CHECK CONSTRAINT [FK_Товары_Расходные_Товар]
GO
USE [master]
GO
ALTER DATABASE [Склад] SET  READ_WRITE 
GO
