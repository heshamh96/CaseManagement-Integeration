USE [PayrollTax]
GO
/****** Object:  Schema [EFINANCE\Amr_AAbouZaid]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Amr_AAbouZaid]
GO
/****** Object:  Schema [EFINANCE\Eslam_Eldeeb]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Eslam_Eldeeb]
GO
/****** Object:  Schema [EFINANCE\Fouad_ElWakil]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Fouad_ElWakil]
GO
/****** Object:  Schema [EFINANCE\hossam_elgoly]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\hossam_elgoly]
GO
/****** Object:  Schema [EFINANCE\hossam_houssien]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\hossam_houssien]
GO
/****** Object:  Schema [EFINANCE\Mahmoud_Shaker]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Mahmoud_Shaker]
GO
/****** Object:  Schema [EFINANCE\Moamen_Abdelsalam]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Moamen_Abdelsalam]
GO
/****** Object:  Schema [EFINANCE\moataz_saad]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\moataz_saad]
GO
/****** Object:  Schema [EFINANCE\Mohamed_Adly]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Mohamed_Adly]
GO
/****** Object:  Schema [EFINANCE\Mohamed_Sobhi]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Mohamed_Sobhi]
GO
/****** Object:  Schema [EFINANCE\moustafa_awad]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\moustafa_awad]
GO
/****** Object:  Schema [EFINANCE\Moustafa_Naguib]    Script Date: 6/28/2022 7:47:03 PM ******/
CREATE SCHEMA [EFINANCE\Moustafa_Naguib]
GO
/****** Object:  Table [dbo].[AudityType]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AudityType](
	[ID] [tinyint] NOT NULL,
	[TypeDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_AudityType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashPayment]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPayment](
	[CashPaymentID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PaidMoney] [decimal](38, 2) NOT NULL,
	[RemainMoney] [decimal](38, 2) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[ReceiptNumber] [nvarchar](100) NULL,
	[Fk_CurrencyID] [int] NULL,
	[DeclarationId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CashPayment] PRIMARY KEY CLUSTERED 
(
	[CashPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChequePayment]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChequePayment](
	[ChequePaymentID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PaidMoney] [decimal](38, 2) NOT NULL,
	[RemainMoney] [decimal](38, 2) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[ChequeNumber] [nvarchar](100) NULL,
	[Fk_CurrencyID] [int] NOT NULL,
	[Fk_BankID] [int] NULL,
	[DeclarationId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EighthModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EighthModel](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](100) NULL,
	[adjustmentYear_6] [smallint] NULL,
	[numOfWorkers_7] [int] NULL,
	[totalAccrual_8] [decimal](18, 2) NULL,
	[totalDeductions_9] [decimal](18, 2) NULL,
	[annualBowl_10] [decimal](18, 2) NULL,
	[employmentTax_11] [decimal](18, 2) NULL,
	[originalEmployment_PeriodTax_12] [decimal](18, 2) NULL,
	[thirdModelEmployment_PeriodTax_13] [decimal](18, 2) NULL,
	[secondModelEmployment_PeriodTax_14] [decimal](18, 2) NULL,
	[allEmploymentTax_15] [decimal](18, 2) NULL,
	[PeriodtotalDeductionTax_16] [decimal](18, 2) NULL,
	[PeriodtotalPaidTax_17] [decimal](18, 2) NULL,
	[TaxDiffToPay_18] [decimal](18, 2) NULL,
	[symbioticContributionPayable_19] [decimal](18, 2) NULL,
	[symbioticContributionPaid_20] [decimal](18, 2) NULL,
	[symbioticContributionDiff_21] [decimal](18, 2) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsClosed] [bit] NULL,
	[EighthModelDetails] [ntext] NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsCSV] [bit] NULL,
	[activityCode] [nchar](3) NULL,
 CONSTRAINT [PK_DependentAdjustmentsModel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectronicPayment]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectronicPayment](
	[ElectronicPaymentID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PaidMoney] [decimal](38, 2) NULL,
	[RemainMoney] [decimal](38, 2) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[ReceiptNumber] [nvarchar](100) NULL,
	[Quarter] [int] NULL,
	[DeclarationId] [uniqueidentifier] NULL,
	[ModelType] [int] NOT NULL,
	[PaymentType] [int] NULL,
 CONSTRAINT [PK_ElectronicPayment] PRIMARY KEY CLUSTERED 
(
	[ElectronicPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FifthModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FifthModel](
	[FifthModelID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[PaymentMethodID] [tinyint] NULL,
	[DifferenceTaxDues] [decimal](15, 2) NULL,
	[PaymentText] [nvarchar](100) NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Job] [nvarchar](50) NULL,
	[NationalID] [nvarchar](14) NULL,
	[Address] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[TotalReceivedSalary] [decimal](15, 2) NULL,
	[TotalReceivedSalaryText] [nvarchar](100) NULL,
	[TaxDues] [decimal](15, 2) NULL,
	[TaxOffice] [nvarchar](50) NULL,
	[TaxYear] [int] NULL,
	[PassportNumber] [nvarchar](20) NULL,
	[TaxDuesText] [nvarchar](100) NULL,
	[IsClosed] [bit] NOT NULL,
	[Mosahma] [decimal](15, 2) NULL,
	[MosahmaShohadaa] [decimal](15, 2) NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[SymbioticContribution] [decimal](18, 2) NULL,
	[ReceivableSignature] [nvarchar](150) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL,
 CONSTRAINT [PK_FifthModel] PRIMARY KEY CLUSTERED 
(
	[FifthModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirstModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirstModel](
	[FirstModelID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[TaxYear] [int] NULL,
	[TaxMonth] [tinyint] NULL,
	[PaymentMethodID] [tinyint] NULL,
	[DifferenceTaxDues] [decimal](15, 2) NULL,
	[PaymentText] [nvarchar](100) NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[TaxDifferences] [decimal](15, 2) NULL,
	[IsClosed] [bit] NOT NULL,
	[Mosahma] [decimal](15, 2) NULL,
	[MosahmaShohadaa] [decimal](15, 2) NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL,
 CONSTRAINT [PK_FirstModel] PRIMARY KEY CLUSTERED 
(
	[FirstModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForthModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForthModel](
	[ModelID] [uniqueidentifier] NOT NULL,
	[AudityType] [tinyint] NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[TaxPeriod] [tinyint] NULL,
	[TotalCountOfEgyEmployees] [int] NULL,
	[TotalCountOfForeignEmployees] [int] NULL,
	[TotalPeriodSalaries] [decimal](15, 2) NULL,
	[TotalBasicSalaries] [decimal](15, 2) NULL,
	[TotalVariableSalaries] [decimal](15, 2) NULL,
	[TotalEmploymentSalary] [decimal](15, 2) NULL,
	[TotalComplementrySalary] [decimal](15, 2) NULL,
	[TotalCutTax] [decimal](15, 2) NULL,
	[TotalPayedTax] [decimal](15, 2) NULL,
	[TaxYear] [smallint] NULL,
	[TaxOnSalaries] [decimal](15, 2) NULL,
	[ChiefsSalariesAndRewards] [decimal](15, 2) NULL,
	[EgyWorkersSalaries] [decimal](15, 2) NULL,
	[LentEmployeesSalaries] [decimal](15, 2) NULL,
	[ForeignEmployeesSalaries] [decimal](15, 2) NULL,
	[AllowanceAmount] [decimal](15, 2) NULL,
	[RewardsAmount] [decimal](15, 2) NULL,
	[FundsFromFriendlyCompanies] [decimal](15, 2) NULL,
	[FundsToFriendlyCompanies] [decimal](15, 2) NULL,
	[AnotherEntityFunds] [decimal](15, 2) NULL,
	[CashBenefits] [decimal](15, 2) NULL,
	[QuotaFromProfit] [decimal](15, 2) NULL,
	[SeverancePay] [decimal](15, 2) NULL,
	[FundsForVacationsBalance] [decimal](15, 2) NULL,
	[Fee12Service] [decimal](15, 2) NULL,
	[EntityBenefitsInKind] [decimal](15, 2) NULL,
	[EntityShareInInsurance] [decimal](15, 2) NULL,
	[EmploymentWage] [decimal](15, 2) NULL,
	[ComplementryWage] [decimal](15, 2) NULL,
	[AuditeesAnotherFunds] [decimal](15, 2) NULL,
	[AuditeesShareInInsurance] [decimal](15, 2) NULL,
	[AuditeesBenefits] [decimal](15, 2) NULL,
	[DataDetails] [ntext] NULL,
	[PaymentMethod] [int] NULL,
	[PaymentText] [nvarchar](100) NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsClosed] [bit] NOT NULL,
	[Total_47] [decimal](15, 2) NULL,
	[Total_48] [decimal](15, 2) NULL,
	[Total_49] [decimal](15, 2) NULL,
	[Total_50] [decimal](15, 2) NULL,
	[Total_51] [decimal](15, 2) NULL,
	[Total_52] [decimal](15, 2) NULL,
	[ActivityCode] [nvarchar](50) NULL,
	[DataDetailsSecondPeriod] [ntext] NULL,
	[Mosahma] [decimal](15, 2) NULL,
	[MosahmaShohadaa] [decimal](15, 2) NULL,
	[AttachedLink] [nvarchar](max) NULL,
	[GehaKind] [nvarchar](50) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL,
 CONSTRAINT [PK_ForthModel] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForthModelSubDataDetails]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForthModelSubDataDetails](
	[SubDataID] [uniqueidentifier] NOT NULL,
	[ModelID] [uniqueidentifier] NULL,
	[SubDataPeriod] [tinyint] NULL,
	[MonthID] [tinyint] NULL,
	[TotalAmountOfSalaries] [decimal](15, 2) NULL,
	[TaxValue] [decimal](15, 2) NULL,
	[ElectronicCode] [varchar](20) NULL,
	[PayDate] [datetime] NULL,
	[WorkerCount] [int] NULL,
	[DataDetails] [ntext] NULL,
	[IsNew] [bit] NULL,
 CONSTRAINT [PK_ForthModelSubDataDetails] PRIMARY KEY CLUSTERED 
(
	[SubDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpPaymentMethod]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpPaymentMethod](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
	[NameEN] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpPaymentMethod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpenModelRequest]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenModelRequest](
	[RequestId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UniqueTaxPayerId] [nchar](9) NOT NULL,
	[TaxpayerName] [nvarchar](100) NOT NULL,
	[ModelNumber] [int] NOT NULL,
	[ModelYear] [int] NOT NULL,
	[ModelPeriod] [tinyint] NULL,
	[Reason] [nvarchar](250) NULL,
	[StatusId] [tinyint] NULL,
	[ModelId] [uniqueidentifier] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedByName] [nvarchar](max) NULL,
 CONSTRAINT [PK_OpenModelRequest] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpenModelRequestLookup]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenModelRequestLookup](
	[StatusId] [tinyint] NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_OpenModelRequestLookup] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondModel](
	[SecondModelID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[TaxYear] [int] NULL,
	[TaxMonth] [tinyint] NULL,
	[SecondModelDetails] [ntext] NULL,
	[PaymentMethodID] [tinyint] NULL,
	[DifferenceTaxDues] [decimal](15, 2) NULL,
	[PaymentText] [nvarchar](100) NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsClosed] [bit] NOT NULL,
	[Mosahma] [decimal](15, 2) NULL,
	[MosahmaShohadaa] [decimal](15, 2) NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL,
 CONSTRAINT [PK_SecondModel] PRIMARY KEY CLUSTERED 
(
	[SecondModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SevenModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SevenModel](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[TaxYear] [int] NULL,
	[FacilityName] [nvarchar](100) NULL,
	[activityCode] [nvarchar](10) NULL,
	[numberOfEmployees_7] [int] NULL,
	[totalYearAccrual_8] [decimal](18, 2) NULL,
	[totalDeductions_9] [decimal](18, 2) NULL,
	[annualVolumn_10] [decimal](18, 2) NULL,
	[workerTaxWithCode_11] [decimal](18, 2) NULL,
	[workerTaxOriginals_12] [decimal](18, 2) NULL,
	[workerTaxWithModel3_13] [decimal](18, 2) NULL,
	[workerTaxWithModel2_14] [decimal](18, 2) NULL,
	[totalKindWorkerTax_15] [decimal](18, 2) NULL,
	[totalDeductionTax_16] [decimal](18, 2) NULL,
	[totalPaidTax_17] [decimal](18, 2) NULL,
	[diffrenceTaxMustPaid_18] [decimal](18, 2) NULL,
	[totalPayableContributionTax_19] [decimal](18, 2) NULL,
	[totalPaidContributionTax_20] [decimal](18, 2) NULL,
	[diffrenceContributionTaxMustPaid_21] [decimal](18, 2) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsClosed] [bit] NULL,
	[SevenModelCSVDetails] [ntext] NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsCSV] [bit] NULL,
 CONSTRAINT [PK_SevenModel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SixthModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SixthModel](
	[SixthModelID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NOT NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[SettlementYear_6] [int] NULL,
	[TotalGenralBenfit_8] [decimal](18, 2) NULL,
	[TotalDeductions_9] [decimal](18, 2) NULL,
	[AnnualTaxBase_10] [decimal](18, 2) NULL,
	[TaxDueWithCodeEmployment1And3_11] [decimal](18, 2) NULL,
	[TaxPayableForMainLabor_12] [decimal](18, 2) NULL,
	[TaxPayableForModel3Labor_13] [decimal](18, 2) NULL,
	[TaxPayableForModel2Labor_14] [decimal](18, 2) NULL,
	[TotalTaxPayableForAllEmploymentTypes_15] [decimal](18, 2) NULL,
	[TotalWithholdingTax_16] [decimal](18, 2) NULL,
	[TotalPaidTax_17] [decimal](18, 2) NULL,
	[TaxDifferences_18] [decimal](18, 2) NULL,
	[TotalSymbioticContributionDue_19] [decimal](18, 2) NULL,
	[TotalSymbioticContributionPaid_20] [decimal](18, 2) NULL,
	[TotalSymbioticContributionToBePaid_21] [decimal](18, 2) NULL,
	[SixthModelDetails] [ntext] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsClosed] [bit] NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[NumberOfEmloyees_7] [int] NULL,
	[TaxPayerName_22] [nvarchar](150) NULL,
	[IsCSVData] [bit] NULL,
 CONSTRAINT [PK_SixthModel_1] PRIMARY KEY CLUSTERED 
(
	[SixthModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThirdModel]    Script Date: 6/28/2022 7:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdModel](
	[ThirdModelID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[NumberOfEmloyees] [int] NULL,
	[TotalAnnualIncom] [decimal](15, 2) NULL,
	[TotalAnnualTaxDue] [decimal](15, 2) NULL,
	[TotalAnnualPaidTax] [decimal](15, 2) NULL,
	[TotalDifferenceTaxDues] [decimal](15, 2) NULL,
	[TaxYear] [int] NULL,
	[ThirdModelDetails] [ntext] NULL,
	[PaymentMethodID] [int] NULL,
	[DifferenceTaxDues] [decimal](15, 2) NULL,
	[PaymentText] [nvarchar](100) NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsClosed] [bit] NOT NULL,
	[Mosahma] [decimal](15, 2) NULL,
	[MosahmaShohadaa] [decimal](15, 2) NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL,
	[IsCSV] [bit] NULL,
 CONSTRAINT [PK_ThirdModel] PRIMARY KEY CLUSTERED 
(
	[ThirdModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FifthModel] ADD  CONSTRAINT [DF_FifthModel_IsClosed]  DEFAULT ((0)) FOR [IsClosed]
GO
ALTER TABLE [dbo].[FirstModel] ADD  CONSTRAINT [DF_FirstModel_IsClosed]  DEFAULT ((0)) FOR [IsClosed]
GO
ALTER TABLE [dbo].[ForthModel] ADD  CONSTRAINT [DF_ForthModel_IsClosed]  DEFAULT ((0)) FOR [IsClosed]
GO
ALTER TABLE [dbo].[OpenModelRequest] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[SecondModel] ADD  CONSTRAINT [DF_SecondModel_IsClosed]  DEFAULT ((0)) FOR [IsClosed]
GO
ALTER TABLE [dbo].[ThirdModel] ADD  CONSTRAINT [DF_ThirdModel_IsClosed]  DEFAULT ((0)) FOR [IsClosed]
GO
ALTER TABLE [dbo].[ForthModel]  WITH CHECK ADD  CONSTRAINT [FK_ForthModel_AudityType] FOREIGN KEY([AudityType])
REFERENCES [dbo].[AudityType] ([ID])
GO
ALTER TABLE [dbo].[ForthModel] CHECK CONSTRAINT [FK_ForthModel_AudityType]
GO
ALTER TABLE [dbo].[ForthModel]  WITH CHECK ADD  CONSTRAINT [FK_ForthModel_LkpPaymentMethod] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[LkpPaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[ForthModel] CHECK CONSTRAINT [FK_ForthModel_LkpPaymentMethod]
GO
ALTER TABLE [dbo].[ForthModelSubDataDetails]  WITH CHECK ADD  CONSTRAINT [FK_ForthModelSubDataDetails_ForthModel] FOREIGN KEY([ModelID])
REFERENCES [dbo].[ForthModel] ([ModelID])
GO
ALTER TABLE [dbo].[ForthModelSubDataDetails] CHECK CONSTRAINT [FK_ForthModelSubDataDetails_ForthModel]
GO
ALTER TABLE [dbo].[OpenModelRequest]  WITH CHECK ADD  CONSTRAINT [FK_OpenModelRequest_OpenModelRequestLookup_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OpenModelRequestLookup] ([StatusId])
GO
ALTER TABLE [dbo].[OpenModelRequest] CHECK CONSTRAINT [FK_OpenModelRequest_OpenModelRequestLookup_StatusId]
GO
ALTER TABLE [dbo].[ThirdModel]  WITH CHECK ADD  CONSTRAINT [FK_ThirdModel_LkpPaymentMethod] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[LkpPaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[ThirdModel] CHECK CONSTRAINT [FK_ThirdModel_LkpPaymentMethod]
GO
ALTER TABLE [dbo].[ForthModelSubDataDetails]  WITH CHECK ADD  CONSTRAINT [chk_month] CHECK  (([MonthID]=(12) OR [MonthID]=(11) OR [MonthID]=(10) OR [MonthID]=(9) OR [MonthID]=(8) OR [MonthID]=(7) OR [MonthID]=(6) OR [MonthID]=(5) OR [MonthID]=(4) OR [MonthID]=(3) OR [MonthID]=(2) OR [MonthID]=(1)))
GO
ALTER TABLE [dbo].[ForthModelSubDataDetails] CHECK CONSTRAINT [chk_month]
GO
ALTER TABLE [dbo].[ForthModelSubDataDetails]  WITH CHECK ADD  CONSTRAINT [chk_period] CHECK  (([SubDataPeriod]=(4) OR [SubDataPeriod]=(3) OR [SubDataPeriod]=(2) OR [SubDataPeriod]=(1)))
GO
ALTER TABLE [dbo].[ForthModelSubDataDetails] CHECK CONSTRAINT [chk_period]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة المبلغ المدفوع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'PaidMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ قسيمة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'PaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم قسيمة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'ReceiptNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashPayment', @level2type=N'COLUMN',@level2name=N'Fk_CurrencyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة المبلغ المدفوع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'PaidMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ قسيمة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'PaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الشيك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'ChequeNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع عملة السداد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Fk_CurrencyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود البنك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChequePayment', @level2type=N'COLUMN',@level2name=N'Fk_BankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'السنة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة المبلغ المدفوع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'PaidMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ المدفوعة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'PaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم المدفوعة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ElectronicPayment', @level2type=N'COLUMN',@level2name=N'ReceiptNumber'
GO
