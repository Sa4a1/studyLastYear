USE [master]
GO
/****** Object:  Database [ProjectOranizationDB]    Script Date: 05.11.2024 23:56:13 ******/
CREATE DATABASE [ProjectOranizationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectOranizationDB', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectOranizationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectOranizationDB_log', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectOranizationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectOranizationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectOranizationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectOranizationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectOranizationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectOranizationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectOranizationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectOranizationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectOranizationDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectOranizationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectOranizationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectOranizationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectOranizationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectOranizationDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectOranizationDB]
GO
/****** Object:  User [Manager]    Script Date: 05.11.2024 23:56:13 ******/
CREATE USER [Manager] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Manager]
GO
/****** Object:  User [DirectorAsisstent]    Script Date: 05.11.2024 23:56:13 ******/
CREATE USER [DirectorAsisstent] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[DirectorAsisstent]
GO
/****** Object:  DatabaseRole [workerManager]    Script Date: 05.11.2024 23:56:13 ******/
CREATE ROLE [workerManager]
GO
/****** Object:  DatabaseRole [Asisstent]    Script Date: 05.11.2024 23:56:13 ******/
CREATE ROLE [Asisstent]
GO
ALTER ROLE [workerManager] ADD MEMBER [Manager]
GO
ALTER ROLE [db_owner] ADD MEMBER [Manager]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Manager]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Manager]
GO
ALTER ROLE [Asisstent] ADD MEMBER [DirectorAsisstent]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DirectorAsisstent]
GO
ALTER ROLE [db_datareader] ADD MEMBER [workerManager]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [workerManager]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Asisstent]
GO
/****** Object:  Schema [Asisstent]    Script Date: 05.11.2024 23:56:13 ******/
CREATE SCHEMA [Asisstent]
GO
/****** Object:  Schema [DirectorAsisstent]    Script Date: 05.11.2024 23:56:13 ******/
CREATE SCHEMA [DirectorAsisstent]
GO
/****** Object:  Schema [Manager]    Script Date: 05.11.2024 23:56:13 ******/
CREATE SCHEMA [Manager]
GO
/****** Object:  Schema [workerManager]    Script Date: 05.11.2024 23:56:13 ******/
CREATE SCHEMA [workerManager]
GO
/****** Object:  Table [dbo].[Deal]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal](
	[DealID] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Deal] PRIMARY KEY CLUSTERED 
(
	[DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](255) NOT NULL,
	[Floor] [int] NULL,
	[Phone] [varchar](16) NOT NULL,
	[DepartmentHeadID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesingWork]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesingWork](
	[DesignWorkID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[dealID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Desing] PRIMARY KEY CLUSTERED 
(
	[DesignWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderCode] [char](1) NOT NULL,
	[GenderName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ActivityType] [varchar](255) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Street] [varchar](60) NOT NULL,
	[House] [varchar](60) NOT NULL,
	[DirectorName] [varchar](30) NOT NULL,
	[DirectorSurname] [varchar](30) NOT NULL,
	[DirectorPatronymic] [varchar](30) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrgType]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrgType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_OrgType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[WorkerID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Patronymic] [varchar](255) NULL,
	[JobID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[GenderCode] [char](1) NOT NULL,
	[Adress] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[BirthDayDate] [date] NOT NULL,
	[Phone] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FirstView]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FirstView]
AS
SELECT        Surname AS Фамилия, Name
FROM            dbo.Workers
WHERE        (GenderCode LIKE 'м')
GO
/****** Object:  View [dbo].[FourthView]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FourthView]
as
SELECT Cost as [Цена проектной работы], (Cost/7.7) as [Сумма полученная после оплаты налогов]
FROM Deal;
GO
/****** Object:  View [dbo].[SecondView]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SecondView]
AS
SELECT        Surname AS Фамилия, Name AS Имя
FROM            dbo.Workers
WHERE        (GenderCode LIKE 'м') OR
                         (DepartmentID = 2)
GO
/****** Object:  View [dbo].[ThirdView]    Script Date: 05.11.2024 23:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThirdView]
as 
SELECT Surname as [Фамилия],  Name as [Имя]
FROM Workers
WHERE Surname like 'Е%';
GO
SET IDENTITY_INSERT [dbo].[Deal] ON 

INSERT [dbo].[Deal] ([DealID], [RegistrationDate], [OrganizationID], [Cost]) VALUES (25, CAST(N'2016-02-01' AS Date), 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[Deal] ([DealID], [RegistrationDate], [OrganizationID], [Cost]) VALUES (26, CAST(N'2018-11-26' AS Date), 2, CAST(2000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Deal] ([DealID], [RegistrationDate], [OrganizationID], [Cost]) VALUES (27, CAST(N'2019-01-31' AS Date), 3, CAST(900000.00 AS Decimal(18, 2)))
INSERT [dbo].[Deal] ([DealID], [RegistrationDate], [OrganizationID], [Cost]) VALUES (28, CAST(N'2022-06-13' AS Date), 5, CAST(4500000.00 AS Decimal(18, 2)))
INSERT [dbo].[Deal] ([DealID], [RegistrationDate], [OrganizationID], [Cost]) VALUES (29, CAST(N'2013-01-22' AS Date), 1, CAST(40000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Deal] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Floor], [Phone], [DepartmentHeadID]) VALUES (1, N'Водоснабжения и канализации', 3, N'8 917 697-63-57', 21)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Floor], [Phone], [DepartmentHeadID]) VALUES (2, N'административно-хозяйственный отдел', 4, N'8 917 021-59-29', 22)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Floor], [Phone], [DepartmentHeadID]) VALUES (3, N'отдел информационного обеспечения', 5, N'8 927 591-65-75', 23)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Floor], [Phone], [DepartmentHeadID]) VALUES (4, N'отдел выдачи проектов ', 8, N'8 957 072-19-95', 24)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [Floor], [Phone], [DepartmentHeadID]) VALUES (5, N'Отдел ген планов и транспорта', 2, N'8 917 822-17-92', 25)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[DesingWork] ON 

INSERT [dbo].[DesingWork] ([DesignWorkID], [StartDate], [EndDate], [dealID], [DepartmentID]) VALUES (9, CAST(N'2017-06-02' AS Date), CAST(N'2017-12-05' AS Date), 25, 2)
INSERT [dbo].[DesingWork] ([DesignWorkID], [StartDate], [EndDate], [dealID], [DepartmentID]) VALUES (10, CAST(N'2018-03-25' AS Date), CAST(N'2018-09-02' AS Date), 26, 2)
INSERT [dbo].[DesingWork] ([DesignWorkID], [StartDate], [EndDate], [dealID], [DepartmentID]) VALUES (11, CAST(N'2019-08-06' AS Date), CAST(N'2019-11-02' AS Date), 27, 1)
INSERT [dbo].[DesingWork] ([DesignWorkID], [StartDate], [EndDate], [dealID], [DepartmentID]) VALUES (12, CAST(N'2022-09-22' AS Date), CAST(N'2023-01-02' AS Date), 28, 2)
SET IDENTITY_INSERT [dbo].[DesingWork] OFF
GO
INSERT [dbo].[Gender] ([GenderCode], [GenderName]) VALUES (N'ж', N'Женский')
INSERT [dbo].[Gender] ([GenderCode], [GenderName]) VALUES (N'м', N'Мужской')
GO
SET IDENTITY_INSERT [dbo].[JobTitles] ON 

INSERT [dbo].[JobTitles] ([ID], [JobTitle]) VALUES (1, N'конструктор')
INSERT [dbo].[JobTitles] ([ID], [JobTitle]) VALUES (2, N'инженер')
INSERT [dbo].[JobTitles] ([ID], [JobTitle]) VALUES (3, N'техник')
INSERT [dbo].[JobTitles] ([ID], [JobTitle]) VALUES (4, N'лаборант')
INSERT [dbo].[JobTitles] ([ID], [JobTitle]) VALUES (5, N'начальник отдела')
SET IDENTITY_INSERT [dbo].[JobTitles] OFF
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([OrganizationID], [Title], [ActivityType], [Country], [City], [Street], [House], [DirectorName], [DirectorSurname], [DirectorPatronymic], [Type]) VALUES (1, N'"АгроРесурс', N'Аграрная промышленность', N'РФ', N'Уфа', N'Достоевского ', N'103', N'Эльза', N'Тимашева', N'Ринадовна', 1)
INSERT [dbo].[Organization] ([OrganizationID], [Title], [ActivityType], [Country], [City], [Street], [House], [DirectorName], [DirectorSurname], [DirectorPatronymic], [Type]) VALUES (2, N' "ТерраТеч"', N'Аграрная промышленность', N'Республика Беларусь', N'Минск', N'Сидорова', N'52', N'Алмаз', N'Хаматдинов', N'Марсельевич', 1)
INSERT [dbo].[Organization] ([OrganizationID], [Title], [ActivityType], [Country], [City], [Street], [House], [DirectorName], [DirectorSurname], [DirectorPatronymic], [Type]) VALUES (3, N'"Плутон"', N'Водоснабжение', N'Казахстан', N'Алматы', N'Мингаженва', N'28', N'Каспаров', N'Владимир', N'Евгеньевич', 2)
INSERT [dbo].[Organization] ([OrganizationID], [Title], [ActivityType], [Country], [City], [Street], [House], [DirectorName], [DirectorSurname], [DirectorPatronymic], [Type]) VALUES (4, N'"ГлобалNet"', N'информационного обеспечения', N'Литва', N'Каунас', N'Премьер', N'6', N'Джон', N'Алловер', NULL, 3)
INSERT [dbo].[Organization] ([OrganizationID], [Title], [ActivityType], [Country], [City], [Street], [House], [DirectorName], [DirectorSurname], [DirectorPatronymic], [Type]) VALUES (5, N'"ЗемлеФарм"', N'Аграрная промышленность', N'Украина', N'Киев', N'Прохорова', N'32', N'Гладенко', N'Максим', N'Андреевич', 4)
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[OrgType] ON 

INSERT [dbo].[OrgType] ([ID], [Type]) VALUES (1, N'ООО')
INSERT [dbo].[OrgType] ([ID], [Type]) VALUES (2, N'ОАО')
INSERT [dbo].[OrgType] ([ID], [Type]) VALUES (3, N'ПАО')
INSERT [dbo].[OrgType] ([ID], [Type]) VALUES (4, N'ЗАО')
SET IDENTITY_INSERT [dbo].[OrgType] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (1, N'Александрова', N'Кристина', N'Михайловна', 1, 1, N'ж', N'Достоевского 103', N'Уфа', CAST(N'1979-07-13' AS Date), N'8 917 367-91-93')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (2, N'Александрова', N'Яна', N'Максимовна', 2, 2, N'ж', N'Комсомольская 104', N'Уфа', CAST(N'1989-08-14' AS Date), N'8 987 030-34-27')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (3, N'Григорьев', N'Павел', N'Даниилович', 1, 3, N'м', N'8-е марта 36', N'Уфа', CAST(N'1978-11-07' AS Date), N'8 927 256-77-01')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (4, N'Евдокимов', N'Виталий', N'Вячеславович', 3, 4, N'м', N'Комсомольская 27/2', N'Уфа', CAST(N'1986-08-01' AS Date), N'8 917 771-44-25')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (5, N'Григорьева', N'Ксения', N'Марковна', 4, 5, N'ж', N'Мустая Карима 54', N'Уфа', CAST(N'2002-02-20' AS Date), N'8 927 937-03-02')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (6, N'Ахмерова', N'Милана', N'Айдаровна', 1, 3, N'ж', N'Карла Маркса 12', N'Уфа', CAST(N'1991-12-05' AS Date), N'8 917 337-85-45')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (7, N'Емельянова', N'Алиса', N'Егоровна', 1, 1, N'ж', N'Заки Валиди 54', N'Уфа', CAST(N'1981-07-07' AS Date), N'8 987 926-72-78')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (8, N'Ермак', N'София', N'Анатольевна', 2, 2, N'ж', N'Проспект Октября 21', N'Уфа', CAST(N'1995-07-29' AS Date), N'8 927 594-91-07')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (9, N'Уршеев', N'Никита', N'Юрьевич', 3, 2, N'м', N'Правды 15', N'Уфа', CAST(N'1982-10-28' AS Date), N'8 917 441-75-31')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (10, N'Иванов', N'Тимур', N'Вадимович', 4, 3, N'м', N'Рихарда Зорге 23', N'Уфа', CAST(N'1978-02-08' AS Date), N'8 927 687-23-21')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (11, N'Зиновьев', N'Роман', N'Арсеньевич', 1, 4, N'м', N'Аксакова 45', N'Уфа', CAST(N'1990-01-21' AS Date), N'8 975 470-75-87')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (12, N'Левина', N'Вера', N'Александровна', 1, 5, N'ж', N'Первомайская 36', N'Уфа', CAST(N'1992-07-18' AS Date), N'8 927 829-92-70')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (13, N'Макаров', N'Илья', N'Всеволодович', 2, 4, N'м', N'Трамвайна 87', N'Уфа', CAST(N'1998-03-29' AS Date), N'8 917 214-75-66')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (14, N'Максимов', N'Денис', N'Артемьевич', 3, 1, N'м', N'Кирова 96', N'Уфа', CAST(N'1981-04-04' AS Date), N'8 917 434-86-51')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (15, N'Назарова', N'Милана', N'Максимовна', 1, 2, N'ж', N'Маяковского 56', N'Уфа', CAST(N'1979-06-04' AS Date), N'8 927 787-06-77')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (16, N'Савина', N'Виктория', N'Георгиевна', 2, 3, N'ж', N'Конститутции 12', N'Уфа', CAST(N'2004-07-02' AS Date), N'8 917 318-80-58')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (17, N'Сальникова', N'Вера', N'Михайловна', 3, 2, N'ж', N'Космонавтов 85', N'Уфа', CAST(N'1984-06-23' AS Date), N'8 957 925-48-27')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (18, N'Филимонова', N'Елизавета', N'Ивановна', 4, 2, N'ж', N'Менделеева 102', N'Уфа', CAST(N'1983-05-26' AS Date), N'8 917 511-27-23')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (19, N'Филиппов', N'Савелий', N'Кириллович', 1, 2, N'м', N'Архитектурная 12', N'Уфа', CAST(N'1978-08-31' AS Date), N'8 927 319-37-82')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (20, N'Яковлева', N'Анна', N'Данииловна', 1, 5, N'ж', N'Неженская 76', N'Уфа', CAST(N'1979-10-05' AS Date), N'8 927 696-27-31')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (21, N'Прохорова', N'Василиса', N'Михайловна', 5, 1, N'ж', N'Калинена 42', N'Уфа', CAST(N'1987-11-19' AS Date), N'8 917 572-49-97')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (22, N'Исхаков', N'Арсен', N'Равилович', 5, 2, N'м', N'Репина 23', N'Уфа', CAST(N'1977-12-14' AS Date), N'8 917 186-80-00')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (23, N'Мельникова', N'Анастасия', N'Марковна', 5, 3, N'ж', N'Короленко 39', N'Уфа', CAST(N'2005-01-16' AS Date), N' 8 917 198-98-05')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (24, N'Ильина', N'Полина', N'Денисовна', 5, 4, N'ж', N'Комарово 32', N'Уфа', CAST(N'1989-07-25' AS Date), N'8 927 018-85-95')
INSERT [dbo].[Workers] ([WorkerID], [Surname], [Name], [Patronymic], [JobID], [DepartmentID], [GenderCode], [Adress], [City], [BirthDayDate], [Phone]) VALUES (25, N'Иванова', N'Даша', N'Гордеевна', 5, 5, N'ж', N'Садовая 5', N'Уфа', CAST(N'1980-01-30' AS Date), N'8 957 675-56-20')
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
ALTER TABLE [dbo].[Deal]  WITH CHECK ADD  CONSTRAINT [FK_Deal_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Deal] CHECK CONSTRAINT [FK_Deal_Organization]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Workers] FOREIGN KEY([DepartmentHeadID])
REFERENCES [dbo].[Workers] ([WorkerID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Workers]
GO
ALTER TABLE [dbo].[DesingWork]  WITH CHECK ADD  CONSTRAINT [FK_DesingWork_Deal] FOREIGN KEY([dealID])
REFERENCES [dbo].[Deal] ([DealID])
GO
ALTER TABLE [dbo].[DesingWork] CHECK CONSTRAINT [FK_DesingWork_Deal]
GO
ALTER TABLE [dbo].[DesingWork]  WITH CHECK ADD  CONSTRAINT [FK_DesingWork_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[DesingWork] CHECK CONSTRAINT [FK_DesingWork_Department]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_OrgType] FOREIGN KEY([Type])
REFERENCES [dbo].[OrgType] ([ID])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_OrgType]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Department]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([GenderCode])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Gender]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_JobTitles] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobTitles] ([ID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_JobTitles]
GO
ALTER TABLE [dbo].[Gender]  WITH CHECK ADD CHECK  (([GenderCode]='ж' OR [GenderCode]='м'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[12] 2[7] 3) )"
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
         Begin Table = "Workers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 214
               Right = 456
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
      Begin ColumnWidths = 9
         Width = 284
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FirstView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FirstView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
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
         Begin Table = "Workers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 265
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SecondView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SecondView'
GO
USE [master]
GO
ALTER DATABASE [ProjectOranizationDB] SET  READ_WRITE 
GO
