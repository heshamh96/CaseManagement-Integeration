USE [VatCustomDB]
GO
/****** Object:  Table [dbo].[Custom_Detail]    Script Date: 9/12/2021 10:40:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custom_Detail](
	[DCRTNIsn] [bigint] NOT NULL,
	[DDBIdentification] [int] NOT NULL,
	[INVITIsn] [bigint] NOT NULL,
	[INVITDDB] [int] NOT NULL,
	[valueOfItem] [float] NULL,
	[INVITKgNet] [float] NULL,
	[INVITLineItemQuantity] [float] NULL,
	[UOMArabicName] [nchar](40) NULL,
	[TRFNumber] [nvarchar](10) NULL,
	[TDESCShortDescription] [nvarchar](255) NULL,
	[ImportFeesPeremptory] [float] NULL,
	[importExempt] [float] NULL,
	[importRate] [float] NULL,
	[ImportFeesTemp] [float] NULL,
	[TaxFeesPeremptory] [float] NULL,
	[TaxExempt] [float] NULL,
	[TaxFeesTemp] [float] NULL,
	[Tax_37_Exempt] [float] NULL,
	[Tax_37_Peremptory] [float] NULL,
	[Tax_37_Temp] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Custom_Header]    Script Date: 9/12/2021 10:40:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custom_Header](
	[DCRTNIsn] [bigint] NOT NULL,
	[DDBIdentification] [int] NOT NULL,
	[DCRTNMainType] [smallint] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[DCRTNYear] [smallint] NULL,
	[CCPXIsn] [bigint] NULL,
	[CCPXCode] [bigint] NOT NULL,
	[DCRTNRegBook] [bigint] NULL,
	[DCRTNRegistrationNumber] [bigint] NULL,
	[DCRTNRegistrationDate] [datetime] NULL,
	[CSVPCode] [int] NULL,
	[CSVPName] [nvarchar](100) NOT NULL,
	[DCRTNStatedValue] [float] NULL,
	[CCPXName] [nvarchar](255) NOT NULL,
	[CUSTCode] [bigint] NOT NULL,
	[CUSTArabicName] [varchar](40) NOT NULL,
	[CDLRNumber] [bigint] NULL,
	[CDLRArabicName] [nvarchar](80) NOT NULL,
	[CDLRAddress] [nvarchar](150) NULL,
	[appdealernum] [bigint] NULL,
	[appdealername] [nvarchar](80) NOT NULL,
	[appdealeraddress] [nvarchar](150) NULL,
	[valueOfInvoice] [decimal](38, 12) NULL,
	[finalValue] [float] NULL,
	[importReceiptNumber] [bigint] NULL,
	[importReceiptDate] [datetime] NULL,
	[LoadingPORTArabicName] [varchar](255) NULL,
	[TaxReceiptNumber] [bigint] NULL,
	[TaxReceiptDate] [datetime] NULL,
	[TaxFlag] [int] NULL,
	[recieve_date] [datetime2](7) NOT NULL,
	[DCRTNCrs] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 9/12/2021 10:40:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[DCRTncrs] [smallint] NOT NULL,
	[CrsName] [varchar](30) NULL,
	[Description] [varchar](200) NULL,
	[Remarks] [varchar](100) NULL
) ON [PRIMARY]
GO
