USE [Withholding]
GO
/****** Object:  DatabaseRole [MSReplPAL_11_1]    Script Date: 9/12/2021 10:41:52 AM ******/
CREATE ROLE [MSReplPAL_11_1]
GO
/****** Object:  DatabaseRole [MStran_PAL_role]    Script Date: 9/12/2021 10:41:52 AM ******/
CREATE ROLE [MStran_PAL_role]
GO
ALTER ROLE [MStran_PAL_role] ADD MEMBER [MSReplPAL_11_1]
GO
/****** Object:  Schema [with_user]    Script Date: 9/12/2021 10:41:52 AM ******/
CREATE SCHEMA [with_user]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Bank_Code] [nvarchar](50) NULL,
	[Bank_Branch_Code] [nvarchar](50) NULL,
	[Branch_Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapitalGainsData43]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapitalGainsData43](
	[TransactionData_Id] [uniqueidentifier] NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Modification_Date] [datetime] NULL,
	[Tax_Year] [char](4) NULL,
	[Total_Money] [decimal](38, 2) NULL,
	[Transaction_Details] [xml] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Closed] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Replicated] [bit] NULL,
 CONSTRAINT [PK_CapitalGains43] PRIMARY KEY CLUSTERED 
(
	[TransactionData_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapitalGainsData45]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapitalGainsData45](
	[TransactionData_Id] [uniqueidentifier] NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Modification_Date] [datetime] NULL,
	[Tax_Year] [char](4) NULL,
	[Total_Money] [decimal](38, 2) NULL,
	[Total_Taxes_Money] [decimal](35, 2) NULL,
	[Transaction_Details] [xml] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Closed] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Replicated] [bit] NULL,
 CONSTRAINT [PK_CapitalGainsData45] PRIMARY KEY CLUSTERED 
(
	[TransactionData_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashPayment]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPayment](
	[CashPayment_Id] [uniqueidentifier] NOT NULL,
	[Fk_TransactionData_Id] [uniqueidentifier] NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Tax_Period] [char](4) NULL,
	[Tax_Year] [char](4) NULL,
	[Paid_Money] [decimal](38, 2) NOT NULL,
	[Payment_Date] [datetime] NOT NULL,
	[Receipt_Number] [nvarchar](100) NULL,
	[Fk_Currency_Id] [int] NOT NULL,
	[Namozag] [nvarchar](50) NULL,
 CONSTRAINT [PK_CashPayment] PRIMARY KEY CLUSTERED 
(
	[CashPayment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChequePayment]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChequePayment](
	[ChequePayment_Id] [uniqueidentifier] NOT NULL,
	[Fk_TransactionData_Id] [uniqueidentifier] NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Tax_Period] [char](1) NULL,
	[Tax_Year] [char](4) NULL,
	[Paid_Money] [decimal](38, 2) NOT NULL,
	[Payment_Date] [datetime] NOT NULL,
	[Cheque_Number] [nvarchar](100) NULL,
	[Fk_Currency_Id] [int] NOT NULL,
	[Fk_Bank_Code] [nvarchar](50) NULL,
	[Fk_Bank_Branch_Code] [nvarchar](50) NULL,
	[Namozag] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChequePayment] PRIMARY KEY CLUSTERED 
(
	[ChequePayment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyTypes]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyTypes](
	[Currency_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Currency_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_CurrencyTypes] PRIMARY KEY CLUSTERED 
(
	[Currency_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistributionsGainsData42_44]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistributionsGainsData42_44](
	[TransactionData_Id] [uniqueidentifier] NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Modification_Date] [datetime] NULL,
	[Tax_Year] [char](4) NULL,
	[Total_Money] [decimal](38, 2) NULL,
	[Total_Taxes_Money] [decimal](35, 2) NULL,
	[Transaction_Details] [xml] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Closed] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Replicated] [bit] NULL,
	[RecordTypeName] [nvarchar](50) NULL,
	[RecordDate_Year] [nvarchar](50) NULL,
	[TransactionDate] [date] NULL,
 CONSTRAINT [PK_DistributionsGainsData42_44] PRIMARY KEY CLUSTERED 
