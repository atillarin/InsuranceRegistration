USE [master]
GO
/****** Object:  Database [BupaPatika]    Script Date: 14.02.2022 04:44:20 ******/
CREATE DATABASE [BupaPatika]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BupaPatika', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BupaPatika.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BupaPatika_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BupaPatika_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BupaPatika] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BupaPatika].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BupaPatika] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BupaPatika] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BupaPatika] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BupaPatika] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BupaPatika] SET ARITHABORT OFF 
GO
ALTER DATABASE [BupaPatika] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BupaPatika] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BupaPatika] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BupaPatika] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BupaPatika] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BupaPatika] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BupaPatika] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BupaPatika] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BupaPatika] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BupaPatika] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BupaPatika] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BupaPatika] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BupaPatika] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BupaPatika] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BupaPatika] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BupaPatika] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BupaPatika] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BupaPatika] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BupaPatika] SET  MULTI_USER 
GO
ALTER DATABASE [BupaPatika] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BupaPatika] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BupaPatika] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BupaPatika] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BupaPatika] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BupaPatika] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BupaPatika] SET QUERY_STORE = OFF
GO
USE [BupaPatika]
GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[CandidateID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](10) NOT NULL,
	[PersonalID] [nvarchar](11) NOT NULL,
	[Gender] [nvarchar](5) NOT NULL,
	[BirthDate] [nvarchar](10) NULL,
	[Phone] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[MartialStatus] [nvarchar](10) NOT NULL,
	[Relationship] [nvarchar](10) NOT NULL,
	[Profession] [nvarchar](20) NULL,
	[Height] [smallint] NULL,
	[Weight] [smallint] NULL,
	[Address] [nvarchar](60) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](10) NOT NULL,
	[PersonalID] [nvarchar](11) NOT NULL,
	[Gender] [nvarchar](5) NOT NULL,
	[BirthDate] [nvarchar](10) NULL,
	[Phone] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](60) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferCandidates]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferCandidates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OfferID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
 CONSTRAINT [PK_OfferCandidates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferID] [int] IDENTITY(1000,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Installment] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[IsPaid] [bit] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[OfferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](30) NULL,
	[Premium] [int] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OfferCandidates]  WITH CHECK ADD  CONSTRAINT [FK_OfferCandidates_InsuranceCandidates] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidates] ([CandidateID])
GO
ALTER TABLE [dbo].[OfferCandidates] CHECK CONSTRAINT [FK_OfferCandidates_InsuranceCandidates]
GO
ALTER TABLE [dbo].[OfferCandidates]  WITH CHECK ADD  CONSTRAINT [FK_OfferCandidates_OfferCandidates] FOREIGN KEY([OfferID])
REFERENCES [dbo].[Offers] ([OfferID])
GO
ALTER TABLE [dbo].[OfferCandidates] CHECK CONSTRAINT [FK_OfferCandidates_OfferCandidates]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Customers]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Products]
GO
/****** Object:  StoredProcedure [dbo].[sp_Candidate_Insert]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Candidate_Insert] (@firstName nvarchar(20),@lastName nvarchar(10),@personalID nvarchar(11),@gender nvarchar(5),@birthDate nvarchar(10),@phone nvarchar(24),
@email nvarchar(50),@martialStatus nvarchar(10),@relationship nvarchar(10),@profession nvarchar(20),@height smallint,@weight smallint,@address nvarchar(60))
AS
BEGIN
	 SET NOCOUNT ON;
     INSERT INTO Candidates(FirstName,LastName,PersonalID,Gender,BirthDate,Phone,Email,MartialStatus,Relationship,Profession,Height,Weight,Address) 
	 VALUES(@firstName,@lastName,@personalID,@gender,@birthDate,@phone,@email,@martialStatus,@relationship,@profession,@height,@weight,@address)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Insert]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Customer_Insert](@firstName nvarchar(20),@lastName nvarchar(10),@personalID nvarchar(11),@gender nvarchar(5),@birthDate nvarchar(10),@phone nvarchar(24),@email nvarchar(50),@address nvarchar(60))
AS
BEGIN
	 
     INSERT INTO Customers(FirstName,LastName,PersonalID,Gender,BirthDate,Phone,Email,Address) 
	 VALUES(@firstName,@lastName,@personalID,@gender,@birthDate,@phone,@email,@address)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllOffers]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetAllOffers]
as
begin

select Offers.OfferID,Candidates.FirstName,Candidates.LastName, Products.ProductName, Offers.Installment,Offers.TotalAmount,Offers.IsPaid from Offers 
inner join Customers on Offers.CustomerID = Customers.CustomerId
inner join Products on Products.ProductID = Offers.ProductID
inner join OfferCandidates on OfferCandidates.OfferID = Offers.OfferID
inner join Candidates on Candidates.CandidateID= OfferCandidates.CandidateID

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProducts]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetProducts]
AS
BEGIN
	SELECT [ProductID],[ProductName] AS Teminatlar,[Premium] AS Prim  FROM [Products]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Offer_Insert]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Offer_Insert] (@productID int,@customerID int,@Installment int,@TotalAmount int,@IsPaid bit)
AS
BEGIN
	INSERT INTO Offers (ProductID,CustomerID,Installment,TotalAmount,IsPaid)
	VALUES (@productID,@customerID,@Installment,@TotalAmount,@IsPaid)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OfferCandidate_Insert]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_OfferCandidate_Insert] (@offerId int, @candidateId int)
AS
BEGIN
	INSERT INTO OfferCandidates (OfferID,CandidateID)
	VALUES (@offerId,@candidateId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Products_Insert]    Script Date: 14.02.2022 04:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Products_Insert](@productName nvarchar(20),@premium int)
AS
BEGIN
     INSERT INTO Products(ProductName,Premium) VALUES(@productName,@premium)
END
GO
USE [master]
GO
ALTER DATABASE [BupaPatika] SET  READ_WRITE 
GO
