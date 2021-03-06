USE [TaxVAT]
GO
/****** Object:  View [dbo].[SentPurshaseInvoices]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[SentPurshaseInvoices]
as 
select * from SentTables.dbo.SentPurshaseInvoices
union 
select * from Sent_Tables_Try_out.dbo.SentPurshaseInvoices
GO
/****** Object:  View [dbo].[SentSalesInvoices]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[SentSalesInvoices]
as 
select * from SentTables.dbo.SentSalesInvoices
union
select * from Sent_Tables_Try_out.dbo.SentSalesInvoices
GO
/****** Object:  Table [dbo].[Dim_ActivitiesVat]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ActivitiesVat](
	[Activity_Vat_ID_S] [int] NOT NULL,
	[Activity_Vat__code] [varchar](50) NULL,
	[Activity_Vat__desc] [varchar](255) NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_InvoiceTypes]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_InvoiceTypes](
	[Inv_Type_ID] [int] NOT NULL,
	[Inv_Type_Desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictsDetails]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictsDetails](
	[Id] [int] NOT NULL,
	[District_Code] [varchar](3) NULL,
	[District_Name] [nvarchar](50) NULL,
	[District_Account] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excel_sales_master]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excel_sales_master](
	[rin] [char](9) NOT NULL,
	[regname] [varchar](60) NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[officename] [varchar](60) NULL,
	[activity_level_onecd] [char](1) NULL,
	[activity_level_onedesc] [varchar](255) NULL,
	[activity_level_twocd] [char](2) NULL,
	[activity_level_twodesc] [varchar](255) NULL,
	[activity_level_threecd] [char](3) NULL,
	[activity_level_threedesc] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igactivity]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igactivity](
	[act_acode] [char](3) NOT NULL,
	[act_desc] [nvarchar](50) NULL,
	[cat_code] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igdistrict]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igdistrict](
	[dis_code] [char](3) NOT NULL,
	[dis_desc] [varchar](100) NULL,
	[Gov_Code] [char](2) NOT NULL,
	[Reg_code] [char](2) NOT NULL,
	[bran_code] [char](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InquiryAPI]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InquiryAPI](
	[Id] [uniqueidentifier] NOT NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[DateOfReq] [date] NULL,
	[InquiryResponse] [ntext] NULL,
	[DeclationId] [uniqueidentifier] NULL,
	[TaxpayerId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_InquiryAPI] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTypes]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTypes](
	[Item_Type_ID] [int] NOT NULL,
	[Item_Type_Desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPIs]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPIs](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[NoOfUsers] [int] NULL,
	[NoOfMonthlyReturns] [int] NULL,
	[NoOfYearlyReturns] [int] NULL,
	[ProjectedMonthlyValue] [decimal](18, 2) NULL,
	[ProjectedYearlyValue] [decimal](18, 2) NULL,
 CONSTRAINT [PK_KPIs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpDeclarationType]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpDeclarationType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpDeclarationType_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lkpInvoiceType]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lkpInvoiceType](
	[ID] [int] NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpLinkType]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpLinkType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpLinkType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpSectionNum]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpSectionNum](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpSectionNum2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpSectionNum_2]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpSectionNum_2](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpSectionNum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpTaxTableCategory]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpTaxTableCategory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpTaxTableCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpVatType]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpVatType](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpDeclarationType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NonTableVatTax]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonTableVatTax](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationTypeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[SalesDetails] [ntext] NULL,
	[SalesTotal] [decimal](18, 2) NULL,
	[SalesAdjustment] [decimal](18, 2) NULL,
	[SalesVat] [decimal](18, 2) NULL,
	[PurchaseDetails] [ntext] NULL,
	[PurchaseTotal] [decimal](18, 2) NULL,
	[PurchaseAdjustment] [decimal](18, 2) NULL,
	[PurchaseVat] [decimal](18, 2) NULL,
	[RecivableTax] [decimal](18, 2) NULL,
	[DebtValue] [decimal](18, 2) NULL,
	[TotalTaxValue] [decimal](18, 2) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[NationalPassNum] [nvarchar](50) NULL,
	[IsSigned] [nvarchar](100) NULL,
	[Representitive] [nvarchar](50) NULL,
	[AuthorizationNumber] [nvarchar](50) NULL,
	[SignedDate] [date] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsPaid] [bit] NULL,
	[IsReplicated] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentMethod] [int] NULL,
	[PersonalizeTypeID] [int] NULL,
	[ReconciliationType] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[RecoPaymentDate] [datetime] NULL,
	[ReconciliationValue] [decimal](18, 2) NULL,
	[InquiryTransAmountVAT] [decimal](18, 2) NULL,
	[IsExtracted] [bit] NULL,
	[ExtractedDate] [datetime] NULL,
 CONSTRAINT [PK_NonTableVatTax] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductType_Id] [int] NOT NULL,
	[Product_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasesInvoices]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasesInvoices](
	[PurchaseInvoice_Id] [uniqueidentifier] NOT NULL,
	[Company_Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Company_Unique_Tax_Id] [nchar](9) NOT NULL,
	[Invoice_Number] [nvarchar](255) NOT NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [decimal](19, 3) NULL,
	[Invoice_Total_Tax] [decimal](19, 3) NULL,
	[Invoice_Total_Money] [decimal](19, 3) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nchar](14) NULL,
	[Customer_Mobile] [nchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[Replicated] [bit] NULL,
	[InvoiceType] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
 CONSTRAINT [PK_PurchasesInvoices] PRIMARY KEY NONCLUSTERED 
(
	[PurchaseInvoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasesInvoicesDetails]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasesInvoicesDetails](
	[PurchasesInvoicesDetails_Id] [uniqueidentifier] NOT NULL,
	[Fk_PurchasesInvoices_Id] [uniqueidentifier] NOT NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Fk_ProductType_Id] [int] NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [decimal](19, 3) NULL,
	[Product_Tax_Value] [decimal](19, 3) NULL,
	[Product_Quantity] [numeric](18, 2) NULL,
	[Product_Total_Net] [decimal](19, 3) NULL,
	[Product_Total_Tax_Value] [decimal](19, 3) NULL,
	[Product_Total_Money] [decimal](19, 3) NULL,
	[Replicated] [bit] NULL,
	[Fk_InvoiceType] [int] NULL,
	[Fk_TaxType_Id] [int] NULL,
	[Tax] [decimal](18, 2) NULL,
	[ItemType] [int] NULL,
	[SectionType] [int] NULL,
	[Discount] [decimal](19, 2) NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
	[InvoiceDate] [date] NULL,
 CONSTRAINT [PK_PurchasesInvoicesDetails] PRIMARY KEY NONCLUSTERED 
(
	[PurchasesInvoicesDetails_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Gamarek]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Gamarek](
	[DCRTNIsn] [decimal](9, 0) NOT NULL,
	[DDBIdentification] [int] NOT NULL,
	[DCRTNMainType] [smallint] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[DCRTNYear] [smallint] NULL,
	[CCPXIsn] [decimal](9, 0) NULL,
	[CCPXCode] [decimal](9, 0) NOT NULL,
	[DCRTNRegBook] [smallint] NULL,
	[DCRTNRegistrationNumber] [decimal](18, 0) NULL,
	[DCRTNRegistrationDate] [datetime] NULL,
	[CSVPCode] [int] NULL,
	[CSVPName] [nvarchar](100) NOT NULL,
	[DCRTNStatedValue] [float] NULL,
	[CCPXName] [nvarchar](255) NOT NULL,
	[CUSTCode] [smallint] NOT NULL,
	[CUSTArabicName] [varchar](40) NOT NULL,
	[CDLRNumber] [numeric](9, 0) NULL,
	[CDLRArabicName] [nvarchar](80) NOT NULL,
	[CDLRAddress] [nvarchar](150) NULL,
	[appdealernum] [numeric](9, 0) NULL,
	[appdealername] [nvarchar](80) NOT NULL,
	[appdealeraddress] [nvarchar](150) NULL,
	[valueOfInvoice] [decimal](38, 12) NULL,
	[finalValue] [float] NULL,
	[importReceiptNumber] [numeric](18, 0) NULL,
	[importReceiptDate] [datetime] NULL,
	[LoadingPORTArabicName] [varchar](255) NULL,
	[TaxReceiptNumber] [numeric](18, 0) NULL,
	[TaxReceiptDate] [datetime] NULL,
	[TaxFlag] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Office]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Office](
	[officeid] [varchar](3) NOT NULL,
	[OfficeName] [nvarchar](60) NOT NULL,
	[ID] [varchar](3) NULL,
	[Settlement_Unit_ID] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Region]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Region](
	[RegionCode] [varchar](3) NULL,
	[RegionName] [varchar](200) NULL,
	[OfficeID] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoices]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoices](
	[SalesInvoice_Id] [uniqueidentifier] NOT NULL,
	[Company_Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Company_Unique_Tax_Id] [nchar](9) NOT NULL,
	[Invoice_Number] [nvarchar](255) NOT NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [decimal](19, 3) NULL,
	[Invoice_Total_Tax] [decimal](19, 3) NULL,
	[Invoice_Total_Money] [decimal](19, 3) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nchar](14) NULL,
	[Customer_Mobile] [nchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[Replicated] [bit] NULL,
	[InvoiceType] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
 CONSTRAINT [PK_SalesInvoices] PRIMARY KEY NONCLUSTERED 
(
	[SalesInvoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_insert_remainnig_sales2]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE CLUSTERED INDEX [IDX_insert_remainnig_sales2] ON [dbo].[SalesInvoices]
(
	[IsDeleted] ASC,
	[Company_Taxpayer_Id] ASC,
	[Invoice_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoicesDetails]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoicesDetails](
	[SalesInvoicesDetails_Id] [uniqueidentifier] NOT NULL,
	[Fk_SalesInvoices_Id] [uniqueidentifier] NOT NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Fk_ProductType_Id] [int] NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [decimal](19, 3) NULL,
	[Product_Tax_Value] [decimal](19, 3) NULL,
	[Product_Quantity] [numeric](18, 2) NULL,
	[Product_Total_Net] [decimal](19, 3) NULL,
	[Product_Total_Tax_Value] [decimal](19, 3) NULL,
	[Product_Total_Money] [decimal](19, 3) NULL,
	[Replicated] [bit] NULL,
	[Fk_InvoiceType] [int] NULL,
	[Fk_TaxType_Id] [int] NULL,
	[Tax] [decimal](18, 2) NULL,
	[ItemType] [int] NULL,
	[SectionType] [int] NULL,
	[Discount] [decimal](19, 2) NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
	[InvoiceDate] [date] NULL,
 CONSTRAINT [PK_SalesInvoicesDetails] PRIMARY KEY NONCLUSTERED 
(
	[SalesInvoicesDetails_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionTypes]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTypes](
	[Section_Type_ID] [int] NOT NULL,
	[Section_Type_Desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUM_Sales_PurchaseVat]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUM_Sales_PurchaseVat](
	[TaxpayerID] [uniqueidentifier] NULL,
	[EQRID] [uniqueidentifier] NOT NULL,
	[SUM_SalesVat] [numeric](38, 2) NULL,
	[SUM_PurchaseVat] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableVatTax]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableVatTax](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationTypeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[TableTaxDetails] [ntext] NULL,
	[TableTaxTotal] [decimal](18, 2) NULL,
	[TableTaxAdjustment] [decimal](18, 2) NULL,
	[TableTaxVat] [decimal](18, 2) NULL,
	[SalesTableDetails] [ntext] NULL,
	[SalesTableTotal] [decimal](18, 2) NULL,
	[SalesTableAdjustment] [decimal](18, 2) NULL,
	[SalesTableVat] [decimal](18, 2) NULL,
	[PurchaseTableDetails] [ntext] NULL,
	[PurchaseTableTotal] [decimal](18, 2) NULL,
	[PurchaseTableAdjustment] [decimal](18, 2) NULL,
	[PurchaseTableVat] [decimal](18, 2) NULL,
	[RecivableTableTax] [decimal](18, 2) NULL,
	[DebtTableValue] [decimal](18, 2) NULL,
	[TotalTableTaxValue] [decimal](18, 2) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[NationalPassNum] [nvarchar](50) NULL,
	[IsSigned] [nvarchar](100) NULL,
	[Representitive] [nvarchar](50) NULL,
	[AuthorizationNumber] [nvarchar](50) NULL,
	[SignedDate] [date] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsPaid] [bit] NULL,
	[IsReplicated] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentMethod] [int] NULL,
	[PersonalizeTypeID] [int] NULL,
	[ReconciliationType] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[RecoPaymentDate] [datetime] NULL,
	[IsPaidTable] [bit] NULL,
	[ReconciliationValue] [decimal](18, 2) NULL,
	[InquiryTransAmountVAT] [decimal](18, 2) NULL,
	[InquiryTransAmountTVAT] [decimal](18, 2) NULL,
	[IsExtracted] [bit] NULL,
	[ExtractedDate] [datetime] NULL,
 CONSTRAINT [PK_TableVatTax] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxType]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaxType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_TaxPeriod]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [IDX_TaxPeriod] ON [dbo].[NonTableVatTax]
(
	[TaxPeriod] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Invoice_Date]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Invoice_Date] ON [dbo].[PurchasesInvoices]
(
	[Invoice_Date] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_InvoiceDate]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [IDX_InvoiceDate] ON [dbo].[PurchasesInvoicesDetails]
(
	[InvoiceDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SalesInvoices_30_1205579333__K16_K2_K18_K5_K1]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_SalesInvoices_30_1205579333__K16_K2_K18_K5_K1] ON [dbo].[SalesInvoices]
(
	[InvoiceType] ASC,
	[Company_Taxpayer_Id] ASC,
	[CreationDate] ASC,
	[Invoice_Date] ASC,
	[SalesInvoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SalesInvoices_30_1205579333__K2_K18_K5_K1]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_SalesInvoices_30_1205579333__K2_K18_K5_K1] ON [dbo].[SalesInvoices]
(
	[Company_Taxpayer_Id] ASC,
	[CreationDate] ASC,
	[Invoice_Date] ASC,
	[SalesInvoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SalesInvoicesDetails_30_1237579447__K2_K20_1]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_SalesInvoicesDetails_30_1237579447__K2_K20_1] ON [dbo].[SalesInvoicesDetails]
(
	[Fk_SalesInvoices_Id] ASC,
	[IsDeleted] ASC
)
INCLUDE([SalesInvoicesDetails_Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_SalesInvoicesDetails_30_1237579447__K20_K2_10_11_18]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_SalesInvoicesDetails_30_1237579447__K20_K2_10_11_18] ON [dbo].[SalesInvoicesDetails]
(
	[IsDeleted] ASC,
	[Fk_SalesInvoices_Id] ASC
)
INCLUDE([Product_Total_Net],[Product_Total_Tax_Value],[SectionType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_TaxPeriod]    Script Date: 9/12/2021 10:39:57 AM ******/
CREATE NONCLUSTERED INDEX [IDX_TaxPeriod] ON [dbo].[TableVatTax]
(
	[TaxPeriod] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[all_declaraitons_with_no_invoices]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declaraitons_with_no_invoices] as
