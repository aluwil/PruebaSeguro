USE [master]
GO
/****** Object:  Database [DBSeguros]    Script Date: 18/11/2019 01:47:41 p. m. ******/
CREATE DATABASE [DBSeguros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSeguros', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBSeguros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBSeguros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBSeguros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBSeguros] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSeguros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSeguros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSeguros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSeguros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSeguros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSeguros] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSeguros] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBSeguros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSeguros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSeguros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSeguros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSeguros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSeguros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSeguros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSeguros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSeguros] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBSeguros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSeguros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSeguros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSeguros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSeguros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSeguros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBSeguros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSeguros] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBSeguros] SET  MULTI_USER 
GO
ALTER DATABASE [DBSeguros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSeguros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSeguros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSeguros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBSeguros] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBSeguros] SET QUERY_STORE = OFF
GO
USE [DBSeguros]
GO
/****** Object:  User [usrDB]    Script Date: 18/11/2019 01:47:41 p. m. ******/
CREATE USER [usrDB] FOR LOGIN [usrDB] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user]    Script Date: 18/11/2019 01:47:41 p. m. ******/
CREATE USER [user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [db_user]    Script Date: 18/11/2019 01:47:41 p. m. ******/
CREATE USER [db_user] FOR LOGIN [db_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usrDB]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [usrDB]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [usrDB]
GO
ALTER ROLE [db_owner] ADD MEMBER [db_user]
GO
/****** Object:  Table [dbo].[Agencia]    Script Date: 18/11/2019 01:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencia](
	[IdAgencia] [int] NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Direccion] [nvarchar](150) NOT NULL,
	[Telefono] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAgencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 18/11/2019 01:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Nombres] [nvarchar](150) NOT NULL,
	[Apellidos] [nvarchar](150) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoberturaPorcentaje]    Script Date: 18/11/2019 01:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoberturaPorcentaje](
	[IdCoberturaPorcentaje] [int] IDENTITY(1,1) NOT NULL,
	[Porcentaje] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCoberturaPorcentaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmisionPoliza]    Script Date: 18/11/2019 01:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmisionPoliza](
	[IdEmisionPoliza] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdRiesgo] [int] NOT NULL,
	[IdTipoPoliza] [int] NOT NULL,
	[IdEstadoPoliza] [int] NOT NULL,
	[NumeroMesesCobertura] [int] NOT NULL,
	[InicioVigencia] [datetime] NOT NULL,
	[IdCoberturaPorcentaje] [int] NOT NULL,
	[ValorPoliza] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmisionPoliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoPoliza]    Script Date: 18/11/2019 01:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoPoliza](
	[IdEstadoPoliza] [int] IDENTITY(1,1) NOT NULL,
	[Descripon] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstadoPoliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Riesgo]    Script Date: 18/11/2019 01:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Riesgo](
	[IdRiesgo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRiesgo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPoliza]    Script Date: 18/11/2019 01:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPoliza](
	[IdTipoPoliza] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoPoliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmisionPoliza]  WITH CHECK ADD  CONSTRAINT [FK_EmisionPoliza_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[EmisionPoliza] CHECK CONSTRAINT [FK_EmisionPoliza_Cliente]
GO
ALTER TABLE [dbo].[EmisionPoliza]  WITH CHECK ADD  CONSTRAINT [FK_EmisionPoliza_CoberturaPorcentaje] FOREIGN KEY([IdCoberturaPorcentaje])
REFERENCES [dbo].[CoberturaPorcentaje] ([IdCoberturaPorcentaje])
GO
ALTER TABLE [dbo].[EmisionPoliza] CHECK CONSTRAINT [FK_EmisionPoliza_CoberturaPorcentaje]
GO
ALTER TABLE [dbo].[EmisionPoliza]  WITH CHECK ADD  CONSTRAINT [FK_EmisionPoliza_EstadoPoliza] FOREIGN KEY([IdEstadoPoliza])
REFERENCES [dbo].[EstadoPoliza] ([IdEstadoPoliza])
GO
ALTER TABLE [dbo].[EmisionPoliza] CHECK CONSTRAINT [FK_EmisionPoliza_EstadoPoliza]
GO
ALTER TABLE [dbo].[EmisionPoliza]  WITH CHECK ADD  CONSTRAINT [FK_EmisionPoliza_Riesgo] FOREIGN KEY([IdRiesgo])
REFERENCES [dbo].[Riesgo] ([IdRiesgo])
GO
ALTER TABLE [dbo].[EmisionPoliza] CHECK CONSTRAINT [FK_EmisionPoliza_Riesgo]
GO
ALTER TABLE [dbo].[EmisionPoliza]  WITH CHECK ADD  CONSTRAINT [FK_EmisionPoliza_TipoPoliza] FOREIGN KEY([IdTipoPoliza])
REFERENCES [dbo].[TipoPoliza] ([IdTipoPoliza])
GO
ALTER TABLE [dbo].[EmisionPoliza] CHECK CONSTRAINT [FK_EmisionPoliza_TipoPoliza]
GO
USE [master]
GO
ALTER DATABASE [DBSeguros] SET  READ_WRITE 
GO
