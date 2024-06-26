USE [master]
GO
/****** Object:  Database [TimetableDB]    Script Date: 9/17/2021 8:10:01 PM ******/
CREATE DATABASE [TimetableDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimetableDB', FILENAME = N'F:\db\TimetableDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimetableDB_log', FILENAME = N'F:\db\TimetableDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TimetableDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimetableDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimetableDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimetableDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimetableDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimetableDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimetableDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimetableDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimetableDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TimetableDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimetableDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimetableDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimetableDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimetableDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimetableDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimetableDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimetableDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimetableDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimetableDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimetableDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimetableDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimetableDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimetableDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimetableDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimetableDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimetableDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimetableDB] SET  MULTI_USER 
GO
ALTER DATABASE [TimetableDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimetableDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimetableDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimetableDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TimetableDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_Code] [int] IDENTITY(1,1) NOT NULL,
	[Prof_Num] [nvarchar](50) NULL,
	[Course_Code] [nvarchar](50) NULL,
	[Semester] [nvarchar](50) NULL,
	[Current_Session] [nvarchar](50) NULL,
	[Dept] [nvarchar](50) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_Code] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Credit_Hour] [int] NULL,
	[Dept_Name] [nvarchar](50) NULL,
	[Semester] [nvarchar](50) NULL,
	[Course_Schema] [nvarchar](50) NULL,
	[MaxMarks] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseSchema]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseSchema](
	[Course_Schema] [nvarchar](50) NOT NULL,
	[Dept_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_CourseSchema] PRIMARY KEY CLUSTERED 
(
	[Course_Schema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department_1] PRIMARY KEY CLUSTERED 
(
	[Dept_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professor]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[Prof_Num] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Designation] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](13) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Dept_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[Prof_Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[Semester] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Semester] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StdID] [int] IDENTITY(1,1) NOT NULL,
	[Std_RegNo] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[FatherName] [nvarchar](30) NULL,
	[RollNo] [int] NOT NULL,
	[Dept_Name] [nvarchar](50) NOT NULL,
	[Session] [nvarchar](50) NOT NULL,
	[Semester] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](14) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Student_1] PRIMARY KEY CLUSTERED 
(
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbEnableRegistration]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEnableRegistration](
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbEnableRegistration] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Class_Code] [int] NOT NULL,
	[Day] [nvarchar](15) NULL,
	[Hour] [nvarchar](15) NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ClassView]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClassView]
AS
SELECT        dbo.Class.Class_Code, dbo.Course.Course_Code, dbo.Course.Title, dbo.Course.Credit_Hour, dbo.Course.Dept_Name, dbo.Professor.Prof_Num, dbo.Professor.Name,
                          dbo.Time.Day, dbo.Time.Hour, dbo.Class.Current_Session, dbo.Class.Semester, dbo.Time.ID
FROM            dbo.Class INNER JOIN
                         dbo.Time ON dbo.Class.Class_Code = dbo.Time.Class_Code INNER JOIN
                         dbo.Course ON dbo.Class.Course_Code = dbo.Course.Course_Code INNER JOIN
                         dbo.Professor ON dbo.Class.Prof_Num = dbo.Professor.Prof_Num


