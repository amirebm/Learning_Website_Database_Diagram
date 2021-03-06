USE [master]
GO
/****** Object:  Database [Learning_Site]    Script Date: 9/13/2018 9:33:29 AM ******/
CREATE DATABASE [Learning_Site]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Learning', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Learning.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Learning_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Learning_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Learning_Site] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Learning_Site].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Learning_Site] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Learning_Site] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Learning_Site] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Learning_Site] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Learning_Site] SET ARITHABORT OFF 
GO
ALTER DATABASE [Learning_Site] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Learning_Site] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Learning_Site] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Learning_Site] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Learning_Site] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Learning_Site] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Learning_Site] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Learning_Site] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Learning_Site] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Learning_Site] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Learning_Site] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Learning_Site] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Learning_Site] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Learning_Site] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Learning_Site] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Learning_Site] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Learning_Site] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Learning_Site] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Learning_Site] SET RECOVERY FULL 
GO
ALTER DATABASE [Learning_Site] SET  MULTI_USER 
GO
ALTER DATABASE [Learning_Site] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Learning_Site] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Learning_Site] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Learning_Site] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Learning_Site', N'ON'
GO
USE [Learning_Site]
GO
/****** Object:  Table [dbo].[Access_User]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Access_User](
	[Access_Name] [nchar](10) NOT NULL,
	[Access_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Access_User] PRIMARY KEY CLUSTERED 
(
	[Access_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[City_Address] [nvarchar](50) NOT NULL,
	[Info_ID] [int] NOT NULL,
	[City_ID] [int] NOT NULL,
	[Address_ID] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Parent_Category_ID] [int] NOT NULL,
	[Subject_Name] [int] NOT NULL,
	[Child_Category_ID] [int] NOT NULL,
 CONSTRAINT [PK_Product_Subjects] PRIMARY KEY CLUSTERED 
(
	[Child_Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_Name] [nvarchar](50) NOT NULL,
	[City_ID] [int] NOT NULL,
	[State_ID] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment_Tree]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment_Tree](
	[Parent_Comment_ID] [int] NOT NULL,
	[Child_Comment_ID] [int] NOT NULL,
 CONSTRAINT [PK_Comment_Tree] PRIMARY KEY CLUSTERED 
(
	[Child_Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Commnets]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commnets](
	[Comment_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Comment_Context] [nvarchar](max) NOT NULL,
	[Commnet_Date] [date] NOT NULL,
	[Commenter_ID] [int] NULL,
	[Enable] [bit] NOT NULL,
	[Controller_Comment_ID] [int] NOT NULL,
	[Read_OR_Unread] [bit] NOT NULL,
 CONSTRAINT [PK_Commnets] PRIMARY KEY CLUSTERED 
(
	[Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Country_Name] [nvarchar](50) NOT NULL,
	[Country_ID] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Degree]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[Degree_Name] [nchar](10) NOT NULL,
	[Degree_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[Degree_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount_Product]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_Product](
	[Discount_ID] [int] NOT NULL,
	[Discount_Percent] [int] NOT NULL,
	[Discount_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Discount_Product] PRIMARY KEY CLUSTERED 
(
	[Discount_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount_Users]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_Users](
	[Discount_Percent] [int] NOT NULL,
	[Discount_percent_ID] [int] NOT NULL,
 CONSTRAINT [PK_Discount_Users] PRIMARY KEY CLUSTERED 
(
	[Discount_percent_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Email_Confirm]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Confirm](
	[Info_ID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Ok_Or_Not] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Positon_ID] [int] NOT NULL,
	[Date_Of_Entry] [date] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Info_ID] [int] NOT NULL,
	[Financial_ID] [int] NOT NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Type]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Type](
	[Employee_ID] [int] NOT NULL,
	[Employee_Category_Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Emploees] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenditure]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenditure](
	[Expenditure_Time] [time](7) NOT NULL,
	[Expense] [int] NOT NULL,
	[Expense_Type_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expense_Type]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense_Type](
	[Expense_Name] [nchar](10) NOT NULL,
	[Expense_ID] [int] NOT NULL,
 CONSTRAINT [PK_Expense_Type] PRIMARY KEY CLUSTERED 
(
	[Expense_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[General_Fields]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[General_Fields](
	[Filed_Name] [nvarchar](50) NOT NULL,
	[Field_ID] [int] NOT NULL,
 CONSTRAINT [PK_General_Fields] PRIMARY KEY CLUSTERED 
(
	[Field_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Idenity_Type]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idenity_Type](
	[Identity_Name] [nchar](10) NOT NULL,
	[Identity_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Idenity_Type] PRIMARY KEY CLUSTERED 
(
	[Identity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[List_Of_Purchase]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_Of_Purchase](
	[User_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Date_Of_Purchase	nvarchar(50)	Unchecked]]] [nvarchar](50) NOT NULL,
	[Purchase_ID] [int] NOT NULL,
	[Discount_Users_ID] [int] NULL,
 CONSTRAINT [PK_List_Of_Purchase] PRIMARY KEY CLUSTERED 
(
	[Purchase_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Major]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[Major_Name] [nvarchar](50) NOT NULL,
	[Major_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[Major_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person_Access]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Access](
	[Person_ID] [int] NOT NULL,
	[Access_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person_Degrees]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Degrees](
	[Degree_ID] [int] NOT NULL,
	[Info_ID] [int] NOT NULL,
 CONSTRAINT [PK_Person_Degrees] PRIMARY KEY CLUSTERED 
(
	[Degree_ID] ASC,
	[Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person_Majors]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Majors](
	[Info_ID] [int] NOT NULL,
	[Sub_Major_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personal_Information]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal_Information](
	[Info_ID] [int] NOT NULL,
	[Person_Name] [nvarchar](50) NULL,
	[Person_Family] [nvarchar](50) NULL,
	[National_ID] [nchar](10) NULL,
	[Date_Of_Birth] [nvarchar](50) NULL,
	[Sex] [bit] NULL,
	[Image] [image] NULL,
	[Email] [nvarchar](50) NULL,
	[Tel_ID] [int] NULL,
	[Nationality_ID] [int] NULL,
	[City_Birth_ID] [int] NULL,
	[Lan_Preference_ID] [int] NULL,
	[User_Name] [nvarchar](50) NULL,
	[Login_Pass] [nvarchar](50) NULL,
	[Access_ID] [int] NOT NULL,
 CONSTRAINT [PK_Personal_Information] PRIMARY KEY CLUSTERED 
(
	[Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personel_Hierarchy]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel_Hierarchy](
	[Parent_Personel_ID] [int] NOT NULL,
	[Child_Personel_ID] [int] NOT NULL,
 CONSTRAINT [PK_Personel_Hierarchy] PRIMARY KEY CLUSTERED 
(
	[Child_Personel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Categories]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Categories](
	[Product_ID] [int] NOT NULL,
	[Child_Category] [int] NOT NULL,
 CONSTRAINT [PK_Product_Categories] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC,
	[Child_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Creators]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Creators](
	[Product_ID] [int] NOT NULL,
	[Info_ID] [int] NOT NULL,
 CONSTRAINT [PK_Product_Creators] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC,
	[Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Properties]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Properties](
	[Product_Type_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Qaulity] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Quality]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Quality](
	[Quality_Level] [nvarchar](50) NOT NULL,
	[Quality_ID] [int] NOT NULL,
 CONSTRAINT [PK_Product_Quality] PRIMARY KEY CLUSTERED 
(
	[Quality_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[Product_Type_Name] [nchar](10) NOT NULL,
	[Product_Type_ID] [int] NOT NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[Product_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_Name] [nvarchar](50) NOT NULL,
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sub_Category_ID] [int] NOT NULL,
	[Product_Properties_ID] [int] NOT NULL,
	[Date_Of_Creation] [time](7) NOT NULL,
	[Price] [int] NOT NULL,
	[Star] [int] NOT NULL,
	[Number_Of_Visit] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Discount_ID] [int] NOT NULL,
	[Language_ID] [int] NOT NULL,
	[Quality_ID] [int] NOT NULL,
	[Quanity] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proficiency]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proficiency](
	[Employee_ID] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
 CONSTRAINT [PK_Proficiency] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC,
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase__PreConfirmed]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase__PreConfirmed](
	[Purchase_ID] [int] NOT NULL,
	[Purchased_Or_Not] [bit] NOT NULL,
 CONSTRAINT [PK_Purchase__PreConfirmed] PRIMARY KEY CLUSTERED 
(
	[Purchase_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale_Type]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Type](
	[Sale_Type_Name] [nchar](10) NOT NULL,
	[Sale_Type_ID] [int] NOT NULL,
 CONSTRAINT [PK_Sale_Type] PRIMARY KEY CLUSTERED 
(
	[Sale_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[State_Name] [nvarchar](50) NOT NULL,
	[State_ID] [int] NOT NULL,
	[Country_ID] [int] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sub_Major]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Major](
	[Sub_Major_Name] [nvarchar](50) NOT NULL,
	[Sub_Major_ID] [int] IDENTITY(1,1) NOT NULL,
	[Main_Major_ID] [int] NOT NULL,
 CONSTRAINT [PK_Sub_Major] PRIMARY KEY CLUSTERED 
(
	[Sub_Major_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sub_Subject]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Subject](
	[Sub_Subject_Type] [nvarchar](50) NOT NULL,
	[Sub_Subject_ID] [int] NOT NULL,
	[Subject_ID] [int] NOT NULL,
 CONSTRAINT [PK_Sub_Subject] PRIMARY KEY CLUSTERED 
(
	[Sub_Subject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject_General_Type]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_General_Type](
	[Subject_Type] [nvarchar](50) NOT NULL,
	[Subject_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Subject_General_Type] PRIMARY KEY CLUSTERED 
(
	[Subject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Product_Child_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers_Hierarchy]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers_Hierarchy](
	[Parent_Teacher_ID] [int] NOT NULL,
	[Child_Teacher_ID] [int] NOT NULL,
 CONSTRAINT [PK_Teachers_Hierarchy] PRIMARY KEY CLUSTERED 
(
	[Child_Teacher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tel_Confirm]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tel_Confirm](
	[Info_ID] [int] NOT NULL,
	[Tel] [int] NOT NULL,
	[Ok_Or_Not] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Purchase]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Purchase](
	[List_Of_Pur_ID] [int] NOT NULL,
	[Date_Of_Finilized] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Request]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Request](
	[User_ID] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Date_Of_request] [int] NOT NULL,
	[[Type_Of_Learning] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Site]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Site](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Info_ID] [int] NOT NULL,
	[Identity_Type_ID] [int] NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[Pass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Tells]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Tells](
	[Person_ID] [int] NOT NULL,
	[Tel_Num] [int] NULL,
	[Tel_ID] [int] NOT NULL,
 CONSTRAINT [PK_User_Tells] PRIMARY KEY CLUSTERED 
(
	[Tel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users_Favorites]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Favorites](
	[User_ID] [int] NOT NULL,
	[Field_ID] [int] NOT NULL,
 CONSTRAINT [PK_Users_Favorites] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[Field_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebSite_Personel]    Script Date: 9/13/2018 9:33:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSite_Personel](
	[Child_Personel_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([City_ID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Personal_Information] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Personal_Information] ([Info_ID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Personal_Information]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories_Product_Categories] FOREIGN KEY([Parent_Category_ID])
REFERENCES [dbo].[Categories] ([Child_Category_ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Product_Categories_Product_Categories]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Product_Subjects_Sub_Subject] FOREIGN KEY([Parent_Category_ID])
REFERENCES [dbo].[Sub_Subject] ([Sub_Subject_ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Product_Subjects_Sub_Subject]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([State_ID])
REFERENCES [dbo].[State] ([State_ID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Comment_Tree]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Tree_Comment_Tree] FOREIGN KEY([Parent_Comment_ID])
REFERENCES [dbo].[Comment_Tree] ([Child_Comment_ID])
GO
ALTER TABLE [dbo].[Comment_Tree] CHECK CONSTRAINT [FK_Comment_Tree_Comment_Tree]
GO
ALTER TABLE [dbo].[Commnets]  WITH CHECK ADD  CONSTRAINT [FK_Commnets_Comment_Tree] FOREIGN KEY([Comment_ID])
REFERENCES [dbo].[Comment_Tree] ([Child_Comment_ID])
GO
ALTER TABLE [dbo].[Commnets] CHECK CONSTRAINT [FK_Commnets_Comment_Tree]
GO
ALTER TABLE [dbo].[Commnets]  WITH CHECK ADD  CONSTRAINT [FK_Commnets_Person] FOREIGN KEY([Commenter_ID])
REFERENCES [dbo].[User_Site] ([User_ID])
GO
ALTER TABLE [dbo].[Commnets] CHECK CONSTRAINT [FK_Commnets_Person]
GO
ALTER TABLE [dbo].[Commnets]  WITH CHECK ADD  CONSTRAINT [FK_Commnets_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Commnets] CHECK CONSTRAINT [FK_Commnets_Products]
GO
ALTER TABLE [dbo].[Email_Confirm]  WITH CHECK ADD  CONSTRAINT [FK_Email_Confirm_Personal_Information] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Personal_Information] ([Info_ID])
GO
ALTER TABLE [dbo].[Email_Confirm] CHECK CONSTRAINT [FK_Email_Confirm_Personal_Information]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Personal_Information] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Personal_Information] ([Info_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Personal_Information]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Personel_Hierarchy] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Personel_Hierarchy] ([Child_Personel_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Personel_Hierarchy]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Teachers] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Teachers] ([Employee_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Teachers]
GO
ALTER TABLE [dbo].[Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_Expenditure_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Expenditure] CHECK CONSTRAINT [FK_Expenditure_Employee]
GO
ALTER TABLE [dbo].[Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_Expenditure_Expense_Type] FOREIGN KEY([Expense_Type_ID])
REFERENCES [dbo].[Expense_Type] ([Expense_ID])
GO
ALTER TABLE [dbo].[Expenditure] CHECK CONSTRAINT [FK_Expenditure_Expense_Type]
GO
ALTER TABLE [dbo].[List_Of_Purchase]  WITH CHECK ADD  CONSTRAINT [FK_List_Of_Purchase_Discount_Users] FOREIGN KEY([Discount_Users_ID])
REFERENCES [dbo].[Discount_Users] ([Discount_percent_ID])
GO
ALTER TABLE [dbo].[List_Of_Purchase] CHECK CONSTRAINT [FK_List_Of_Purchase_Discount_Users]
GO
ALTER TABLE [dbo].[List_Of_Purchase]  WITH CHECK ADD  CONSTRAINT [FK_List_Of_Purchase_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[List_Of_Purchase] CHECK CONSTRAINT [FK_List_Of_Purchase_Products]
GO
ALTER TABLE [dbo].[List_Of_Purchase]  WITH CHECK ADD  CONSTRAINT [FK_List_Of_Purchase_User_Site] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User_Site] ([User_ID])
GO
ALTER TABLE [dbo].[List_Of_Purchase] CHECK CONSTRAINT [FK_List_Of_Purchase_User_Site]
GO
ALTER TABLE [dbo].[Person_Access]  WITH CHECK ADD  CONSTRAINT [FK_Person_Access_Access_User] FOREIGN KEY([Access_ID])
REFERENCES [dbo].[Access_User] ([Access_ID])
GO
ALTER TABLE [dbo].[Person_Access] CHECK CONSTRAINT [FK_Person_Access_Access_User]
GO
ALTER TABLE [dbo].[Person_Degrees]  WITH CHECK ADD  CONSTRAINT [FK_Person_Degrees_Degree] FOREIGN KEY([Degree_ID])
REFERENCES [dbo].[Degree] ([Degree_ID])
GO
ALTER TABLE [dbo].[Person_Degrees] CHECK CONSTRAINT [FK_Person_Degrees_Degree]
GO
ALTER TABLE [dbo].[Person_Degrees]  WITH CHECK ADD  CONSTRAINT [FK_Person_Degrees_Personal_Information] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Personal_Information] ([Info_ID])
GO
ALTER TABLE [dbo].[Person_Degrees] CHECK CONSTRAINT [FK_Person_Degrees_Personal_Information]
GO
ALTER TABLE [dbo].[Person_Majors]  WITH CHECK ADD  CONSTRAINT [FK_Person_Majors_Personal_Information] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Personal_Information] ([Info_ID])
GO
ALTER TABLE [dbo].[Person_Majors] CHECK CONSTRAINT [FK_Person_Majors_Personal_Information]
GO
ALTER TABLE [dbo].[Person_Majors]  WITH CHECK ADD  CONSTRAINT [FK_Person_Majors_Sub_Major] FOREIGN KEY([Sub_Major_ID])
REFERENCES [dbo].[Sub_Major] ([Sub_Major_ID])
GO
ALTER TABLE [dbo].[Person_Majors] CHECK CONSTRAINT [FK_Person_Majors_Sub_Major]
GO
ALTER TABLE [dbo].[Personal_Information]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Information_Access_User] FOREIGN KEY([Access_ID])
REFERENCES [dbo].[Access_User] ([Access_ID])
GO
ALTER TABLE [dbo].[Personal_Information] CHECK CONSTRAINT [FK_Personal_Information_Access_User]
GO
ALTER TABLE [dbo].[Personel_Hierarchy]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Hierarchy_Personel_Hierarchy] FOREIGN KEY([Parent_Personel_ID])
REFERENCES [dbo].[Personel_Hierarchy] ([Child_Personel_ID])
GO
ALTER TABLE [dbo].[Personel_Hierarchy] CHECK CONSTRAINT [FK_Personel_Hierarchy_Personel_Hierarchy]
GO
ALTER TABLE [dbo].[Product_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories_Categories] FOREIGN KEY([Child_Category])
REFERENCES [dbo].[Categories] ([Child_Category_ID])
GO
ALTER TABLE [dbo].[Product_Categories] CHECK CONSTRAINT [FK_Product_Categories_Categories]
GO
ALTER TABLE [dbo].[Product_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Categories] CHECK CONSTRAINT [FK_Product_Categories_Products]
GO
ALTER TABLE [dbo].[Product_Creators]  WITH CHECK ADD  CONSTRAINT [FK_Product_Creators_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Creators] CHECK CONSTRAINT [FK_Product_Creators_Products]
GO
ALTER TABLE [dbo].[Product_Properties]  WITH CHECK ADD  CONSTRAINT [FK_Product_Properties_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Product_Properties] CHECK CONSTRAINT [FK_Product_Properties_Product_Type]
GO
ALTER TABLE [dbo].[Product_Properties]  WITH CHECK ADD  CONSTRAINT [FK_Product_Properties_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Properties] CHECK CONSTRAINT [FK_Product_Properties_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Country] FOREIGN KEY([Language_ID])
REFERENCES [dbo].[Country] ([Country_ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Country]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Discount_Product] FOREIGN KEY([Discount_ID])
REFERENCES [dbo].[Discount_Product] ([Discount_ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Discount_Product]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_Quality] FOREIGN KEY([Quality_ID])
REFERENCES [dbo].[Product_Quality] ([Quality_ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_Quality]
GO
ALTER TABLE [dbo].[Proficiency]  WITH CHECK ADD  CONSTRAINT [FK_Proficiency_Categories] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([Child_Category_ID])
GO
ALTER TABLE [dbo].[Proficiency] CHECK CONSTRAINT [FK_Proficiency_Categories]
GO
ALTER TABLE [dbo].[Proficiency]  WITH CHECK ADD  CONSTRAINT [FK_Proficiency_Teachers] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Teachers] ([Employee_ID])
GO
ALTER TABLE [dbo].[Proficiency] CHECK CONSTRAINT [FK_Proficiency_Teachers]
GO
ALTER TABLE [dbo].[Purchase__PreConfirmed]  WITH CHECK ADD  CONSTRAINT [FK_Purchase__PreConfirmed_List_Of_Purchase] FOREIGN KEY([Purchase_ID])
REFERENCES [dbo].[List_Of_Purchase] ([Purchase_ID])
GO
ALTER TABLE [dbo].[Purchase__PreConfirmed] CHECK CONSTRAINT [FK_Purchase__PreConfirmed_List_Of_Purchase]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Country] ([Country_ID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[Sub_Major]  WITH CHECK ADD  CONSTRAINT [FK_Sub_Major_Major] FOREIGN KEY([Main_Major_ID])
REFERENCES [dbo].[Major] ([Major_ID])
GO
ALTER TABLE [dbo].[Sub_Major] CHECK CONSTRAINT [FK_Sub_Major_Major]
GO
ALTER TABLE [dbo].[Sub_Major]  WITH CHECK ADD  CONSTRAINT [FK_Sub_Major_Sub_Major] FOREIGN KEY([Main_Major_ID])
REFERENCES [dbo].[Sub_Major] ([Sub_Major_ID])
GO
ALTER TABLE [dbo].[Sub_Major] CHECK CONSTRAINT [FK_Sub_Major_Sub_Major]
GO
ALTER TABLE [dbo].[Sub_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Sub_Subject_Subject_General_Type] FOREIGN KEY([Subject_ID])
REFERENCES [dbo].[Subject_General_Type] ([Subject_ID])
GO
ALTER TABLE [dbo].[Sub_Subject] CHECK CONSTRAINT [FK_Sub_Subject_Subject_General_Type]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Teachers_Hierarchy] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Teachers_Hierarchy] ([Child_Teacher_ID])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Teachers_Hierarchy]
GO
ALTER TABLE [dbo].[Teachers_Hierarchy]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Hierarchy_Teachers_Hierarchy] FOREIGN KEY([Parent_Teacher_ID])
REFERENCES [dbo].[Teachers_Hierarchy] ([Child_Teacher_ID])
GO
ALTER TABLE [dbo].[Teachers_Hierarchy] CHECK CONSTRAINT [FK_Teachers_Hierarchy_Teachers_Hierarchy]
GO
ALTER TABLE [dbo].[Tel_Confirm]  WITH CHECK ADD  CONSTRAINT [FK_Tel_Confirm_Personal_Information] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Personal_Information] ([Info_ID])
GO
ALTER TABLE [dbo].[Tel_Confirm] CHECK CONSTRAINT [FK_Tel_Confirm_Personal_Information]
GO
ALTER TABLE [dbo].[Tel_Confirm]  WITH CHECK ADD  CONSTRAINT [FK_Tel_Confirm_User_Tells] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[User_Tells] ([Tel_ID])
GO
ALTER TABLE [dbo].[Tel_Confirm] CHECK CONSTRAINT [FK_Tel_Confirm_User_Tells]
GO
ALTER TABLE [dbo].[User_Purchase]  WITH CHECK ADD  CONSTRAINT [FK_User_Purchase_Purchase__PreConfirmed] FOREIGN KEY([List_Of_Pur_ID])
REFERENCES [dbo].[Purchase__PreConfirmed] ([Purchase_ID])
GO
ALTER TABLE [dbo].[User_Purchase] CHECK CONSTRAINT [FK_User_Purchase_Purchase__PreConfirmed]
GO
ALTER TABLE [dbo].[User_Request]  WITH CHECK ADD  CONSTRAINT [FK_User_Request_Categories] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([Child_Category_ID])
GO
ALTER TABLE [dbo].[User_Request] CHECK CONSTRAINT [FK_User_Request_Categories]
GO
ALTER TABLE [dbo].[User_Request]  WITH CHECK ADD  CONSTRAINT [FK_User_Request_Product_Type] FOREIGN KEY([[Type_Of_Learning])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[User_Request] CHECK CONSTRAINT [FK_User_Request_Product_Type]
GO
ALTER TABLE [dbo].[User_Request]  WITH CHECK ADD  CONSTRAINT [FK_User_Request_User_Site] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User_Site] ([User_ID])
GO
ALTER TABLE [dbo].[User_Request] CHECK CONSTRAINT [FK_User_Request_User_Site]
GO
ALTER TABLE [dbo].[User_Site]  WITH CHECK ADD  CONSTRAINT [FK_Person_Idenity_Type] FOREIGN KEY([Identity_Type_ID])
REFERENCES [dbo].[Idenity_Type] ([Identity_ID])
GO
ALTER TABLE [dbo].[User_Site] CHECK CONSTRAINT [FK_Person_Idenity_Type]
GO
ALTER TABLE [dbo].[User_Site]  WITH CHECK ADD  CONSTRAINT [FK_User_Site_Personal_Information] FOREIGN KEY([Info_ID])
REFERENCES [dbo].[Personal_Information] ([Info_ID])
GO
ALTER TABLE [dbo].[User_Site] CHECK CONSTRAINT [FK_User_Site_Personal_Information]
GO
ALTER TABLE [dbo].[User_Tells]  WITH CHECK ADD  CONSTRAINT [FK_User_Tells_Person] FOREIGN KEY([Person_ID])
REFERENCES [dbo].[User_Site] ([User_ID])
GO
ALTER TABLE [dbo].[User_Tells] CHECK CONSTRAINT [FK_User_Tells_Person]
GO
ALTER TABLE [dbo].[Users_Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Users_Favorites_General_Fields] FOREIGN KEY([Field_ID])
REFERENCES [dbo].[General_Fields] ([Field_ID])
GO
ALTER TABLE [dbo].[Users_Favorites] CHECK CONSTRAINT [FK_Users_Favorites_General_Fields]
GO
ALTER TABLE [dbo].[Users_Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Users_Favorites_User_Site] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User_Site] ([User_ID])
GO
ALTER TABLE [dbo].[Users_Favorites] CHECK CONSTRAINT [FK_Users_Favorites_User_Site]
GO
USE [master]
GO
ALTER DATABASE [Learning_Site] SET  READ_WRITE 
GO