truncate table [Sent_Tables_Try_out].[dbo].[Declarations_Final];


with all_declarations as (
select ID,concat(UniqueTaxID,concat('_',TaxPeriod)) as ak
,UniqueTaxID,SendDate,TaxPeriod,[DeclarationTypeID]
,[SalesTotal],[SalesAdjustment],[SalesVat]
,[PurchaseTotal],[PurchaseAdjustment],[PurchaseVat]
from NonTableVatTax
--where 
--UniqueTaxID='557762456' and
 --TaxPeriod in ('202001','202002','202003')
 
union
select ID,concat(UniqueTaxID,concat('_',TaxPeriod)) as ak
,UniqueTaxID,SendDate,TaxPeriod,[DeclarationTypeID]
,[SalesTableVat],[SalesTableAdjustment],[SalesTableTotal]
,[PurchaseTableTotal],[PurchaseTableAdjustment],[PurchaseTableVat]
from TableVatTax
--where 
--UniqueTaxID='557762456'and
 --TaxPeriod in ('202001','202002','202003')
--and Active=1
)
---------
,temp as(
select ak,max(ad.SendDate) as mx
from all_declarations ad
group by ak
),
---------
final_declaraions as(
select ad.* from all_declarations ad join temp 
on ad.ak=temp.ak and ad.SendDate=temp.mx
where 
ad.[DeclarationTypeID] !=2
and(
(ad.[SalesTotal]!=0 and [SalesAdjustment] !=0 and [SalesVat]!=0 )
or
([PurchaseTotal]!=0 and [PurchaseAdjustment]!=0 and [PurchaseVat]!=0)
)
)