(
	[TransactionData_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictsDetails]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictsDetails](
	[District_Code] [int] NOT NULL,
	[District_Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_DistrictsDetails] PRIMARY KEY CLUSTERED 
(
	[District_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectronicPayment]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectronicPayment](
	[ElectronicPayment_Id] [uniqueidentifier] NOT NULL,
	[Fk_TransactionData_Id] [uniqueidentifier] NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Tax_Period] [char](1) NULL,
	[Tax_Year] [char](4) NULL,
	[Paid_Money] [decimal](38, 2) NOT NULL,
	[Payment_Date] [datetime] NOT NULL,
	[Receipt_Number] [nvarchar](100) NULL,
	[Fk_Currency_Id] [int] NOT NULL,
	[Namozag] [nvarchar](50) NULL,
 CONSTRAINT [PK_ElectronicPayment] PRIMARY KEY CLUSTERED 
(
	[ElectronicPayment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FawryPayment]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FawryPayment](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[FawryRefNum] [nvarchar](50) NULL,
	[PaidMoney] [decimal](38, 2) NULL,
	[CurrencyID] [int] NULL,
	[FawryStatusID] [int] NULL,
	[TaxYear] [char](4) NULL,
	[TaxPeriod] [char](1) NULL,
	[RequestDate] [datetime] NULL,
	[PaidDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
	[RefundedDate] [datetime] NULL,
	[DeliveredDate] [datetime] NULL,
	[CanceledDate] [datetime] NULL,
 CONSTRAINT [PK_FawryPayment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geha]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geha](
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Unique_Tax_Id] [nchar](9) NULL,
	[Geha_Name] [nvarchar](100) NULL,
	[Geha_Address] [nvarchar](100) NULL,
	[Geha_Email] [nvarchar](50) NULL,
	[Geha_Telephone] [nchar](20) NULL,
	[Geha_Fax] [nchar](20) NULL,
	[Fk_Taxpayer_Category_Id] [int] NULL,
 CONSTRAINT [PK_Geha] PRIMARY KEY CLUSTERED 
(
	[Taxpayer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GehaType]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GehaType](
	[GehaTypeId] [int] NOT NULL,
	[GehaTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_GehaType] PRIMARY KEY CLUSTERED 
(
	[GehaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InCorrectCapitalGains43]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InCorrectCapitalGains43](
	[Transaction_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Tax_Year] [nchar](10) NULL,
	[Financier_UniqueTaxId] [nchar](30) NULL,
	[Financier_FileNumber] [nchar](30) NULL,
	[Financier_Name] [nvarchar](100) NULL,
	[Financier_National_Id] [nchar](30) NULL,
	[Financier_Address] [nvarchar](100) NULL,
	[Fk_District_Code] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Transaction_Value] [decimal](38, 2) NULL,
	[Transaction_Net] [decimal](38, 2) NULL,
	[Fk_Currency_Id] [int] NULL,
 CONSTRAINT [PK_InCorrectCapitalGains43] PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InCorrectCapitalGains45]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InCorrectCapitalGains45](
	[Transaction_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Tax_Year] [nchar](10) NULL,
	[Financier_UniqueTaxId] [nchar](30) NULL,
	[Financier_FileNumber] [nchar](30) NULL,
	[Financier_Name] [nvarchar](100) NULL,
	[Financier_National_Id] [nchar](30) NULL,
	[Financier_Address] [nvarchar](100) NULL,
	[Fk_District_Code] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Transaction_Value] [decimal](38, 2) NULL,
	[Transaction_Net] [decimal](38, 2) NULL,
	[Opponent_Percentage] [decimal](38, 2) NULL,
	[Collected_Money] [decimal](38, 2) NULL,
	[Fk_Currency_Id] [int] NULL,
 CONSTRAINT [PK_InCorrectCapitalGains45] PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncorrectDistributionsGains42_44]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncorrectDistributionsGains42_44](
	[Transaction_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Tax_Year] [nchar](10) NULL,
	[Financier_UniqueTaxId] [nchar](30) NULL,
	[Financier_FileNumber] [nchar](30) NULL,
	[Financier_Name] [nvarchar](100) NULL,
	[Financier_National_Id] [nchar](30) NULL,
	[Financier_Address] [nvarchar](100) NULL,
	[Fk_District_Code] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Transaction_Value] [decimal](38, 2) NULL,
	[Transaction_Net] [decimal](38, 2) NULL,
	[Fk_Reserved_Id] [int] NULL,
	[Opponent_Percentage] [decimal](38, 2) NULL,
	[Collected_Money] [decimal](38, 2) NULL,
	[Fk_Currency_Id] [int] NULL,
	[Fk_GehaType_Id] [int] NULL,
	[Fk_RecoredType_Id] [int] NULL,
	[RecordDateYear] [nvarchar](50) NULL,
 CONSTRAINT [PK_IncorrectDistributionsGains42_44] PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncorrectTransactions]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncorrectTransactions](
	[Transaction_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Tax_Period] [nchar](10) NULL,
	[Tax_Year] [nchar](10) NULL,
	[Financier_UniqueTaxId] [nchar](30) NULL,
	[Financier_FileNumber] [nchar](30) NULL,
	[Financier_Name] [nvarchar](100) NULL,
	[Financier_National_Id] [nchar](30) NULL,
	[Financier_Address] [nvarchar](100) NULL,
	[Fk_District_Code] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Fk_TransactionType_Id] [int] NULL,
	[Transaction_Value] [decimal](38, 2) NULL,
	[Transaction_Net] [decimal](38, 2) NULL,
	[Fk_Opponent_Id] [int] NULL,
	[Opponent_Percentage] [decimal](38, 2) NULL,
	[Collected_Money] [decimal](38, 2) NULL,
	[Fk_Currency_Id] [int] NULL,
 CONSTRAINT [PK_IncorrectTransactions] PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncorrectTransactions46]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncorrectTransactions46](
	[Transaction_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Tax_Period] [nchar](10) NULL,
	[Tax_Year] [nchar](10) NULL,
	[Financier_UniqueTaxId] [nchar](30) NULL,
	[Financier_FileNumber] [nchar](30) NULL,
	[Financier_Name] [nvarchar](100) NULL,
	[Financier_National_Id] [nchar](30) NULL,
	[Financier_Address] [nvarchar](100) NULL,
	[Fk_District_Code] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Fk_TransactionType_Id] [int] NULL,
	[Transaction_Value] [decimal](38, 2) NULL,
	[Transaction_Net] [decimal](38, 2) NULL,
	[Fk_Opponent_Id] [int] NULL,
	[Opponent_Percentage] [decimal](38, 2) NULL,
	[Collected_Money] [decimal](38, 2) NULL,
	[Fk_Currency_Id] [int] NULL,
 CONSTRAINT [PK_IncorrectTransactions46] PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncorrectTransactions47]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncorrectTransactions47](
	[Transaction_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Tax_Period] [nchar](10) NULL,
	[Tax_Year] [nchar](10) NULL,
	[Financier_UniqueTaxId] [nchar](30) NULL,
	[Financier_FileNumber] [nchar](30) NULL,
	[Financier_Name] [nvarchar](100) NULL,
	[Financier_National_Id] [nchar](30) NULL,
	[Financier_Address] [nvarchar](100) NULL,
	[Fk_District_Code] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Fk_TransactionType_Id] [int] NULL,
	[Transaction_Value] [decimal](38, 2) NULL,
	[Transaction_Net] [decimal](38, 2) NULL,
	[Fk_Opponent_Id] [int] NULL,
	[Opponent_Percentage] [decimal](38, 2) NULL,
	[Collected_Money] [decimal](38, 2) NULL,
	[Fk_Currency_Id] [int] NULL,
 CONSTRAINT [PK_IncorrectTransactions47] PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LT_FawryStatus]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LT_FawryStatus](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_LT_FawryStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentMethod_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PaymentMethod_Descr] [nvarchar](100) NULL,
	[PaymentMethod_Table] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentMethod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordTypes42_44]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordTypes42_44](
	[Record_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Record_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_RecordTypes] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedRate42_44]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedRate42_44](
	[Reserved_Id] [int] NOT NULL,
	[Reserved_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReservedRate] PRIMARY KEY CLUSTERED 
(
	[Reserved_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Activity]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Activity](
	[Activity_Code] [char](3) NOT NULL,
	[Activity_Name] [varchar](40) NULL,
 CONSTRAINT [PK_igactivity] PRIMARY KEY CLUSTERED 
(
	[Activity_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxpayerCategories]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxpayerCategories](
	[Id] [int] NOT NULL,
	[Category_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaxpayerCategories_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_rep]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_rep](
	[id] [int] NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_test_rep] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions_PaymentMethod]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions_PaymentMethod](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Fk_TransactionData_Id] [uniqueidentifier] NULL,
	[Fk_PaymentMethod_Id] [int] NULL,
	[Payment_Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Transactions_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionsData]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionsData](
	[TransactionData_Id] [uniqueidentifier] NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Modification_Date] [datetime] NULL,
	[Tax_Period] [char](1) NULL,
	[Tax_Year] [char](4) NULL,
	[Total_Money] [decimal](38, 2) NULL,
	[Total_Taxes_Money] [decimal](35, 2) NULL,
	[Transaction_Details] [xml] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Closed] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Replicated] [bit] NULL,
 CONSTRAINT [PK_TransactionsData] PRIMARY KEY CLUSTERED 
