USE [master]
GO
/****** Object:  Database [SMS]    Script Date: 2021-04-07 오후 3:49:52 ******/
CREATE DATABASE [SMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMS', FILENAME = N'D:\Data\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMS_log', FILENAME = N'D:\Data\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SMS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMS] SET RECOVERY FULL 
GO
ALTER DATABASE [SMS] SET  MULTI_USER 
GO
ALTER DATABASE [SMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SMS', N'ON'
GO
ALTER DATABASE [SMS] SET QUERY_STORE = OFF
GO
USE [SMS]
GO
/****** Object:  Table [dbo].[Antenna]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antenna](
	[AntennaID] [int] IDENTITY(1,1) NOT NULL,
	[TxPower] [decimal](18, 0) NOT NULL,
	[RxPower] [decimal](18, 0) NOT NULL,
	[AntennaNumber] [int] NOT NULL,
	[ReaderID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AntennaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barcode]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcode](
	[BarcodeID] [int] IDENTITY(1,1) NOT NULL,
	[BarcodeNumber] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BarcodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookOut]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookOut](
	[BookOutID] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [varchar](300) NOT NULL,
	[Project] [varchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookOutItem]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookOutItem](
	[BookOutItemID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[BookOutID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookOutItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](200) NOT NULL,
	[BrandDescription] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) NOT NULL,
	[CategoryDescription] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](200) NOT NULL,
	[ItemDescription] [varchar](200) NOT NULL,
	[ItemStatus] [bit] NOT NULL,
	[TagID] [int] NOT NULL,
	[BarcodeID] [int] NOT NULL,
	[BrandID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[ReaderID] [int] IDENTITY(1,1) NOT NULL,
	[IPaddress] [varchar](200) NOT NULL,
	[NumAntennas] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](200) NOT NULL,
	[StoreLocation] [varchar](200) NOT NULL,
	[ItemStatus] [bit] NOT NULL,
	[TagID] [int] NOT NULL,
	[BarcodeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[EPC] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserIdentityNumber] [varchar](200) NOT NULL,
	[UserName] [varchar](200) NOT NULL,
	[UserSurname] [varchar](200) NOT NULL,
	[UserEmail] [varchar](200) NOT NULL,
	[UserPassword] [varchar](200) NOT NULL,
	[UserAdmin] [bit] NOT NULL,
	[UserActivated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_UserEmail] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_UserIdentityNumber] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Antenna]  WITH CHECK ADD  CONSTRAINT [FK_AntennaReader] FOREIGN KEY([ReaderID])
REFERENCES [dbo].[Reader] ([ReaderID])
GO
ALTER TABLE [dbo].[Antenna] CHECK CONSTRAINT [FK_AntennaReader]
GO
ALTER TABLE [dbo].[BookOut]  WITH CHECK ADD  CONSTRAINT [FK_BookOutUSer] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BookOut] CHECK CONSTRAINT [FK_BookOutUSer]
GO
ALTER TABLE [dbo].[BookOutItem]  WITH CHECK ADD  CONSTRAINT [FK_BookOut_Item] FOREIGN KEY([BookOutID])
REFERENCES [dbo].[BookOut] ([BookOutID])
GO
ALTER TABLE [dbo].[BookOutItem] CHECK CONSTRAINT [FK_BookOut_Item]
GO
ALTER TABLE [dbo].[BookOutItem]  WITH CHECK ADD  CONSTRAINT [FK_BookOutItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[BookOutItem] CHECK CONSTRAINT [FK_BookOutItem_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_ItemBarcode] FOREIGN KEY([BarcodeID])
REFERENCES [dbo].[Barcode] ([BarcodeID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_ItemBarcode]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_ItemBrand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_ItemBrand]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_ItemCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_ItemCategory]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_ItemTag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_ItemTag]
GO
ALTER TABLE [dbo].[Reader]  WITH CHECK ADD  CONSTRAINT [FK_ReaderStore] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Reader] CHECK CONSTRAINT [FK_ReaderStore]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_StockItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_StockItem]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_StockStore] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_StockStore]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntenna]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAntenna]
	@AntennaID int
AS
BEGIN
Delete from dbo.[Antenna] where [AntennaID] = @AntennaID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBarcode]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBarcode]
	@BarcodeID int
AS
BEGIN
Delete from dbo.[Barcode] where [BarcodeID] = @BarcodeID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBookOut]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBookOut]
	@BookOutID int
AS
BEGIN
Delete from dbo.[BookOut] where [BookOutID] = @BookOutID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBookOutItem]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBookOutItem]
	@BookOutItemID int
AS
BEGIN
Delete from dbo.[BookOutItem] where [BookOutItemID] = @BookOutItemID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBrand]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBrand]
	@BrandID int
AS
BEGIN
Delete from dbo.[Brand] where [BrandID] = @BrandID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCategory]
	@CategoryID int
AS
BEGIN
Delete from dbo.[Category] where [CategoryID] = @CategoryID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteItem]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteItem]
	@ItemID int
AS
BEGIN
Delete from dbo.[Item] where [ItemID] = @ItemID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteReader]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteReader]
	@ReaderID int
AS
BEGIN
Delete from dbo.[Reader] where [ReaderID] = @ReaderID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStock]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStock]
	@StockID int
AS
BEGIN
Delete from dbo.[Stock] where [StockID] = @StockID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStore]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStore]
	@StoreID int
AS
BEGIN
Delete from dbo.[Store] where [StoreID] = @StoreID 
END
GO
/****** Object:  StoredProcedure [dbo].[Deletesysdiagrams]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Deletesysdiagrams]
	@diagram_id int
AS
BEGIN
Delete from dbo.[sysdiagrams] where [diagram_id] = @diagram_id 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTag]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTag]
	@TagID int
AS
BEGIN
Delete from dbo.[Tag] where [TagID] = @TagID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]
	@UserID int
AS
BEGIN
Delete from dbo.[User] where [UserID] = @UserID 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAntenna]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAntenna]
	@AntennaNumber int, 
	@ReaderID int, 
	@RxPower decimal, 
	@TxPower decimal,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Antenna]([AntennaNumber],[ReaderID],[RxPower],[TxPower])
values (@AntennaNumber,@ReaderID,@RxPower,@TxPower)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertBarcode]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBarcode]
	@BarcodeNumber varchar(200),
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Barcode]([BarcodeNumber])
values (@BarcodeNumber)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertBookOut]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBookOut]
	@Date datetime, 
	@Project varchar(200), 
	@Reason varchar(300), 
	@UserID int,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[BookOut]([Date],[Project],[Reason],[UserID])
values (@Date,@Project,@Reason,@UserID)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertBookOutItem]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBookOutItem]
	@BookOutID int, 
	@ItemID int, 
	@Quantity int,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[BookOutItem]([BookOutID],[ItemID],[Quantity])
values (@BookOutID,@ItemID,@Quantity)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertBrand]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBrand]
	@BrandDescription varchar(300), 
	@BrandName varchar(200),
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Brand]([BrandDescription],[BrandName])
values (@BrandDescription,@BrandName)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertCategory]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCategory]
	@CategoryDescription varchar(300), 
	@CategoryName varchar(200),
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Category]([CategoryDescription],[CategoryName])
values (@CategoryDescription,@CategoryName)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertItem]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertItem]
	@BarcodeID int, 
	@BrandID int, 
	@CategoryID int, 
	@ItemDescription varchar(200), 
	@ItemName varchar(200), 
	@ItemStatus bit, 
	@TagID int,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Item]([BarcodeID],[BrandID],[CategoryID],[ItemDescription],[ItemName],[ItemStatus],[TagID])
values (@BarcodeID,@BrandID,@CategoryID,@ItemDescription,@ItemName,@ItemStatus,@TagID)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertReader]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertReader]
	@IPaddress varchar(200), 
	@NumAntennas int, 
	@StoreID int,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Reader]([IPaddress],[NumAntennas],[StoreID])
values (@IPaddress,@NumAntennas,@StoreID)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertStock]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStock]
	@ItemID int, 
	@Quantity int, 
	@StoreID int,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Stock]([ItemID],[Quantity],[StoreID])
values (@ItemID,@Quantity,@StoreID)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertStore]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStore]
	@BarcodeID int, 
	@ItemStatus bit, 
	@StoreLocation varchar(200), 
	@StoreName varchar(200), 
	@TagID int,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Store]([BarcodeID],[ItemStatus],[StoreLocation],[StoreName],[TagID])
values (@BarcodeID,@ItemStatus,@StoreLocation,@StoreName,@TagID)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[Insertsysdiagrams]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insertsysdiagrams]
	@definition varbinary(max), 
	@name nvarchar(128), 
	@principal_id int, 
	@version int,
	@ID INT OUT
AS
BEGIN

Insert into dbo.[sysdiagrams]([definition],[name],[principal_id],[version])
values (@definition,@name,@principal_id,@version)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertTag]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTag]
	@EPC varchar(200),
	@ID INT OUT
AS
BEGIN

Insert into dbo.[Tag]([EPC])
values (@EPC)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUser]
	@UserActivated bit, 
	@UserAdmin bit, 
	@UserEmail varchar(200), 
	@UserIdentityNumber varchar(200), 
	@UserName varchar(200), 
	@UserPassword varchar(200), 
	@UserSurname varchar(200),
	@ID INT OUT
AS
BEGIN

Insert into dbo.[User]([UserActivated],[UserAdmin],[UserEmail],[UserIdentityNumber],[UserName],[UserPassword],[UserSurname])
values (@UserActivated,@UserAdmin,@UserEmail,@UserIdentityNumber,@UserName,@UserPassword,@UserSurname)

set @ID = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAntenna]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAntenna]
	@AntennaNumber int, 
	@ReaderID int, 
	@RxPower decimal, 
	@TxPower decimal, 
	@AntennaID int
AS
BEGIN
Update dbo.[Antenna] set  [AntennaNumber] = @AntennaNumber , [ReaderID] = @ReaderID , [RxPower] = @RxPower , [TxPower] = @TxPower  where [AntennaID] = @AntennaID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBarcode]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBarcode]
	@BarcodeNumber varchar(200), 
	@BarcodeID int
AS
BEGIN
Update dbo.[Barcode] set  [BarcodeNumber] = @BarcodeNumber  where [BarcodeID] = @BarcodeID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBookOut]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBookOut]
	@Date datetime, 
	@Project varchar(200), 
	@Reason varchar(300), 
	@UserID int, 
	@BookOutID int
AS
BEGIN
Update dbo.[BookOut] set  [Date] = @Date , [Project] = @Project , [Reason] = @Reason , [UserID] = @UserID  where [BookOutID] = @BookOutID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBookOutItem]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBookOutItem]
	@BookOutID int, 
	@ItemID int, 
	@Quantity int, 
	@BookOutItemID int
AS
BEGIN
Update dbo.[BookOutItem] set  [BookOutID] = @BookOutID , [ItemID] = @ItemID , [Quantity] = @Quantity  where [BookOutItemID] = @BookOutItemID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBrand]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBrand]
	@BrandDescription varchar(300), 
	@BrandName varchar(200), 
	@BrandID int
AS
BEGIN
Update dbo.[Brand] set  [BrandDescription] = @BrandDescription , [BrandName] = @BrandName  where [BrandID] = @BrandID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategory]
	@CategoryDescription varchar(300), 
	@CategoryName varchar(200), 
	@CategoryID int
AS
BEGIN
Update dbo.[Category] set  [CategoryDescription] = @CategoryDescription , [CategoryName] = @CategoryName  where [CategoryID] = @CategoryID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItem]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItem]
	@BarcodeID int, 
	@BrandID int, 
	@CategoryID int, 
	@ItemDescription varchar(200), 
	@ItemName varchar(200), 
	@ItemStatus bit, 
	@TagID int, 
	@ItemID int
AS
BEGIN
Update dbo.[Item] set  [BarcodeID] = @BarcodeID , [BrandID] = @BrandID , [CategoryID] = @CategoryID , [ItemDescription] = @ItemDescription , [ItemName] = @ItemName , [ItemStatus] = @ItemStatus , [TagID] = @TagID  where [ItemID] = @ItemID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateReader]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReader]
	@IPaddress varchar(200), 
	@NumAntennas int, 
	@StoreID int, 
	@ReaderID int
AS
BEGIN
Update dbo.[Reader] set  [IPaddress] = @IPaddress , [NumAntennas] = @NumAntennas , [StoreID] = @StoreID  where [ReaderID] = @ReaderID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStock]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStock]
	@ItemID int, 
	@Quantity int, 
	@StoreID int, 
	@StockID int
AS
BEGIN
Update dbo.[Stock] set  [ItemID] = @ItemID , [Quantity] = @Quantity , [StoreID] = @StoreID  where [StockID] = @StockID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStore]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStore]
	@BarcodeID int, 
	@ItemStatus bit, 
	@StoreLocation varchar(200), 
	@StoreName varchar(200), 
	@TagID int, 
	@StoreID int
AS
BEGIN
Update dbo.[Store] set  [BarcodeID] = @BarcodeID , [ItemStatus] = @ItemStatus , [StoreLocation] = @StoreLocation , [StoreName] = @StoreName , [TagID] = @TagID  where [StoreID] = @StoreID 
END
GO
/****** Object:  StoredProcedure [dbo].[Updatesysdiagrams]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Updatesysdiagrams]
	@definition varbinary(max), 
	@name nvarchar(128), 
	@principal_id int, 
	@version int, 
	@diagram_id int
AS
BEGIN
Update dbo.[sysdiagrams] set  [definition] = @definition , [name] = @name , [principal_id] = @principal_id , [version] = @version  where [diagram_id] = @diagram_id 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTag]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTag]
	@EPC varchar(200), 
	@TagID int
AS
BEGIN
Update dbo.[Tag] set  [EPC] = @EPC  where [TagID] = @TagID 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 2021-04-07 오후 3:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
	@UserActivated bit, 
	@UserAdmin bit, 
	@UserEmail varchar(200), 
	@UserIdentityNumber varchar(200), 
	@UserName varchar(200), 
	@UserPassword varchar(200), 
	@UserSurname varchar(200), 
	@UserID int
AS
BEGIN
Update dbo.[User] set  [UserActivated] = @UserActivated , [UserAdmin] = @UserAdmin , [UserEmail] = @UserEmail , [UserIdentityNumber] = @UserIdentityNumber , [UserName] = @UserName , [UserPassword] = @UserPassword , [UserSurname] = @UserSurname  where [UserID] = @UserID 
END
GO
USE [master]
GO
ALTER DATABASE [SMS] SET  READ_WRITE 
GO
