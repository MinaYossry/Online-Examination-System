USE [master]
GO
/****** Object:  Database [online_Exame]    Script Date: 2023-01-20 8:54:43 PM ******/
CREATE DATABASE [online_Exame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nline_Exame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\nline_Exame.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nline_Exame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\nline_Exame_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [online_Exame] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [online_Exame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [online_Exame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [online_Exame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [online_Exame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [online_Exame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [online_Exame] SET ARITHABORT OFF 
GO
ALTER DATABASE [online_Exame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [online_Exame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [online_Exame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [online_Exame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [online_Exame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [online_Exame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [online_Exame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [online_Exame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [online_Exame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [online_Exame] SET  DISABLE_BROKER 
GO
ALTER DATABASE [online_Exame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [online_Exame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [online_Exame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [online_Exame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [online_Exame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [online_Exame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [online_Exame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [online_Exame] SET RECOVERY FULL 
GO
ALTER DATABASE [online_Exame] SET  MULTI_USER 
GO
ALTER DATABASE [online_Exame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [online_Exame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [online_Exame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [online_Exame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [online_Exame] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'online_Exame', N'ON'
GO
ALTER DATABASE [online_Exame] SET QUERY_STORE = OFF
GO
USE [online_Exame]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Crs_ID] [int] NOT NULL,
	[Cr_Name] [varchar](50) NULL,
 CONSTRAINT [PK__Courses__56CAA5F5DF7F67BE] PRIMARY KEY CLUSTERED 
(
	[Crs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_ID] [int] NOT NULL,
	[Dept_Name] [varchar](20) NULL,
	[Dept_Description] [varchar](100) NULL,
	[Dept_Location] [varchar](100) NULL,
	[Mgr_ID] [int] NULL,
	[Mgr_HrieDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Ex_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ex_Name] [varchar](50) NULL,
 CONSTRAINT [PK__Exam__410CF9172847BA0A] PRIMARY KEY CLUSTERED 
(
	[Ex_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_Answers]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Answers](
	[Ex_ID] [int] NOT NULL,
	[St_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
	[St_Answer] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Exam_Answers] PRIMARY KEY CLUSTERED 
(
	[Ex_ID] ASC,
	[St_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_Questions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Questions](
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
 CONSTRAINT [PK_Exam_Questions] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ins_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ins_Crs](
	[Crs_ID] [int] NOT NULL,
	[Instructor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Ins_Crs] PRIMARY KEY CLUSTERED 
(
	[Crs_ID] ASC,
	[Instructor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Ins_ID] [int] NOT NULL,
	[Ins_Name] [varchar](20) NULL,
	[Ins_Degree] [varchar](20) NULL,
	[Ins_Salary] [int] NULL,
	[Dept_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Choices]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Choices](
	[Question_ID] [int] NOT NULL,
	[Answer-1] [varchar](300) NULL,
	[Answer-2] [varchar](300) NULL,
	[Answer-3] [varchar](300) NULL,
	[Answer-4] [varchar](300) NULL,
 CONSTRAINT [PK_Question_Choices_1] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Question_ID] [int] IDENTITY(443,1) NOT NULL,
	[Crs_ID] [int] NULL,
	[Q_Type] [int] NULL,
	[Q_Statement] [varchar](300) NULL,
	[Model_Answer] [varchar](300) NULL,
	[Q_Code] [varchar](300) NULL,
 CONSTRAINT [PK__Question__B0B2E4C6C08E80FC] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sheet1$]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1$](
	[Question_ID] [float] NULL,
	[answers/0] [nvarchar](255) NULL,
	[answers/1] [nvarchar](255) NULL,
	[answers/2] [nvarchar](255) NULL,
	[answers/3] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stud_Course]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stud_Course](
	[St_ID] [int] NOT NULL,
	[Crs_ID] [int] NOT NULL,
	[Instructor_ID] [int] NULL,
	[St_Grade] [real] NULL,
 CONSTRAINT [PK_Stud_Course] PRIMARY KEY CLUSTERED 
(
	[St_ID] ASC,
	[Crs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[St_ID] [int] NOT NULL,
	[St_Name] [varchar](50) NULL,
	[St_phone] [int] NULL,
	[St_Email] [varchar](50) NULL,
	[Street] [varchar](50) NULL,
	[city] [varchar](20) NULL,
	[Dept_ID] [int] NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK__Student__B9034F938A42EAC2] PRIMARY KEY CLUSTERED 
(
	[St_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Topic_ID] [int] NOT NULL,
	[Topic_Name] [varchar](20) NULL,
	[Topic_Desc] [varchar](40) NULL,
	[Crs_ID] [int] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Topic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (1, N'HTML')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (2, N'CSS')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (3, N'JS')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (4, N'JQuery')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (5, N'SQL Server')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (6, N'OS')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (7, N'DS')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (8, N'XML')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (9, N'Network')
INSERT [dbo].[Courses] ([Crs_ID], [Cr_Name]) VALUES (10, N'C#')
GO
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (10, N'SWA', NULL, NULL, 1, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (20, N'PD', NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (30, N'UI', NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (40, N'Mobile Cross', NULL, NULL, 4, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (50, N'Java', NULL, NULL, 5, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (60, N'Open Source', NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (70, N'Andriod', NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Description], [Dept_Location], [Mgr_ID], [Mgr_HrieDate]) VALUES (80, N'Embedded', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (1, N'DS')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (40, N'CSS')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (42, N'CSS')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (44, N'CSS')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (46, N'CSS')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (48, N'CSS')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (49, N'JQuery')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (50, N'SQL Server')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (51, N'JS')
INSERT [dbo].[Exam] ([Ex_ID], [Ex_Name]) VALUES (52, N'JS')
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (1, 1, 22, N'Array')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (40, 1, 184, N'Inline')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (40, 1, 192, N'alpha-spacing')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (40, 1, 199, N'outline-style')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (40, 1, 202, N'display')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (40, 1, 206, N'Margins')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (40, 1, 221, N'!important')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (42, 1, 187, N'#')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (42, 1, 196, N'border-collapse')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (42, 1, 199, N'outline-style')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (42, 1, 202, N'display')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (42, 1, 206, N'Margins')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (42, 1, 219, N'em')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (42, 1, 224, N'box-reflect')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 187, N'#')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 197, N'height property')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 203, N'display')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 209, N'Set different list item markers for ordered lists')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 220, N'A sentence')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 221, N'!important')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 224, N'box-reflect')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 459, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 460, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (44, 1, 461, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 185, N'<style>')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 187, N'#')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 202, N'display')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 207, N'Padding')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 221, N'!important')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 225, N'RGBA(0, 0, 0, 1)')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 227, N'var(--name, value)')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 459, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 460, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (46, 1, 461, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 180, N'background-color')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 185, N'<style>')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 198, N'border-style')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 213, N'Both A and B')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 214, N'No such specific property is present')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 218, N'Both A and B')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 225, N'RGBA(0, 0, 0, 0)')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 457, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 458, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (48, 1, 460, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (50, 1, 282, N'nchar')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (50, 1, 284, N'TEXT')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (50, 1, 304, N'PROJECTION')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (50, 1, 305, N'NULL')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (50, 1, 314, N'Referential integrity')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (50, 1, 328, N'NUMERIC')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (50, 1, 333, N'count()')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 337, N'Ignores the statements')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 343, N'Both the datatype and the result of the expression are compared.')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 345, N'The contents are displayed by non-JS-based browsers.')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 361, N'Classes, Native object, and Interfaces and Object''s extensible flag.')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 368, N'await')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 371, N'The contents of the objects are compared')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 383, N'All of the above')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 452, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 454, N'FALSE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (51, 1, 455, N'FALSE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 334, N'Object-Based')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 344, N'in')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 352, N'All of the above.')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 356, N'TRUE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 357, N'Number')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 361, N'Classes, Native object, and Interfaces and Object''s extensible flag.')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 366, N'Node')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 371, N'Their references are compared')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 453, N'FALSE')
INSERT [dbo].[Exam_Answers] ([Ex_ID], [St_ID], [Question_ID], [St_Answer]) VALUES (52, 1, 454, N'TRUE')
GO
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (1, 22)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (1, 32)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (1, 38)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (1, 47)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (1, 74)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (1, 75)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (40, 184)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (40, 192)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (40, 199)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (40, 202)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (40, 206)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (40, 221)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (42, 187)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (42, 196)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (42, 199)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (42, 202)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (42, 206)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (42, 219)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (42, 224)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 187)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 197)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 203)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 209)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 220)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 221)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 224)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 459)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 460)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (44, 461)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 185)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 187)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 202)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 207)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 221)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 225)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 227)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 459)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 460)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (46, 461)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 180)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 185)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 198)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 213)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 214)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 218)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 225)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 457)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 458)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (48, 460)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (49, 102)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (49, 104)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (49, 122)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (50, 282)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (50, 284)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (50, 304)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (50, 305)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (50, 314)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (50, 328)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (50, 333)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 337)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 343)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 345)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 361)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 368)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 371)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 383)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 452)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 454)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (51, 455)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 334)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 344)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 352)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 356)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 357)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 361)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 366)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 371)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 453)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Question_ID]) VALUES (52, 454)
GO
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (1, 10)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (2, 3)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (3, 7)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (4, 5)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (5, 2)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (6, 4)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (7, 1)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (8, 1)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (9, 6)
INSERT [dbo].[Ins_Crs] ([Crs_ID], [Instructor_ID]) VALUES (10, 8)
GO
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (1, N'Eman', N'PHD', 20000, 10)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (2, N'Bassant', N'Master', 10000, 20)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (3, N'Raouf', N'Master', 9000, 30)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (4, N'Mina', N'Master', 10000, 40)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (5, N'Sara', N'Master', 8888, 50)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (6, N'Ahmed', N'Master', 6000, 60)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (7, N'Hany', N'Master', 7000, 70)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (8, N'Reham', N'Master', 5000, 80)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (9, N'Yasmin', N'PHD', 15000, 40)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (10, N'Amany', N'PHD', 14000, 50)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_Name], [Ins_Degree], [Ins_Salary], [Dept_ID]) VALUES (11, N'Mona', N'PHD', 13000, 10)
GO
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (1, N'Inline', N'Internal', N'External', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (2, N'<?-- -->', N'<!-- -->', N'<!-- --!>', N'</-- -->')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (3, N'<p style=”backgroundColor: #a7b8c9”><p>', N'<p style=”background-color= #a7b8c9”></p>', N'<p style=”background-color: #a7b8c9”></p>', N'<p style=”color: #a7b8c9></p>')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (4, N'<a src=”http://www.xyz.com/image”><img src=”image path” /></a>', N'<a src=”http://www.xyz.com/image”><img href=”image path” /></a>', N'<link href=”http://www.xyz.com/image”><img src=”image path” /></link>', N'<a href=”http://www.xyz.com/image”><img src=”image path” /></a>')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (5, N'<div>', N'<nav>', N'<article>', N'<summary>')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (6, N'<p style=”textSize: 10px”></p>', N'<p style=”text-size: 10px”></p>', N'<p style=”font-size: 10px”></p>', N'<p style=”fontSize: 10px”></p>')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (7, N'.hml', N'.xml', N'.html', N'.htm')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (8, N'True', N'False', N'', N'')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (9, N'tooltip', N'title', N'ref', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (10, N'inline-flex', N'flexbox', N'flex', N'grid')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (11, N'A custom data attribute starts with data- and would be named based on the requirement.', N'The values of these attributes can be retrieved using JavaScript APIs or CSS, similar to standard attribute.', N'Both of the above.', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (12, N'onloadedmetadata', N'onloadstart', N'onmessage', N'Onoffline')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (13, N'data-x', N'common', N'accesskey', N'Src')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (14, N'playbackrate', N'defaultPlaybackrate', N'currentTime', N'Duration')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (15, N'<article>', N'<mark>', N'<section>', N'<span>')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (16, N'geolocation.watchPosition()', N'geolocation.getcurrentPosition()', N'geolocation.clearPosition()', N'geolocation.clearCurrentPosition(')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (17, N'onhaschange', N'onchange', N'ischanged', N'inputchange')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (18, N'To display web page within a web page', N'To display animation within a web page', N'To display web page without browser', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (19, N'content', N'editable', N'contenteditable', N'contextmenu')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (20, N'beforeprint', N'onbeforeprint', N'onprint', N'onafterprint')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (21, N'int a[3] = {1, 2, 3};', N'int a = {1, 2, 3};', N'int a[] = new int[3]', N'int a(3) = [1, 2, 3];')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (22, N'Array', N'AVL Trees', N'Binary Trees', N'Graphs')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (23, N'*a + 2', N'*(a + 2)', N'*(*a + 2)', N'&(a + 2)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (24, N'Priority queue', N'Single-ended queue', N'Circular queue', N'Ordinary queue')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (25, N'Operations that manipulate data in some way', N'Operations that perform a computation', N'Operations that check for syntax errors', N'Operations that monitor an object for the occurrence of a controlling event')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (28, N'The amount of memory to be allocated should be known beforehand.', N'Elements of an array can be accessed in constant time.', N'Elements are stored in contiguous memory blocks.', N'Multiple other data structures can be implemented using arrays.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (29, N'An array of characters.', N'The object of some class.', N'Same as other primitive data types.', N'LinkedList of characters.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (31, N'Elements of mixed data types can be stored.', N'Easier to access the elements in an array', N'Index of the first element starts from 1.', N'Elements of an array cannot be sorted')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (32, N'push_back()', N'append()', N'push()', N'insert()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (33, N'When a resource is shared among multiple consumers.', N'When data is transferred asynchronously', N'Load Balancing', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (34, N'Overflow', N'Underflow', N'Syntax Error', N'Garbage Value')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (36, N'Stack', N'Arrays', N'LinkedList', N'All of the Above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (37, N'Stack', N'Arrays', N'LinkedList', N'Queues')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (38, N'Stack', N'Deque', N'Queue', N'Strings')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (40, N'Merge Sort', N'Quick Sort', N'Bubble Sort', N'Selection Sort')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (41, N'n - 1', N'n', N'1', N'n - 2')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (42, N'Bubble Sort', N'Selection Sort', N'Heap Sort', N'Merge Sort')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (43, N'Bubble Sort', N'Merge Sort', N'Counting Sort', N'Heap Sort')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (44, N'Sentence Ordering.', N'Course Scheduling.', N'OS Deadlock Detection.', N'All of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (45, N'Vertex Cover Problem.', N'0/1 Knapsack Problem.', N'Maximal Independent Set Problem.', N'Travelling Salesman Problem.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (46, N'Z Algorithm', N'Rabin Karp Algorithm', N'KMP Algorithm', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (47, N'dist(u) + dist(v) - 2 * dist(getLCA(u, v))', N'dist(u) + dist(v) + 2 * dist(getLCA(u, v))', N'dist(u) + dist(v)', N'dist(u) + dist(v) - dist(getLCA(u, v))')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (48, N'Centroid Decomposition.', N'Heavy Light Decomposition.', N'Both (A) and (B).', N'Neither (A) nor (B).')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (51, N'O(n)', N'O(1)', N'O(log2n)', N'O(n^2)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (52, N'DP Problem.', N'Greedy Algorithm.', N'Adhoc Problem.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (54, N'Red-Black Trees.', N'Binary Search Trees.', N'AVL Trees.', N'Hash Tables.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (56, N'O(nlog(logn)) Precomputation, O(1) for check.', N'O(n) Precomputation, O(1) for the check.', N'O(n * logn) Precomputation, O(logn) for check.', N'O(n) Precomputation, O(logn) for check.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (58, N'O(1)', N'O(n)', N'O(log2n)', N'O(n^2)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (59, N'O(n)', N'O(1)', N'O(logn)', N'O(n * logn)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (60, N'O(n)', N'O(1)', N'O(logn)', N'O(n * logn)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (62, N'Implementation of Stacks and Queues', N'Implementation of Binary Trees', N'Implementation of Data Structures that can simulate Dynamic Arrays', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (63, N'The address of the next node if it exists', N'The value of the current node', N'Both (A) and (B)', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (64, N'2', N'0', N'1', N'n')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (65, N'O(n)', N'O(n * logn)', N'O(1)', N'O(logn)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (66, N'Left -> Right -> Root', N'Left -> Root -> Right', N'Right -> Left -> Root', N'Right -> Root -> Left')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (67, N'O(V + E)', N'O(V)', N'O(E)', N'O(V * logE)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (68, N'The difference between the heights of left and right nodes cannot be more than 1.', N'The height of an AVL Tree always remains of the order of O(logn)', N'AVL Trees are a type of self-balancing Binary Search Trees.', N'All of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (70, N'Exactly 1', N'At most 1', N'At most 2', N'Depends on the graph')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (71, N'Center', N'Diameter', N'Centroid', N'Path')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (73, N'BFS.', N'Djikstra’s Algorithm.', N'Prims Algorithm.', N'Kruskal’s Algorithm.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (74, N'O(n^3)', N'O(n^2)', N'O(n)', N'O(n^4)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (75, N'Queue', N'Stack', N'Array', N'List')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (76, N'-(2^31) to (2^31) - 1', N'-256 to 255', N'-(2^63) to (2^63) - 1', N'0 to (2^31) - 1')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (78, N'int a[3] = {1, 2, 3};', N'int a = {1, 2, 3};', N'int a[] = new int[3]', N'int a(3) = [1, 2, 3];')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (81, N'*a + 3', N'*(a + 3)', N'*(*a + 3)', N'&(a + 3)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (82, N'An array of characters.', N'The object of some class.', N'Same as other primitive data types.', N'LinkedList of characters.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (85, N'The amount of memory to be allocated should be known beforehand.', N'Elements of an array can be accessed in constant time.', N'Elements are stored in contiguous memory blocks.', N'Multiple other data structures can be implemented using arrays.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (88, N'x stores a value of 8.', N'x is an 8-bit integer.', N'Both A and B.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (89, N'#define long long ll', N'#define ll long long', N'#define ll', N'#define long long')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (90, N'While loop.', N'For loop.', N'do-while loop.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (91, N'4', N'8', N'2', N'1')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (93, N'int *val', N'int **val', N'int &val', N'int *&val')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (94, N'1020', N'1005', N'1004', N'1010')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (96, N'stdio.h', N'stdlib.h', N'conio.h', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (101, N'C', N'C++', N'Java', N'Python')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (102, N'fopen', N'fclose', N'fseek', N'fgets')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (103, N'r', N'rb', N'w', N'All of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (104, N'Pointer to a FILE object.', N'Pointer to an integer.', N'An integer.', N'An integer.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (111, N'sizeof(a)', N'sizeof(a[0])', N'sizeof(a) / sizeof(a[0])', N'sizeof(a) * sizeof(a[0])')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (112, N'volatile', N'extern', N'typedef', N'static')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (117, N'Compilation Error.', N'Runtime Error.', N'Undefined Behaviour.', N'The program will execute normally.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (118, N'free()', N'delete', N'realloc()', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (119, N'Stack.', N'Queue.', N'Deque.', N'Trees.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (122, N'No Data Hiding.', N'Functions are allowed inside structs.', N'Constructors are not allowed inside structs.', N'Cannot have static members in the struct body.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (126, N'Priority scheduling', N'Round Robin', N'Shortest Job First', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (127, N'Provides a layer so as to act as a user-friendly interface that enables the programmer to draw a flow chart', N'Links the program with subroutines', N'Helps to create a flow chart of the programs', N'All of these')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (128, N'Demand paging', N'Paging', N'Threads', N'Segmentation')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (129, N'Pre-emptive scheduling', N'Non-pre-emptive scheduling.', N'Deadline scheduling', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (130, N'Quick sharing OS', N'Time Sharing OS', N'Real time OS', N'Batch OS')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (131, N'Synchronization', N'Deadlock', N'Starvation', N'Context Switching')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (132, N'C#', N'C++', N'C', N'.NET')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (133, N'Light weight process', N'Heavy weight process', N'Multi-process', N'I/0 process')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (134, N'Mainframe and motherboard level', N'Kernel and User level', N'Security and Memory level', N'OS and CPU level')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (135, N'FCFS', N'SJF', N'Priority scheduling', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (136, N'Virtual mode, dedicated mode', N'Private mode, public mode', N'Real mode, protected mode', N'Direct mode, indirect mode')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (137, N'Virtual memory', N'Operating system', N'CPU', N'Input')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (138, N'When the process is scheduled to run after some execution', N'When the process is currently using the CPU', N'When the process is dependent of the execution time of some other process.', N'None of these')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (139, N'A line printer that prints the output of a number of jobs.', N'A terminal that inputs user data', N'A I/O device to display graphics.', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (140, N'Non-volatile', N'Volatile', N'Restricted', N'Unrestricted')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (141, N'Preventing deadlock', N'Solving deadlock', N'Recover from deadlock', N'None')
GO
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (142, N'Register', N'Main memory', N'Disk', N'Cache')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (143, N'when the thread terminates', N'when the thread blocks', N'when the thread unblocks', N'when the thread spawns')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (144, N'stack', N'program counter', N'both program counter and stack', N'none')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (145, N'to construct a new thread', N'to communicate between threads', N'convert a blocking system call into non blocking system call', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (146, N'an application having several threads of activity all within the same address space.', N'share the memory and resources of the process to which the threads belong', N'Compress the address space a process can use', N'all of the mentioned')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (147, N'When the program needs to be multi-threaded', N'When there is a single processor present', N'When the program does not need multithreading', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (148, N'exec', N'fork', N'longjmp', N'ioctl')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (151, N'fork', N'getpid', N'ioctl', N'open')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (152, N'The process of terminating a thread process before its execution', N'The process of removing a thread after its work is executed', N'The process of destroying the thread after its work is executed', N'none')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (153, N'Immediate Termination', N'Asynchronous termination', N'Synchronous termination', N'Deferred cancellation')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (154, N'sent together', N'queued', N'stacked', N'none')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (155, N'send', N'kill', N'sigsend', N'none')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (157, N'prompt', N'kernel', N'command', N'shell')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (158, N'Spooling is a type of fast memory', N'Spooling holds a single copy of data', N'Spooling holds copy of all data in the system', N'none')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (159, N'dispatch', N'wakeup', N'block', N'none')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (160, N'CPU & I/O Burst', N'I/O & OS Burst', N'Memory & I/O Burst', N'CPU and Memory burst')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (161, N'decrease CPU utilisation', N'decrease cost', N'increase CPU utilisation', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (162, N'Shortest Job First', N'First Come First Serve', N'Round robin', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (163, N'one', N'two', N'three', N'four')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (164, N'single', N'static', N'atomic', N'none of the mentioned')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (165, N'atomic, critical section', N'integer variable, memory error', N'integer variable, critical section', N'atomic, memory error')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (166, N'wait, signal', N'wait, stop', N'signal, stop', N'signal, wait')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (167, N'Counting and decimal semaphore', N'Counting and binary semaphore', N'Counting and mutex', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (168, N'0', N'1', N'-1', N'2')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (169, N'system calls', N'I/O interrupts', N'command lines', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (170, N'Yes', N'No', N'Maybe', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (171, N'Not deadlocks', N'Deadlocks', N'Livelock', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (172, N'Load time', N'Compile time', N'Execution time', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (173, N'Relocation register', N'Regular register', N'Delocation register', N'Basic register')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (174, N'Linux', N'DOS', N'Oracle', N'Windows')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (175, N'Windows', N'Ms-DOS', N'MAC', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (176, N'System Calls', N'API', N'Library', N'Assembly Instructions')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (177, N'CPU', N'Address Bus', N'RAM', N'Data Bus')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (178, N'Process Control', N'MS DOS', N'WIndows XP', N'Lynx')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (179, N'Cascading Style Sheets', N'Coloured Special Sheets', N'Color and Style Sheets', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (180, N'background-color', N'color', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (181, N'background-color', N'color', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (182, N'1', N'2', N'3', N'4')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (184, N'Inline', N'Internal', N'External', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (185, N'<style>', N'<link>', N'<script>', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (186, N'#', N'.', N'^', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (187, N'#', N'.', N'^', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (188, N'/* */', N'//', N'#', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (190, N'Yes', N'No', N'Depends on property', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (191, N'opacity', N'visibility', N'filter', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (192, N'alpha-spacing', N'letter-spacing', N'character-spacing', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (193, N'<link rel="stylesheet" type="text/css" href="style.css">', N'<style rel="stylesheet" type="text/css" href="style.css">', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (194, N'A valid color name', N'RGB values', N'HEX values', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (195, N'div h1', N'div-h1', N'h1', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (196, N'border-collapse', N'border-round', N'border-radius', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (197, N'height property', N'max-height property', N'max-width property', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (198, N'border-style', N'border', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (199, N'outline-style', N'outline', N'outline-font', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (200, N'static', N'relative', N'fixed', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (201, N'Inherits the value of the parent element.', N'Invalid property name.', N'Changes the value of the parent element’s property.', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (202, N'display', N'color', N'block', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (203, N'display', N'color', N'text', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (204, N'background-origin', N'background-size', N'origin', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (205, N'@font-face rule.', N'Custom fonts cannot be defined.', N'src tags.', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (206, N'Margins', N'Borders', N'Padding', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (207, N'Padding', N'Margin', N'Both A and B', N'Content')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (209, N'Set different list item markers for ordered lists', N'Set different list item markers for unordered lists', N'Set an image as the list item marker', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (210, N'list', N'list-style-type', N'ul', N'ol')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (211, N'1', N'0.5', N'0', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (212, N'text-align', N'text-alignment', N'text', N'text-position')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (213, N'overflow-x: auto', N'overflow-x: none', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (214, N'z-index', N'overlap', N'No such specific property is present', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (215, N'visibility', N'clip-path', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (216, N'Style specified parts of an element.', N'Style the first letter or line of an element.', N'Insert content before or after the element.', N'All of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (217, N'[attribute] selector', N'[property] selector', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (218, N'Absolute', N'Relative', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (219, N'em', N'rem', N'vmax', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (220, N'A sentence', N'A mathematical expression', N'A number', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (221, N'!important', N'important', N'bold', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (222, N'background-size', N'background-clip', N'background-image', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (223, N'Linear Gradients', N'Conic Gradients', N'Radial Gradients', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (224, N'box-reflect', N'image-reflect', N'reflect-img', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (225, N'RGBA(0, 0, 0, 1)', N'RGBA(255, 255, 255, 1)', N'RGBA(0, 0, 0, 0)', N'RGBA(255, 255, 255, 0)')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (226, N'var()', N'rand()', N'varchar()', N'calc()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (227, N'var(--name, value)', N'var(--name)', N'var(value)', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (228, N'1', N'2', N'3', N'4')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (229, N'Pre Office Protocol', N'Post Office Protocol', N'Protocol of Post', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (230, N'35', N'43', N'110', N'25')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (231, N'2 layers', N'4 layers', N'7 layers', N'9 layers')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (232, N'Operating System interface', N'Optical System interconnection', N'Operating System Internet', N'Open system interconnection')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (233, N'Session layer', N'Application layer', N'Presentation error', N'Physical layer')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (234, N'Software', N'Computing device', N'Network device', N'Calculating device')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (235, N'SMTP', N'FTP', N'IMAP', N'Protocol')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (236, N'Mail server', N'Webserver', N'Database server', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (237, N'HyperText Transfer Protocol', N'HyperText Transfer Package', N'Hyper Transfer Text Package', N'Hyper Transfer Text Practice')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (238, N'FTP', N'TCP', N'TFTP', N'HTTP')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (239, N'1', N'2', N'3', N'4')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (240, N'ARPANET', N'HUB', N'Ethernet Card', N'Router')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (241, N'PPP', N'FTP', N'TCP/IP', N'SMTP')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (242, N'Telephone control protocol / Internet Protocol', N'Transmission control protocol/Internet protocol', N'Transmission control protocol/International protocol', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (243, N'Network layer', N'Session layer', N'Application layer', N'Transport layer')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (244, N'HTML', N'Email', N'WWW', N'Internet')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (245, N'Email', N'IP', N'Protocol', N'URL')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (246, N'Bus', N'Star', N'P2P', N'Ring')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (247, N'23', N'21', N'110', N'143')
GO
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (248, N'8 bits', N'16 bits', N'32 bits', N'128 bits')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (249, N'8 bits', N'16 bits', N'32 bits', N'128 bits')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (250, N'FTP', N'SMTP', N'TCP/IP', N'MIME')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (251, N'110', N'143', N'25', N'99')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (252, N'Multipurpose Internet Mail Extra', N'Multi Internet Mail End', N'Multipurpose Internet Mail Email', N'Multipurpose Internet Mail Extension')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (253, N'SMTP', N'FTP', N'IMAP', N'POP')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (254, N'Switch', N'Hub', N'Bridge', N'Gateway')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (255, N'Modem', N'Repeater', N'Switch', N'Router')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (256, N'Media Access Control', N'Mass Access Control', N'Media Access Carriage', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (257, N'8 bits', N'16 bits', N'32 bits', N'48 bits')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (258, N'Bluetooth', N'Server', N'Node', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (259, N'Ring topology', N'Mesh topology', N'Star topology', N'Bus topology')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (260, N'Application gateway', N'Switch', N'Router', N'Repeaters')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (262, N'Servers', N'Protocols', N'Rules', N'IP')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (263, N'Classification', N'Integration', N'Management', N'Enhanced security')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (264, N'Storage Area network', N'Virtual private network', N'Enterprise Private network', N'Local area network')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (265, N'Network', N'Datalink', N'Presentation', N'Application')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (266, N'Network', N'Datalink', N'Presentation', N'Application')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (267, N'RIng', N'Mesh', N'Star', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (268, N'Hub', N'Router', N'Bridge', N'Gateway')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (269, N'To encrypt data', N'To detect error', N'To identify user', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (270, N'121.12.12.248', N'128.12.12.248', N'129.12.12.248', N'130.12.12.248')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (271, N'Local Array Network', N'Local Area Network', N'Local Area Net', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (272, N'Sender', N'Receiver', N'Both Sender and Receiver', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (273, N'0.16', N'0.0189', N'0.184', N'0.18999')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (274, N'Virtual switching', N'Packet switching', N'Message switching', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (275, N'Application-level gateway', N'Proxy tools', N'Application proxy', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (276, N'Communication server', N'Point server', N'Data server', N'File server')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (277, N'½ Tfr', N'Tfr', N'2*Tfr', N'4*Tfr')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (278, N'SSL', N'HDLC', N'HTTP', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (279, N'Oracle', N'MySQL', N'HeidiSQL', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (280, N'CREATE TABLE', N'BUILD TABLE', N'GENERATE TABLE', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (282, N'nchar', N'ntext', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (283, N'Binary Large Objects', N'Big Large Objects', N'Binary Language for Objects', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (284, N'TEXT', N'TINY TEXT', N'BLOB', N'BINARY')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (285, N'Nothing happens', N'The code will crash', N'A blank value is inserted in that case', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (286, N'Signed numbers in the range of -8388608 to 8388607.', N'Unsigned numbers in the range of 0 to 16777215.', N'Both A and B.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (288, N'TRUNCATE', N'DROP', N'DELETE', N'ALTER')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (289, N'Revoke', N'Grant', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (291, N'An exact match is necessary for a CREATE statement.', N'An exact match is not possible in a SELECT statement.', N'An exact match is necessary for a SELECT statement.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (292, N'Data definition language', N'Data derivation language', N'Dynamic data language', N'Detailed data language')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (293, N'UNIQUE', N'NOT NULL', N'DEFAULT', N'CHECK')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (294, N'Degree', N'Entity', N'Tuple', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (295, N'Rollback', N'Commit', N'View', N'Flashback')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (296, N'Schema', N'Attribute', N'Super key', N'Domain')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (297, N'4', N'3', N'2', N'1')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (298, N'DELETE', N'ORDER BY', N'SELECT', N'WHERE')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (300, N'Primary Key', N'Foreign Key', N'Surrogate Key', N'Composite Key')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (301, N'LIMIT', N'LIKE', N'WHERE', N'GROUP BY')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (302, N'SOME', N'ALL', N'AND', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (303, N'SOUNDEX', N'DIFFERENCE', N'CONCAT', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (304, N'PROJECTION', N'SELECTION', N'JOIN', N'UNION')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (305, N'NULL', N'NOT NULL', N'Both NULL and NOT NULL', N'Depends on situation')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (306, N'NUMERIC', N'CHARACTER', N'FLOAT', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (307, N'DAY', N'DATEPART', N'GETDATE', N'CURRENT_TIMESTAMP')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (308, N'ANY', N'BETWEEN', N'IN', N'ALL')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (309, N'Join', N'Self-join', N'Outer join', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (310, N'Combination of Union and cartesian product', N'Combination of Selection and cartesian product', N'Combination of Projection and cartesian product', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (311, N'DROP', N'DELETE', N'ALTER', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (312, N'SHOW', N'VIEW', N'READ', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (313, N'Primary key', N'Foreign key', N'Candidate key', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (314, N'Referential integrity', N'Entity integrity', N'Domain integrity', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (315, N'WRITE UNCOMMITTED', N'READ COMMITTED', N'WRITE COMMITTED', N'READ UNCOMMITTED')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (318, N'UPDATE User SET Name = ''Scaler'' INTO Name = ''Interviewbit''', N'MODIFY Users SET Name = ''Interviewbit'' WHERE Name = ''Scaler''', N'MODIFY Users SET Name = ''Scaler'' INTO Name = ''Interviewbit''', N'UPDATE Users SET Name = ''Interviewbit'' WHERE Name = ''Scaler''')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (319, N'Multi query', N'Subquery', N'Super query', N'Master query')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (320, N'Rename', N'Selection', N'Join', N'Projection')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (321, N'NOT NULL', N'CHECK', N'UNIQUE', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (322, N'Primary Key', N'Foreign Key', N'Surrogate Key', N'Composite Key')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (323, N'Trigger', N'Stored Procedure', N'Stored Function', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (324, N'Data is used to dynamically construct an SQL Query.', N'Unintended data from an untrusted source enters the application.', N'Both A and B.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (325, N'UNIQUE', N'NOT NULL', N'CHECK', N'PRIMARY KEY')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (326, N'Network', N'Unit', N'Transaction', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (327, N'Lock based protocol', N'Two-phase locking protocol', N'Timestamp ordering protocol', N'All')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (328, N'NUMERIC', N'DECIMAL', N'CHARACTER', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (329, N'Structured Query Language', N'Sample Query Language', N'Structured Query List', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (330, N'REVOKE', N'GRANT', N'UPDATE', N'RENAME')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (331, N'ROLLBACK', N'SAVEPOINT', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (332, N'Schema', N'Virtual Table', N'Instance', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (333, N'count()', N'Sum()', N'Avg()', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (334, N'Object-Oriented', N'Object-Based', N'Procedural', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (335, N'var', N'let', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (336, N'getElementbyId()', N'getElementsByClassName()', N'Both A and B', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (337, N'Throws an error', N'Ignores the statements', N'Gives a warning', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (338, N'document.write()', N'console.log()', N'window.alert()', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (339, N'const', N'var', N'let', N'constant')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (343, N'Both the datatype and the result of the expression are compared.', N'Only the datatype of the expression is compared.', N'Only the value of the expression is compared.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (344, N'in', N'is in', N'exists', N'lies')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (345, N'The contents are displayed by non-JS-based browsers.', N'Clears all the cookies and cache.', N'Both A and B.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (350, N'Boolean', N'Undefined', N'Object', N'Integer')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (352, N'It will debug all the errors in the program at runtime.', N'It acts as a breakpoint in a program.', N'It will debug error in the current statement if any.', N'All of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (357, N'Object', N'Number', N'String', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (358, N'Returns a localised object representation.', N'Returns a parsed string.', N'Returns a localized string representation of an object.', N'None of the above.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (359, N'Object Serialization', N'Object Encapsulation', N'Object Inheritance', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (360, N'stringify()', N'parse()', N'convert()', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (361, N'Class, prototype, objects'' parameters.', N'Class, prototype, object''s extensible flag.', N'Class, parameters, object''s extensible flag.', N'Classes, Native object, and Interfaces and Object''s extensible flag.')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (365, N'Variables', N'Functions', N'Objects', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (366, N'Node', N'Vue', N'React', N'Cassandra')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (368, N'async', N'await', N'setTimeout', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (369, N'clearInterval', N'clearTimer', N'intervalOver', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (371, N'The contents of the objects are compared', N'Their references are compared', N'Both A and B', N'None of the above')
GO
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (372, N'It is used to spread iterables to individual elements', N'It is used to describe a datatype of undefined size', N'No such operator exists', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (379, N'/* */', N'//', N'#', N'$ $')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (380, N'Base Object', N'All objects have a prototype', N'None of the objects have a prototype', N'None of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (383, N'Date', N'FileUpload', N'Function', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (384, N'Pretext Hypertext Processor', N'Hypertext preprocessor', N'Preprocessor Home page', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (385, N'.xml', N'.html', N'.php', N'.ph')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (386, N'Server-side scripting', N'Client-side scripting', N'User-side scripting', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (387, N'<php>', N'<?php>', N'?php?', N'<?php?>')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (388, N'$sub = $sub - 1', N'$sub = $sub - $sub', N'$sub = $sub - $sub - 1', N'$sub = $sub')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (389, N'2', N'3', N'4', N'5')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (390, N'print', N'echo', N'Both have the same speed', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (391, N'No numbers', N'Letters', N'Underscore', N'All of the above')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (393, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (394, N'Objects', N'void', N'Null', N'Resources')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (395, N'1', N'22', N'3', N'4')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (398, N'fopen()', N'fclosed()', N'gettype()', N'print_r()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (399, N'def', N'fun', N'function', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (400, N'2', N'3', N'4', N'5')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (401, N'0', N'-1', N'1', N'2')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (402, N'Removes uppercase alphabet', N'Removes whitespaces', N'Removes lowercase alphabet', N'Removes underscore')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (403, N'template', N'reference', N'instances', N'class')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (404, N'object', N'new', N'create', N'None')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (405, N'Key function', N'Automatic function', N'Find function', N'Magic function')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (406, N'this', N'public', N'private', N'protected')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (407, N'PHP 6', N'PHP 4', N'PHP 5', N'PHP 5.3')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (408, N'get_argv()', N'func_get_argv()', N'get_argc()', N'func_get_args()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (409, N'file()', N'glob()', N'get_file()', N'fold()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (410, N'gzcompress()', N'compress()', N'zip()', N'zip_compress()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (411, N'dsort()', N'asort()', N'rsort()', N'sort()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (412, N'object::methodName();', N'object -> methodName();', N'$object::methodName();', N'$object->methodName();')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (413, N'Final', N'Protected', N'Static', N'Abstract')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (414, N'function_construct()', N'classname()', N'function__construct()', N'_construct()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (415, N'Method adding', N'Method chaining', N'Method including', N'Typecasting')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (416, N'17', N'16', N'15', N'14')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (417, N'Near-fatal error', N'Compile-time error', N'Fatal compile-time error', N'Fatal run-time error')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (418, N'new exception()', N'throws new expection()', N'throw new expection()', N'New throws exception()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (419, N'md5()', N'uniqueid()', N'id()', N'mdid()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (422, N'into_array()', N'inend_array()', N'array_unshift()', N'array_push()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (424, N'dsort()', N'natcasesort()', N'naturalsort()', N'casesort()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (425, N'public', N'static', N'friendly', N'final')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (426, N'Only 2', N'Only 2 and 3', N'Only 3 and 4', N'Only 1 and 4')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (427, N'__call', N'__invoke', N'__unset', N'__wakeup')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (428, N'Source PHP library', N'Source PHP list', N'Standard PHP library', N'Standard PHP list')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (429, N'1', N'2', N'3', N'4')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (430, N'P+', N'P*', N'P?', N'P#')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (431, N'Portable Operating system interface for Linux', N'Portable Operating system interface for Unix', N'Portative Operating system interface for Linux', N'Portative Operating system interface for Unix')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (432, N'uppercase()', N'str_uppercase()', N'strtoupper()', N'struppercase()')
INSERT [dbo].[Question_Choices] ([Question_ID], [Answer-1], [Answer-2], [Answer-3], [Answer-4]) VALUES (433, N'KB', N'Bytes', N'GB', N'bits')
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (1, 1, 0, N'If you have used inline, internal, and external all the 3 stylings in HTML for a single element then which style will be applied?', N'Inline', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (2, 1, 0, N'Comments in HTML is done by:', N'<!-- -->', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (3, 1, 0, N'Which of the following is the correct HTML syntax for adding background color?', N'<p style=”background-color: #a7b8c9”></p>', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (4, 1, 0, N'Which is the correct HTML syntax for adding a link to the image?', N'<a href=”http://www.xyz.com/image”><img src=”image path” /></a>', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (5, 1, 0, N'Which of the following are not semantic tags?', N'<div>', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (6, 1, 0, N'Which is the correct attribute to change the size of text?', N'<p style=”font-size: 10px”></p>', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (7, 1, 0, N'What are the correct extensions for saving an HTML file?', N'option c and d', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (8, 1, 1, N'HTML attribute values are case-sensitive?', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (9, 1, 0, N'Using which attribute we can add a tooltip in the HTML element.', N'title', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (10, 1, 0, N'Which of the following is not a value of the attribute display?', N'flexbox', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (11, 1, 0, N'Which of the following is correct about custom attributes in HTML5?', N'Both of the above.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (12, 1, 0, N'Which of the following attribute triggers an event when all the media data of a media element is loaded?', N'onloadedmetadata', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (13, 1, 0, N'Which attribute defines the accelerator key to be used for keyboard access to an element.', N'accesskey', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (14, 1, 0, N'How to set the playback speed of audio/video?', N'defaultPlaybackrate', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (15, 1, 0, N'Which one is not a semantic html5 element?', N'<span>', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (16, 1, 0, N'Which of the following method cancels an ongoing watchPosition call?', N'geolocation.clearPosition()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (17, 1, 0, N'Which of the following attribute triggers events when the document has changed?', N'onhaschange', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (18, 1, 0, N'Why iframe is used?', N'To display web page within a web page', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (19, 1, 0, N'Which of the following attribute specifies if the user can edit the element''s content or not?', N'contenteditable', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (20, 1, 0, N'Which of the following attribute triggers events before the document is printed?', N'onbeforeprint', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (21, 7, 0, N'How is an array initialized in C language?', N'int a[3] = {1, 2, 3};', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (22, 7, 0, N'Which of the following is a linear data structure?', N'Array', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (23, 7, 0, N'How is the 2nd element in an array accessed based on pointer notation?', N'*(a + 2)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (24, 7, 0, N'Which of the following is not the type of queue?', N'Single-ended queue', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (25, 7, 0, N'From following which is not the operation of data structure?', N'Operations that manipulate data in some way', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (28, 7, 0, N'What is the disadvantage of array data structure?', N'The amount of memory to be allocated should be known beforehand.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (29, 7, 0, N'How are String represented in memory in C?', N'An array of characters.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (31, 7, 0, N'Which of the following is the advantage of the array data structure?', N'Easier to access the elements in an array', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (32, 7, 0, N'What function is used to append a character at the back of a string in C++?', N'push_back()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (33, 7, 0, N'Which one of the following is an application of queue data structure', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (34, 7, 0, N'When a pop() operation is called on an empty queue, what is the condition called?', N'Underflow', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (36, 7, 0, N'Which of the following data structures can be used to implement queues?', N'All of the Above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (37, 7, 0, N'Which of the following data structures finds its use in recursion?', N'Stack', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (38, 7, 0, N'Which of the following data structures allow insertion and deletion from both ends?', N'Deque', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (40, 7, 0, N'Which of the following sorting algorithms provide the best time complexity in the worst-case scenario?', N'Merge Sort', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (41, 7, 0, N'What is the maximum number of swaps that can be performed in the Selection Sort algorithm?', N'n - 1', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (42, 7, 0, N'Which of the following is a Divide and Conquer algorithm?', N'Merge Sort', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (43, 7, 0, N'What will be the best sorting algorithm, given that the array elements are small (<= 1e6)?', N'Counting Sort', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (44, 7, 0, N'Which of the following are applications of Topological Sort of a graph?', N'All of the above.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (45, 7, 0, N'Which of the following is known to be not an NP-Hard Problem?', N'0/1 Knapsack Problem.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (46, 7, 0, N'Which of the following algorithms are used for string and pattern matching problems?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (47, 7, 0, N'Consider we have a function, getLCA(), which returns us the Lowest Common Ancestor between 2 nodes of a tree. Using this getLCA() function, how can we calculate the distance between 2 nodes, given that distance from the root, to each node is calculated?', N'dist(u) + dist(v) - 2 * dist(getLCA(u, v))', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (48, 7, 0, N'Which of the following algorithms are useful for processing queries on trees?', N'Both (A) and (B).', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (51, 7, 0, N' What is the time complexity of the binary search algorithm?', N'O(log2n)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (52, 7, 0, N'Kruskal’s Algorithm for finding the Minimum Spanning Tree of a graph is a kind of a?', N'Greedy Algorithm.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (54, 7, 0, N'Maps in C++ are implemented using which of the following data structures?', N'Red-Black Trees.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (56, 7, 0, N'What is the time complexity of the Sieve of Eratosthenes to check if a number is prime?', N'O(nlog(logn)) Precomputation, O(1) for check.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (58, 7, 0, N'What is the best case time complexity of the binary search algorithm?', N'O(1)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (59, 7, 0, N'What is the time complexity to insert an element to the front of a LinkedList(head pointer given)?', N'O(1)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (60, 7, 0, N'What is the time complexity to insert an element to the rear of a LinkedList(head pointer given)?', N'O(n)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (62, 7, 0, N'Which of the following can be done with LinkedList?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (63, 7, 0, N' What is the information, which a LinkedList’s Node must store?', N'Both (A) and (B)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (64, 7, 0, N'What is the maximum number of children a node can have in an n-ary tree?', N'n', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (65, 7, 0, N'Worst case time complexity to access an element in a BST can be?', N'O(n)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (66, 7, 0, N'Which of the following represents the Postorder Traversal of a Binary Tree?', N'Left -> Right -> Root', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (67, 7, 0, N'In what time complexity can we find the diameter of a binary tree optimally?', N'O(V + E)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (68, 7, 0, N'Which of the following statements is true about AVL Trees?', N'All of the above.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (70, 7, 0, N'In a graph of n nodes and n edges, how many cycles will be present?', N'Exactly 1', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (71, 7, 0, N'A node in a tree, such that removing it splits the tree into forests, with size of each connected component being not greater than n / 2 is called?', N'Centroid', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (73, 7, 0, N'Which of the following algorithms are used to find the shortest path from a source node to all other nodes in a weighted graph?', N'Djikstra’s Algorithm.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (74, 7, 0, N'What is the best time complexity we can achieve to precompute all-pairs shortest paths in a weighted graph?', N'O(n^3)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (75, 7, 0, N'Which data structure is mainly used for implementing the recursive algorithm?', N'Stack', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (76, 4, 1, N' What is the range of values that can be stored by int datatype in C?', N'-(2^31) to (2^31) - 1', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (78, 4, 1, N'How is an array initialized in C language?', N'int a[3] = {1, 2, 3};', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (81, 4, 1, N'How is the 3rd element in an array accessed based on pointer notation?', N'*(a + 3)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (82, 4, 1, N'How are String represented in memory in C?', N'An array of characters.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (85, 4, 1, N'What is the disadvantage of arrays in C?', N'The amount of memory to be allocated should be known beforehand.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (88, 4, 1, N'What does the following declaration indicate?int x: 8;', N'x is an 8-bit integer.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (89, 4, 1, N'Which of the following is the proper syntax for declaring macros in C?', N'#define ll long long', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (90, 4, 1, N'Which of the following is an exit controlled loop?', N'do-while loop.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (91, 4, 1, N'What is the size of the int data type (in bytes) in C?', N'4', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (93, 4, 1, N'How to declare a double-pointer in C?', N'int **val', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (94, 4, 1, N'If p is an integer pointer with a value 1000, then what will the value of p + 5 be?', N'1020', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (96, 4, 1, N'Which of the following are not standard header files in C?', N'None of the above.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (101, 4, 1, N'In which of the following languages is function overloading not possible?', N'C', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (102, 4, 1, N'Which of the following function is used to open a file in C++?', N'fopen', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (103, 4, 1, N'Which of the following are correct file opening modes in C?', N'All of the above.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (104, 4, 1, N'What is the return type of the fopen() function in C?', N'Pointer to a FILE object.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (111, 4, 1, N'How to find the length of an array in C?', N'sizeof(a) / sizeof(a[0])', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (112, 4, 1, N'Which of the following is not a storage class specifier in C?', N'volatile', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (117, 4, 1, N'Which of the following will occur if we call the free() function on a NULL pointer?', N'The program will execute normally.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (118, 4, 1, N'Which of the following should be used to free memory from a pointer allocated using the “new” operator?', N'delete', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (119, 4, 1, N'Which data structure is used to handle recursion in C?', N'Stack.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (122, 4, 1, N'Which of the following is not true about structs in C?', N'Functions are allowed inside structs.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (126, 6, 0, N'Which of the following are CPU scheduling algorithms?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (127, 6, 0, N'Operating systems', N'Provides a layer so as to act as a user-friendly interface that enables the programmer to draw a flo', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (128, 6, 0, N'A process which is copied from main memory to secondary memory on the basis of requirement is known as -', N'Demand paging', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (129, 6, 0, N'FIFO scheduling is a type of:', N'Non-pre-emptive scheduling.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (130, 6, 0, N'Which of the type of OS reads and reacts in terms of actual time?', N'Real time OS', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (131, 6, 0, N'A systematic procedure for moving the CPU to new process is known as-', N'Context Switching', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (132, 6, 0, N'UNIX is written in which language?', N'C', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (133, 6, 0, N'Thread is a', N'Light weight process', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (134, 6, 0, N'OS classifies the threads as-', N'Kernel and User level', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (135, 6, 0, N'Among the following CPU scheduling algorithms, which of these allocated the CPU first to the process that requests the CPU first?', N'FCFS', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (136, 6, 0, N'What are the two types of operating modes of AT?', N'Real mode, protected mode', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (137, 6, 0, N'Which of the following schedules threads?', N'Operating system', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (138, 6, 0, N'What is meant by ready state of a process?', N'None of these', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (139, 6, 0, N'Among the following, which is an example of a spooled device?', N'A line printer that prints the output of a number of jobs.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (140, 6, 0, N'Main memory of a computer system is?', N'Volatile', NULL)
GO
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (141, 6, 0, N'For which of the following purposes in Banker’s algorithm is used?', N'Preventing deadlock', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (142, 6, 0, N'Device driver required in?', N'Disk', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (143, 6, 0, N'When are the register context and stack of thread deallocated?', N'when the thread terminates', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (144, 6, 0, N'Threads is not shared among which of the following?', N'both program counter and stack', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (145, 6, 0, N'For which of the following is the jacketing technique used?', N'convert a blocking system call into non blocking system call', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (146, 6, 0, N'For which of the following is resource sharing used?', N'all of the mentioned', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (147, 6, 0, N'Many to One model is at an advantage in which of the following conditions?', N'When the program does not need multithreading', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (148, 6, 0, N'Identify the system calls that on termination does not return control to the calling point.', N'exec', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (151, 6, 0, N'Identify the call which never returns an error?', N'getpid', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (152, 6, 0, N'What of the following defines Thread cancellation?', N'The process of terminating a thread process before its execution', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (153, 6, 0, N'When a thread terminates some target thread immediately, it is known as?', N'Asynchronous termination', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (154, 6, 0, N'Signals of some given type are', N'sent together', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (155, 6, 0, N'Which of the following commands in UNIX is used to send a signal?', N'kill', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (156, 6, 1, N'The speed of writing data in magnetic tape disks is comparable to that of disk drives. State True/False', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (157, 6, 0, N'What else is a command interpreter called?', N'shell', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (158, 6, 0, N'Select the correct definition of spooling.', N'Spooling holds a single copy of data', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (159, 6, 0, N'Which of the following is the only state transition that is initiated by the user process itself?', N'block', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (160, 6, 0, N'Identify the two steps of a process execution.', N'CPU & I/O Burst', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (161, 6, 0, N'Why is CPU scheduling done?', N'increase CPU utilisation', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (162, 6, 0, N'The most optimal CPU scheduling algorithm is ________', N'Shortest Job First', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (163, 6, 0, N'How many minimum variables is/are required to share between processes, so as to solve the critical section problem?', N'two', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (164, 6, 0, N'Which of the following is known as uninterruptible unit?', N'atomic', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (165, 6, 0, N'Semaphore is a __ and it helps to solve the problem of  ___?', N'integer variable, critical section', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (166, 6, 0, N'Which of the following are two types of atomic operations performed by semaphores?', N'wait, signal', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (167, 6, 0, N'The two types of semaphores are-', N'Counting and binary semaphore', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (168, 6, 0, N'A binary semaphore has a value of', N'1', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (169, 6, 0, N'The release and request of resources are a type of which of the following?', N'system calls', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (170, 6, 0, N'Is mutual exclusion required for shareable resources?', N'No', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (171, 6, 0, N'Unsafe states are?', N'Not deadlocks', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (172, 6, 0, N'When can the binding of instructions and data to memory addresses be done?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (173, 6, 0, N'Which of the following is also known as the base register?', N'Relocation register', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (174, 6, 0, N'Which of the following is not an operating system?', N'Oracle', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (175, 6, 0, N'Which of the following is a single user operating system?', N'Ms-DOS', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (176, 6, 0, N'To access the services of operating system the interface is provided by the?', N'System Calls', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (177, 6, 0, N'The size of virtual memory is based on which of the following?', N'Address Bus', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (178, 6, 0, N'Which of the following is an example of a real-time operating system?', N'Lynx', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (179, 2, 0, N'The full form of CSS is:', N'Cascading Style Sheets', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (180, 2, 0, N'How can we change the background color of an element?', N'background-color', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (181, 2, 0, N'How can we change the text color of an element?', N'color', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (182, 2, 0, N'In how many ways can CSS be written in?', N'3', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (184, 2, 0, N'What type of CSS is generally recommended for designing large web pages?', N'External', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (185, 2, 0, N'Which HTML tag is used to declare internal CSS?', N'<style>', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (186, 2, 0, N'How can we select an element with a specific ID in CSS?', N'#', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (187, 2, 0, N'How can we select an element with a specific Class in CSS?', N'.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (188, 2, 0, N'How can we write comments in CSS?', N'/* */', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (190, 2, 0, N'Can negative values be allowed in padding property?', N'No', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (191, 2, 0, N'The CSS property used to specify the transparency of an element is?', N'opacity', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (192, 2, 0, N'How can we specify the spacing between each letter in a text in CSS?', N'letter-spacing', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (193, 2, 0, N'What is the correct syntax for referring an external CSS?', N'<link rel="stylesheet" type="text/css" href="style.css">', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (194, 2, 0, N'Which of the following are valid ways to represent a colour in CSS?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (195, 2, 0, N'Which of the following is the correct way to select all h1 headers in a div element?', N'div h1', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (196, 2, 0, N'We can make rounded borders around elements using which CSS element?', N'border-radius', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (197, 2, 0, N'How can we set the maximum width of the elements content box using CSS?', N'max-width property', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (198, 2, 0, N'Which CSS property is used to specify different border styles?', N'border-style', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (199, 2, 0, N'Which of the following property specifies the look and design of an outline?', N'outline-style', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (200, 2, 0, N'Which of the following are valid CSS position property values?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (201, 2, 0, N'What does the inherit value for a property do?', N'Inherits the value of the parent element.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (202, 2, 0, N'Setting an inline-block in CSS requires which of the following properties?', N'display', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (203, 2, 0, N'Which of the following CSS property is used for controlling the layout?', N'display', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (204, 2, 0, N'Which of the following CSS property specifies the origin of the background image?', N'background-origin', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (205, 2, 0, N'How are custom fonts defined using CSS?', N'@font-face rule.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (206, 2, 0, N'Which of the following are parts of the CSS box model?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (207, 2, 0, N'Which of the following components of the CSS box model are transparent?', N'Both A and B', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (209, 2, 0, N'Which of the following can be achieved with CSS lists?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (210, 2, 0, N'Which of the following CSS property specifies the type of list item marker?', N'list-style-type', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (211, 2, 0, N'What value should be passed to the width parameter if we want an element, say a table, to span the entire width of the screen?', N'100%', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (212, 2, 0, N'Which of the following properties is used to align text in CSS?', N'text-align', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (213, 2, 0, N'Which of the following is the correct approach to make a table responsive?', N'overflow-x: auto', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (214, 2, 0, N'Which of the following CSS properties specifies the stack order of elements?', N'z-index', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (215, 2, 0, N'Which of the following CSS property creates a clipping region and specifies the visible area of the element?', N'clip-path', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (216, 2, 0, N'What are the uses of CSS pseudo-elements?', N'All of the above.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (217, 2, 0, N'How can we select elements with a specified attribute in CSS?', N'[attribute] selector', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (218, 2, 0, N'Which of the following are types of length units in CSS?', N'Both A and B', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (219, 2, 0, N'Which of the following are units of relative length in CSS?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (220, 2, 0, N'What parameter does the calc() function in CSS take?', N'A mathematical expression', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (221, 2, 0, N'How can we add more importance to a property/value than normal?', N'!important', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (222, 2, 0, N'Which CSS property specifies the painting area of the background?', N'background-clip', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (223, 2, 0, N'What are the different types of gradients in CSS?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (224, 2, 0, N'Which CSS property is used to create an image reflection?', N'box-reflect', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (225, 2, 0, N'The transparent keyword is equivalent to which RGBA() value in CSS?', N'RGBA(0, 0, 0, 0)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (226, 2, 0, N'What function is used to insert values of a CSS variable?', N'var()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (227, 2, 0, N'What is the general syntax of writing the var() function?', N'var(--name, value)', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (228, 2, 0, N'How many layout modes were there before the Flexbox Layout Module was introduced in CSS?', N'4', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (229, 9, 0, N'What does PoP stand for?', N'Post Office Protocol', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (230, 9, 0, N'What is the port number of PoP?', N'110', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (231, 9, 0, N'What is the number of layers in the OSI model?', N'7 layers', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (232, 9, 0, N'The full form of OSI is?', N'Open system interconnection', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (233, 9, 0, N'Identify the layer which provides service to the user.', N'Application layer', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (234, 9, 0, N'What is a HUB?', N'Network device', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (235, 9, 0, N'What does a set of rules define?', N'Protocol', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (236, 9, 0, N'Identify among the following which is mainly used to host web site.', N'Webserver', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (237, 9, 0, N'Identify the full form of HTTP?', N'HyperText Transfer Protocol', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (238, 9, 0, N'Identify the protocol primarily used for browsing data.', N'HTTP', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (239, 9, 0, N'Identify the total versions of IP.', N'2', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (240, 9, 0, N'Identify the first network which was based on TCP/IP protocol.', N'ARPANET', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (241, 9, 0, N'Choose among the following, which is the most common internet protocol.', N'SMTP', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (242, 9, 0, N'What does TCP/IP stand for?', N'Transmission control protocol/Internet protocol', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (243, 9, 0, N'Which of the following layer isn’t present in the TCP/IP model but is included in the OSI model?', N'Session layer', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (244, 9, 0, N'What is the collection of the hyperlinked document on the internet known as?', N'WWW', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (245, 9, 0, N'What is the location of a resource on the internet given by?', N'URL', NULL)
GO
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (246, 9, 0, N'Identify the incorrect network topology,', N'P2P', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (247, 9, 0, N'Choose the port number of FTP.', N'21', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (248, 9, 0, N'What is the length of the IPv4 address?', N'32 bits', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (249, 9, 0, N'What is the length of the IPv6 address?', N'128 bits', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (250, 9, 0, N'What is the term used when the main server sends mail to another mail server?', N'SMTP', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (251, 9, 0, N'What is the port number of SMTP?', N'25', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (252, 9, 0, N'What does MIME stand for?', N'Multipurpose Internet Mail Extension', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (253, 9, 0, N'What does port number 143 refer to?', N'IMAP', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (254, 9, 0, N'Identify among the following the network device used to connect two dis-similar types of networks.', N'Gateway', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (255, 9, 0, N'Identify the device used to boost up a weak signal.', N'Repeater', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (256, 9, 0, N'What does MAC stand for?', N'Media Access Control', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (257, 9, 0, N'What is the length of the MAC address?', N'48 bits', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (258, 9, 0, N'Which of the following is used to allocate and manage resources for a network?', N'Server', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (259, 9, 0, N'The arrangement where all data pass through a central computer is known as', N'Star topology', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (260, 9, 0, N'What of the following device is used in the network layer?', N'Router', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (261, 9, 1, N'Identify if the following statement is True or False: Network Interface Card(NIC) is an I/O device.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (262, 9, 0, N'What is required to use a Simple Network Management System?', N'Rules', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (263, 9, 0, N'Identify the major difference between SNMPv3 and SNMPv2.', N'Enhanced security', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (264, 9, 0, N'Identify the network which extends a private network across a public network.', N'Virtual private network', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (265, 9, 0, N'Identify the layer which is responsible for data translating.', N'Presentation', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (266, 9, 0, N'Identify the layer which determines the interface of the system with the user.', N'Application', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (267, 9, 0, N'Which of the following topology arrangements is a point-to-point line configuration?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (268, 9, 0, N'Identify the device which links two homogeneous packed broadcast local networks.', N'Bridge', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (269, 9, 0, N'Why are parity bits used?', N'To detect error', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (270, 9, 0, N'Identify among the following which belongs to class A.', N'121.12.12.248', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (271, 9, 0, N'What does LAN stand for?', N'Local Area Network', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (272, 9, 0, N'Who keeps the private key in asymmetric key cryptography?', N'Receiver', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (273, 9, 0, N'Calculate the maximum efficiency of pure ALOHA at G = 0.5?', N'19.00%', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (274, 9, 0, N'Identify the switching method in which the message is divided into small packets.', N'Packet switching', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (275, 9, 0, N'What is a proxy server also known as?', N'Application-level gateway', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (276, 9, 0, N'Identify among the following servers which allow LAN users to share data.', N'File server', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (277, 9, 0, N'Choose the correct formula for the total vulnerable time value of pure ALOHA.', N'2*Tfr', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (278, 9, 0, N'Choose among the following which is a bit-oriented protocol.', N'HDLC', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (279, 5, 0, N'Which of the following are some common RDBMS in use?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (280, 5, 0, N'What command is used to create a new table in SQL?', N'CREATE TABLE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (282, 5, 0, N'Which of the following are types of Unicode character string types in SQL?', N'Both A and B', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (283, 5, 0, N'What does BLOB in SQL stand for?', N'Binary Large Objects', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (284, 5, 0, N'Which of the following datatype is most appropriate for storing a string of up to 255 characters?', N'TINY TEXT', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (285, 5, 0, N'What happens when no value is inserted in an ENUM list?', N'A blank value is inserted in that case', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (286, 5, 0, N'What is the range of integers that can be held in the MEDIUMINT datatype of SQL?', N'Both A and B.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (288, 5, 0, N'Which of the following commands is used to delete all rows and free up space from a table?', N'TRUNCATE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (289, 5, 0, N'Which of the following commands are a part of Data Control Language?', N'Both A and B', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (291, 5, 0, N'When is the wildcard in WHERE clause used?', N'An exact match is not possible in a SELECT statement.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (292, 5, 0, N'Which of the following is the full form of DDL?', N'Data definition language', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (293, 5, 0, N'Which SQL constraint do we use to set some value to a field whose value has not been added explicitly?', N'DEFAULT', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (294, 5, 0, N'What are rows of a relation known as?', N'Tuple', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (295, 5, 0, N'During transaction before commit which of the following statements is done automatically in case of shutdown?', N'Rollback', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (296, 5, 0, N'Which of the following allows you to uniquely identify a tuple?', N'Super key', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (297, 5, 0, N'How many operations are considered to be the most basic SQL operations?', N'4', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (298, 5, 0, N'Which of the following is not a SQL command?', N'DELETE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (300, 5, 0, N'Which of the following matches the definition given below: It is an artificial key that aims to uniquely identify each record.', N'Surrogate Key', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (301, 5, 0, N'Which of the following commands are used to put a restriction on the number of rows returned from a query?', N'LIMIT', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (302, 5, 0, N'Which of the following are valid logical operators in SQL?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (303, 5, 0, N'Which of the following SQL functions compares the similarities of 2 strings and returns the result as a 4 character code?', N'SOUNDEX', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (304, 5, 0, N'To select some particular columns, which of the following commands is used?', N'PROJECTION', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (305, 5, 0, N'Primary key can be?', N'NOT NULL', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (306, 5, 0, N'Select the valid SQL type.', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (307, 5, 0, N'Which of the following functions do we use to get a specified day of the month for a given date?', N'DAY', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (308, 5, 0, N'Which of the following operators is used to compare a value to a list of literal values that have been specified?', N'BETWEEN', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (309, 5, 0, N'What is a table joined with itself called?', N'Self-join', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (310, 5, 0, N'NATURAL JOIN can also be termed as -', N'Combination of Projection and cartesian product', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (311, 5, 0, N'Which of the following commands is used to delete a trigger in SQL?', N'DROP', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (312, 5, 0, N'How can we view all the triggers currently in the database?', N'SHOW', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (313, 5, 0, N'Which of the following is known as the minimal super key?', N'Candidate key', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (314, 5, 0, N'Select the correct foreign key constraint?', N'Referential integrity', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (315, 5, 0, N'What is NOLOCK in SQL equivalent to?', N'READ UNCOMMITTED', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (318, 5, 0, N'How can the user change “Scaler” into “Interviewbit” in the “Name” column in the Users table?', N'UPDATE Users SET Name = ''Interviewbit'' WHERE Name = ''Scaler''', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (319, 5, 0, N'What is the name of the query that is placed within a WHERE or HAVING clause of another query?', N'Subquery', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (320, 5, 0, N'Which is the AS clause used for?', N'Rename', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (321, 5, 0, N'Which of the following are valid SQL constraints?', NULL, NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (322, 5, 0, N'Which of the following is also known as a concatenated key?', N'Composite Key', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (323, 5, 0, N'The program which performs some common action on database data and is also stored there is called?', N'Stored Procedure', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (324, 5, 0, N'How can SQL injections occur?', N'Both A and B.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (325, 5, 0, N'Which of the following constraints can be defined only at the column level?', N'NOT NULL', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (326, 5, 0, N'Group of operations that form a single logical unit of work called?', N'Transaction', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (327, 5, 0, N'Identify the concurrency-based protocol?', N'All', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (328, 5, 0, N'Which of the following is not a valid SQL type?', N'DECIMAL', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (329, 5, 0, N'What is the full form of SQL?', N'Structured Query Language', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (330, 5, 0, N'Which of the following is not a DDL command?', N'RENAME', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (331, 5, 0, N'Which of the following are TCL commands?', N'Both A and B', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (332, 5, 0, N'SQL views are also known as?', N'Virtual Table', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (333, 5, 0, N'Which of the following is not a valid aggregate function?', N'None of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (334, 3, 0, N'Javascript is an _______ language?', N'Object-Oriented', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (335, 3, 0, N'Which of the following keywords is used to define a variable in Javascript?', N'Both A and B', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (336, 3, 0, N'Which of the following methods is used to access HTML elements using Javascript?', N'Both A and B', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (337, 3, 0, N'Upon encountering empty statements, what does the Javascript Interpreter do?', N'Ignores the statements', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (338, 3, 0, N'Which of the following methods can be used to display data in some form using Javascript?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (339, 3, 0, N'How can a datatype be declared to be a constant type?', N'const', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (343, 3, 0, N'When the switch statement matches the expression with the given labels, how is the comparison done?', N'Both the datatype and the result of the expression are compared.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (344, 3, 0, N'What keyword is used to check whether a given property is valid or not?', N'in', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (345, 3, 0, N'What is the use of the <noscript> tag in Javascript?', N'The contents are displayed by non-JS-based browsers.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (350, 3, 0, N'When an operator’s value is NULL, the typeof returned by the unary operator is:', N'Object', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (352, 3, 0, N'What does the Javascript “debugger” statement do?', N'It acts as a breakpoint in a program.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (356, 3, 1, N'What is the output of the following code snippet?print(NaN === NaN);', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (357, 3, 0, N'What will be the output of the following code snippet?print(typeof(NaN));', N'Number', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (358, 3, 0, N'What does the ‘toLocateString()’ method do in JS?', N'Returns a localized string representation of an object.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (359, 3, 0, N'The process in which an object or data structure is translated into a format suitable for transferral over a network, or storage is called?', N'Object Serialization', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (360, 3, 0, N'Which function is used to serialize an object into a JSON string in Javascript?', N'stringify()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (361, 3, 0, N'The 3 basic object attributes in Javascript are:', N'Classes, Native object, and Interfaces and Object''s extensible flag.', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (365, 3, 0, N'Which of the following are closures in Javascript?', N'All of the above', NULL)
GO
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (366, 3, 0, N'Which of the following is not a Javascript framework?', N'Cassandra', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (368, 3, 0, N'What keyword is used to declare an asynchronous function in Javascript?', N'async', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (369, 3, 0, N'How to stop an interval timer in Javascript?', N'clearInterval', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (371, 3, 0, N'How are objects compared when they are checked with the strict equality operator?', N'Their references are compared', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (372, 3, 0, N'What does … operator do in JS?', N'It is used to spread iterables to individual elements', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (379, 3, 0, N'How do we write a comment in javascript?', N'//', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (380, 3, 0, N'Which object in Javascript doesn’t have a prototype?', N'Base Object', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (383, 3, 0, N'Which of the following are not server-side Javascript objects?', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (384, 8, 0, N'Full form of PHP is?', N'Hypertext preprocessor', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (385, 8, 0, N'Choose the default file extension of PHP among the following.', N'.php', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (386, 8, 0, N'What type of language is PHP?', N'Server-side scripting', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (387, 8, 0, N'Choose the correct syntax of PHP.', N'<?php?>', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (388, 8, 0, N'Choose the equivalent of the statement : $sub -= $sub.', N'$sub = $sub - $sub', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (389, 8, 0, N'Total ways in which user a print output in PHP is -', N'2', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (390, 8, 0, N'Among echo and print, which is faster?', N'echo', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (391, 8, 0, N'In PHP, variable names must start with which of the following.', N'All of the above', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (392, 8, 1, N'Is PHP variable case sensitive?', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (393, 8, 0, N'Total variable scope in PHP is?', NULL, NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (394, 8, 0, N'Choose the incorrect data type among the following.', N'void', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (395, 8, 0, N'Total looping techniques supported by PHP are?', N'4', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (396, 8, 1, N'Choose whether true or false: the do-while loop is an exit control loop.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (397, 8, 1, N'Choose whether true or false: while loop is an exit control loop.', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (398, 8, 0, N'Identify the function among the following, which is not built-in.', N'fclosed()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (399, 8, 0, N'Functions in PHP should start with which of the following keyword?', N'function', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (400, 8, 0, N'Total types of the array in PHP is?', N'3', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (401, 8, 0, N'Index of an array by default starts with which of the following in PHP?', N'0', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (402, 8, 0, N'trim() in PHP is used for?', N'Removes whitespaces', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (403, 8, 0, N'Another term used for Objects is?', N'instances', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (404, 8, 0, N'Using which keyword is the object created?', N'new', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (405, 8, 0, N'Another name of the constructor is?', N'Magic function', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (406, 8, 0, N'Among the following options, choose the term which is used to refer to methods within the class itself.', N'this', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (407, 8, 0, N'In which version of PHP was Type Hinting introduced?', N'PHP 5', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (408, 8, 0, N'Among the following functions, choose the one which accepts any number of parameters.', N'func_get_args()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (409, 8, 0, N'Which of the following is used to find files?', N'glob()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (410, 8, 0, N'Identify the function which is used to compress a string.', N'gzcompress()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (411, 8, 0, N'Which of the following function is used to sort array in descending order?', N'rsort()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (412, 8, 0, N'Choose the correct way to invoke a method among the following.', N'$object->methodName();', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (413, 8, 0, N'Choose the option which prevents a method from being overridden by a subclass?', N'Final', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (414, 8, 0, N'In PHP, how are constructors recognized?', N'function__construct()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (415, 8, 0, N'Identify the feature, which allows calling one or more methods or functions in single instruction?', N'Method chaining', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (416, 8, 0, N'Total error levels available in PHP are?', N'16', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (417, 8, 0, N'Error level E_ERROR denotes?', N'Fatal run-time error', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (418, 8, 0, N'Identify the options among the following which invokes the exception class.', N'throw new expection()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (419, 8, 0, N'Identify the options among the following which generates unique ids', N'uniqueid()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (422, 8, 0, N'Identify the function which adds a value at the end of an array?', N'array_push()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (424, 8, 0, N'Which of the following function is used to sort arrays in the natural order?', N'natcasesort()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (425, 8, 0, N'Identify the property scope not supported by PHP.', N'final', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (426, 8, 0, N'From which of the following class does the child class inherits?', N'Only 3 and 4', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (427, 8, 0, N'To implement overloading, which of the following magic method used?', N'__call', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (428, 8, 0, N'Full form of SPL is?', N'Standard PHP library', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (429, 8, 0, N'Total types of filtering present in PHP?', N'2', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (430, 8, 0, N'Identify the regular expression which matches any expression string having zero or one P?', N'P?', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (431, 8, 0, N'Full form of POSIX is?', N'Portable Operating system interface for Unix', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (432, 8, 0, N'Identify the function which converts a string to uppercase.', N'strtoupper()', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (433, 8, 0, N'The function FILESIZE() returns the size of the file in?', N'Bytes', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (434, 1, 1, N'Are HTML tags case sensitive?', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (435, 1, 1, N'Is HTML5 backward compatible with old browsers?', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (436, 1, 1, N'Inline elements are normally displayed without starting a new line.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (437, 1, 1, N'An <iframe> is used to display a web page within a web page.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (438, 1, 1, N'In HTML, you can embed SVG elements directly into an HTML page.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (439, 1, 1, N'An <iframe> is used to display a web page within a web page.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (440, 6, 1, N'Threads within the same process can share data with one another by passing pointers to objects on their stacks.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (441, 6, 1, N'A user-level process cannot modify its own page table entries.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (442, 6, 1, N'Immediately after a process has been forked, the same variable in both the parent and the child will have the same virtual memory address but different physical memory addresses.', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (443, 6, 1, N'The scheduler is the part of an Operating System that determines the priority of each process.', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (444, 6, 1, N'"Hyper-threading" refers to the situation in which a modern operating system allows thousands of threads to access the same address space.', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (445, 6, 1, N'Threads in a process share same file descriptors.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (446, 7, 1, N'Properties of an object are stored as rows in a table', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (447, 7, 1, N'DBMS stores data efficiently with little wasted space', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (448, 7, 1, N'A primary goal of a database system is to share data with multiple users', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (449, 7, 1, N'Multiple constraints can be included in a single query', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (450, 7, 1, N'The primary key does not necessarily have to be unique for a given table', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (451, 7, 1, N'Validation can make sure that your data is correct. a or b?', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (452, 3, 1, N'You can use a text string as a literal value or assign it to a variable', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (453, 3, 1, N'The statement document.write("This is a text string.");
prints "This is a text string".', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (454, 3, 1, N'JavaScript can be used to delete persistent cookies in a program.', N'TRUE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (455, 3, 1, N'To round a number to the next highest integer you will use the round(x) Math class method.', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (456, 3, 1, N'In JavaScript code, you use the words yes and no to indicate Boolean values.', N'FALSE', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (457, 2, 1, N'CSS stands for Cascading Style Sheets', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (458, 2, 1, N'CSS is used to style HTML documents', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (459, 2, 1, N'CSS is a programming language', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (460, 2, 1, N'CSS is used to create animations', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (461, 2, 1, N'CSS can only be used to change the color of text', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (462, 4, 1, N'jQuery is a JavaScript library.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (463, 4, 1, N'jQuery is a programming language.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (464, 4, 1, N'jQuery simplifies HTML document traversing, event handling, and animation.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (465, 4, 1, N'jQuery can only be used with JavaScript.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (466, 4, 1, N'jQuery is a replacement for JavaScript.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (467, 4, 1, N'jQuery can be used to create interactive and responsive web pages.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (468, 4, 1, N'jQuery is only compatible with the Internet Explorer browser.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (469, 4, 1, N'jQuery is no longer supported and maintained.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (470, 4, 1, N'jQuery can be used to create dynamic user interfaces.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (471, 4, 1, N'jQuery can only be used on the front-end.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (472, 6, 1, N'An operating system is a program that controls the execution of application programs and acts as an intermediary between the application and the computer hardware.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (473, 6, 1, N'A program that interacts with the hardware and provides common services for computer programs.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (474, 6, 1, N'A program that is loaded into memory and executed directly by the CPU.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (475, 6, 1, N'A program that acts as an intermediary between the user and the computer.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (476, 6, 1, N'An operating system is a program that controls the execution of application programs and acts as an intermediary between the application and the computer hardware.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (477, 6, 1, N'A multitasking operating system allows multiple programs to run simultaneously.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (478, 6, 1, N'A single-tasking operating system allows only one program to run at a time.', N'False', NULL)
GO
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (479, 6, 1, N'An operating system does not manage the memory.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (480, 6, 1, N'An operating system does not manage the file system.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (481, 6, 1, N'An operating system does not manage the input and output.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (482, 7, 1, N'In a tree, a node can have multiple parents.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (483, 7, 1, N'In a linked list, each node contains a pointer to the next node.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (484, 7, 1, N'A stack is a linear data structure that follows the LIFO principle.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (485, 7, 1, N'A queue is a linear data structure that follows the FIFO principle.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (486, 7, 1, N'In a binary search tree, the left child node must have a value smaller than its parent node.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (487, 7, 1, N'In a hash table, the keys are stored in a sorted order.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (488, 7, 1, N'In a graph, a vertex can be connected to itself.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (489, 7, 1, N'In a graph, edges represent the relationship between nodes.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (490, 7, 1, N'In a heap, the parent node must have a value smaller than its child nodes.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (491, 7, 1, N'In a breadth-first search, the algorithm visits all the nodes at the same depth before moving on to the next depth.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (492, 8, 1, N'XML stands for eXtensible Markup Language.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (493, 8, 1, N'XML is a programming language.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (494, 8, 1, N'XML documents can be used in a wide variety of applications.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (495, 8, 1, N'XML is a replacement for HTML.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (496, 8, 1, N'XML is case-sensitive.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (497, 8, 1, N'XML can be used to store structured data.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (498, 8, 1, N'XML is similar to JSON.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (499, 8, 1, N'XML is used to display data in the browser.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (500, 8, 1, N'XML is a proprietary technology.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (501, 8, 1, N'XML is only used for web development.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (502, 9, 1, N'TCP/IP is a set of protocols that allows communication between different types of devices.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (503, 9, 1, N'A switch is a networking device that connects devices on a LAN.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (504, 9, 1, N'A router is a device that connects different LANs and WANs together.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (505, 9, 1, N'A firewall is a device that is used to protect a network from unauthorized access.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (506, 9, 1, N'A proxy server is used to hide the IP address of a client.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (507, 9, 1, N'DNS is used to translate domain names to IP addresses.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (508, 9, 1, N'VPN stands for Virtual Public Network.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (509, 9, 1, N'FTP is used to transfer files between computers over a network.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (510, 9, 1, N'SMTP is used for sending and receiving emails over a network.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (511, 9, 1, N'TCP is a connection-oriented protocol.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (512, 10, 1, N'C# is a type-safe programming language.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (513, 10, 1, N'C# is a case-sensitive programming language.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (514, 10, 1, N'C# can only be used to develop Windows applications.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (515, 10, 1, N'C# is an interpreted language.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (516, 10, 1, N'The C# language is based on C++.', N'True', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (517, 10, 1, N'C# does not support multithreading.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (518, 10, 1, N'C# does not support garbage collection.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (519, 10, 1, N'C# does not support exception handling.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (520, 10, 1, N'C# does not support delegates and events.', N'False', NULL)
INSERT [dbo].[Questions] ([Question_ID], [Crs_ID], [Q_Type], [Q_Statement], [Model_Answer], [Q_Code]) VALUES (521, 10, 1, N'C# is not an object-oriented programming language.', N'False', NULL)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (1, N'Inline', N'Internal', N'External', N'None of the above')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (2, N'<?-- -->', N'<!-- -->', N'<!-- --!>', N'</-- -->')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (3, N'<p style=”backgroundColor: #a7b8c9”><p>', N'<p style=”background-color= #a7b8c9”></p>', N'<p style=”background-color: #a7b8c9”></p>', N'<p style=”color: #a7b8c9></p>')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (4, N'<a src=”http://www.xyz.com/image”><img src=”image path” /></a>', N'<a src=”http://www.xyz.com/image”><img href=”image path” /></a>', N'<link href=”http://www.xyz.com/image”><img src=”image path” /></link>', N'<a href=”http://www.xyz.com/image”><img src=”image path” /></a>')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (5, N'<div>', N'<nav>', N'<article>', N'<summary>')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (6, N'<p style=”textSize: 10px”></p>', N'<p style=”text-size: 10px”></p>', N'<p style=”font-size: 10px”></p>', N'<p style=”fontSize: 10px”></p>')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (7, N'.hml', N'.xml', N'.html', N'.htm')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (8, N'True', N'False', N'', N'')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (9, N'tooltip', N'title', N'ref', N'None of the above')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (10, N'inline-flex', N'flexbox', N'flex', N'grid')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (11, N'A custom data attribute starts with data- and would be named based on the requirement.', N'The values of these attributes can be retrieved using JavaScript APIs or CSS, similar to standard attribute.', N'Both of the above.', N'None of the above')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (12, N'onloadedmetadata', N'onloadstart', N'onmessage', N'Onoffline')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (13, N'data-x', N'common', N'accesskey', N'Src')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (14, N'playbackrate', N'defaultPlaybackrate', N'currentTime', N'Duration')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (15, N'<article>', N'<mark>', N'<section>', N'<span>')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (16, N'geolocation.watchPosition()', N'geolocation.getcurrentPosition()', N'geolocation.clearPosition()', N'geolocation.clearCurrentPosition(')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (17, N'onhaschange', N'onchange', N'ischanged', N'inputchange')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (18, N'To display web page within a web page', N'To display animation within a web page', N'To display web page without browser', N'All of the above')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (19, N'content', N'editable', N'contenteditable', N'contextmenu')
INSERT [dbo].[Sheet1$] ([Question_ID], [answers/0], [answers/1], [answers/2], [answers/3]) VALUES (20, N'beforeprint', N'onbeforeprint', N'onprint', N'onafterprint')
GO
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (1, 1, 10, 90)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (1, 2, 3, 85)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (1, 3, 7, 60.0000038)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (1, 4, 5, 76)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (1, 5, 2, 78)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (3, 3, 7, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (3, 4, 5, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (4, 4, 5, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (6, 6, 4, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (7, 7, 1, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (8, 8, 1, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (9, 9, 6, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (10, 10, 8, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (11, 2, 3, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (12, 1, 10, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (13, 3, 7, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (14, 8, 1, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (15, 9, 6, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (16, 4, 5, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (17, 10, 8, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (18, 9, 6, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (19, 9, 6, NULL)
INSERT [dbo].[Stud_Course] ([St_ID], [Crs_ID], [Instructor_ID], [St_Grade]) VALUES (20, 8, 1, NULL)
GO
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (1, N'Ahmed Mohamed', 1234567889, N'ahmed.m@gmail.com', N'Salem Salem', N'Cairo', 10, N'123456789')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (2, N'Amr Ghoniem', 1069225715, N'amr.gh@gmail.com', N'Hilton', N'Mansoura', 20, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (3, N'Magdy  Ahmed  ', 1122448731, N'magdy.a@gmail.com', N'Mohamed Hagag', N'Cairo', 10, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (4, N'Fady Omar', 1599334452, N'fady.o@gmail.com', N'El Mina El Sharkeya', N'Alex', 30, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (5, N'Khalid Mahmoud', 1114435782, N'khalid.m@gmail.com', N'Eskan Shabab ', N'Alex', 30, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (6, N'Heba Basem', 1553729547, N'heba.b@gmail.com', N'Abo Dawood El Zahiry', N'Alex', 40, N'132')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (7, N'Nahed Moatz', 1233665571, N'nahed.m@gmail.com', N'Maadi', N'Cairo', 50, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (8, N'Mohamed Ibrahim', 1258231649, N'Mohamed.i@gmail.com', N'El Amir Gamil', N'Mansoura', 20, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (9, N'Marwa Farouk', 1178268921, N'marwa.f@gmail.com', N'El-Selsela Tower 95 26th July', N'Alex', 40, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (10, N'Noha Kamel', 1023399788, N'noha.k@gmail.com', N' Shubra', N'Cairo', 50, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (11, N'Omar Hamdy', 1050201469, N'omar.h@gmail.com', N'18 Gamal El Din El Shayal', N'Cairo', 80, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (12, N'Zeinab Hamed', 1119977258, N'zeinab.h@gmail.com', N'45 Abdel Razeq El Sanhory', N'Cairo', 10, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (13, N'Ustina Samir', 1536921523, N'ustina.s@gmail.com', N'8 Abd EL Aziz EL Atar', N'Cairo', 40, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (14, N'Habiba Yasser', 1266220001, N'habiba.y@gmail.com', N'10 Messaha', N'Mansoura', 50, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (15, N'Rania Abdulaah', 1288805521, N'rania.a@gmail.com', N'6 Mohamed Mousa', N'Alex', 60, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (16, N'Mariam Maged', 1000632971, N'mariam.m@gmail.com', N'El-Nozha El-Gedida', N'Cairo', 60, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (17, N'Adam Hany ', 1223378054, N'adam.h@gmail.com', N'Opposite 15 El Hamamil', N'Mansoura', 70, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (18, N'Yassen Ahmed', 1022339977, N'yassen.a@gmail.com', N'58 Tahrir', N'Cairo', 50, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (19, N'Nada Mahmoud', 1199304218, N'nada.m@gmail.com', N' 26 Serhank', N'Mansoura', 70, N'123')
INSERT [dbo].[Student] ([St_ID], [St_Name], [St_phone], [St_Email], [Street], [city], [Dept_ID], [password]) VALUES (20, N'Ayman Walid', 1288992266, N'ayman.w@gmail.com', N'95 Hafez Ramadan', N'Cairo', 80, N'123')
GO
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (1, N'Table', N'How to handle tables in HTML', 1)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (2, N'Form', N'How to handle Forms in HTML', 1)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (3, N'Image', N'Learn how to insert images in HTML file', 1)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (4, N'margin', NULL, 2)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (5, N'padding', NULL, 2)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (6, N'colors', NULL, 2)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (7, N'variables', NULL, 3)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (8, N'events', NULL, 3)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (9, N'Objects', NULL, 3)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (10, N'Ajax', NULL, 4)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (11, N'Effects', NULL, 4)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (12, N'Triggers', NULL, 5)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (13, N'View', NULL, 5)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (14, N'Function', NULL, 5)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (15, N'Process Management', NULL, 6)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (16, N'File Management', NULL, 6)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (17, N'Security Management', NULL, 6)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (18, N'Array', NULL, 7)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (19, N'Queue', NULL, 7)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (20, N'Stack', NULL, 7)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (21, N'Tree', NULL, 7)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (22, N'XML Elements', NULL, 8)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (23, N'XML Attributes', NULL, 8)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (24, N'XML Ajax', NULL, 8)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (25, N'Cloud & Data Center', NULL, 9)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (26, N'Mobile & Wireless', NULL, 9)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (27, N'Infrastructure', NULL, 9)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (28, N'Namespaces', NULL, 10)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (29, N'Classes', NULL, 10)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (30, N'Indexers ', NULL, 10)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (40, N'angular', N'front-end-dev', 6)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Name], [Topic_Desc], [Crs_ID]) VALUES (45, N'Next.js', NULL, 7)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student]    Script Date: 2023-01-20 8:54:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student] ON [dbo].[Student]
(
	[St_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Mgr_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor]
GO
ALTER TABLE [dbo].[Exam_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Answers_Exam] FOREIGN KEY([Ex_ID])
REFERENCES [dbo].[Exam] ([Ex_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_Answers] CHECK CONSTRAINT [FK_Exam_Answers_Exam]
GO
ALTER TABLE [dbo].[Exam_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Answers_Questions] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions] ([Question_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_Answers] CHECK CONSTRAINT [FK_Exam_Answers_Questions]
GO
ALTER TABLE [dbo].[Exam_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Answers_Student] FOREIGN KEY([St_ID])
REFERENCES [dbo].[Student] ([St_ID])
GO
ALTER TABLE [dbo].[Exam_Answers] CHECK CONSTRAINT [FK_Exam_Answers_Student]
GO
ALTER TABLE [dbo].[Exam_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Questions_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Ex_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_Questions] CHECK CONSTRAINT [FK_Exam_Questions_Exam]
GO
ALTER TABLE [dbo].[Exam_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Questions_Questions] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions] ([Question_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_Questions] CHECK CONSTRAINT [FK_Exam_Questions_Questions]
GO
ALTER TABLE [dbo].[Ins_Crs]  WITH CHECK ADD  CONSTRAINT [FK_Ins_Crs_Courses] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[Ins_Crs] CHECK CONSTRAINT [FK_Ins_Crs_Courses]
GO
ALTER TABLE [dbo].[Ins_Crs]  WITH CHECK ADD  CONSTRAINT [FK_Ins_Crs_Instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Ins_Crs] CHECK CONSTRAINT [FK_Ins_Crs_Instructor]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[Department] ([Dept_ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO
ALTER TABLE [dbo].[Question_Choices]  WITH CHECK ADD  CONSTRAINT [FK_Question_Choices_Questions1] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions] ([Question_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question_Choices] CHECK CONSTRAINT [FK_Question_Choices_Questions1]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Courses] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Courses]
GO
ALTER TABLE [dbo].[Stud_Course]  WITH CHECK ADD  CONSTRAINT [FK_Stud_Course_Courses] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[Stud_Course] CHECK CONSTRAINT [FK_Stud_Course_Courses]
GO
ALTER TABLE [dbo].[Stud_Course]  WITH CHECK ADD  CONSTRAINT [FK_Stud_Course_Instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Stud_Course] CHECK CONSTRAINT [FK_Stud_Course_Instructor]
GO
ALTER TABLE [dbo].[Stud_Course]  WITH CHECK ADD  CONSTRAINT [FK_Stud_Course_Student] FOREIGN KEY([St_ID])
REFERENCES [dbo].[Student] ([St_ID])
GO
ALTER TABLE [dbo].[Stud_Course] CHECK CONSTRAINT [FK_Stud_Course_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[Department] ([Dept_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Courses] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Courses]
GO
/****** Object:  StoredProcedure [dbo].[de_Ex_Ans]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[de_Ex_Ans] @Ex_ID int, @St_ID int, @Question_ID int
as
	begin try
		delete from Exam_Answers
		where Ex_ID = @Ex_ID and St_ID = @St_ID and Question_ID = @Question_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[de_Ins_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[de_Ins_Crs] @Crs_ID int, @Ins_ID int
as
	begin try
		delete from Ins_Crs
		where Crs_ID = @Crs_ID and Instructor_ID = @Ins_ID
	end try
	begin catch
		select 'error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[de_St_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[de_St_Crs] @St_ID int, @Crs_ID int
as
	begin try
		delete from Stud_Course
		where St_ID = @St_ID and Crs_ID = @Crs_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[DelCourse]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROC [dbo].[DelCourse]  @id int
AS
	BEGIN TRY

		DELETE FROM Courses
		WHERE Crs_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[deleteDepartment]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete
create procedure [dbo].[deleteDepartment] @id int
as
	IF EXISTS ( select 1 from Department where Dept_ID = @id )
	BEGIN
		delete from Department where Dept_ID= @id
	END
	ELSE
	SELECT 'No row found' AS ErrorMessage; 
GO
/****** Object:  StoredProcedure [dbo].[deletetStudent]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--delete
create procedure [dbo].[deletetStudent] @id int
as
	IF EXISTS ( select 1 from Student where St_ID = @id )
	BEGIN
		delete from Student where St_ID= @id
	END
	ELSE
	SELECT 'No row found' AS ErrorMessage; 
GO
/****** Object:  StoredProcedure [dbo].[DelExam]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROC [dbo].[DelExam] @id int

AS
	BEGIN TRY

		DELETE FROM Exam
		WHERE Ex_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[DelExamQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DELETE
CREATE PROC [dbo].[DelExamQuestions]  @Quest_id int

AS
	BEGIN TRY

		DELETE FROM Exam_Questions
		WHERE Question_ID = @Quest_id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[DelInstructor]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROC [dbo].[DelInstructor]  @id int

AS
	BEGIN TRY

		DELETE FROM Instructor
		WHERE Ins_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[DelQuestionChoice]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DELETE
CREATE PROC [dbo].[DelQuestionChoice] @id int

AS
	BEGIN TRY

		DELETE FROM Question_Choices
		WHERE  Question_ID= @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[deQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------
/* 3- Delete Question*/

 create proc [dbo].[deQuestions] 
			@Q_ID int
			
as
	begin try
		delete from Questions
		where Question_ID = @Q_ID

	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[deTopic]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------------------------------------------------------------------------
/* 3- Delete Topic*/

 create proc [dbo].[deTopic] 
			@Topic_ID int
			
as
	begin try
		delete from Topic
		where Topic_ID = @Topic_ID

	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[exam_answer]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[exam_answer]
    @exam_ID INT,
    @st_ID  int,
	@q_ID int, 
	@answer varchar(300)
AS
BEGIN
declare @std_name varchar(50)
set @std_name = 
			(select Student.St_Name from Student 
			where Student.St_ID = @st_ID)
    BEGIN TRY
        IF (@exam_ID IS NULL OR @st_ID IS NULL OR @q_ID IS NULL )
            RAISERROR('exam_ID, this data are required', 16, 1)
        ELSE
            -- Insert the answers into the answers table
            INSERT INTO Exam_Answers(Ex_ID,St_ID,Question_ID,St_Answer)
            VALUES (@exam_ID,@st_ID,@q_ID,@answer)

            SELECT 'All your answers has been registered for exam id ' + CAST(@exam_ID AS VARCHAR) + ' and the student name is '+ @std_name
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[exam_correction]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[exam_correction]
	@Ex_ID int, @St_ID int
as
begin
	begin try
		IF (@Ex_ID IS NULL OR @St_ID IS NULL )
            RAISERROR('Ex_ID, St_ID', 16, 1)
		ELSE
			declare @grade int, @total int
			set @grade = 0
			set @total = 0

			declare @Crs_ID int
			select distinct @Crs_ID = Crs_ID
			from Exam_Questions EQ inner join Exam E 
			on EQ.Exam_ID = E.Ex_ID inner join Questions Q
			on EQ.Question_ID = Q.Question_ID
			where E.Ex_ID = @Ex_ID
			

			declare c1 cursor
			for
				select ans.Question_ID, ans.St_Answer, Q.Model_Answer
				from Exam_Answers ans inner join Questions Q
				on Q.Question_ID = ans.Question_ID
				where ans.Ex_ID = @Ex_ID and ans.St_ID = @St_ID
			for read only

			declare @Q_ID int, @St_ans varchar(20), @Model_ans varchar(20)
			open c1
			fetch c1 into @Q_ID, @St_ans, @Model_ans
			while @@FETCH_STATUS = 0
				begin
					set @total = @total + 1
					if (@St_ans = @Model_ans)
						set @grade = @grade + 1
					fetch c1 into @Q_ID, @St_ans, @Model_ans
				end
			close c1
			deallocate c1

			
			declare @percent real = ((convert(real,@grade) / convert(real,@total) )* 100)
			update Stud_Course 
			set St_Grade = @percent
			where St_ID = @St_ID and Crs_ID = @Crs_ID;

			select @Ex_ID as Ex_ID,
				   @St_ID as St_ID,
				   @grade as grade,
				   @total as total,
				   @percent as [Percentage]
	end try
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
end
GO
/****** Object:  StoredProcedure [dbo].[generate_exam]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[generate_exam]
    @Crs_ID INT,
    @num_mcq INT = 7,
    @num_tf INT = 3
AS
BEGIN
    DECLARE @exam_ID INT
	declare @crs_name varchar(50)
    BEGIN TRY
        IF (@Crs_ID IS NULL OR @num_mcq IS NULL OR @num_tf IS NULL)
            RAISERROR('Crs_ID, num_mcq, num_tf are required', 16, 1)
        ELSE
            -- Insert a new exam into the exam table and get the generated ID

			set @crs_name = 
			(select Courses.Cr_Name from Courses 
			where Courses.Crs_ID = @Crs_ID)

			INSERT INTO Exam (Ex_Name) VALUES (@crs_name)
            SET @exam_ID = SCOPE_IDENTITY()
			
            -- Select the desired number of random MCQ questions
            INSERT INTO Exam_Questions(Exam_ID, Question_ID)
            SELECT @exam_ID, mcq_questions.Question_ID
            FROM (
                SELECT TOP (@num_mcq) question_ID
                FROM Questions
                WHERE Crs_ID = @Crs_ID AND Q_Type = 0
                ORDER BY NEWID()
            ) mcq_questions

            -- Select the desired number of random true/false questions
           INSERT INTO Exam_Questions(Exam_ID, Question_ID)
            SELECT @exam_ID, tf_questions.Question_ID
            FROM (
                SELECT TOP (@num_tf) question_ID
                FROM Questions
                WHERE Crs_ID = @Crs_ID AND Q_Type = 1
                ORDER BY NEWID()
            ) tf_questions

            SELECT @exam_ID as exam_ID
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[get_exam_questions_with_choices]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_exam_questions_with_choices] @Ex_ID int
as
	begin try

		declare @result table
		(Q_Type int,Q_ID int, Q_Code varchar(300), Q_Statement varchar(300), 
		[Answer-1] varchar(300), [Answer-2] varchar(300), 
		[Answer-3] varchar(300), [Answer-4] varchar(300))

		insert into @result
		select Q.Q_Type,Q.Question_ID, Q.Q_Code, Q.Q_Statement, QC.[Answer-1], QC.[Answer-2], QC.[Answer-3], QC.[Answer-4]
		from Exam_Questions EQ inner join Questions Q
		on EQ.Question_ID = Q.Question_ID inner join Question_Choices QC
		on Q.Question_ID = QC.Question_ID
		where EQ.Exam_ID = @Ex_ID and Q.Q_Type = 0

		insert into @result
		select Q.Q_Type,Q.Question_ID, Q.Q_Code, Q.Q_Statement, null, null, null, null
		from Exam_Questions EQ inner join Questions Q
		on EQ.Question_ID = Q.Question_ID
		where EQ.Exam_ID = @Ex_ID and Q.Q_Type = 1

		select ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS number,* from @result
	end try
	begin catch
		select 'Error'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[get_student_exam_q_with_answers]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 6)
-- Report that takes exam number and the student
-- ID then returns the Questions in this exam with
-- the student answers.
CREATE proc [dbo].[get_student_exam_q_with_answers] @Ex_ID int, @St_ID int
as
	begin try
		select Q.Q_Statement, EA.St_Answer, Q.Model_Answer
		from Exam_Answers EA inner join Questions Q
		on EA.Question_ID = Q.Question_ID
		where Ex_ID = @Ex_ID and St_ID = @St_ID
	end try
	begin catch
		select 'Error'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[get_student_grades]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 2)

--Report that takes the student ID and returns the
--grades of the student in all courses. %

CREATE proc [dbo].[get_student_grades] @id int
as
	begin try
		select C.Crs_ID, C.Cr_Name, I.Ins_Name, SC.St_Grade
		from Stud_Course SC inner join Courses C
		on SC.Crs_ID = C.Crs_ID inner join Instructor I
		on SC.Instructor_ID = I.Ins_ID
		where St_ID = @id and SC.St_Grade is not null

	end try
	begin catch
	end catch
GO
/****** Object:  StoredProcedure [dbo].[get_students_info_by_dept]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[get_students_info_by_dept]  @id INT
AS
	BEGIN TRY
		SELECT * 
		FROM Student
		WHERE Dept_ID = @id
	END TRY

	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ins_Ex_Ans]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ins_Ex_Ans] @Ex_ID int, @St_ID int, @Question_ID int, @St_Ans varchar(100)
as
	begin try
		insert into Exam_Answers
		Values (@Ex_ID, @St_ID, @Question_ID, @St_Ans)
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[ins_Ins_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ins_Ins_Crs] @Crs_ID int, @Ins_ID int
as
	begin try
		insert into Ins_Crs
		values (@Crs_ID, @Ins_ID)
	end try
	begin catch
		select 'error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[ins_St_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ins_St_Crs] @St_ID int, @Crs_ID int, @Ins_ID int, @St_Grade int = NULL
as
	begin try
		insert into Stud_Course
		Values (@St_ID, @Crs_ID, @Ins_ID, @St_Grade)
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[InsCourse]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Courses Table

--INSERT
CREATE PROC [dbo].[InsCourse] @id int, 
					  @name nvarchar(50)
					
AS
	BEGIN TRY

		INSERT INTO Courses(Crs_ID, Cr_Name)
		VALUES( @id, @name)

	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

 --------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[insertDepartment]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--insert
create procedure [dbo].[insertDepartment] @id int , @name varchar(20) , @Mgr_id int , @description varchar(100) = null , @location varchar(100) = null , @hireDate Date = null
as 
	IF NOT EXISTS ( select 1 from Department where Dept_ID= @id )
	BEGIN
		insert into Department values( @id , @name , @Mgr_id , @description, @location, @hireDate)
	END
	ELSE
	print 'Record exists'
GO
/****** Object:  StoredProcedure [dbo].[insertStudent]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--insert
create procedure [dbo].[insertStudent] @id int , @name varchar(20) , @Dept_id int , @email varchar(30), @phone int = null, @street varchar(30) = null , @city varchar(20) = null
as 
	IF NOT EXISTS ( select 1 from Student where St_ID= @id ) and NOT EXISTS ( select 1 from Student where St_Email= @email )
	BEGIN
		insert into Student values( @id , @name , @phone , lower(@email) , @street , @city , @Dept_id )
	END
	ELSE IF EXISTS ( select 1 from Student where St_ID= @id )
	SELECT 'Student id already exists' AS ErrorMessage;
	ELSE IF EXISTS ( select 1 from Student where St_Email= @email )
	SELECT 'Student email already exists' AS ErrorMessage;

GO
/****** Object:  StoredProcedure [dbo].[InsExam]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Exam Table

--INSERT
CREATE PROC [dbo].[InsExam] @id int, 
			        @name nvarchar(50)
					

AS
	BEGIN TRY

		INSERT INTO Exam(Ex_ID, Ex_Name)
		VALUES( @id, @name)

	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

 --------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[InsExamQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Exam Questions Table

--INSERT
CREATE PROC [dbo].[InsExamQuestions] @Exam_id int, 
					         @Quest_id int
					

AS
	BEGIN TRY

		INSERT INTO Exam_Questions(Exam_ID, Question_ID)
		VALUES( @Exam_id, @Quest_id)

	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

 --------------------------------------------------------------------------------------------
 



--------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[InsInstructor]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Instructor Table

--INSERT
CREATE PROC [dbo].[InsInstructor] @id int, 
						  @name nvarchar(20), 
						  @degree nvarchar(20), 
						  @salary int, 
						  @department int

AS
	BEGIN TRY

		INSERT INTO Instructor (Ins_ID, Ins_Name, Ins_Degree, Ins_Salary, Dept_ID)
		VALUES( @id, @name, @degree, @salary, @department)

	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH


--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[InsQuestionChoices]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Question Choices Table

--INSERT
CREATE PROC [dbo].[InsQuestionChoices] @id int, 
							   @Ans1 varchar(300),
							   @Ans2 varchar(300),
							   @Ans3 varchar(300),
							   @Ans4 varchar(300)

					

AS
	BEGIN TRY

		INSERT INTO Question_Choices(Question_ID, [Answer-1], [Answer-2], [Answer-3], [Answer-4])
		VALUES( @id, @Ans1, @Ans2, @Ans3, @Ans4)

	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH


GO
/****** Object:  StoredProcedure [dbo].[insQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Note: 
			1-should we also insert the answers in the questions_Choices table .. in the same stored procedure? 
			the relation between the two tables are weird to me.

			2- in the question_choices is the question_ID a primary and a foregin key at the same time ? 
		
*/

/* 1- Insert Question*/

 create proc [dbo].[insQuestions] 
			@Q_ID int,
			@Crs_ID int,
			@Q_Type int,
			@Q_Statement varchar(300),
			@Model_Answer varchar(300),
			@Q_Code varchar(300) = null
as
	begin try
		insert into Questions
		values(@Q_ID, @Crs_ID,@Q_Code,@Q_Statement,@Q_Type,@Model_Answer)

	end try
	begin catch
		select 'Q_ID is used before'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[insTopic]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Note: 
			1- we must increase the size for topic_desc 
		
*/


/* 1- Insert Topic*/

 create proc [dbo].[insTopic] 
			@Topic_ID int,
			@Topic_Name varchar(20),
			@Crs_ID int,
			@Topic_Desc varchar(40) = null
as
	begin try
		insert into Topic
		values(@Topic_ID, @Topic_Name, @Topic_Desc , @Crs_ID)

	end try
	begin catch
		select 'Topic_ID is used before'
	end catch


-- test 

GO
/****** Object:  StoredProcedure [dbo].[InstructorCourses]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[InstructorCourses]    @id INT
AS
	BEGIN TRY

		SELECT c.Cr_Name , count(sc.st_id) as 'Number of Student'
		FROM Instructor i inner join Ins_Crs ic 
		ON ic.Instructor_ID = i.ins_id
		inner join Courses c
		ON c.Crs_ID = ic. Crs_ID
		inner join Stud_Course sc
		on sc.Instructor_ID = i.Ins_ID and sc.Crs_ID = ic.Crs_ID
		WHERE i.Ins_ID= @id
		group by c.Cr_Name, sc.crs_id

	END TRY

	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[loginStudent]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[loginStudent] @email varchar(50)
as
	declare @st_id int = -1

	select @st_id = St_ID
	from Student where St_Email = @email

	select @st_id

GO
/****** Object:  StoredProcedure [dbo].[sel_all_course_students]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_all_course_students] @Crs_ID int
as
	begin try
		select * from Stud_Course
		where Crs_ID  = @Crs_ID 
	end try
	begin catch
		select 'Error'
	end catch


GO
/****** Object:  StoredProcedure [dbo].[sel_All_Ins_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_All_Ins_Crs] @Crs_ID int
as
	begin try
		select * from Ins_Crs
		where Crs_ID = @Crs_ID
	end try
	begin catch
		select 'error'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sel_all_st_answers]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_all_st_answers] @Ex_ID int, @St_ID int
as
	begin try
		select * from Exam_Answers
		where Ex_ID = @Ex_ID and St_ID = @St_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[sel_all_st_exams]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_all_st_exams] @St_ID int
as
	begin try
		select * from Exam_Answers
		where St_ID = @St_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[sel_all_student_courses]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sel_all_student_courses] @St_ID int
as
	begin try
		select SC.*,C.Cr_Name from Stud_Course SC inner join Courses C
		on SC.Crs_ID = C.Crs_ID
		where St_ID = @St_ID 
	end try
	begin catch
		select 'Error'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sel_Crs_Ins]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_Crs_Ins] @Ins_ID int
as
	begin try
		select * from Ins_Crs
		where Instructor_ID = @Ins_ID
	end try
	begin catch
		select 'error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[sel_St_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sel_St_Crs] @St_ID int, @Crs_ID int = NULL
as
	begin try
		select * from Stud_Course
		where St_ID = @St_ID and Crs_ID = @Crs_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[sel_st_quest_ans]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_st_quest_ans] @Ex_ID int, @St_ID int, @Question_ID int
as
	begin try
		select * from Exam_Answers
		where Ex_ID = @Ex_ID and St_ID = @St_ID and Question_ID = @Question_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[SelectAllCourses]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT ALL COURSES
CREATE PROC [dbo].[SelectAllCourses]
AS
	BEGIN TRY

		SELECT * 
		FROM Courses
	
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SelectAllExamQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT ALL ExamQuestions
CREATE PROC [dbo].[SelectAllExamQuestions]
 
AS
	BEGIN TRY

		SELECT * 
		FROM Exam_Questions
	
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH



GO
/****** Object:  StoredProcedure [dbo].[SelectAllExams]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------
--SELECT ALL COURSES
CREATE PROC [dbo].[SelectAllExams]
 
AS
	BEGIN TRY

		SELECT * 
		FROM Exam
	
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SelectAllInstructors]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT ALL INSTRUCTORS
CREATE PROC [dbo].[SelectAllInstructors]
 
AS
	BEGIN TRY

		SELECT * 
		FROM Instructor
	
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SelectAllQuestionChoice]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------
--SELECT ALL Question Choice
CREATE PROC [dbo].[SelectAllQuestionChoice]
 
AS
	BEGIN TRY

		SELECT * 
		FROM Question_Choices
	
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SelectCourse]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SELECT SPECIFIC ROW
CREATE PROC [dbo].[SelectCourse]  @id int
AS
	BEGIN TRY

		SELECT * 
		FROM Courses
		WHERE Crs_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[selectDepartment]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select
create procedure [dbo].[selectDepartment] @id int
as 
	IF EXISTS ( select 1 from Department where Dept_ID = @id )
	BEGIN
		select *
		from Department
		where Dept_ID = @id
	END
	ELSE
	SELECT 'No row found' AS ErrorMessage; 

GO
/****** Object:  StoredProcedure [dbo].[SelectExam]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT SPECIFIC ROW
CREATE PROC [dbo].[SelectExam]  @id int

AS
	BEGIN TRY

		SELECT * 
		FROM Exam
		WHERE Ex_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SelectExamQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT SPECIFIC ROW
CREATE PROC [dbo].[SelectExamQuestions]  @Exam_id int

AS
	BEGIN TRY

		SELECT * 
		FROM Exam_Questions
		WHERE Exam_ID = @Exam_id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SelectInstructor]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SELECT SPECIFIC ROW
CREATE PROC [dbo].[SelectInstructor]  @id int

AS
	BEGIN TRY

		SELECT * 
		FROM Instructor
		WHERE Ins_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SelectQuestionChoice]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------

--SELECT SPECIFIC ROW
CREATE PROC [dbo].[SelectQuestionChoice]  @id int

AS
	BEGIN TRY

		SELECT * 
		FROM Question_Choices
		WHERE Question_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[selectQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------
/* 4- select Question*/

-- 1- specific question
 create proc [dbo].[selectQuestions] 
			@Q_ID int
			
as
	begin try
		select *  from Questions
		where Question_ID = @Q_ID

	end try
	begin catch
		select 'Error'
	end catch

-- 2- show all questions
GO
/****** Object:  StoredProcedure [dbo].[selectStudent]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select
create procedure [dbo].[selectStudent] @id int
as 
	IF EXISTS ( select 1 from Student where St_ID = @id )
	BEGIN
		select *
		from Student
		where St_ID = @id
	END
	ELSE
	SELECT 'No row found' AS ErrorMessage; 

GO
/****** Object:  StoredProcedure [dbo].[selectTopic]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------
/* 4- select Topic*/

-- 1- specific Topic
 create proc [dbo].[selectTopic]
			@Topic_ID int
			
as
	begin try
		select *  from Topic
		where Topic_ID = @Topic_ID

	end try
	begin catch
		select 'Error'
	end catch

-- 2- show all Topics
GO
/****** Object:  StoredProcedure [dbo].[showAllQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[showAllQuestions] 					
as
	begin try
		select *  from Questions
		
	end try
	begin catch
		select 'Error'
	end catch

--test

GO
/****** Object:  StoredProcedure [dbo].[showAllTopics]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[showAllTopics] 					
as
	begin try
		select *  from Topic
		
	end try
	begin catch
		select 'Error'
	end catch

--test
GO
/****** Object:  StoredProcedure [dbo].[TopicInfo]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TopicInfo] @id INT
AS 
	BEGIN TRY
		SELECT Topic_ID, Topic_Name, Topic_Desc 
		FROM Topic t inner join Courses c
		ON c.Crs_ID = t.Crs_ID
		WHERE t.Crs_ID = @id
	END TRY

	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[up_Ex_Ans]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[up_Ex_Ans] @Ex_ID int, @St_ID int, @Question_ID int, @St_Ans varchar(100)
as
	begin try
		update Exam_Answers
		set St_Answer =  @St_Ans
		where Ex_ID = @Ex_ID and St_ID = @St_ID and Question_ID = @Question_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[up_Ins_Crs]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[up_Ins_Crs] @Crs_ID int, @Ins_ID int
as
	begin try
		update Ins_Crs
		set Instructor_ID = @Ins_ID
		where Crs_ID = @Crs_ID and Instructor_ID = @Ins_ID
	end try
	begin catch
		select 'error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[up_St_Grade]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[up_St_Grade] @St_ID int, @Crs_ID int, @St_Grade int
as
	begin try
		update Stud_Course
		set St_Grade = @St_Grade
		where St_ID = @St_ID and Crs_ID = @Crs_ID
	end try
	begin catch
		select 'Error'
	end catch

GO
/****** Object:  StoredProcedure [dbo].[UpCourse]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--UPDATE
CREATE PROC [dbo].[UpCourse]  @id int,
					  @name nvarchar(50)
AS
	BEGIN TRY

		UPDATE Courses
		SET  Cr_Name = @name
		WHERE Crs_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH


--------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[updateDepartment]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--update
create procedure [dbo].[updateDepartment] @id int , @name varchar(20) = null , @Mgr_id int = null , @description varchar(100) = null , @location varchar(100) = null , @hireDate Date = null
as
	IF EXISTS ( select 1 from Department where Dept_ID = @id ) and (EXISTS ( select 1 from Instructor where Ins_ID = @Mgr_id ) or ( select 1 from Instructor where Ins_ID = @Mgr_id ) is null )
	BEGIN
		UPDATE Department
		set Dept_Name = isnull(@name, Dept_Name), Mgr_ID = isnull(@Mgr_id, Mgr_ID), Dept_Description = isnull(@description, Dept_Description),Dept_Location = isnull(@location, Dept_Location),Mgr_HrieDate = isnull(@hireDate, Mgr_HrieDate)
		where Dept_ID = @id
	END
	ELSE
	SELECT 'No row found' AS ErrorMessage;


---------------------------------------------------------------------------------------

--calling
GO
/****** Object:  StoredProcedure [dbo].[updatetStudent]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--update
create procedure [dbo].[updatetStudent] @id int , @name varchar(20) = null , @Dept_id int = null  , @phone int = null , @email varchar(30) = null , @street varchar(30) = null , @city varchar(20) = null 
as
	IF EXISTS ( select 1 from Student where St_ID = @id )
	BEGIN
		UPDATE Student
		set St_Name = isnull(@name, St_Name), Dept_ID = isnull(@Dept_id, Dept_ID), St_Email = isnull(lower(@email), St_Email),St_phone = isnull(@phone, St_phone),Street = isnull(@street, Street), city = isnull(@city, city) 
		where St_ID = @id
	END
	ELSE
	SELECT 'No row found' AS ErrorMessage;

---------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[UpExam]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--UPDATE
CREATE PROC [dbo].[UpExam]  @id int,
					@name nvarchar(50)

AS
	BEGIN TRY

		UPDATE Exam
		SET  Ex_Name = @name
		WHERE Ex_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[UpInstructor]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--UPDATE
CREATE PROC [dbo].[UpInstructor]  @id int,
						  @degree nvarchar(20) = null, 
						  @salary int = null, 
						  @department int = null

AS
	BEGIN TRY

		UPDATE Instructor
		SET  Ins_Degree = isnull(@degree,Ins_Degree),
		Ins_Salary = isnull(@salary,Ins_Salary),
		Dept_ID = isnull(@department,Dept_ID)
		WHERE Ins_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH


--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[UpQuestionChoice]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --------------------------------------------------------------------------------------------


--UPDATE
CREATE PROC [dbo].[UpQuestionChoice] @id int, 
							 @Ans1 varchar(300) = null,
							 @Ans2 varchar(300) = null,
							 @Ans3 varchar(300) = null,
							 @Ans4 varchar(300) = null

AS
	BEGIN TRY

		UPDATE Question_Choices
		SET [Answer-1] = isnull(@Ans1, [Answer-1]),
		[Answer-2] = isnull(@Ans2, [Answer-2]),
		[Answer-3] = isnull(@Ans3, [Answer-3]), 
		[Answer-4] = isnull(@Ans4, [Answer-4])
		WHERE Question_ID = @id
		
	END TRY
	BEGIN CATCH
		SELECT 'Error'
	END CATCH

--------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[upQuestions]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-------------------------------------------------------------------------------------------
/* 2- Update Question*/
 create proc [dbo].[upQuestions] 
			@Q_ID int,
			@Crs_ID int = null,
			@Q_Type int = null,
			@Q_Statement varchar(300) = null,
			@Model_Answer varchar(300) = null,
			@Q_Code varchar(300) = null
as
	begin try
		update Questions
		set Question_ID = isnull(@Q_ID,Question_ID), 
			Crs_ID =isnull(@Crs_ID,Crs_ID),
			Q_Statement=isnull(@Q_Statement,Q_Statement),
			Q_Code = isnull(@Q_Code,Q_Code),
			Q_Type = isnull(@Q_Type,Q_Type),
			Model_Answer = isnull(@Model_Answer,Model_Answer)
		where Question_ID = @Q_ID

	end try
	begin catch
		select 'Error'
	end catch

-- test

GO
/****** Object:  StoredProcedure [dbo].[upTopic]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-------------------------------------------------------------------------------------------
/* 2- Update Topic*/

create proc [dbo].[upTopic] 
			@Topic_ID int =null,
			@Topic_Name varchar(20)=null,
			@Crs_ID int=null,
			@Topic_Desc varchar(40) = null
as
	begin try
		update Topic
		set 
		Topic_ID =isnull(@Topic_ID,Topic_ID),
		Topic_Name = isnull(@Topic_Name,Topic_Name),
		Topic_Desc = isnull(@Topic_Desc,Topic_Desc),
		Crs_ID =isnull(@Crs_ID,Crs_ID)
		where Topic_ID = @Topic_ID

	end try
	begin catch
		select 'Error'
	end catch

-- test
GO
/****** Object:  StoredProcedure [dbo].[usp_get_courses_without_grade]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_courses_without_grade] (@St_ID INT)
AS
BEGIN
    SELECT C.Cr_Name, C.Crs_ID
    FROM Courses C
    JOIN Stud_Course SC ON C.Crs_ID = SC.Crs_ID
    WHERE SC.St_ID = @St_ID AND SC.St_Grade IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[usp_student_login]    Script Date: 2023-01-20 8:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_student_login]
    @St_Email VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Student
    WHERE St_Email = @St_Email AND password = @password
END
GO
USE [master]
GO
ALTER DATABASE [online_Exame] SET  READ_WRITE 
GO