(
	[TransactionData_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionsData46]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionsData46](
	[TransactionData_Id] [uniqueidentifier] NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Modification_Date] [datetime] NULL,
	[Tax_Period] [char](1) NULL,
	[Tax_Year] [char](4) NULL,
	[Total_Money] [decimal](38, 2) NULL,
	[Total_Taxes_Money] [decimal](35, 2) NULL,
	[Transaction_Details] [xml] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Closed] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Replicated] [bit] NULL,
 CONSTRAINT [PK_TransactionsData46] PRIMARY KEY CLUSTERED 
(
	[TransactionData_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionsData47]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionsData47](
	[TransactionData_Id] [uniqueidentifier] NOT NULL,
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Creation_Date] [datetime] NULL,
	[Modification_Date] [datetime] NULL,
	[Tax_Period] [char](1) NULL,
	[Tax_Year] [char](4) NULL,
	[Total_Money] [decimal](38, 2) NULL,
	[Total_Taxes_Money] [decimal](35, 2) NULL,
	[Transaction_Details] [xml] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Closed] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Replicated] [bit] NULL,
 CONSTRAINT [PK_TransactionsData47] PRIMARY KEY CLUSTERED 
(
	[TransactionData_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionTypes]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTypes](
	[TransactionType_Id] [int] NOT NULL,
	[TransactionType_Name] [nvarchar](75) NULL,
	[TransactionPercentage] [int] NULL,
	[TransactionDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_TransactionTypes] PRIMARY KEY CLUSTERED 
(
	[TransactionType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithHoldingTypes]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithHoldingTypes](
	[Opponent_Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Opponent_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_WithHoldingTypes] PRIMARY KEY CLUSTERED 
(
	[Opponent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Taxpayer_Id]    Script Date: 9/12/2021 10:41:52 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Taxpayer_Id] ON [dbo].[TransactionsData]
(
	[Taxpayer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CashPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_CashPayment_CurrencyTypes] FOREIGN KEY([Fk_Currency_Id])
REFERENCES [dbo].[CurrencyTypes] ([Currency_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CashPayment] CHECK CONSTRAINT [FK_CashPayment_CurrencyTypes]
GO
ALTER TABLE [dbo].[ChequePayment]  WITH NOCHECK ADD  CONSTRAINT [FK_ChequePayment_CurrencyTypes] FOREIGN KEY([Fk_Currency_Id])
REFERENCES [dbo].[CurrencyTypes] ([Currency_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ChequePayment] CHECK CONSTRAINT [FK_ChequePayment_CurrencyTypes]
GO
ALTER TABLE [dbo].[ElectronicPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_ElectronicPayment_CurrencyTypes] FOREIGN KEY([Fk_Currency_Id])
REFERENCES [dbo].[CurrencyTypes] ([Currency_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ElectronicPayment] CHECK CONSTRAINT [FK_ElectronicPayment_CurrencyTypes]
GO
ALTER TABLE [dbo].[FawryPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FawryPayment_CurrencyTypes] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[CurrencyTypes] ([Currency_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FawryPayment] CHECK CONSTRAINT [FK_FawryPayment_CurrencyTypes]
GO
ALTER TABLE [dbo].[FawryPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FawryPayment_LT_FawryStatus] FOREIGN KEY([FawryStatusID])
REFERENCES [dbo].[LT_FawryStatus] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FawryPayment] CHECK CONSTRAINT [FK_FawryPayment_LT_FawryStatus]
GO
ALTER TABLE [dbo].[Geha]  WITH NOCHECK ADD  CONSTRAINT [FK_Geha_TaxpayerCategories] FOREIGN KEY([Fk_Taxpayer_Category_Id])
REFERENCES [dbo].[TaxpayerCategories] ([Id])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Geha] CHECK CONSTRAINT [FK_Geha_TaxpayerCategories]
GO
ALTER TABLE [dbo].[Transactions_PaymentMethod]  WITH NOCHECK ADD  CONSTRAINT [FK_Transactions_PaymentMethod_PaymentMethod] FOREIGN KEY([Fk_PaymentMethod_Id])
REFERENCES [dbo].[PaymentMethod] ([PaymentMethod_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Transactions_PaymentMethod] CHECK CONSTRAINT [FK_Transactions_PaymentMethod_PaymentMethod]
GO
ALTER TABLE [dbo].[Transactions_PaymentMethod]  WITH NOCHECK ADD  CONSTRAINT [FK_Transactions_PaymentMethod_TransactionsData] FOREIGN KEY([Fk_TransactionData_Id])
REFERENCES [dbo].[TransactionsData] ([TransactionData_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Transactions_PaymentMethod] CHECK CONSTRAINT [FK_Transactions_PaymentMethod_TransactionsData]
GO
ALTER TABLE [dbo].[TransactionsData]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionsData_Geha] FOREIGN KEY([Taxpayer_Id])
REFERENCES [dbo].[Geha] ([Taxpayer_Id])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionsData] CHECK CONSTRAINT [FK_TransactionsData_Geha]
GO
ALTER TABLE [dbo].[TransactionsData46]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionsData46_Geha] FOREIGN KEY([Taxpayer_Id])
REFERENCES [dbo].[Geha] ([Taxpayer_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionsData46] CHECK CONSTRAINT [FK_TransactionsData46_Geha]
GO
ALTER TABLE [dbo].[TransactionsData47]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionsData47_Geha] FOREIGN KEY([Taxpayer_Id])
REFERENCES [dbo].[Geha] ([Taxpayer_Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TransactionsData47] CHECK CONSTRAINT [FK_TransactionsData47_Geha]
GO
/****** Object:  StoredProcedure [dbo].[Get_AllYearTransactionsDeals]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Asmaa Gad Ali >
-- Create date: <Create Date,10-8-2015>
-- Description:	<Description,get the deals in whole year>
-- =============================================
CREATE PROCEDURE [dbo].[Get_AllYearTransactionsDeals]
( 
@Taxpayer_Id uniqueidentifier,
@Tax_Year nvarchar(10)
)
AS
BEGIN
select Transaction_Details 
from TransactionsData
where 
Tax_Year=@Tax_Year
and 
Taxpayer_Id=@Taxpayer_Id

END

GO
/****** Object:  StoredProcedure [dbo].[GetTransactions]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Asmaa Gad >
-- Create date: <Create Date,15-7-2015>
-- Description:	<Description,get transaction>
-- =============================================
CREATE PROCEDURE [dbo].[GetTransactions]
(
@OrganizationNumber nvarchar(10)
)
AS
BEGIN
Select TransactionDetails 
From TransactionsData
where 
[OrganizationNumber]=@OrganizationNumber
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Geha]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,asmaa gad ali >
-- Create date: <Create Date,30-7-2015>
-- Description:	<Description,insert  Geha >
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Geha]
(
       @Taxpayer_Id  uniqueidentifier
      ,@Geha_Code  nvarchar(9)
      ,@Unique_Tax_Id  nvarchar(9)
      ,@Geha_Name  nvarchar(100)
      ,@Geha_Address  nvarchar(100)
      ,@Geha_Email  nvarchar(50)
      ,@Geha_Telephone  nvarchar(20)
      ,@Geha_Fax  nvarchar(20)
      ,@Fk_Taxpayer_Category_Id  int
)
AS

BEGIN
insert into [dbo].[Geha]  
      ([Taxpayer_Id]
      ,[Geha_Code]
      ,[Unique_Tax_Id]
      ,[Geha_Name]
      ,[Geha_Address]
      ,[Geha_Email]
      ,[Geha_Telephone]
      ,[Geha_Fax]
      ,[Fk_Taxpayer_Category_Id])
	  values
	  ( @Taxpayer_Id  
      ,@Geha_Code  
      ,@Unique_Tax_Id  
      ,@Geha_Name  
      ,@Geha_Address  
      ,@Geha_Email  
      ,@Geha_Telephone  
      ,@Geha_Fax  
      ,@Fk_Taxpayer_Category_Id  
	  )
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRowSize]    Script Date: 9/12/2021 10:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetRowSize](@Tablename varchar(100),@pkcol varchar(100))
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود البنك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banks', @level2type=N'COLUMN',@level2name=N'Bank_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الفرع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banks', @level2type=N'COLUMN',@level2name=N'Bank_Branch_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الفرع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banks', @level2type=N'COLUMN',@level2name=N'Branch_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Tax_Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة المبلغ المدفوع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Paid_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ قسيمة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Payment_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم قسيمة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Receipt_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Tax_Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة المبلغ المدفوع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Paid_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ قسيمة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Payment_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الشيك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Cheque_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود البنك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Fk_Bank_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الفرع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Fk_Bank_Branch_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DistributionsGainsData42_44', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DistributionsGainsData42_44', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعاملات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DistributionsGainsData42_44', @level2type=N'COLUMN',@level2name=N'Total_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي المحصل لحساب الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DistributionsGainsData42_44', @level2type=N'COLUMN',@level2name=N'Total_Taxes_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم اخر تعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DistributionsGainsData42_44', @level2type=N'COLUMN',@level2name=N'Last_Transaction_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'غلق الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DistributionsGainsData42_44', @level2type=N'COLUMN',@level2name=N'Closed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ غلق الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DistributionsGainsData42_44', @level2type=N'COLUMN',@level2name=N'Closed_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Tax_Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة المبلغ المدفوع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Paid_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ المدفوعة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Payment_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم المدفوعة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Receipt_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي الموحد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Unique_Tax_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Geha_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Geha_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'البريد الإلكتروني' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Geha_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Geha_Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'فاكس' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Geha_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'فئـة الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geha', @level2type=N'COLUMN',@level2name=N'Fk_Taxpayer_Category_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي الموحد للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Financier_UniqueTaxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم ملف الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Financier_FileNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Financier_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Financier_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Financier_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمورية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Fk_District_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Transaction_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Transaction_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الصافية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Transaction_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains43', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي الموحد للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Financier_UniqueTaxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم ملف الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Financier_FileNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Financier_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Financier_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Financier_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمورية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Fk_District_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Transaction_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Transaction_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الصافية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Transaction_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Opponent_Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'المحصل لحساب الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Collected_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InCorrectCapitalGains45', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي الموحد للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Financier_UniqueTaxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم ملف الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Financier_FileNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Financier_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Financier_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Financier_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمورية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Fk_District_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Transaction_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Transaction_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الصافية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Transaction_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Fk_Reserved_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Opponent_Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'المحصل لحساب الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Collected_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectDistributionsGains42_44', @level2type=N'COLUMN',@level2name=N'Fk_GehaType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Tax_Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي الموحد للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Financier_UniqueTaxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم ملف الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Financier_FileNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Financier_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Financier_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Financier_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمورية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Fk_District_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Transaction_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'طبيعة التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Fk_TransactionType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Transaction_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الصافية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Transaction_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Fk_Opponent_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Opponent_Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'المحصل لحساب الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Collected_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Tax_Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي الموحد للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Financier_UniqueTaxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم ملف الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Financier_FileNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Financier_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Financier_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Financier_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمورية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Fk_District_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Transaction_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'طبيعة التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Fk_TransactionType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Transaction_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الصافية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Transaction_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Fk_Opponent_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Opponent_Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'المحصل لحساب الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Collected_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions46', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Tax_Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي الموحد للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Financier_UniqueTaxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم ملف الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Financier_FileNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Financier_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Financier_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Financier_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمورية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Fk_District_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Transaction_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'طبيعة التعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Fk_TransactionType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Transaction_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الصافية للتعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Transaction_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Fk_Opponent_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Opponent_Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'المحصل لحساب الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Collected_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IncorrectTransactions47', @level2type=N'COLUMN',@level2name=N'Fk_Currency_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الجهـة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Geha_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Tax_Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Tax_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'القيمة الإجمالية للتعاملات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Total_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي المحصل لحساب الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Total_Taxes_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم اخر تعامل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Last_Transaction_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'غلق الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Closed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ غلق الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsData', @level2type=N'COLUMN',@level2name=N'Closed_Date'
GO
