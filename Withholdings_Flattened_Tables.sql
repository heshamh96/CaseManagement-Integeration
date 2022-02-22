USE [Withholdings_Flattened]
GO
/****** Object:  Table [dbo].[CashPayment]    Script Date: 9/12/2021 10:42:37 AM ******/
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
	[Namozag] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChequePayment]    Script Date: 9/12/2021 10:42:37 AM ******/
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
	[Namozag] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyTypes]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyTypes](
	[Currency_Id] [int] NOT NULL,
	[Currency_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectronicPayment]    Script Date: 9/12/2021 10:42:37 AM ******/
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
	[Namozag] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gehat_5asm_w_Ta7seel]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehat_5asm_w_Ta7seel](
	[Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Geha_Code] [nchar](9) NULL,
	[Unique_Tax_Id] [nchar](9) NULL,
	[Geha_Name] [nvarchar](100) NULL,
	[Geha_Address] [nvarchar](100) NULL,
	[Geha_Email] [nvarchar](50) NULL,
	[Geha_Telephone] [nchar](20) NULL,
	[Geha_Fax] [nchar](20) NULL,
	[Fk_Taxpayer_Category_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GehaType]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GehaType](
	[GehaTypeId] [int] NOT NULL,
	[GehaTypeName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Namozag_41]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Namozag_41](
	[Replicated] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Closed] [bit] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Total_Taxes_Money] [numeric](35, 2) NULL,
	[Total_Money] [numeric](38, 2) NULL,
	[Tax_Year] [varchar](4) NULL,
	[Tax_Period] [varchar](1) NULL,
	[Modification_Date] [datetime] NULL,
	[Creation_Date] [datetime] NULL,
	[Geha_Code] [nvarchar](9) NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[TransactionData_Id] [uniqueidentifier] NULL,
	[P_Transactions_@Period] [nvarchar](1000) NULL,
	[P_Transactions_@Year] [nvarchar](1000) NULL,
	[@IsAdded] [nvarchar](1000) NULL,
	[@TransactionDataId] [nvarchar](1000) NULL,
	[@TaxPayerId] [nvarchar](1000) NULL,
	[@GehaCode] [nvarchar](1000) NULL,
	[@TaxPeriod] [nvarchar](1000) NULL,
	[@TaxPeriodNamed] [nvarchar](1000) NULL,
	[@TaxYear] [nvarchar](1000) NULL,
	[@TransactionId] [nvarchar](1000) NULL,
	[@TransactionNumber] [nvarchar](1000) NULL,
	[@FinancierUniqueTaxId] [nvarchar](1000) NULL,
	[@FinancierFileNumber] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart1] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart2] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart3] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart4] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart5] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart6] [nvarchar](1000) NULL,
	[@FinancierName] [nvarchar](1000) NULL,
	[@FinancierAddress] [nvarchar](1000) NULL,
	[@TaxDistrictCode] [nvarchar](1000) NULL,
	[@TaxDistrictName] [nvarchar](1000) NULL,
	[@TransactionDate] [nvarchar](1000) NULL,
	[@TransactionDatestr] [nvarchar](1000) NULL,
	[@TransactionTypeId] [nvarchar](1000) NULL,
	[@TransactionType] [nvarchar](1000) NULL,
	[@TransactionDescription] [nvarchar](1000) NULL,
	[@TransactionPercentage] [nvarchar](1000) NULL,
	[@TransactionTotalValue] [nvarchar](1000) NULL,
	[@TotalValue] [nvarchar](1000) NULL,
	[@OpponentTypeId] [nvarchar](1000) NULL,
	[@OpponentType] [nvarchar](1000) NULL,
	[@TransactionNet] [nvarchar](1000) NULL,
	[@OpponentPercentage] [nvarchar](1000) NULL,
	[@CollectedMoney] [nvarchar](1000) NULL,
	[@TotalCollectedMoney] [nvarchar](1000) NULL,
	[@CurrencyId] [nvarchar](1000) NULL,
	[@CurrencyName] [nvarchar](1000) NULL,
	[@FinancierNationalId] [nvarchar](1000) NULL,
	[@SelcectedCurrencyType] [nvarchar](1000) NULL,
	[@TransactionCreationDate] [nvarchar](1000) NULL,
	[@TransactionModificationDate] [nvarchar](1000) NULL,
	[@Exemption41] [nvarchar](1000) NULL,
	[@AdvancedPayment] [nvarchar](1000) NULL,
	[@Exemption41Name] [nvarchar](1000) NULL,
	[@AdvancedPaymentName] [nvarchar](1000) NULL,
	[@TransactionDetails] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Namozag_42_44]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Namozag_42_44](
	[P_Transactions_@Year] [nvarchar](1000) NULL,
	[@IsAdded] [nvarchar](1000) NULL,
	[@TransactionDataId] [nvarchar](1000) NULL,
	[@TaxPayerId] [nvarchar](1000) NULL,
	[@GehaCode] [nvarchar](1000) NULL,
	[@TaxYear] [nvarchar](1000) NULL,
	[@TransactionId] [nvarchar](1000) NULL,
	[@TransactionNumber] [nvarchar](1000) NULL,
	[@FinancierUniqueTaxId] [nvarchar](1000) NULL,
	[@FinancierFileNumber] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart1] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart2] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart3] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart4] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart5] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart6] [nvarchar](1000) NULL,
	[@FinancierName] [nvarchar](1000) NULL,
	[@FinancierAddress] [nvarchar](1000) NULL,
	[@TaxDistrictCode] [nvarchar](1000) NULL,
	[@TaxDistrictName] [nvarchar](1000) NULL,
	[@TransactionDate] [nvarchar](1000) NULL,
	[@TransactionDatestr] [nvarchar](1000) NULL,
	[@TransactionTotalValue] [nvarchar](1000) NULL,
	[@TotalValue] [nvarchar](1000) NULL,
	[@OpponentPercentage] [nvarchar](1000) NULL,
	[@CollectedMoney] [nvarchar](1000) NULL,
	[@CurrencyId] [nvarchar](1000) NULL,
	[@CurrencyName] [nvarchar](1000) NULL,
	[@FinancierNationalId] [nvarchar](1000) NULL,
	[@IsLegalNatural] [nvarchar](1000) NULL,
	[@SelcectedCurrencyType] [nvarchar](1000) NULL,
	[@TransactionCreationDate] [nvarchar](1000) NULL,
	[@TransactionModificationDate] [nvarchar](1000) NULL,
	[@RecordYear] [nvarchar](1000) NULL,
	[@RecordDate] [nvarchar](1000) NULL,
	[@TransactionNet] [nvarchar](1000) NULL,
	[@ContributionRatio] [nvarchar](1000) NULL,
	[@GehaTypeId] [nvarchar](1000) NULL,
	[@GehaTypeName] [nvarchar](1000) NULL,
	[@ReservedRateId] [nvarchar](1000) NULL,
	[@ReservedRateName] [nvarchar](1000) NULL,
	[@RecordTypeId] [nvarchar](1000) NULL,
	[@RecordTypeName] [nvarchar](1000) NULL,
	[@Exemption] [nvarchar](1000) NULL,
	[@ExemptionUrl] [nvarchar](1000) NULL,
	[@TransactionDetails] [nvarchar](1000) NULL,
	[@SelectedDate] [nvarchar](1000) NULL,
	[@SelectedRecord] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Namozag_43]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Namozag_43](
	[Replicated] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Closed] [bit] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Total_Money] [numeric](38, 2) NULL,
	[Tax_Year] [varchar](4) NULL,
	[Modification_Date] [datetime] NULL,
	[Creation_Date] [datetime] NULL,
	[Geha_Code] [nvarchar](9) NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[TransactionData_Id] [uniqueidentifier] NULL,
	[P_Transactions_@Year] [bigint] NULL,
	[@IsAdded] [nvarchar](80) NULL,
	[@TransactionDataId] [nvarchar](144) NULL,
	[@TaxPayerId] [nvarchar](144) NULL,
	[@GehaCode] [bigint] NULL,
	[@TaxYear] [bigint] NULL,
	[@TransactionId] [bigint] NULL,
	[@TransactionNumber] [bigint] NULL,
	[@FinancierUniqueTaxId] [bigint] NULL,
	[@FinancierFileNumber] [bigint] NULL,
	[@FinancierFileNumberLPart1] [bigint] NULL,
	[@FinancierFileNumberLPart2] [bigint] NULL,
	[@FinancierFileNumberLPart3] [bigint] NULL,
	[@FinancierFileNumberLPart4] [bigint] NULL,
	[@FinancierFileNumberLPart5] [bigint] NULL,
	[@FinancierFileNumberLPart6] [bigint] NULL,
	[@FinancierName] [nvarchar](96) NULL,
	[@FinancierAddress] [nvarchar](136) NULL,
	[@TaxDistrictCode] [bigint] NULL,
	[@TaxDistrictName] [nvarchar](100) NULL,
	[@TransactionDate] [datetime] NULL,
	[@TransactionDatestr] [nvarchar](80) NULL,
	[@TransactionTotalValue] [bigint] NULL,
	[@CurrencyId] [bigint] NULL,
	[@CurrencyName] [nvarchar](16) NULL,
	[@FinancierNationalId] [nvarchar](80) NULL,
	[@CodingNumber] [bigint] NULL,
	[@IsLegalNatural] [nvarchar](28) NULL,
	[@SelcectedCurrencyType] [bigint] NULL,
	[@TransactionCreationDate] [datetime] NULL,
	[@TransactionModificationDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Namozag_45]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Namozag_45](
	[Replicated] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Closed] [bit] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Total_Taxes_Money] [numeric](35, 2) NULL,
	[Total_Money] [numeric](38, 2) NULL,
	[Tax_Year] [varchar](4) NULL,
	[Modification_Date] [datetime] NULL,
	[Creation_Date] [datetime] NULL,
	[Geha_Code] [nvarchar](9) NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[TransactionData_Id] [uniqueidentifier] NULL,
	[P_Transactions_@Year] [bigint] NULL,
	[@IsAdded] [nvarchar](80) NULL,
	[@totalTax] [nvarchar](80) NULL,
	[@Transaction_Id] [nvarchar](144) NULL,
	[@TransactionDataId] [nvarchar](144) NULL,
	[@TaxPayerId] [nvarchar](144) NULL,
	[@GehaCode] [bigint] NULL,
	[@TaxYear] [bigint] NULL,
	[@TransactionId] [bigint] NULL,
	[@TransactionNumber] [bigint] NULL,
	[@FinancierUniqueTaxId] [nvarchar](80) NULL,
	[@FinancierFileNumber] [nvarchar](80) NULL,
	[@FinancierFileNumberLPart1] [nvarchar](80) NULL,
	[@FinancierFileNumberLPart2] [nvarchar](80) NULL,
	[@FinancierFileNumberLPart3] [nvarchar](80) NULL,
	[@FinancierFileNumberLPart4] [nvarchar](80) NULL,
	[@FinancierFileNumberLPart5] [nvarchar](80) NULL,
	[@FinancierFileNumberLPart6] [nvarchar](80) NULL,
	[@FinancierName] [nvarchar](96) NULL,
	[@FinancierAddress] [nvarchar](136) NULL,
	[@TaxDistrictCode] [nvarchar](80) NULL,
	[@TaxDistrictName] [nvarchar](100) NULL,
	[@TransactionDate] [datetime] NULL,
	[@TransactionDatestr] [nvarchar](80) NULL,
	[@TransactionTotalValue] [bigint] NULL,
	[@OpponentPercentage] [bigint] NULL,
	[@CollectedMoney] [float] NULL,
	[@CurrencyId] [bigint] NULL,
	[@CurrencyName] [nvarchar](16) NULL,
	[@FinancierNationalId] [nvarchar](80) NULL,
	[@CodingNumber] [bigint] NULL,
	[@IsLegalNatural] [nvarchar](56) NULL,
	[@SelcectedCurrencyType] [bigint] NULL,
	[@TransactionCreationDate] [datetime] NULL,
	[@TransactionModificationDate] [datetime] NULL,
	[@Closed] [nvarchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Namozag_46]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Namozag_46](
	[Replicated] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Closed] [bit] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Total_Taxes_Money] [numeric](35, 2) NULL,
	[Total_Money] [numeric](38, 2) NULL,
	[Tax_Year] [varchar](4) NULL,
	[Tax_Period] [varchar](1) NULL,
	[Modification_Date] [datetime] NULL,
	[Creation_Date] [datetime] NULL,
	[Geha_Code] [nvarchar](9) NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[TransactionData_Id] [uniqueidentifier] NULL,
	[P_Transactions_@Period] [nvarchar](1000) NULL,
	[P_Transactions_@Year] [nvarchar](1000) NULL,
	[@TransactionDataId] [nvarchar](1000) NULL,
	[@TaxPayerId] [nvarchar](1000) NULL,
	[@GehaCode] [nvarchar](1000) NULL,
	[@TaxPeriod] [nvarchar](1000) NULL,
	[@TaxPeriodNamed] [nvarchar](1000) NULL,
	[@TaxYear] [nvarchar](1000) NULL,
	[@IsAdded] [nvarchar](1000) NULL,
	[@TransactionId] [nvarchar](1000) NULL,
	[@TransactionNumber] [nvarchar](1000) NULL,
	[@FinancierUniqueTaxId] [nvarchar](1000) NULL,
	[@FinancierFileNumber] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart1] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart2] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart3] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart4] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart5] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart6] [nvarchar](1000) NULL,
	[@FinancierName] [nvarchar](1000) NULL,
	[@FinancierAddress] [nvarchar](1000) NULL,
	[@TaxDistrictCode] [nvarchar](1000) NULL,
	[@TaxDistrictName] [nvarchar](1000) NULL,
	[@TransactionDate] [nvarchar](1000) NULL,
	[@TransactionDatestr] [nvarchar](1000) NULL,
	[@TransactionTypeId] [nvarchar](1000) NULL,
	[@TransactionType] [nvarchar](1000) NULL,
	[@TransactionDescription] [nvarchar](1000) NULL,
	[@TransactionPercentage] [nvarchar](1000) NULL,
	[@TransactionTotalValue] [nvarchar](1000) NULL,
	[@OpponentTypeId] [nvarchar](1000) NULL,
	[@OpponentType] [nvarchar](1000) NULL,
	[@TransactionNet] [nvarchar](1000) NULL,
	[@OpponentPercentage] [nvarchar](1000) NULL,
	[@CollectedMoney] [nvarchar](1000) NULL,
	[@CurrencyId] [nvarchar](1000) NULL,
	[@CurrencyName] [nvarchar](1000) NULL,
	[@FinancierNationalId] [nvarchar](1000) NULL,
	[@SelcectedCurrencyType] [nvarchar](1000) NULL,
	[@TransactionCreationDate] [nvarchar](1000) NULL,
	[@TransactionModificationDate] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Namozag_47]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Namozag_47](
	[Replicated] [bit] NULL,
	[Closed_Date] [datetime] NULL,
	[Closed] [bit] NULL,
	[Last_Transaction_Number] [int] NULL,
	[Total_Taxes_Money] [numeric](35, 2) NULL,
	[Total_Money] [numeric](38, 2) NULL,
	[Tax_Year] [varchar](4) NULL,
	[Tax_Period] [varchar](1) NULL,
	[Modification_Date] [datetime] NULL,
	[Creation_Date] [datetime] NULL,
	[Geha_Code] [nvarchar](9) NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[TransactionData_Id] [uniqueidentifier] NULL,
	[P_Transactions_@Period] [nvarchar](1000) NULL,
	[P_Transactions_@Year] [nvarchar](1000) NULL,
	[@TransactionDataId] [nvarchar](1000) NULL,
	[@TaxPayerId] [nvarchar](1000) NULL,
	[@GehaCode] [nvarchar](1000) NULL,
	[@TaxPeriod] [nvarchar](1000) NULL,
	[@TaxPeriodNamed] [nvarchar](1000) NULL,
	[@TaxYear] [nvarchar](1000) NULL,
	[@IsAdded] [nvarchar](1000) NULL,
	[@TransactionId] [nvarchar](1000) NULL,
	[@TransactionNumber] [nvarchar](1000) NULL,
	[@FinancierUniqueTaxId] [nvarchar](1000) NULL,
	[@FinancierFileNumber] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart1] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart2] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart3] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart4] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart5] [nvarchar](1000) NULL,
	[@FinancierFileNumberLPart6] [nvarchar](1000) NULL,
	[@FinancierName] [nvarchar](1000) NULL,
	[@FinancierAddress] [nvarchar](1000) NULL,
	[@TaxDistrictCode] [nvarchar](1000) NULL,
	[@TaxDistrictName] [nvarchar](1000) NULL,
	[@TransactionDate] [nvarchar](1000) NULL,
	[@TransactionDatestr] [nvarchar](1000) NULL,
	[@TransactionTypeId] [nvarchar](1000) NULL,
	[@TransactionType] [nvarchar](1000) NULL,
	[@TransactionTotalValue] [nvarchar](1000) NULL,
	[@OpponentTypeId] [nvarchar](1000) NULL,
	[@OpponentType] [nvarchar](1000) NULL,
	[@TransactionNet] [nvarchar](1000) NULL,
	[@OpponentPercentage] [nvarchar](1000) NULL,
	[@CollectedMoney] [nvarchar](1000) NULL,
	[@CurrencyId] [nvarchar](1000) NULL,
	[@CurrencyName] [nvarchar](1000) NULL,
	[@FinancierNationalId] [nvarchar](1000) NULL,
	[@SelcectedCurrencyType] [nvarchar](1000) NULL,
	[@TransactionCreationDate] [nvarchar](1000) NULL,
	[@TransactionModificationDate] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentMethod_Id] [int] NOT NULL,
	[PaymentMethod_Descr] [nvarchar](100) NULL,
	[PaymentMethod_Table] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordTypes42_44]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordTypes42_44](
	[Record_Id] [int] NOT NULL,
	[Record_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedRate42_44]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedRate42_44](
	[Reserved_Id] [int] NOT NULL,
	[Reserved_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxpayerCategories]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxpayerCategories](
	[Id] [int] NOT NULL,
	[Category_Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithHoldingTypes]    Script Date: 9/12/2021 10:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithHoldingTypes](
	[Opponent_Id] [int] NOT NULL,
	[Opponent_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