insert into [Sent_Tables_Try_out].dbo.Declarations_Final 
select  * --into [Sent_Tables_Try_out].dbo.Declarations_Final 
from final_declaraions fd
where 
fd.ID not in 
(select distinct [TaxVatDecID] from [SentTables].[dbo].[SentPurshaseInvoices]
union 
select distinct [TaxVatDecID] from [SentTables].[dbo].[SentSalesInvoices])
GO
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion] @Period varchar(6)
as 
--truncate table [Sent_Tables_Try_out].dbo.SentPurshaseInvoices ;
with equrar as(
select * from [Sent_Tables_Try_out].dbo.Declarations_Final fd 
where --UniqueTaxID='100270468' and 
TaxPeriod=@Period
)
,fawateer as(
--select *,sum(pttv)over( order by CreationDate asc) acc_pttv from(
select a.PurchaseInvoice_Id,/*b.PurchasesInvoicesDetails_Id,*/a.CreationDate 
,a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) as fk_Ak,a.Company_Unique_Tax_Id as unique_tax_id

from PurchasesInvoices a  
--join PurchasesInvoicesDetails b 
--on a.PurchaseInvoice_Id=b.Fk_PurchasesInvoices_Id
where --a.Company_Unique_Tax_Id='100270468' and 
CONVERT(varchar(6),a.Invoice_Date,112) = @Period
and a.IsDeleted=0
--and b.IsDeleted=0
--and a.CreationDate not in(2,3)
--group by a.PurchaseInvoice_Id,a.CreationDate
--) x
)

insert into [Sent_Tables_Try_out].dbo.SentPurshaseInvoices (
[ID]
,[TaxpayerID]
,[TaxVatDecID]
,[PurchaseInvoiceID]
--,[PurchaseInvoiceDetailsID]
,CreationDate
)
select distinct newid() as id,rtp.Taxpayer_Id,a.ID,b.PurchaseInvoice_Id,/*b.PurchasesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.ak=b.fk_Ak
join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
left join (select distinct PurchaseInvoiceID,TaxVatDecID from SentTables.dbo.SentPurshaseInvoices) as spik 
on b.PurchaseInvoice_Id=spik.PurchaseInvoiceID and a.ID=spik.TaxVatDecID 
where a.SendDate>=b.CreationDate
and spik.PurchaseInvoiceID is null
and spik.TaxVatDecID is null








--select * from PurchasesInvoices a  join PurchasesInvoicesDetails b on a.PurchaseInvoice_Id=b.Fk_PurchasesInvoices_Id
--where a.Company_Unique_Tax_Id='100270468' 
--and CONVERT(varchar(6),a.Invoice_Date,112) in ('202001')
----and a.IsDeleted=0
--and a.InvoiceType in(3)
--and a.CreationDate < (select SendDate from equrar)
--order by a.CreationDate
GO
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion] @Period varchar(6)

as 
--truncate table [Sent_Tables_Try_out].dbo.SentSalesInvoices ;
with equrar as(
select * from [Sent_Tables_Try_out].dbo.Declarations_Final fd 
where --UniqueTaxID='100270468' and 
TaxPeriod=@Period
)
,fawateer as(
--select *,sum(pttv)over( order by CreationDate asc) acc_pttv from(
select a.SalesInvoice_Id,/*b.SalesInvoicesDetails_Id,*/a.CreationDate 
,a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) as fk_Ak,a.Company_Unique_Tax_Id as unique_tax_id

from SalesInvoices a 
--join SalesInvoicesDetails b 
--on a.SalesInvoice_Id=b.Fk_SalesInvoices_Id 
where --a.Company_Unique_Tax_Id='100270468' and 
CONVERT(varchar(6),a.Invoice_Date,112) = @Period
and a.IsDeleted=0
--and b.IsDeleted=0
--and a.CreationDate not in(2,3)
--group by a.PurchaseInvoice_Id,a.CreationDate
--) x
)