GO
/****** Object:  View [dbo].[View_1]    Script Date: 9/17/2021 8:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Professor.Prof_Num, dbo.Professor.Name, dbo.Course.Course_Code, dbo.Course.Title, dbo.Course.Credit_Hour, dbo.Course.Dept_Name, dbo.Class.Class_Code,
                          dbo.Class.Semester, dbo.Class.Current_Session, dbo.Time.ID, dbo.Time.Day, dbo.Time.Hour
FROM            dbo.Professor INNER JOIN
                         dbo.Class ON dbo.Professor.Prof_Num = dbo.Class.Prof_Num INNER JOIN
                         dbo.Course ON dbo.Class.Course_Code = dbo.Course.Course_Code INNER JOIN
                         dbo.Time ON dbo.Class.Class_Code = dbo.Time.Class_Code


GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id], [username], [password], [Department], [role]) VALUES (1, N'Computer Admin ', N'asdf', N'Computer Science', N'Dept Admin')
INSERT [dbo].[Admin] ([id], [username], [password], [Department], [role]) VALUES (2, N'Mathemtics Admin', N'maths123', N'Maths', N'Dept Admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (14, N'1001', N'CCC-112', N'1st Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (15, N'1001', N'CCC-112L', N'1st Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (16, N'1007', N'CGE-111', N'1st Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (17, N'1007', N'CGE-111L', N'1st Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (18, N'1111', N'CGE-115', N'1st Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (19, N'1006', N'CSC-113', N'1st Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (21, N'1005', N'CSC-114', N'1st Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (22, N'1003', N'CGE-5', N'3rd Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (23, N'1005', N'CSC-4', N'3rd Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (24, N'1004', N'CSUE-1', N'3rd Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (25, N'1004', N'CCC-8', N'5th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (26, N'1001', N'CCC-9', N'5th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (27, N'1002', N'CSCC-2', N'5th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (29, N'1002', N'CSCC-3', N'5th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (30, N'1001', N'CSCC-4', N'5th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (31, N'1002', N'CCC-10', N'7th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (32, N'1002', N'CSCC-5', N'7th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (34, N'1006', N'CSEC-5', N'7th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (35, N'1006', N'CSSC-4', N'7th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (36, N'1005', N'CC-123', N'1st Semester', N'Fall-2021', N'Maths')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (39, N'1001', N'CGE-7', N'7th Semester', N'Fall-2021', N'Computer Science')
INSERT [dbo].[Class] ([Class_Code], [Prof_Num], [Course_Code], [Semester], [Current_Session], [Dept]) VALUES (40, N'1004', N'--Select Subject--', N'3rd Semester', N'Fall-2021', N'Computer Science')
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CC-123', N'Introduction Maths', 3, N'Maths', N'1st Semester', N'2021-2025 Ownword', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-10', N'data minig', 3, N'Computer Science', N'7th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-11', N'Project', 6, N'Computer Science', N'8th semester', N'2016-2020 Onwards', 200)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-112', N'Programming Fundamentals', 3, N'Computer Science', N'1st semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-112L', N'Programming Fundamentals Lab', 1, N'Computer Science', N'1st semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-2', N'Object Oriented Programming', 4, N'Computer Science', N'2nd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-3', N'Discrete Structures', 3, N'Computer Science', N'2nd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-38', N'Java', 4, N'Computer Science', N'6th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-4', N'Digital Logic and Design', 3, N'Computer Science', N'3rd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-5', N'Data Base Systems', 4, N'Computer Science', N'4th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-6', N'Operating Systems', 4, N'Computer Science', N'4th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-7', N'Data Structures and Algorithms', 3, N'Computer Science', N'4th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-8', N'Software Engineering', 3, N'Computer Science', N'5th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CCC-9', N'Data Communication', 3, N'Computer Science', N'5th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-111', N' Information and Communication Technologies', 2, N'Computer Science', N'1st semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-111L', N'Information and Communication Technologies Lab', 1, N'Computer Science', N'1st semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-115', N'Islamic Studies', 2, N'Computer Science', N'1st semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-3', N'English Comprehension', 3, N'Computer Science', N'2nd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-4', N'Pakistan Studies', 2, N'Computer Science', N'2nd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-5', N'Communication Skills', 3, N'Computer Science', N'3rd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-6', N'Technical and Business Writing', 3, N'Computer Science', N'6th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CGE-7', N'Professional Practices', 3, N'Computer Science', N'7th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSC-113', N'Basic Electronics', 3, N'Computer Science', N'1st semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSC-114', N'Calculus and Analytical Geometry', 3, N'Computer Science', N'1st semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSC-3', N'Statistics and Probability', 3, N'Computer Science', N'3rd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSC-4', N'Linear Algebra', 3, N'Computer Science', N'3rd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSCC-1', N'Theory of Automata', 3, N'Computer Science', N'4th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSCC-2', N'Compiler Construction', 3, N'Computer Science', N'5th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSCC-3', N'Microprocessors and Assembly language', 3, N'Computer Science', N'5th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSCC-4', N'Design and Analysis of Algorithms', 3, N'Computer Science', N'5th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSCC-5', N'Artificial Intelligence', 3, N'Computer Science', N'7th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSCC-6', N'Computer Architecture', 3, N'Computer Science', N'8th semester', NULL, 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSCC-7', N'Information Security', 3, N'Computer Science', N'8th semester', NULL, 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSEC-1', N'Web Technologies', 4, N'Computer Science', N'4th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSEC-2', N'Object Oriented Software Engineering', 3, N'Computer Science', N'6th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSEC-3', N'Computer Networks', 3, N'Computer Science', N'6th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSEC-4', N'Visual Programming', 4, N'Computer Science', N'6th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSEC-5', N'Data warehousing', 3, N'Computer Science', N'7th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSEC-6', N'Introduction to Data mining', 3, N'Computer Science', N'8th semester', NULL, 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSSC-1', N'Differential and Integral Calculus', 3, N'Computer Science', N'2nd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSSC-4', N'Software Project Management', 3, N'Computer Science', N'7th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSUE-1', N'Introduction to Marketing', 3, N'Computer Science', N'3rd semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSUE-2', N'Fundamentals of Economics', 3, N'Computer Science', N'5th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSUE-3', N'Fundamentals of Management', 3, N'Computer Science', N'6th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[Course] ([Course_Code], [Title], [Credit_Hour], [Dept_Name], [Semester], [Course_Schema], [MaxMarks]) VALUES (N'CSUE-4', N'Human Resource Management', 3, N'Computer Science', N'7th semester', N'2016-2020 Onwards', 100)
INSERT [dbo].[CourseSchema] ([Course_Schema], [Dept_Name]) VALUES (N'2016-2020 Onwards', N'Computer Science')
INSERT [dbo].[CourseSchema] ([Course_Schema], [Dept_Name]) VALUES (N'2021-2025 Ownword', N'Maths')
INSERT [dbo].[Department] ([Dept_Name]) VALUES (N'Computer Science')
INSERT [dbo].[Department] ([Dept_Name]) VALUES (N'English')
INSERT [dbo].[Department] ([Dept_Name]) VALUES (N'Islamiyat')
INSERT [dbo].[Department] ([Dept_Name]) VALUES (N'Maths')
INSERT [dbo].[Department] ([Dept_Name]) VALUES (N'Pak Study')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1001', N'Ajobnoor', N'lecturer', N'Bannu', N'03328374625', N'ajobnoor33@gmail.com', N'asdf', N'Computer Science')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1002', N'Sana-Ul-haq', N'lecturer', N'Bannu', N'03328374625', N'sanaullah@gmail.com', N'aaa', N'Computer Science')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1003', N'Rauf', N'lecturer', N'Bannu', N'03328374687', N'rauf', N'asdf', N'English')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1004', N'Adnan Ahmad', N'lecturer', N'Bannu', N'03328374625', N'adnanahmad99@gmail.com', N'asdf1234', N'Computer Science')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1005', N'Aurangzab', N'lecturer', N'Bannu', N'03328374625', N'aurangzab', N'asdf', N'Maths')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1006', N'Shukat', N'lecturer', N'Peshaware', N'03328374625', N'ajobnoor33@gmail.com', N'asdf', N'Computer Science')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1007', N'Saad Ullah Shah', N'Lecturer', N'Bannu', N'0333-3333333', N'saad', N'asdf', N'Computer Science')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'1111', N'Kareem Khan', N'Lecturer', N'Bannu', N'3333-3333333', N'kareem', N'asdf', N'Islamiyat')
INSERT [dbo].[Professor] ([Prof_Num], [Name], [Designation], [Address], [ContactNo], [UserName], [Password], [Dept_Name]) VALUES (N'2222', N'Bahtali Khan', N'Lecturer', N'Bannu', N'3333-3333333', N'bahtali', N'asdf', N'Pak Study')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'1st Semester')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'2nd Semester')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'3rd Semester')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'4th Semester')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'5th Semester')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'6th Semester')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'7th Semester')
INSERT [dbo].[Semester] ([Semester]) VALUES (N'8th Semester')
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (9, N'2017-UB-GCB-21002', N'Ahmad Yar Khan', N'Ghulam Ishaq Khan', 1, N'Computer Science', N'2017-2021', N'6th Semester', N'03319909998', N'ahmadyar@gmail.com', N'ahmadyar123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (10, N'2017-UB-GCB-21003', N'Saad Ullah Khan', N'Mandi Khan', 2, N'Computer Science', N'2017-2021', N'6th Semester', N'03319700777', N'saadkhan@gmail.com', N'saad123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (11, N'2017-UB-GCB-21004', N'Nasar Khan', N'Jalil Khan', 3, N'Computer Science', N'2017-2021', N'6th Semester', N'03319708887', N'nasarkhan@gmail.com', N'nasar123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (12, N'2017-UB-GCB-21005', N'Zeshan Ahmad Khan', N'Muhammad Alamgir Khan', 4, N'Computer Science', N'2017-2021', N'7th Semester', N'03319708887', N'zeshankhan@gmail.com', N'zeshan123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (14, N'2018-UB-GCB-22002', N'Shaker Zaman', N'Akheer Zaman', 2, N'Computer Science', N'2018-2022', N'4th Semester', N'03319796677', N'shakerzaman@gmail.com', N'shaker123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (15, N'2018-UB-GCB-22003', N'Arif Ullah', N'Ghazim Khan', 3, N'Computer Science', N'2018-2022', N'4th Semester', N'03319796677', N'arifullah@gmail.com', N'arif123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (16, N'2018-UB-GCB-22004', N'Fahim Khan', N'Zafar Khan', 4, N'Computer Science', N'2018-2022', N'5th Semester', N'0331987983', N'fahimkhan@gmail.com', N'fahim123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (17, N'2019-UB-GCB-23001', N'Aqib Ullah Khan', N'Jahangir Khan', 1, N'Computer Science', N'2019-2023', N'2nd Semester', N'0331987983', N'aqibkhan@gmail.com', N'aqib123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (18, N'2019-UB-GCB-23002', N'Zafar Ullah Khan', N'Habib Ullah Khan', 3, N'Computer Science', N'2019-2023', N'3rd Semester', N'0331987983', N'zafarullah@gmail.com', N'zafar123')
INSERT [dbo].[Student] ([StdID], [Std_RegNo], [Name], [FatherName], [RollNo], [Dept_Name], [Session], [Semester], [Phone], [UserName], [Password]) VALUES (21, N'2017-UB-GCB-77566', N'Ahmad', N'Muhammad Khan', 21, N'Maths', N'2017-2021', N'1st Semester', N'2222-2222222', N'Ahmad@gmail.com', N'ahmad')
SET IDENTITY_INSERT [dbo].[Student] OFF
INSERT [dbo].[tbEnableRegistration] ([Status]) VALUES (N'Enable')
SET IDENTITY_INSERT [dbo].[Time] ON 

INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (17, 14, N'Mon', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (18, 14, N'Tue', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (19, 14, N'Wed', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (20, 15, N'Wed', N'12:00 PM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (21, 16, N'Mon', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (22, 16, N'Tue', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (23, 16, N'Wed', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (24, 17, N'Tue', N'12:00 PM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (25, 18, N'Mon', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (26, 18, N'Tue', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (27, 19, N'Fri', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (28, 19, N'Sat', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (32, 21, N'Fri', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (33, 21, N'Sat', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (34, 22, N'Mon', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (35, 22, N'Tue', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (36, 22, N'Wed', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (37, 23, N'Mon', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (38, 23, N'Tue', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (39, 23, N'Wed', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (40, 24, N'Fri', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (41, 24, N'Sat', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (42, 25, N'Mon', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (43, 25, N'Tue', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (44, 25, N'Wed', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (45, 26, N'Mon', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (46, 26, N'Tue', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (47, 26, N'Wed', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (48, 27, N'Thu', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (49, 27, N'Fri', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (53, 29, N'Thu', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (54, 29, N'Fri', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (55, 29, N'Sat', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (56, 30, N'Mon', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (57, 30, N'Tue', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (58, 30, N'Wed', N'11:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (59, 31, N'Mon', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (60, 31, N'Tue', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (61, 31, N'Wed', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (62, 32, N'Mon', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (63, 32, N'Tue', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (64, 32, N'Wed', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (68, 34, N'Thu', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (69, 34, N'Fri', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (70, 34, N'Sat', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (71, 35, N'Thu', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (72, 35, N'Fri', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (73, 35, N'Sat', N'10:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (74, 36, N'Mon', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (75, 36, N'Tue', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (76, 36, N'Wed', N'9:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (86, 39, N'Mon', N'1:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (87, 39, N'Tue', N'1:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (88, 39, N'Wed', N'1:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (89, 39, N'Mon', N'12:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (90, 39, N'Tue', N'12:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (91, 39, N'Wed', N'12:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (92, 40, N'Mon', N'12:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (93, 40, N'Tue', N'12:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (94, 40, N'Wed', N'12:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (95, 40, N'Tue', N'12:00 AM')
INSERT [dbo].[Time] ([ID], [Class_Code], [Day], [Hour]) VALUES (96, 40, N'Wed', N'12:00 AM')
SET IDENTITY_INSERT [dbo].[Time] OFF
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Professor] FOREIGN KEY([Prof_Num])
REFERENCES [dbo].[Professor] ([Prof_Num])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Professor]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Semester] FOREIGN KEY([Semester])
REFERENCES [dbo].[Semester] ([Semester])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Semester]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_CourseSchema] FOREIGN KEY([Course_Schema])
REFERENCES [dbo].[CourseSchema] ([Course_Schema])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_CourseSchema]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([Dept_Name])
REFERENCES [dbo].[Department] ([Dept_Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semester] FOREIGN KEY([Semester])
REFERENCES [dbo].[Semester] ([Semester])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semester]
GO
ALTER TABLE [dbo].[Professor]  WITH CHECK ADD  CONSTRAINT [FK_Professor_Department] FOREIGN KEY([Dept_Name])
REFERENCES [dbo].[Department] ([Dept_Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Professor] CHECK CONSTRAINT [FK_Professor_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Dept_Name])
REFERENCES [dbo].[Department] ([Dept_Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Time]  WITH CHECK ADD  CONSTRAINT [FK_Time_Class] FOREIGN KEY([Class_Code])
REFERENCES [dbo].[Class] ([Class_Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Time] CHECK CONSTRAINT [FK_Time_Class]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[16] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Class"
            Begin Extent = 
               Top = 19
               Left = 316
               Bottom = 205
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Time"
            Begin Extent = 
               Top = 121
               Left = 551
               Bottom = 233
               Right = 721
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 22
               Left = 39
               Bottom = 208
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Professor"
            Begin Extent = 
               Top = 6
               Left = 668
               Bottom = 224
               Right = 838
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Professor"
            Begin Extent = 
               Top = 67
               Left = 0
               Bottom = 289
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Class"
            Begin Extent = 
               Top = 120
               Left = 264
               Bottom = 276
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 85
               Left = 683
               Bottom = 267
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Time"
            Begin Extent = 
               Top = 0
               Left = 466
               Bottom = 139
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1380
         Width = 1125
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 435
         Width = 840
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         F' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ilter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [TimetableDB] SET  READ_WRITE 
GO
