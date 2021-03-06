USE [Sales_Tax_Payments]
GO
/****** Object:  Table [dbo].[Sales_Tax_Payments_View_table]    Script Date: 9/12/2021 10:35:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Tax_Payments_View_table](
	[officeid] [varchar](3) NOT NULL,
	[OfficeName] [varchar](60) NOT NULL,
	[Rin] [varchar](10) NOT NULL,
	[FilingName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Taxyrmo] [smalldatetime] NOT NULL,
	[ProcessingDate] [datetime] NOT NULL,
	[BusinessDate] [datetime] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[TransactionCurrency] [int] NULL,
	[TransactionCurrencyName] [nvarchar](50) NOT NULL,
	[Bank_Name] [nvarchar](50) NOT NULL,
	[Branch_Name] [nvarchar](50) NOT NULL,
	[AuthorizationNo] [varchar](20) NOT NULL,
	[Signature] [nvarchar](250) NOT NULL,
	[regname] [varchar](60) NULL,
	[tradename] [varchar](60) NULL,
	[addr1] [varchar](60) NULL,
	[LocalDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
