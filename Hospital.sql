USE [master]
GO
/****** Object:  Database [HospitalDb]    Script Date: 27-04-2020 18:26:08 ******/
CREATE DATABASE [HospitalDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HospitalDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HospitalDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HospitalDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HospitalDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalDb] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HospitalDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HospitalDb]
GO
/****** Object:  Table [dbo].[ApplicationObjects]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationObjects](
	[ApplicationObjectId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeId] [int] NOT NULL,
	[ApplicationObjectName] [varchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjects] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicationObjectTypes]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationObjectTypes](
	[ApplicationObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeName] [varchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjectTypes] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Beds]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beds](
	[BedId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DateAssigned] [date] NOT NULL,
	[DateFree] [date] NULL,
 CONSTRAINT [PK_Beds] PRIMARY KEY CLUSTERED 
(
	[BedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[EmailId] [varchar](50) NULL,
	[Address] [varchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
	[Gender] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HealthcareAssistents]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HealthcareAssistents](
	[HealthcareAssistentId] [int] IDENTITY(1,1) NOT NULL,
	[HealthcareAssistenceName] [varchar](50) NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Gender] [int] NOT NULL,
 CONSTRAINT [PK_HealthcareAssistents] PRIMARY KEY CLUSTERED 
(
	[HealthcareAssistentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicines](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
	[ManufactureDate] [date] NOT NULL,
	[ExpireDate] [date] NOT NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[DateAdmitted] [date] NOT NULL,
	[DateDischarge] [date] NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[MedicalHistory] [varchar](100) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Priscriptions]    Script Date: 27-04-2020 18:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priscriptions](
	[PriscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TimeToTackDrug] [int] NOT NULL,
 CONSTRAINT [PK_Priscriptions] PRIMARY KEY CLUSTERED 
(
	[PriscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ApplicationObjects]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes] FOREIGN KEY([ApplicationObjectTypeId])
REFERENCES [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId])
GO
ALTER TABLE [dbo].[ApplicationObjects] CHECK CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes]
GO
ALTER TABLE [dbo].[Beds]  WITH CHECK ADD  CONSTRAINT [FK_Beds_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Beds] CHECK CONSTRAINT [FK_Beds_Patients]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Departments]
GO
ALTER TABLE [dbo].[HealthcareAssistents]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareAssistents_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[HealthcareAssistents] CHECK CONSTRAINT [FK_HealthcareAssistents_Departments]
GO
ALTER TABLE [dbo].[Priscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Priscriptions_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Priscriptions] CHECK CONSTRAINT [FK_Priscriptions_Doctors]
GO
ALTER TABLE [dbo].[Priscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Priscriptions_Medicines] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([MedicineId])
GO
ALTER TABLE [dbo].[Priscriptions] CHECK CONSTRAINT [FK_Priscriptions_Medicines]
GO
ALTER TABLE [dbo].[Priscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Priscriptions_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Priscriptions] CHECK CONSTRAINT [FK_Priscriptions_Patients]
GO
USE [master]
GO
ALTER DATABASE [HospitalDb] SET  READ_WRITE 
GO
