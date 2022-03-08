CREATE DATABASE [Withholdings_Flattened]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Withholdings_Flattened', FILENAME = N'D:\MSSQL14.TXBIDB\MSSQL\DATA\Withholdings_Flattened.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Withholdings_Flattened_log', FILENAME = N'D:\MSSQL14.TXBIDB\MSSQL\DATA\Withholdings_Flattened_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 COLLATE Arabic_100_CI_AI
GO
ALTER DATABASE [Withholdings_Flattened] SET COMPATIBILITY_LEVEL = 140
GO
ALTER DATABASE [Withholdings_Flattened] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET ARITHABORT OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [Withholdings_Flattened] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Withholdings_Flattened] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Withholdings_Flattened] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Withholdings_Flattened] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Withholdings_Flattened] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Withholdings_Flattened] SET  READ_WRITE 
GO
ALTER DATABASE [Withholdings_Flattened] SET RECOVERY FULL 
GO
ALTER DATABASE [Withholdings_Flattened] SET  MULTI_USER 
GO
ALTER DATABASE [Withholdings_Flattened] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Withholdings_Flattened] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Withholdings_Flattened] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Withholdings_Flattened]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [Withholdings_Flattened]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [Withholdings_Flattened] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO