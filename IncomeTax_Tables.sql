USE [IncomeTax]
GO
/****** Object:  Table [dbo].[tblDeclarations]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeclarations](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationID] [uniqueidentifier] NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationNum] [int] NULL,
	[DeclarationType] [int] NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [int] NULL,
	[RecieptNum] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[PaidStatus] [int] NULL,
	[IsPaid] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsUploaded] [bit] NULL,
	[PaymentDate] [datetime] NULL,
	[SendDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblDeclarations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDeclarationTypes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeclarationTypes](
	[Id] [smallint] NOT NULL,
	[declaration_Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblDeclarationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_dta_mv_0]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_dta_mv_0] WITH SCHEMABINDING AS SELECT  [dbo].[tblDeclarations].[TaxPayerID] as _col_1,  [dbo].[tblDeclarations].[DeclarationYear] as _col_2,  [dbo].[tblDeclarations].[IsDeleted] as _col_3,  [dbo].[tblDeclarations].[ID] as _col_4,  [dbo].[tblDeclarations].[DeclarationID] as _col_5,  [dbo].[tblDeclarations].[DeclarationNum] as _col_6,  [dbo].[tblDeclarations].[DeclarationType] as _col_7,  [dbo].[tblDeclarations].[PaidMoney] as _col_8,  [dbo].[tblDeclarations].[PaymentTypeID] as _col_9,  [dbo].[tblDeclarations].[RecieptNum] as _col_10,  [dbo].[tblDeclarations].[CreationDate] as _col_11,  [dbo].[tblDeclarations].[PaidStatus] as _col_12,  [dbo].[tblDeclarations].[IsPaid] as _col_13,  [dbo].[tblDeclarations].[PaymentDate] as _col_14,  [dbo].[tblDeclarations].[SendDate] as _col_15,  [dbo].[tblDeclarationTypes].[declaration_Type] as _col_16,  count_big(*) as _col_17 FROM  [dbo].[tblDeclarations],  [dbo].[tblDeclarationTypes]   WHERE  [dbo].[tblDeclarations].[DeclarationType] = [dbo].[tblDeclarationTypes].[Id]  GROUP BY  [dbo].[tblDeclarations].[TaxPayerID],  [dbo].[tblDeclarations].[DeclarationYear],  [dbo].[tblDeclarations].[IsDeleted],  [dbo].[tblDeclarations].[ID],  [dbo].[tblDeclarations].[DeclarationID],  [dbo].[tblDeclarations].[DeclarationNum],  [dbo].[tblDeclarations].[DeclarationType],  [dbo].[tblDeclarations].[PaidMoney],  [dbo].[tblDeclarations].[PaymentTypeID],  [dbo].[tblDeclarations].[RecieptNum],  [dbo].[tblDeclarations].[CreationDate],  [dbo].[tblDeclarations].[PaidStatus],  [dbo].[tblDeclarations].[IsPaid],  [dbo].[tblDeclarations].[PaymentDate],  [dbo].[tblDeclarations].[SendDate],  [dbo].[tblDeclarationTypes].[declaration_Type]  
GO
/****** Object:  View [dbo].[_dta_mv_1]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_dta_mv_1] WITH SCHEMABINDING AS SELECT  [dbo].[tblDeclarations].[TaxPayerID] as _col_1,  [dbo].[tblDeclarations].[DeclarationYear] as _col_2,  [dbo].[tblDeclarations].[IsDeleted] as _col_3,  [dbo].[tblDeclarations].[ID] as _col_4,  [dbo].[tblDeclarations].[DeclarationID] as _col_5,  [dbo].[tblDeclarations].[DeclarationNum] as _col_6,  [dbo].[tblDeclarations].[DeclarationType] as _col_7,  [dbo].[tblDeclarations].[PaidMoney] as _col_8,  [dbo].[tblDeclarations].[PaymentTypeID] as _col_9,  [dbo].[tblDeclarations].[RecieptNum] as _col_10,  [dbo].[tblDeclarations].[CreationDate] as _col_11,  [dbo].[tblDeclarations].[PaidStatus] as _col_12,  [dbo].[tblDeclarations].[IsPaid] as _col_13,  [dbo].[tblDeclarations].[PaymentDate] as _col_14,  [dbo].[tblDeclarations].[SendDate] as _col_15,  [dbo].[tblDeclarationTypes].[declaration_Type] as _col_16 FROM  [dbo].[tblDeclarations],  [dbo].[tblDeclarationTypes]   WHERE  [dbo].[tblDeclarations].[DeclarationType] = [dbo].[tblDeclarationTypes].[Id]  
GO
/****** Object:  View [dbo].[_dta_mv_2]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_dta_mv_2] WITH SCHEMABINDING AS SELECT  [dbo].[tblDeclarations].[ID] as _col_1,  [dbo].[tblDeclarations].[DeclarationID] as _col_2,  [dbo].[tblDeclarations].[TaxPayerID] as _col_3,  [dbo].[tblDeclarations].[DeclarationYear] as _col_4,  [dbo].[tblDeclarations].[DeclarationNum] as _col_5,  [dbo].[tblDeclarations].[DeclarationType] as _col_6,  [dbo].[tblDeclarations].[PaidMoney] as _col_7,  [dbo].[tblDeclarations].[PaymentTypeID] as _col_8,  [dbo].[tblDeclarations].[RecieptNum] as _col_9,  [dbo].[tblDeclarations].[CreationDate] as _col_10,  [dbo].[tblDeclarations].[PaidStatus] as _col_11,  [dbo].[tblDeclarations].[IsPaid] as _col_12,  [dbo].[tblDeclarations].[IsDeleted] as _col_13,  [dbo].[tblDeclarations].[PaymentDate] as _col_14,  [dbo].[tblDeclarations].[SendDate] as _col_15,  [dbo].[tblDeclarationTypes].[declaration_Type] as _col_16 FROM  [dbo].[tblDeclarations],  [dbo].[tblDeclarationTypes]   WHERE  [dbo].[tblDeclarations].[IsDeleted] = 0  AND  [dbo].[tblDeclarations].[DeclarationType] = [dbo].[tblDeclarationTypes].[Id]  
GO
/****** Object:  Table [dbo].[CarDeclaration_104]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarDeclaration_104](
	[ProfitDeclarationID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [int] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [int] NULL,
	[IsAccepted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_CarDeclaration_104] PRIMARY KEY CLUSTERED 
(
	[ProfitDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheaqueTypes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheaqueTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheaqueType] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetermineTaxPosition]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetermineTaxPosition](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NOT NULL,
	[TaxPeriodEndDate] [date] NULL,
	[Profit] [decimal](18, 2) NULL,
	[TaxValue] [decimal](18, 2) NULL,
	[ChequeNumber] [nvarchar](50) NULL,
	[ChequePaymentDate] [date] NULL,
	[LegalEntity] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_DetermineTaxPosition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StopingTaxPosition]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StopingTaxPosition](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NOT NULL,
	[OfficeManager] [nvarchar](50) NULL,
	[StoppingDate] [date] NULL,
	[StoppingType] [int] NULL,
	[StoppingReason] [nvarchar](200) NULL,
	[CreationDate] [date] NULL,
	[UpdatedDate] [datetime] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_StopingTaxPosition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBanks]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBanks](
	[Id] [smallint] NOT NULL,
	[bank_code] [nvarchar](20) NULL,
	[bank_Branch_Code] [nvarchar](20) NULL,
	[bank_Branch_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblBanks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCars]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCars](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[plate_Number] [nvarchar](10) NOT NULL,
	[type] [smallint] NULL,
	[model] [nchar](5) NULL,
	[chassis_Number] [varchar](20) NULL,
	[engine_Number] [varchar](20) NULL,
	[fuel_Type] [smallint] NULL,
	[passengers_Count] [smallint] NULL,
	[weight] [smallint] NULL,
	[driver_Type] [smallint] NULL,
	[daily_Income] [int] NULL,
	[annual_Work_Days] [smallint] NULL,
	[annual_Income] [int] NULL,
	[net_Profit_Percentage] [smallint] NULL,
	[annual_Net_Profit] [int] NULL,
	[total_Annual_Net_Profit] [int] NULL,
	[declaration_Num] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblCars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCarTypes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCarTypes](
	[Id] [smallint] NOT NULL,
	[car_Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblCarTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCashPayment]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCashPayment](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[declaration_Id] [uniqueidentifier] NULL,
	[DeclarationNum] [int] NULL,
	[taxpayer_Id] [uniqueidentifier] NULL,
	[amount] [decimal](38, 2) NULL,
	[payment_Date] [datetime] NULL,
	[receipt_Number] [varchar](50) NULL,
	[currency_Type] [smallint] NULL,
 CONSTRAINT [PK_tblCashPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChequePayment]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChequePayment](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[declaration_Id] [uniqueidentifier] NULL,
	[DeclarationNum] [int] NULL,
	[taxpayer_Id] [uniqueidentifier] NULL,
	[amount] [decimal](38, 2) NULL,
	[payment_Date] [datetime] NULL,
	[cheque_Number] [varchar](50) NULL,
	[currency_Type] [smallint] NULL,
	[bank_Code] [nvarchar](20) NULL,
	[bank_Branch_Code] [nvarchar](20) NULL,
	[notes] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_tblChequePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompaniesSearchingPetroleum_108]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompaniesSearchingPetroleum_108](
	[ProfitDeclarationID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [smallint] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [smallint] NULL,
	[IsAccepted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[GPCIsAccepted] [bit] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblCompaniesSearchingPetroleum_108] PRIMARY KEY CLUSTERED 
(
	[ProfitDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCurrencyTypes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCurrencyTypes](
	[Id] [smallint] NOT NULL,
	[currency_Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblCurrencyTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDataExtraction]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDataExtraction](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationCode] [nchar](3) NULL,
	[DeclarationType] [int] NULL,
	[TaxPayer_Id] [uniqueidentifier] NULL,
	[ReturnValueAttr] [decimal](18, 2) NULL,
	[TotalTaxAttr] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblDataExtraction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDataExtractionAttributes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDataExtractionAttributes](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [nchar](3) NULL,
	[ReturnValueAttr] [nvarchar](50) NULL,
	[TotalTaxAttr] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDataExtractionLkp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDeclarationData]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeclarationData](
	[declaration_Id] [uniqueidentifier] NOT NULL,
	[taxpayer] [varchar](50) NULL,
	[declaration_Year] [smallint] NULL,
	[declaration_Type] [smallint] NULL,
	[address] [nvarchar](50) NULL,
	[Accountant_Office] [nvarchar](50) NULL,
	[telephone] [nvarchar](30) NULL,
	[traffic_Unit] [nvarchar](50) NULL,
	[tax_Period_From] [date] NULL,
	[tax_Period_To] [date] NULL,
	[annual_Income] [int] NULL,
	[net_Profit] [int] NULL,
	[tax_Amount] [int] NULL,
	[outstanding_Balance] [int] NULL,
	[return_Amount] [int] NOT NULL,
	[withholding_Paid_Amount] [int] NULL,
	[original_Declaration_Paid_Amount] [int] NULL,
	[total_Payments] [int] NULL,
	[total_Tax] [int] NULL,
	[postOffice\Pank] [nvarchar](50) NULL,
	[declaration_Creation_Date] [date] NULL,
	[accountant_Name] [nvarchar](50) NULL,
	[accountant_Enrollment_Number] [int] NULL,
	[actual_Paid_Amount] [int] NULL,
	[payment_Type] [smallint] NULL,
 CONSTRAINT [PK_tblDeclarationData] PRIMARY KEY CLUSTERED 
(
	[declaration_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDeclarationProfit]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeclarationProfit](
	[ProfitDeclarationID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [int] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [int] NULL,
	[IsAccepted] [bit] NULL,
	[IsCAOAccepted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblDeclarationProfit] PRIMARY KEY CLUSTERED 
(
	[ProfitDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDriverTypes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDriverTypes](
	[Id] [smallint] NOT NULL,
	[driver_Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblDriverTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblElectronicPayment]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblElectronicPayment](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[declaration_Id] [uniqueidentifier] NULL,
	[DeclarationNum] [int] NULL,
	[taxpayer_Id] [uniqueidentifier] NULL,
	[amount] [decimal](38, 2) NULL,
	[payment_Date] [datetime] NULL,
	[receipt_Number] [varchar](50) NULL,
	[currency_Type] [smallint] NULL,
 CONSTRAINT [PK_tblElectronicPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblExceptionTaxpayer]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExceptionTaxpayer](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[TaxpayerName] [nvarchar](150) NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[FileNumber] [nvarchar](16) NULL,
 CONSTRAINT [PK_ExceptionTaxpayer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblfuelTypes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblfuelTypes](
	[Id] [smallint] NOT NULL,
	[fuel_Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblfuelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNetIncome_101]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNetIncome_101](
	[NetIncomeID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [int] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [int] NULL,
	[IsAccepted] [bit] NULL,
	[NewPdfData] [xml] NULL,
	[OldPdfData] [xml] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblNetIncome_101] PRIMARY KEY CLUSTERED 
(
	[NetIncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNetIncomeCars_103]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNetIncomeCars_103](
	[NetIncomeID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [int] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [int] NULL,
	[IsAccepted] [bit] NULL,
	[NewPdfData] [xml] NULL,
	[OldPdfData] [xml] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblNetIncomeCars_103] PRIMARY KEY CLUSTERED 
(
	[NetIncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNetIncomeNaturalPerson_105]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNetIncomeNaturalPerson_105](
	[NetIncomeID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [smallint] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [smallint] NULL,
	[IsAccepted] [bit] NULL,
	[NewPdfData] [xml] NULL,
	[OldPdfData] [xml] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblNetIncomeNaturalPerson_105] PRIMARY KEY CLUSTERED 
(
	[NetIncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNetProfitDeclaration_102]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNetProfitDeclaration_102](
	[NetProfitDeclarationID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [int] NULL,
	[NetDeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [int] NULL,
	[IsAccepted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblNetProfitDeclaration_102] PRIMARY KEY CLUSTERED 
(
	[NetProfitDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentTypes]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentTypes](
	[Id] [smallint] NOT NULL,
	[payment_Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblPaymentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProfitInvestmentFundsCompanyAndBank_110]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProfitInvestmentFundsCompanyAndBank_110](
	[ProfitDeclarationID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [smallint] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [smallint] NULL,
	[IsAccepted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblProfitInvestmentFundsCompanyAndBank_110] PRIMARY KEY CLUSTERED 
(
	[ProfitDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProfitsLegalPersonsBank_107]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProfitsLegalPersonsBank_107](
	[ProfitsLegalID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [smallint] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [smallint] NULL,
	[IsAccepted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblProfitsLegalPersonsBank_107] PRIMARY KEY CLUSTERED 
(
	[ProfitsLegalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProfitsLegalPersonsHotel_109]    Script Date: 9/12/2021 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProfitsLegalPersonsHotel_109](
	[ProfitDeclarationID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[DeclarationType] [smallint] NULL,
	[DeclarationData] [xml] NULL,
	[IsDeleted] [bit] NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[PaidMoney] [decimal](18, 2) NULL,
	[PaymentTypeID] [smallint] NULL,
	[IsAccepted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
 CONSTRAINT [PK_tblProfitsLegalPersonsHotel_109] PRIMARY KEY CLUSTERED 
(
	[ProfitDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IDX_declaration_Id]    Script Date: 9/12/2021 10:33:25 AM ******/
CREATE NONCLUSTERED INDEX [IDX_declaration_Id] ON [dbo].[tblCashPayment]
(
	[declaration_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_ALL_columns_INCLUDE]    Script Date: 9/12/2021 10:33:25 AM ******/
CREATE NONCLUSTERED INDEX [INDEX_ALL_columns_INCLUDE] ON [dbo].[tblDeclarationProfit]
(
	[TaxPayerID] ASC,
	[DeclarationYear] ASC,
	[DeclarationType] ASC,
	[IsDeleted] ASC
)
INCLUDE([ProfitDeclarationID],[DeclarationData],[PaidMoney],[PaymentTypeID],[IsAccepted],[IsCAOAccepted],[CreationDate],[UpdatedDate],[AccountantId],[AcceptanceDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_ALL_columns_INCLUDE]    Script Date: 9/12/2021 10:33:25 AM ******/
CREATE NONCLUSTERED INDEX [INDEX_ALL_columns_INCLUDE] ON [dbo].[tblDeclarations]
(
	[IsDeleted] ASC,
	[TaxPayerID] ASC,
	[CreationDate] ASC,
	[DeclarationType] ASC
)
INCLUDE([ID],[DeclarationID],[DeclarationYear],[DeclarationNum],[PaidMoney],[PaymentTypeID],[RecieptNum],[PaidStatus],[IsPaid],[IsUploaded],[PaymentDate],[SendDate],[UpdatedDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_declaration_Id]    Script Date: 9/12/2021 10:33:25 AM ******/
CREATE NONCLUSTERED INDEX [IDX_declaration_Id] ON [dbo].[tblElectronicPayment]
(
	[declaration_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_TaxPayerID]    Script Date: 9/12/2021 10:33:25 AM ******/
CREATE NONCLUSTERED INDEX [IDX_TaxPayerID] ON [dbo].[tblNetProfitDeclaration_102]
(
	[TaxPayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarDeclaration_104] ADD  CONSTRAINT [DF_CarDeclaration_104_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CarDeclaration_104] ADD  CONSTRAINT [DF_CarDeclaration_104_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[DetermineTaxPosition] ADD  CONSTRAINT [DF_DetermineTaxPosition_IsSend]  DEFAULT ((0)) FOR [IsSend]
GO
ALTER TABLE [dbo].[DetermineTaxPosition] ADD  CONSTRAINT [DF_DetermineTaxPosition_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StopingTaxPosition] ADD  CONSTRAINT [DF_StopingTaxPosition_IsSend]  DEFAULT ((0)) FOR [IsSend]
GO
ALTER TABLE [dbo].[StopingTaxPosition] ADD  CONSTRAINT [DF_StopingTaxPosition_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblCompaniesSearchingPetroleum_108] ADD  CONSTRAINT [DF_tblCompaniesSearchingPetroleum_108_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblDeclarationProfit] ADD  CONSTRAINT [DF_tblDeclarationProfit_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblDeclarationProfit] ADD  CONSTRAINT [DF_tblDeclarationProfit_IsAccepted_1]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblDeclarationProfit] ADD  CONSTRAINT [DF_tblDeclarationProfit_IsExceptionAccepted]  DEFAULT ((0)) FOR [IsCAOAccepted]
GO
ALTER TABLE [dbo].[tblDeclarations] ADD  CONSTRAINT [DF_tblDeclarations_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[tblDeclarations] ADD  CONSTRAINT [DF_tblDeclarations_IsUploaded]  DEFAULT ((0)) FOR [IsUploaded]
GO
ALTER TABLE [dbo].[tblNetIncome_101] ADD  CONSTRAINT [DF_tblNetIncome_101_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblNetIncome_101] ADD  CONSTRAINT [DF_tblNetIncome_101_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblNetIncomeCars_103] ADD  CONSTRAINT [DF_tblNetIncomeDeclaration_103_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblNetIncomeCars_103] ADD  CONSTRAINT [DF_tblNetIncomeCars_103_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblNetIncomeNaturalPerson_105] ADD  CONSTRAINT [DF_tblNetIncomeNaturalPerson_105_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblNetProfitDeclaration_102] ADD  CONSTRAINT [DF_tblNetProfitDeclaration_102_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblNetProfitDeclaration_102] ADD  CONSTRAINT [DF_tblNetProfitDeclaration_102_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblProfitInvestmentFundsCompanyAndBank_110] ADD  CONSTRAINT [DF_tblProfitInvestmentFundsCompanyAndBank_110_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblProfitsLegalPersonsBank_107] ADD  CONSTRAINT [DF_tblProfitsLegalPersonsBank_107_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblProfitsLegalPersonsHotel_109] ADD  CONSTRAINT [DF_tblProfitsLegalPersonsHotel_109_IsAccepted]  DEFAULT ((0)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[tblCars]  WITH CHECK ADD  CONSTRAINT [FK_tblCars_tblCarTypes] FOREIGN KEY([type])
REFERENCES [dbo].[tblCarTypes] ([Id])
GO
ALTER TABLE [dbo].[tblCars] CHECK CONSTRAINT [FK_tblCars_tblCarTypes]
GO
ALTER TABLE [dbo].[tblCars]  WITH CHECK ADD  CONSTRAINT [FK_tblCars_tblDeclarationData] FOREIGN KEY([declaration_Num])
REFERENCES [dbo].[tblDeclarationData] ([declaration_Id])
GO
ALTER TABLE [dbo].[tblCars] CHECK CONSTRAINT [FK_tblCars_tblDeclarationData]
GO
ALTER TABLE [dbo].[tblCars]  WITH CHECK ADD  CONSTRAINT [FK_tblCars_tblDriverTypes] FOREIGN KEY([driver_Type])
REFERENCES [dbo].[tblDriverTypes] ([Id])
GO
ALTER TABLE [dbo].[tblCars] CHECK CONSTRAINT [FK_tblCars_tblDriverTypes]
GO
ALTER TABLE [dbo].[tblCars]  WITH CHECK ADD  CONSTRAINT [FK_tblCars_tblfuelTypes] FOREIGN KEY([fuel_Type])
REFERENCES [dbo].[tblfuelTypes] ([Id])
GO
ALTER TABLE [dbo].[tblCars] CHECK CONSTRAINT [FK_tblCars_tblfuelTypes]
GO
ALTER TABLE [dbo].[tblDeclarationData]  WITH CHECK ADD  CONSTRAINT [FK_tblDeclarationData_tblDeclarationTypes] FOREIGN KEY([declaration_Type])
REFERENCES [dbo].[tblDeclarationTypes] ([Id])
GO
ALTER TABLE [dbo].[tblDeclarationData] CHECK CONSTRAINT [FK_tblDeclarationData_tblDeclarationTypes]
GO
ALTER TABLE [dbo].[tblDeclarationData]  WITH CHECK ADD  CONSTRAINT [FK_tblDeclarationData_tblPaymentTypes] FOREIGN KEY([payment_Type])
REFERENCES [dbo].[tblPaymentTypes] ([Id])
GO
ALTER TABLE [dbo].[tblDeclarationData] CHECK CONSTRAINT [FK_tblDeclarationData_tblPaymentTypes]
GO