insert into [Sent_Tables_Try_out].dbo.SentSalesInvoices(
ID
,[TaxpayerID]
,[TaxVatDecID]
,SalesInvoiceID
--,SalesInvoiceDetailsID
,CreationDate
)
select distinct newid() as id,rtp.Taxpayer_Id,a.ID,b.SalesInvoice_Id,/*b.SalesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.ak=b.fk_Ak
join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
left join (select distinct SalesInvoiceID,TaxVatDecID from SentTables.dbo.SentSalesInvoices) as ssik 
on b.SalesInvoice_Id=ssik.SalesInvoiceID and a.ID=ssik.TaxVatDecID
where a.SendDate>=b.CreationDate
and ssik.SalesInvoiceID is null
and ssik.TaxVatDecID is null
GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_Purchase_fix_2020]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[insert_remainnig_Purchase2]    Script Date: 4/14/2021 3:19:08 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_Purchase_fix_2020]
--	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Purchase TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,PurchaseTotal decimal(18,2)
        ,PurchaseAdjustment decimal(18,2)
		,SendDate Datetime
    )

    INSERT INTO @Remaining_Purchase 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, PurchaseTotal, PurchaseAdjustment,SendDate--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM Staging_Area.[dbo].[LastIqrarSentOfTaxpayer2020] le with(nolock) left join SentTables.dbo.SentPurshaseInvoices ss with(nolock)  on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.PurchaseTotal!=0

  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@PurchaseTotal decimal(18,2)
        ,@PurchaseAdjustment decimal(18,2)
		,@PurchaseFatoraTotal decimal(18,2)
        ,@PurchaseAddAdj decimal(18,2)
        ,@PurchaseSubAdj decimal(18,2)
		,@SendDate Datetime

    SELECT @Count = COUNT(*) FROM @Remaining_Purchase m
	PRINT @Count
    SET @Counter = 1



    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@PurchaseTotal=PurchaseTotal,@PurchaseAdjustment=PurchaseAdjustment,@SendDate =SendDate FROM @Remaining_Purchase m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @PurchaseFatoraTotal=(select ISNULL(sum(d.Product_Total_Tax_Value), 0 ) tax from PurchasesInvoices s with(nolock)  join PurchasesInvoicesDetails d with(nolock) on s.PurchaseInvoice_Id=d.Fk_PurchasesInvoices_Id  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  and (InvoiceType=1 or InvoiceType=4)

  )

 set @PurchaseAddAdj=( select ISNULL(sum(d.Product_Total_Tax_Value), 0 ) tax from PurchasesInvoices s with(nolock) join PurchasesInvoicesDetails d with(nolock) on s.PurchaseInvoice_Id=d.Fk_PurchasesInvoices_Id   where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
 
  and InvoiceType=2 )

  set @PurchaseSubAdj=  (  select ISNULL(sum(d.Product_Total_Tax_Value), 0 ) tax from PurchasesInvoices s with(nolock) join PurchasesInvoicesDetails d with(nolock) on s.PurchaseInvoice_Id=d.Fk_PurchasesInvoices_Id   where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  
  and InvoiceType=3 )

  if(round(@PurchaseFatoraTotal,0)=round(@PurchaseTotal,0) and round(@PurchaseAdjustment,0)=round(@PurchaseAddAdj-@PurchaseSubAdj,0) )
  begin
  insert into SentTables.dbo.[SentPurshaseInvoices]
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[PurchaseInvoice_Id] PurchaseInvoiceID,PurchasesInvoicesDetails_Id PurchaseInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated   from PurchasesInvoices s with(nolock) join PurchasesInvoicesDetails d with(nolock) on s.PurchaseInvoice_Id=d.Fk_PurchasesInvoices_Id   where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_Purchase2]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_Purchase2]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Purchase TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,PurchaseTotal decimal(18,2)
        ,PurchaseAdjustment decimal(18,2)
		,SendDate datetime
    )

    INSERT INTO @Remaining_Purchase 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, PurchaseTotal, PurchaseAdjustment,SendDate--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer] le with(nolock) left join SentPurshaseInvoices ss with(nolock)  on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.PurchaseTotal!=0  

  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@PurchaseTotal decimal(18,2)
        ,@PurchaseAdjustment decimal(18,2)
		,@PurchaseFatoraTotal decimal(18,2)
        ,@PurchaseAddAdj decimal(18,2)
        ,@PurchaseSubAdj decimal(18,2)
		,@SendDate Datetime

    SELECT @Count = COUNT(*) FROM @Remaining_Purchase m
	PRINT @Count
    SET @Counter = 1



    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@PurchaseTotal=PurchaseTotal,@PurchaseAdjustment=PurchaseAdjustment,@SendDate= SendDate  FROM @Remaining_Purchase m WHERE ID = @Counter -- extracting values from the table by counternum
		 
       SET @PurchaseFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  and (InvoiceType=1 or InvoiceType=4)

  )

 set @PurchaseAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
 
  and InvoiceType=2 )

  set @PurchaseSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  
  and InvoiceType=3 )

  if(round(@PurchaseFatoraTotal,0)=round(@PurchaseTotal,0) and round(@PurchaseAdjustment,0)=round(@PurchaseAddAdj-@PurchaseSubAdj,0) )
  begin
  insert into SentPurshaseInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[PurchaseInvoice_Id] PurchaseInvoiceID,null PurchaseInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated   from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_Purchase2_Linked]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_Purchase2_Linked]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Purchase TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,PurchaseTotal decimal(18,2)
        ,PurchaseAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Purchase 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, PurchaseTotal, PurchaseAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer3] le with(nolock) 
  left join SentPurshaseInvoices ss with(nolock)  on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.PurchaseTotal!=0

  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@PurchaseTotal decimal(18,2)
        ,@PurchaseAdjustment decimal(18,2)
		,@PurchaseFatoraTotal decimal(18,2)
        ,@PurchaseAddAdj decimal(18,2)
        ,@PurchaseSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Purchase m
	PRINT @Count
    SET @Counter = 1



    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@PurchaseTotal=PurchaseTotal,@PurchaseAdjustment=PurchaseAdjustment
		FROM @Remaining_Purchase m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @PurchaseFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
	   from ETAX.TAXVAT.dbo.PurchasesInvoices s with(nolock)
	   where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=4)

  )

 set @PurchaseAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
 from ETAX.TAXVAT.dbo.PurchasesInvoices s with(nolock) 
 where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @PurchaseSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
  from ETAX.TAXVAT.dbo.PurchasesInvoices s with(nolock) 
  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@PurchaseFatoraTotal,0)=round(@PurchaseTotal,0) and round(@PurchaseAdjustment,0)=round(@PurchaseAddAdj-@PurchaseSubAdj,0) )
  begin
  insert into SentPurshaseInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[PurchaseInvoice_Id] PurchaseInvoiceID,null PurchaseInvoiceDetailsID ,null CreationDate,
  null UpdatedDate,0 IsDeleted,null IsReplicated 
  from ETAX.TAXVAT.dbo.PurchasesInvoices s with(nolock) 
  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_Purchase3]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[insert_remainnig_Purchase3]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Purchase TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,PurchaseTotal decimal(18,2)
        ,PurchaseAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Purchase 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, PurchaseTotal, PurchaseAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer2] le with(nolock) left join SentPurshaseInvoices ss with(nolock)  on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.PurchaseTotal!=0

  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@PurchaseTotal decimal(18,2)
        ,@PurchaseAdjustment decimal(18,2)
		,@PurchaseFatoraTotal decimal(18,2)
        ,@PurchaseAddAdj decimal(18,2)
        ,@PurchaseSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Purchase m
	PRINT @Count
    SET @Counter = 1



    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@PurchaseTotal=PurchaseTotal,@PurchaseAdjustment=PurchaseAdjustment FROM @Remaining_Purchase m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @PurchaseFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=4)

  )

 set @PurchaseAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @PurchaseSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@PurchaseFatoraTotal,0)=round(@PurchaseTotal,0) and round(@PurchaseAdjustment,0)=round(@PurchaseAddAdj-@PurchaseSubAdj,0) )
  begin
  insert into SentPurshaseInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[PurchaseInvoice_Id] PurchaseInvoiceID,null PurchaseInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated   from PurchasesInvoices s with(nolock)  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[Insert_Remainnig_Sales_Linked]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





--exec  [dbo].[Insert_Remainnig_Sales_Linked]




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Remainnig_Sales_Linked]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM TaxVat_New.[dbo].[LastIqrarSentOfTaxpayer] le With(nolock)
  left join SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0  ---and le.TaxPeriod=202010
  ---and le.TaxpayerID<>'DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment 
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @SalesFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
	   from ETAX.TaxVAT.dbo.SalesInvoices s  WITH(NOLOCK) where year(s.Invoice_Date)=left(@TaxPeriod,4) 
	   and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

  )

 set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
 from ETAX.TaxVAT.dbo.SalesInvoices s WITH(NOLOCK) where year(s.Invoice_Date)=left(@TaxPeriod,4) 
 and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
  from ETAX.TaxVAT.dbo.SalesInvoices s WITH(NOLOCK) where year(s.Invoice_Date)=left(@TaxPeriod,4)
  and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
  begin
  insert into TaxVat.dbo.SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated  
   from ETAX.TaxVAT.dbo.SalesInvoices s With(nolock) where year(s.Invoice_Date)=left(@TaxPeriod,4) 
   and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales2]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales2]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
		,SendDate Datetime
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment,SendDate--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer] le With(nolock)
  left join SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0 and le.TaxpayerID<>'DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)
		,@SendDate Datetime

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment ,@SendDate =SendDate
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @SalesFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

  )

 set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
 
  and InvoiceType=2 )

  set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  
  and InvoiceType=3 )

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
  begin
  insert into SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated  
   from SalesInvoices s With(nolock) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales2_fix]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales2_fix]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
		,TableTaxTotal decimal(18,2)
		,TableTaxAdjustment decimal(18,2)
		,SendDate Datetime
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment,TableTaxTotal, TableTaxAdjustment,SendDate--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer7] le With(nolock)
  left join SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0 and le.TaxpayerID<>'DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@TableTaxTotal decimal(18,2)
		,@TableTaxAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
		,@SalesTableFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
		,@SalesTableAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)
		,@SalesTableSubAdj decimal(18,2)
		,@SendDate Datetime

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment,@TableTaxTotal=TableTaxTotal,@TableTaxAdjustment=TableTaxAdjustment,@SendDate =SendDate
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

       select  @SalesFatoraTotal=ISNULL(sum(case when d.SectionType = 0 then [Product_Total_Tax_Value]
					   when d.SectionType = 2 then [Product_Total_Net]*0.14 
					   else 0 
					   end), 0 ) , @SalesTableFatoraTotal = ISNULL(sum(case when d.SectionType = 0 then 0
													  else [Product_Total_Tax_Value] 
					   end), 0 ) from SalesInvoices s join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
				and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5 )
  

	   select	@SalesAddAdj=ISNULL(sum(case when d.SectionType = 0 then [Product_Total_Tax_Value]
					   when d.SectionType = 2 then [Product_Total_Net]*0.14 
					   else 0 
					   end), 0 ) , @SalesTableAddAdj = ISNULL(sum(case when d.SectionType = 0 then 0
													  else [Product_Total_Tax_Value] 
					   end), 0 ) from SalesInvoices s join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
 
					and InvoiceType=2 

     select @SalesSubAdj=ISNULL(sum(case when d.SectionType = 0 then [Product_Total_Tax_Value]
					   when d.SectionType = 2 then [Product_Total_Net]*0.14 
					   else 0 
					   end), 0 ) , @SalesTableSubAdj = ISNULL(sum(case when d.SectionType = 0 then 0
													  else [Product_Total_Tax_Value] 
					   end), 0 )from SalesInvoices s join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  
      and InvoiceType=3 

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) and round(@SalesTableFatoraTotal,0)=round(@TableTaxTotal,0) and round(@TableTaxAdjustment,0)=round(@SalesTableAddAdj-@SalesTableSubAdj,0) )
  begin
  insert into    Test.[dbo].SentSalesInvoices7
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,SalesInvoicesDetails_Id SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated  
   from SalesInvoices s With(nolock) join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales2_fix_2020]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales2_fix_2020]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
		,TableTaxTotal decimal(18,2)
		,TableTaxAdjustment decimal(18,2)
		,SendDate Datetime
    )

    INSERT INTO @Remaining_Sales 
SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment,TableTaxTotal, TableTaxAdjustment,SendDate
	----,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM Staging_Area.[dbo].[LastIqrarSentOfTaxpayer2020]  le With(nolock)
  left join SentTables.dbo.SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID
  --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where  le.DeclarationTypeID!=2 and le.SalesTotal!=0 and ss.TaxVatDecID is null
  --and le.TaxpayerID
  
  --<>'DB62D761-6C3E-4BF8-927C-72D29998A79B'
  
  
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@TableTaxTotal decimal(18,2)
		,@TableTaxAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
		,@SalesTableFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
		,@SalesTableAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)
		,@SalesTableSubAdj decimal(18,2)
		,@SendDate Datetime

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment,@TableTaxTotal=TableTaxTotal,@TableTaxAdjustment=TableTaxAdjustment,@SendDate =SendDate
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

       select  @SalesFatoraTotal=ISNULL(sum(case when d.SectionType = 0 then [Product_Total_Tax_Value]
					   when d.SectionType = 2 then [Product_Total_Net]*0.14 
					   else 0 
					   end), 0 ) , @SalesTableFatoraTotal = ISNULL(sum(case when d.SectionType = 0 then 0
													  else [Product_Total_Tax_Value] 
					   end), 0 ) from SalesInvoices s join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
				and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5 )
  

	   select	@SalesAddAdj=ISNULL(sum(case when d.SectionType = 0 then [Product_Total_Tax_Value]
					   when d.SectionType = 2 then [Product_Total_Net]*0.14 
					   else 0 
					   end), 0 ) , @SalesTableAddAdj = ISNULL(sum(case when d.SectionType = 0 then 0
													  else [Product_Total_Tax_Value] 
					   end), 0 ) from SalesInvoices s join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
 
					and InvoiceType=2 

     select @SalesSubAdj=ISNULL(sum(case when d.SectionType = 0 then [Product_Total_Tax_Value]
					   when d.SectionType = 2 then [Product_Total_Net]*0.14 
					   else 0 
					   end), 0 ) , @SalesTableSubAdj = ISNULL(sum(case when d.SectionType = 0 then 0
													  else [Product_Total_Tax_Value] 
					   end), 0 )from SalesInvoices s join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
  
      and InvoiceType=3 

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) and round(@SalesTableFatoraTotal,0)=round(@TableTaxTotal,0) and round(@TableTaxAdjustment,0)=round(@SalesTableAddAdj-@SalesTableSubAdj,0) )
  begin
  insert into    SentTables.[dbo].SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,SalesInvoicesDetails_Id SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated  
   from SalesInvoices s With(nolock) join SalesInvoicesDetails d on s.SalesInvoice_Id=d.Fk_SalesInvoices_Id where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and d.IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID and s.CreationDate<@SendDate
   End

        SET @Counter = @Counter + 1
    END 

	
GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales2_for_taxpayer]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales2_for_taxpayer]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer] le left join SentSalesInvoices ss on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0 and le.TaxpayerID='DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

 --      SET @SalesFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 -- and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

 -- )

 --set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
 -- and InvoiceType=2 )

 -- set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
 -- and InvoiceType=3 )

  --if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
 -- begin
  insert into SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated 
  from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 --  End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales2_for_taxpayer_M]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales2_for_taxpayer_M]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer] le left join SentSalesInvoices ss on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0 and le.TaxpayerID='DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

 --      SET @SalesFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 -- and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

 -- )

 --set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
 -- and InvoiceType=2 )

 -- set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
 -- and InvoiceType=3 )

  --if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
 -- begin
  insert into SentSalesInvoices_M
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated 
  from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 --  End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales2_Linked]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales2_Linked]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer3] le With(nolock)
  left join SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0 and le.TaxpayerID<>'DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment 
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @SalesFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
	   from ETAX.TaxVAT.dbo.SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

  )

 set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
 from ETAX.TaxVAT.dbo.SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
  from ETAX.TaxVAT.dbo.SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
  begin
  insert into SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated  
   from ETAX.TaxVAT.dbo.SalesInvoices s With(nolock) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales2_test]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales2_test]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer] le With(nolock)
  left join SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0 and le.TaxpayerID<>'DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment 
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @SalesFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

  )

 set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
  begin
  insert into SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated  
   from SalesInvoices s With(nolock) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[insert_remainnig_sales3]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_remainnig_sales3]
	-- Add the parameters for the stored procedure here

AS
BEGIN
    DECLARE @Remaining_Sales TABLE
    (
         ID INT IDENTITY(1,1)
        ,TaxPeriod int
        ,EQRID uniqueidentifier
        ,TaxpayerID uniqueidentifier
        ,SalesTotal decimal(18,2)
        ,SalesAdjustment decimal(18,2)
    )

    INSERT INTO @Remaining_Sales 
	SELECT TaxPeriod, EQRID, le.TaxpayerID, SalesTotal, SalesAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM [TaxVat].[dbo].[LastIqrarSentOfTaxpayer2] le With(nolock)
  left join SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0 and le.TaxpayerID<>'DB62D761-6C3E-4BF8-927C-72D29998A79B'
  END
  


    DECLARE @Count INT
	    ,@Counter INT
	    ,@TaxPeriod int
        ,@EQRID uniqueidentifier
        ,@TaxpayerID uniqueidentifier
        ,@SalesTotal decimal(18,2)
        ,@SalesAdjustment decimal(18,2)
		,@SalesFatoraTotal decimal(18,2)
        ,@SalesAddAdj decimal(18,2)
        ,@SalesSubAdj decimal(18,2)

    SELECT @Count = COUNT(*) FROM @Remaining_Sales m
    SET @Counter = 1
	PRINT @Count


    WHILE @Counter <= @Count
    BEGIN
	PRINT @Counter
        SELECT @TaxPeriod = TaxPeriod, @EQRID = EQRID ,@TaxpayerID=TaxpayerID,@SalesTotal=SalesTotal,@SalesAdjustment=SalesAdjustment 
		FROM @Remaining_Sales m WHERE ID = @Counter -- extracting values from the table by counternum

       SET @SalesFatoraTotal=(select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

  )

 set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax from SalesInvoices s where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
  begin
  insert into SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated  
   from SalesInvoices s With(nolock) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriod]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLastIqrarSentOfTaxpayerPeriod] 
	-- Add the parameters for the stored procedure here
	@TaxPeriod nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[LastIqrarSentOfTaxpayer]   
    -- Insert statements for procedure here
	
    ----DECLARE @TaxPeriod nvarchar(6)
	--set @TaxPeriod=202002
;with cte_latestNonTable as (select 
			[TaxPeriod]
          
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           
           
           ,'NonTable' [VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,CAST([SalesDetails] AS VARCHAR(MAX))[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,CAST([PurchaseDetails] AS VARCHAR(MAX))[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,null [TableTaxDetails]
           ,0 [TableTaxTotal]
           ,0 [TableTaxAdjustment]
           ,0 [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from NonTableVatTax NonTableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod),

 cte_latestTable as(
select		[TaxPeriod]
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           ,'Table' [VatType] 
           ,RecivableTableTax RecivableTax 
           ,DebtTableValue DebtValue
           ,TotalTableTaxValue TotalTaxValue
           ,CAST([SalesTableDetails] AS VARCHAR(MAX)) [SalesDetails]
           ,[SalesTableTotal] [SalesTotal]
           ,[SalesTableAdjustment] [SalesAdjustment]
           ,[SalesTableVat] [SalesVat]
           ,CAST([PurchaseTableDetails] AS VARCHAR(MAX)) [PurchaseDetails]
           ,[PurchaseTableTotal] [PurchaseTotal]
           ,[PurchaseTableAdjustment] [PurchaseAdjustment]
           ,[PurchaseTableVat] [PurchaseVat]
           ,[SendDate]
           ,CAST([TableTaxDetails] AS VARCHAR(MAX)) [TableTaxDetails]
           , [TableTaxTotal]
           , [TableTaxAdjustment]
           , [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from TableVatTax TableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod)
, 
cte_UniomnDecl as(select * from 
					cte_latestTable where cte_latestTable.Rk=1 
					union all 
					select * from cte_latestNonTable
					where cte_latestNonTable.Rk=1
					)



--,cte_taxPayerDEc as(select [Unique_Tax_Id],[Taxpayer_Name],[Taxpayer_Address],cte_UniomnDecl.* from cte_UniomnDecl inner join SmartPackage.dbo.Taxpayer Taxpayer on Taxpayer.Taxpayer_Id=cte_UniomnDecl.[TaxpayerID]   )

--select * from cte_UniomnDecl

INSERT INTO [dbo].[LastIqrarSentOfTaxpayer] 
			([TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType]
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,[Rk]) --- Columns of smaller table
	select [TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,Rk from cte_UniomnDecl

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_2020]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_2020] ---202001
	-- Add the parameters for the stored procedure here
	@TaxPeriod nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
	TRUNCATE TABLE Staging_Area.[dbo].[LastIqrarSentOfTaxpayer2020]
    -- Insert statements for procedure here
	
    --DECLARE @TaxPeriod nvarchar(6)
	----set @TaxPeriod=202002
;with cte_latestNonTable as (select 
			[TaxPeriod]
          
           ,[TaxpayerID]
           ,ID [EQRID]
          ,[TotalTaxValue]
          ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
         ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
		   ,DeclarationTypeID
        ,0 [TableTaxTotal]
           ,0 [TableTaxAdjustment]
           ,0 [TableTaxVat]
		   ,'NonTable' [VatType] 
		   ,row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from TAXVAT.dbo.NonTableVatTax NonTableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 

and TaxPeriod=@TaxPeriod

),

 cte_latestTable as(
select	[TaxPeriod]
           ,[TaxpayerID]
           ,ID [EQRID]
         ,TotalTableTaxValue TotalTaxValue
        ,[SalesTableTotal] [SalesTotal]
        ,[SalesTableAdjustment] [SalesAdjustment]
         ,[SalesTableVat] [SalesVat]
		,[PurchaseTableTotal] [PurchaseTotal]
        ,[PurchaseTableAdjustment] [PurchaseAdjustment]
           ,[PurchaseTableVat] [PurchaseVat]
		  
           ,[SendDate]
		   ,DeclarationTypeID
            , [TableTaxTotal]
           , [TableTaxAdjustment]
           , [TableTaxVat]
		   ,'Table' [VatType] 
		   ,row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk

from TAXVAT.dbo.TableVatTax TableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod

)
, 
cte_UniomnDecl as(select * from 
					cte_latestTable where cte_latestTable.Rk=1 
					union all 
					select * from cte_latestNonTable
					where cte_latestNonTable.Rk=1
					)



--,cte_taxPayerDEc as(select [Unique_Tax_Id],[Taxpayer_Name],[Taxpayer_Address],cte_UniomnDecl.* from cte_UniomnDecl inner join SmartPackage.dbo.Taxpayer Taxpayer on Taxpayer.Taxpayer_Id=cte_UniomnDecl.[TaxpayerID]   )

--select * from cte_UniomnDecl

INSERT INTO  Staging_Area.[dbo].[LastIqrarSentOfTaxpayer2020]
			([TaxPeriod]
      ,[TaxpayerID]
      ,[EQRID]
      ,[TotalTaxValue]
      ,[SalesTotal]
      ,[SalesAdjustment]
      ,[SalesVat]
      ,[PurchaseTotal]
      ,[PurchaseAdjustment]
      ,[PurchaseVat]
	  ,DeclarationTypeID
      ,[SendDate]
      ,[TableTaxTotal]
      ,[TableTaxAdjustment]
      ,[TableTaxVat]
	  ,[VatType] 
      ,[Rk]) --- Columns of smaller table
	select [TaxPeriod]
      ,[TaxpayerID]
      ,[EQRID]
      ,[TotalTaxValue]
      ,[SalesTotal]
      ,[SalesAdjustment]
      ,[SalesVat]
      ,[PurchaseTotal]
      ,[PurchaseAdjustment]
      ,[PurchaseVat]
	  ,DeclarationTypeID
      ,[SendDate]
      ,[TableTaxTotal]
      ,[TableTaxAdjustment]
      ,[TableTaxVat]
	  ,[VatType] 
      ,[Rk] 
	  
	  from cte_UniomnDecl

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_DBA]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_DBA] ---201911
	-- Add the parameters for the stored procedure here
	@TaxPeriod nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[LastIqrarSentOfTaxpayer7]
    -- Insert statements for procedure here
	
    ----DECLARE @TaxPeriod nvarchar(6)
	--set @TaxPeriod=202002
;with cte_latestNonTable as (select 
			[TaxPeriod]
          
           ,[TaxpayerID]
           ,ID [EQRID]
          ,[TotalTaxValue]
          ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
         ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
		   ,DeclarationTypeID
        ,0 [TableTaxTotal]
           ,0 [TableTaxAdjustment]
           ,0 [TableTaxVat]
		   ,'NonTable' [VatType] 
		   ,row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from ETAX.TAXVAT.dbo.NonTableVatTax NonTableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 

and TaxPeriod=@TaxPeriod

),

 cte_latestTable as(
select	[TaxPeriod]
           ,[TaxpayerID]
           ,ID [EQRID]
         ,TotalTableTaxValue TotalTaxValue
        ,[SalesTableTotal] [SalesTotal]
        ,[SalesTableAdjustment] [SalesAdjustment]
         ,[SalesTableVat] [SalesVat]
		,[PurchaseTableTotal] [PurchaseTotal]
        ,[PurchaseTableAdjustment] [PurchaseAdjustment]
           ,[PurchaseTableVat] [PurchaseVat]
		  
           ,[SendDate]
		   ,DeclarationTypeID
            , [TableTaxTotal]
           , [TableTaxAdjustment]
           , [TableTaxVat]
		   ,'Table' [VatType] 
		   ,row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk

from ETAX.TAXVAT.dbo.TableVatTax TableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod

)
, 
cte_UniomnDecl as(select * from 
					cte_latestTable where cte_latestTable.Rk=1 
					union all 
					select * from cte_latestNonTable
					where cte_latestNonTable.Rk=1
					)



--,cte_taxPayerDEc as(select [Unique_Tax_Id],[Taxpayer_Name],[Taxpayer_Address],cte_UniomnDecl.* from cte_UniomnDecl inner join SmartPackage.dbo.Taxpayer Taxpayer on Taxpayer.Taxpayer_Id=cte_UniomnDecl.[TaxpayerID]   )

--select * from cte_UniomnDecl

INSERT INTO [dbo].[LastIqrarSentOfTaxpayer7]
			([TaxPeriod]
      ,[TaxpayerID]
      ,[EQRID]
      ,[TotalTaxValue]
      ,[SalesTotal]
      ,[SalesAdjustment]
      ,[SalesVat]
      ,[PurchaseTotal]
      ,[PurchaseAdjustment]
      ,[PurchaseVat]
	  ,DeclarationTypeID
      ,[SendDate]
      ,[TableTaxTotal]
      ,[TableTaxAdjustment]
      ,[TableTaxVat]
	  ,[VatType] 
      ,[Rk]) --- Columns of smaller table
	select [TaxPeriod]
      ,[TaxpayerID]
      ,[EQRID]
      ,[TotalTaxValue]
      ,[SalesTotal]
      ,[SalesAdjustment]
      ,[SalesVat]
      ,[PurchaseTotal]
      ,[PurchaseAdjustment]
      ,[PurchaseVat]
	  ,DeclarationTypeID
      ,[SendDate]
      ,[TableTaxTotal]
      ,[TableTaxAdjustment]
      ,[TableTaxVat]
	  ,[VatType] 
      ,[Rk] 
	  
	  from cte_UniomnDecl

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_LinkedServer]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_LinkedServer] 
	-- Add the parameters for the stored procedure here
	@TaxPeriod nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[LastIqrarSentOfTaxpayer3]   
    -- Insert statements for procedure here
	
    ----DECLARE @TaxPeriod nvarchar(6)
	--set @TaxPeriod=202002
;with cte_latestNonTable as (select 
			[TaxPeriod]
          
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           
           
           ,'NonTable' [VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,CAST([SalesDetails] AS VARCHAR(MAX))[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,CAST([PurchaseDetails] AS VARCHAR(MAX))[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,null [TableTaxDetails]
           ,0 [TableTaxTotal]
           ,0 [TableTaxAdjustment]
           ,0 [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from ETAX.TaxVAT.dbo.NonTableVatTax NonTableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod),

 cte_latestTable as(
select		[TaxPeriod]
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           ,'Table' [VatType] 
           ,RecivableTableTax RecivableTax 
           ,DebtTableValue DebtValue
           ,TotalTableTaxValue TotalTaxValue
           ,CAST([SalesTableDetails] AS VARCHAR(MAX)) [SalesDetails]
           ,[SalesTableTotal] [SalesTotal]
           ,[SalesTableAdjustment] [SalesAdjustment]
           ,[SalesTableVat] [SalesVat]
           ,CAST([PurchaseTableDetails] AS VARCHAR(MAX)) [PurchaseDetails]
           ,[PurchaseTableTotal] [PurchaseTotal]
           ,[PurchaseTableAdjustment] [PurchaseAdjustment]
           ,[PurchaseTableVat] [PurchaseVat]
           ,[SendDate]
           ,CAST([TableTaxDetails] AS VARCHAR(MAX)) [TableTaxDetails]
           , [TableTaxTotal]
           , [TableTaxAdjustment]
           , [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from ETAX.TaxVAT.dbo.TableVatTax TableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod)
, 
cte_UniomnDecl as(select * from 
					cte_latestTable where cte_latestTable.Rk=1 
					union all 
					select * from cte_latestNonTable
					where cte_latestNonTable.Rk=1
					)



--,cte_taxPayerDEc as(select [Unique_Tax_Id],[Taxpayer_Name],[Taxpayer_Address],cte_UniomnDecl.* from cte_UniomnDecl inner join SmartPackage.dbo.Taxpayer Taxpayer on Taxpayer.Taxpayer_Id=cte_UniomnDecl.[TaxpayerID]   )

--select * from cte_UniomnDecl

INSERT INTO [dbo].LastIqrarSentOfTaxpayer3
			([TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType]
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,[Rk]) --- Columns of smaller table
	select [TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,Rk from cte_UniomnDecl

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_LinkedServerCases]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_LinkedServerCases]  
	-- Add the parameters for the stored procedure here
	@TaxPeriod nvarchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[LastIqrarSentOfTaxpayer9]   
    -- Insert statements for procedure here
	
    ----DECLARE @TaxPeriod nvarchar(6)
	--set @TaxPeriod=202002
;with cte_latestNonTable as (select 
			[TaxPeriod]
          
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           
           
           ,'NonTable' [VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,CAST([SalesDetails] AS VARCHAR(MAX))[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,CAST([PurchaseDetails] AS VARCHAR(MAX))[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,null [TableTaxDetails]
           ,0 [TableTaxTotal]
           ,0 [TableTaxAdjustment]
           ,0 [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from TaxVAT.dbo.NonTableVatTax NonTableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod),

 cte_latestTable as(
select		[TaxPeriod]
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           ,'Table' [VatType] 
           ,RecivableTableTax RecivableTax 
           ,DebtTableValue DebtValue
           ,TotalTableTaxValue TotalTaxValue
           ,CAST([SalesTableDetails] AS VARCHAR(MAX)) [SalesDetails]
           ,[SalesTableTotal] [SalesTotal]
           ,[SalesTableAdjustment] [SalesAdjustment]
           ,[SalesTableVat] [SalesVat]
           ,CAST([PurchaseTableDetails] AS VARCHAR(MAX)) [PurchaseDetails]
           ,[PurchaseTableTotal] [PurchaseTotal]
           ,[PurchaseTableAdjustment] [PurchaseAdjustment]
           ,[PurchaseTableVat] [PurchaseVat]
           ,[SendDate]
           ,CAST([TableTaxDetails] AS VARCHAR(MAX)) [TableTaxDetails]
           , [TableTaxTotal]
           , [TableTaxAdjustment]
           , [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from TaxVAT.dbo.TableVatTax TableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod)
, 
cte_UniomnDecl as(select * from 
					cte_latestTable where cte_latestTable.Rk=1 
					union all 
					select * from cte_latestNonTable
					where cte_latestNonTable.Rk=1
					)



--,cte_taxPayerDEc as(select [Unique_Tax_Id],[Taxpayer_Name],[Taxpayer_Address],cte_UniomnDecl.* from cte_UniomnDecl inner join SmartPackage.dbo.Taxpayer Taxpayer on Taxpayer.Taxpayer_Id=cte_UniomnDecl.[TaxpayerID]   )

--select * from cte_UniomnDecl

INSERT INTO [dbo].LastIqrarSentOfTaxpayer9
			([TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType]
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,[Rk]) --- Columns of smaller table
	select [TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,Rk from cte_UniomnDecl

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriod2]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLastIqrarSentOfTaxpayerPeriod2] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[LastIqrarSentOfTaxpayer2]   
    -- Insert statements for procedure here
	
    DECLARE @TaxPeriod INT
	set @TaxPeriod=201912
;with cte_latestNonTable as (select 
			[TaxPeriod]
          
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           
           
           ,'NonTable' [VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,CAST([SalesDetails] AS VARCHAR(MAX))[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,CAST([PurchaseDetails] AS VARCHAR(MAX))[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,null [TableTaxDetails]
           ,0 [TableTaxTotal]
           ,0 [TableTaxAdjustment]
           ,0 [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from NonTableVatTax NonTableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod),

 cte_latestTable as(
select		[TaxPeriod]
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           ,'Table' [VatType] 
           ,RecivableTableTax RecivableTax 
           ,DebtTableValue DebtValue
           ,TotalTableTaxValue TotalTaxValue
           ,CAST([SalesTableDetails] AS VARCHAR(MAX)) [SalesDetails]
           ,[SalesTableTotal] [SalesTotal]
           ,[SalesTableAdjustment] [SalesAdjustment]
           ,[SalesTableVat] [SalesVat]
           ,CAST([PurchaseTableDetails] AS VARCHAR(MAX)) [PurchaseDetails]
           ,[PurchaseTableTotal] [PurchaseTotal]
           ,[PurchaseTableAdjustment] [PurchaseAdjustment]
           ,[PurchaseTableVat] [PurchaseVat]
           ,[SendDate]
           ,CAST([TableTaxDetails] AS VARCHAR(MAX)) [TableTaxDetails]
           , [TableTaxTotal]
           , [TableTaxAdjustment]
           , [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from TableVatTax TableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 and TaxPeriod=@TaxPeriod)
, 
cte_UniomnDecl as(select * from 
					cte_latestTable where cte_latestTable.Rk=1 
					union all 
					select * from cte_latestNonTable
					where cte_latestNonTable.Rk=1
					)



--,cte_taxPayerDEc as(select [Unique_Tax_Id],[Taxpayer_Name],[Taxpayer_Address],cte_UniomnDecl.* from cte_UniomnDecl inner join SmartPackage.dbo.Taxpayer Taxpayer on Taxpayer.Taxpayer_Id=cte_UniomnDecl.[TaxpayerID]   )

--select * from cte_UniomnDecl

INSERT INTO [dbo].[LastIqrarSentOfTaxpayer2] 
			([TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType]
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,[Rk]) --- Columns of smaller table
	select [TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,Rk from cte_UniomnDecl

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriodAll]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLastIqrarSentOfTaxpayerPeriodAll] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[LastIqrarSentOfTaxpayer]   
    -- Insert statements for procedure here
	
    DECLARE @TaxPeriod nvarchar(6)
	set @TaxPeriod=201907
;with cte_latestNonTable as (select 
			[TaxPeriod]
          
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           
           
           ,'NonTable' [VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,CAST([SalesDetails] AS VARCHAR(MAX))[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,CAST([PurchaseDetails] AS VARCHAR(MAX))[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,null [TableTaxDetails]
           ,0 [TableTaxTotal]
           ,0 [TableTaxAdjustment]
           ,0 [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from NonTableVatTax NonTableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 ),

 cte_latestTable as(
select		[TaxPeriod]
           ,[TaxpayerID]
           ,ID [EQRID]
           ,[DeclarationTypeID]
           ,'Table' [VatType] 
           ,RecivableTableTax RecivableTax 
           ,DebtTableValue DebtValue
           ,TotalTableTaxValue TotalTaxValue
           ,CAST([SalesTableDetails] AS VARCHAR(MAX)) [SalesDetails]
           ,[SalesTableTotal] [SalesTotal]
           ,[SalesTableAdjustment] [SalesAdjustment]
           ,[SalesTableVat] [SalesVat]
           ,CAST([PurchaseTableDetails] AS VARCHAR(MAX)) [PurchaseDetails]
           ,[PurchaseTableTotal] [PurchaseTotal]
           ,[PurchaseTableAdjustment] [PurchaseAdjustment]
           ,[PurchaseTableVat] [PurchaseVat]
           ,[SendDate]
           ,CAST([TableTaxDetails] AS VARCHAR(MAX)) [TableTaxDetails]
           , [TableTaxTotal]
           , [TableTaxAdjustment]
           , [TableTaxVat],row_number() over (PARTITION by [TaxpayerID],TaxPeriod order by SendDate desc) Rk
from TableVatTax TableVatTax with(nolock)
where IsSend=1 and IsDeleted=0 )
, 
cte_UniomnDecl as(select * from 
					cte_latestTable where cte_latestTable.Rk=1 
					union all 
					select * from cte_latestNonTable
					where cte_latestNonTable.Rk=1
					)



--,cte_taxPayerDEc as(select [Unique_Tax_Id],[Taxpayer_Name],[Taxpayer_Address],cte_UniomnDecl.* from cte_UniomnDecl inner join SmartPackage.dbo.Taxpayer Taxpayer on Taxpayer.Taxpayer_Id=cte_UniomnDecl.[TaxpayerID]   )

--select * from cte_UniomnDecl

INSERT INTO [dbo].[LastIqrarSentOfTaxpayer] 
			([TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType]
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,[Rk]) --- Columns of smaller table
	select [TaxPeriod]
           ,[TaxpayerID]
           ,[EQRID]
           ,[DeclarationTypeID]
           ,[VatType] 
           ,[RecivableTax]
           ,[DebtValue]
           ,[TotalTaxValue]
           ,[SalesDetails]
           ,[SalesTotal]
           ,[SalesAdjustment]
           ,[SalesVat]
           ,[PurchaseDetails]
           ,[PurchaseTotal]
           ,[PurchaseAdjustment]
           ,[PurchaseVat]
           ,[SendDate]
           ,[TableTaxDetails]
           ,[TableTaxTotal]
           ,[TableTaxAdjustment]
           ,[TableTaxVat]
		   ,Rk from cte_UniomnDecl

END

GO
/****** Object:  StoredProcedure [dbo].[InsertPurchasesInvoicesOfLastEqrarSent]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertPurchasesInvoicesOfLastEqrarSent]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].PurchasesInvoicesOfLastEqrarSent   
    -- Insert statements for procedure here
	
	;with SentPurchaces as (
	select [PurchaseInvoiceID],TaxPeriod from [dbo].[SentPurshaseInvoices] with(nolock) inner join
	[dbo].[LastIqrarSentOfTaxpayer] Decla on  Decla.EQRID=[dbo].[SentPurshaseInvoices].[TaxVatDecID]
	group by [PurchaseInvoiceID],TaxPeriod
),

 SentJoinPurchasesInvoices as(
	select [PurchasesInvoices].*,SentPurchaces.TaxPeriod
	from [dbo].[PurchasesInvoices] with(nolock) inner join SentPurchaces on SentPurchaces.[PurchaseInvoiceID]=[PurchasesInvoices].[PurchaseInvoice_Id] 
)

INSERT INTO [dbo].[PurchasesInvoicesOfLastEqrarSent]
           ([PurchaseInvoice_Id]
           ,[Company_Taxpayer_Id]
           ,[Company_Unique_Tax_Id]
           ,[Invoice_Number]
           ,[Invoice_Date]
           ,[Invoice_Total_Net]
           ,[Invoice_Total_Tax]
           ,[Invoice_Total_Money]
           ,[Customer_Name]
           ,[Customer_Unique_Tax_Id]
           ,[Customer_File_Number]
           ,[Customer_National_Id]
           ,[Customer_Mobile]
           ,[Customer_Address]
           ,[Replicated]
           ,[InvoiceType]
           ,[IsDeleted]
           ,[CreationDate]
           ,[UpdatedDate]
           ,[IsAPI],TaxPeriod)
SELECT	[PurchaseInvoice_Id]
           ,[Company_Taxpayer_Id]
           ,[Company_Unique_Tax_Id]
           ,[Invoice_Number]
           ,[Invoice_Date]
           ,[Invoice_Total_Net]
           ,[Invoice_Total_Tax]
           ,[Invoice_Total_Money]
           ,[Customer_Name]
           ,[Customer_Unique_Tax_Id]
           ,[Customer_File_Number]
           ,[Customer_National_Id]
           ,[Customer_Mobile]
           ,[Customer_Address]
           ,[Replicated]
           ,[InvoiceType]
           ,[IsDeleted]
           ,[CreationDate]
           ,[UpdatedDate]
           ,[IsAPI]
		   ,TaxPeriod from SentJoinPurchasesInvoices     
--insert into [dbo].PurchasesInvoicesOfLastEqrarSent


END

GO
/****** Object:  StoredProcedure [dbo].[InsertSalesInvoicesOfLastEqrarSent]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertSalesInvoicesOfLastEqrarSent]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].SalesInvoicesOfLastSentEqrar   
    -- Insert statements for procedure here
		;with SentSales as (
	select [SalesInvoiceID],TaxPeriod from [dbo].[SentSalesInvoices] with(nolock) inner join
	[dbo].[LastIqrarSentOfTaxpayer] Decla on  Decla.EQRID=[dbo].[SentSalesInvoices].[TaxVatDecID]
	group by [SalesInvoiceID],TaxPeriod
),

 SentJoinSalesInvoices as(
	select [SalesInvoices].*,SentSales.TaxPeriod
	from [dbo].[SalesInvoices] with(nolock) inner join SentSales on SentSales.[SalesInvoiceID]=[SalesInvoices].[SalesInvoice_Id] 
)

INSERT INTO [dbo].[SalesInvoicesOfLastSentEqrar]
           ([SalesInvoice_Id]
           ,[Company_Taxpayer_Id]
           ,[Company_Unique_Tax_Id]
           ,[Invoice_Number]
           ,[Invoice_Date]
           ,[Invoice_Total_Net]
           ,[Invoice_Total_Tax]
           ,[Invoice_Total_Money]
           ,[Customer_Name]
           ,[Customer_Unique_Tax_Id]
           ,[Customer_File_Number]
           ,[Customer_National_Id]
           ,[Customer_Mobile]
           ,[Customer_Address]
           ,[Replicated]
           ,[InvoiceType]
           ,[IsDeleted]
           ,[CreationDate]
           ,[UpdatedDate]
           ,[IsAPI],TaxPeriod)
SELECT	[SalesInvoice_Id]
           ,[Company_Taxpayer_Id]
           ,[Company_Unique_Tax_Id]
           ,[Invoice_Number]
           ,[Invoice_Date]
           ,[Invoice_Total_Net]
           ,[Invoice_Total_Tax]
           ,[Invoice_Total_Money]
           ,[Customer_Name]
           ,[Customer_Unique_Tax_Id]
           ,[Customer_File_Number]
           ,[Customer_National_Id]
           ,[Customer_Mobile]
           ,[Customer_Address]
           ,[Replicated]
           ,[InvoiceType]
           ,[IsDeleted]
           ,[CreationDate]
           ,[UpdatedDate]
           ,[IsAPI]
		   ,TaxPeriod from SentJoinSalesInvoices   


END

GO
/****** Object:  StoredProcedure [dbo].[Move_Data_SentPurshaseInvoices]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Move_Data_SentPurshaseInvoices]

as



Declare  @Max_CreationDate  datetime =(SELECT MAX   ([CreationDate])  FROM [SentTables].[dbo].[SentPurshaseInvoices])
--Declare  @EndDate datetime  = getdate()

--select @Max_CreationDate
DECLARE @err_msg AS NVARCHAR(MAX);

BEGIN TRY
BEGIN TRAN
--============================ Your Code according Date



--truncate table  Test.[dbo].SentPurshaseInvoicesDiff
--=========================== Wite after Done in History Table
INSERT INTO SentTables.[dbo].SentPurshaseInvoices
           ([ID]
           ,[TaxpayerID]
           ,[TaxVatDecID]
           ,[PurchaseInvoiceID]
           ,[PurchaseInvoiceDetailsID]
           ,[CreationDate]
           ,[UpdatedDate]
           ,[IsDeleted]
           ,[IsReplicated])
SELECT [ID]
      ,[TaxpayerID]
      ,[TaxVatDecID]
      ,[PurchaseInvoiceID]
      ,[PurchaseInvoiceDetailsID]
      ,[CreationDate]
      ,[UpdatedDate]
      ,[IsDeleted]
      ,[IsReplicated]
  FROM [ETAX].[TaxVAT].[dbo].[SentPurshaseInvoices] with(nolock)
  Where [CreationDate]>@Max_CreationDate

  COMMIT;
 SELECT 1;
END TRY
BEGIN CATCH
SET @err_msg = ERROR_MESSAGE() ;
	   PRINT @err_msg;
ROLLBACK;





SELECT 0;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Move_Data_SentSalesInvoices]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Move_Data_SentSalesInvoices]

as



Declare  @Max_CreationDate  datetime =(SELECT MAX   ([CreationDate])  FROM [SentTables].[dbo].[SentSalesInvoices])
--Declare  @EndDate datetime  = getdate()

--select @Max_CreationDate
DECLARE @err_msg AS NVARCHAR(MAX);

BEGIN TRY
BEGIN TRAN
--============================ Your Code according Date



--truncate table  Test.[dbo].[SentSalesInvoicesDiff]
--=========================== Wite after Done in History Table
 INSERT INTO SentTables.[dbo].[SentSalesInvoices]
           ([ID]
           ,[TaxPayerID]
           ,[TaxVatDecID]
           ,[SalesInvoiceID]
           ,[SalesInvoiceDetailsID]
           ,[CreationDate]
           ,[UpdatedDate]
           ,[IsDeleted]
           ,[IsReplicated])
SELECT [ID]
      ,[TaxPayerID]
      ,[TaxVatDecID]
      ,[SalesInvoiceID]
      ,[SalesInvoiceDetailsID]
      ,[CreationDate]
      ,[UpdatedDate]
      ,[IsDeleted]
      ,[IsReplicated]
  FROM [ETAX].[TaxVAT].[dbo].[SentSalesInvoices] with(nolock)
  Where [CreationDate]>@Max_CreationDate

  COMMIT;
 SELECT 1;
END TRY
BEGIN CATCH
SET @err_msg = ERROR_MESSAGE() ;
	   PRINT @err_msg;
ROLLBACK;





SELECT 0;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRowSize]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_GetRowSize](@Tablename varchar(100),@pkcol varchar(100))
AS 
BEGIN
declare @dynamicsql varchar(1000)

-- A @pkcol can be used to identify max/min length row
set @dynamicsql = 'select ' + @PkCol +' , (0'

-- traverse each record and calculate the datalength
select @dynamicsql = @dynamicsql + ' + isnull(datalength(' + name + '), 1)' 
	from syscolumns where id = object_id(@Tablename)
set @dynamicsql = @dynamicsql + ') as rowsize from ' + @Tablename 


exec (@dynamicsql)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Inquery_GPS_Sales_Tax_Payments]    Script Date: 9/12/2021 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Inquery_GPS_Sales_Tax_Payments] 
@registeration_Number varchar(10) = NULL,
@tax_Period DATE= NULL
AS

DECLARE @smalldatetime smalldatetime = @tax_Period;  
DECLARE @date date;  
IF @tax_Period IS NOT NULL
BEGIN
	SET @date = @smalldatetime  
END

SELECT * FROM [TaxPaymentDB].[dbo].[GPS_Sales_Tax_Payments_View]
WHERE 
Registration_Number = @registeration_Number AND Tax_Period = @date
									 
GO
