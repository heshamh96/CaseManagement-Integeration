USE [PayrollTax_Flattened]
GO
/****** Object:  User [CLOUD\Excel_Admin3]    Script Date: 6/28/2022 7:37:10 PM ******/
CREATE USER [CLOUD\Excel_Admin3] FOR LOGIN [CLOUD\Excel_Admin3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CLOUD\Excel_Admin4]    Script Date: 6/28/2022 7:37:10 PM ******/
CREATE USER [CLOUD\Excel_Admin4] FOR LOGIN [CLOUD\Excel_Admin4] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin3]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin4]
GO
/****** Object:  Table [dbo].[Eight_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eight_Model](
	[activityCode] [nvarchar](3) NULL,
	[IsCSV] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsClosed] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[symbioticContributionDiff_21] [numeric](18, 2) NULL,
	[symbioticContributionPaid_20] [numeric](18, 2) NULL,
	[symbioticContributionPayable_19] [numeric](18, 2) NULL,
	[TaxDiffToPay_18] [numeric](18, 2) NULL,
	[PeriodtotalPaidTax_17] [numeric](18, 2) NULL,
	[PeriodtotalDeductionTax_16] [numeric](18, 2) NULL,
	[allEmploymentTax_15] [numeric](18, 2) NULL,
	[secondModelEmployment_PeriodTax_14] [numeric](18, 2) NULL,
	[thirdModelEmployment_PeriodTax_13] [numeric](18, 2) NULL,
	[originalEmployment_PeriodTax_12] [numeric](18, 2) NULL,
	[employmentTax_11] [numeric](18, 2) NULL,
	[annualBowl_10] [numeric](18, 2) NULL,
	[totalDeductions_9] [numeric](18, 2) NULL,
	[totalAccrual_8] [numeric](18, 2) NULL,
	[numOfWorkers_7] [int] NULL,
	[adjustmentYear_6] [smallint] NULL,
	[FacilityName] [nvarchar](100) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[ID] [uniqueidentifier] NULL,
	[SeriesNum_1] [bigint] NULL,
	[taxTreatment_2] [bigint] NULL,
	[employeeCode_3] [nvarchar](20) NULL,
	[insuranceNum_4] [nvarchar](36) NULL,
	[NID_5] [nvarchar](56) NULL,
	[passportNum_6] [nvarchar](16) NULL,
	[employeeName_7] [nvarchar](120) NULL,
	[employeeJob_8] [nvarchar](52) NULL,
	[employmentDuration_9] [bigint] NULL,
	[employmentSalary_10] [bigint] NULL,
	[supplementalSalary_11] [bigint] NULL,
	[periodicBonus_12] [bigint] NULL,
	[incentiveBonus_13] [bigint] NULL,
	[additionalSalary_14] [bigint] NULL,
	[salaryTax_15] [bigint] NULL,
	[entitlementExemptAmounts_16] [bigint] NULL,
	[total_17] [bigint] NULL,
	[InkindBenefits_18] [bigint] NULL,
	[serviceFees_19] [bigint] NULL,
	[entitlementEmployeeShareInProfit_20] [bigint] NULL,
	[totalAccrual_21] [bigint] NULL,
	[deductionExemptAmounts_22] [bigint] NULL,
	[personalExemption_23] [bigint] NULL,
	[employeeShareInInsurance_24] [bigint] NULL,
	[installments_25] [bigint] NULL,
	[employeeShareInInsuranceSub_26] [bigint] NULL,
	[deductionEmployeeShareInProfit_27] [bigint] NULL,
	[relativeImprint_28] [bigint] NULL,
	[totalExemption_29] [bigint] NULL,
	[netProfit_30] [bigint] NULL,
	[insuranceSubs_31] [bigint] NULL,
	[insuranceInstallments_32] [bigint] NULL,
	[exemptAmountsFromSub_33] [float] NULL,
	[periodBowl_34] [float] NULL,
	[yearlyBowl_35] [float] NULL,
	[yearlyTax_36] [bigint] NULL,
	[periodTax_37] [bigint] NULL,
	[deductedTax_38] [bigint] NULL,
	[paidTax_39] [bigint] NULL,
	[diff1_40] [bigint] NULL,
	[symbioticContribution_41] [bigint] NULL,
	[symbioticContributionPaid_42] [bigint] NULL,
	[diff2_43] [bigint] NULL,
	[martyrBoxContribution_44] [bigint] NULL,
	[martyrBoxContributionPaid_45] [bigint] NULL,
	[diff3_46] [bigint] NULL,
	[gehaName_47] [nvarchar](124) NULL,
	[FileName] [nvarchar](96) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fifth_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fifth_Model](
	[FifthModelID] [uniqueidentifier] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[PaymentMethodID] [tinyint] NULL,
	[DifferenceTaxDues] [numeric](15, 2) NULL,
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
	[TotalReceivedSalary] [numeric](15, 2) NULL,
	[TotalReceivedSalaryText] [nvarchar](100) NULL,
	[TaxDues] [numeric](15, 2) NULL,
	[TaxOffice] [nvarchar](50) NULL,
	[TaxYear] [int] NULL,
	[PassportNumber] [nvarchar](20) NULL,
	[TaxDuesText] [nvarchar](100) NULL,
	[IsClosed] [bit] NULL,
	[Mosahma] [numeric](15, 2) NULL,
	[MosahmaShohadaa] [numeric](15, 2) NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[SymbioticContribution] [numeric](18, 2) NULL,
	[ReceivableSignature] [nvarchar](150) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[First_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[First_Model](
	[FirstModelID] [uniqueidentifier] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[TaxYear] [int] NULL,
	[TaxMonth] [tinyint] NULL,
	[PaymentMethodID] [tinyint] NULL,
	[DifferenceTaxDues] [numeric](15, 2) NULL,
	[PaymentText] [nvarchar](100) NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[TaxDifferences] [numeric](15, 2) NULL,
	[IsClosed] [bit] NULL,
	[Mosahma] [numeric](15, 2) NULL,
	[MosahmaShohadaa] [numeric](15, 2) NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fourth_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fourth_Model](
	[ModelID] [uniqueidentifier] NULL,
	[AudityType] [tinyint] NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[FacilityName] [nvarchar](250) NULL,
	[TaxPeriod] [tinyint] NULL,
	[TotalCountOfEgyEmployees] [int] NULL,
	[TotalCountOfForeignEmployees] [int] NULL,
	[TotalPeriodSalaries] [numeric](15, 2) NULL,
	[TotalBasicSalaries] [numeric](15, 2) NULL,
	[TotalVariableSalaries] [numeric](15, 2) NULL,
	[TotalEmploymentSalary] [numeric](15, 2) NULL,
	[TotalComplementrySalary] [numeric](15, 2) NULL,
	[TotalCutTax] [numeric](15, 2) NULL,
	[TotalPayedTax] [numeric](15, 2) NULL,
	[TaxYear] [smallint] NULL,
	[TaxOnSalaries] [numeric](15, 2) NULL,
	[ChiefsSalariesAndRewards] [numeric](15, 2) NULL,
	[EgyWorkersSalaries] [numeric](15, 2) NULL,
	[LentEmployeesSalaries] [numeric](15, 2) NULL,
	[ForeignEmployeesSalaries] [numeric](15, 2) NULL,
	[AllowanceAmount] [numeric](15, 2) NULL,
	[RewardsAmount] [numeric](15, 2) NULL,
	[FundsFromFriendlyCompanies] [numeric](15, 2) NULL,
	[FundsToFriendlyCompanies] [numeric](15, 2) NULL,
	[AnotherEntityFunds] [numeric](15, 2) NULL,
	[CashBenefits] [numeric](15, 2) NULL,
	[QuotaFromProfit] [numeric](15, 2) NULL,
	[SeverancePay] [numeric](15, 2) NULL,
	[FundsForVacationsBalance] [numeric](15, 2) NULL,
	[Fee12Service] [numeric](15, 2) NULL,
	[EntityBenefitsInKind] [numeric](15, 2) NULL,
	[EntityShareInInsurance] [numeric](15, 2) NULL,
	[EmploymentWage] [numeric](15, 2) NULL,
	[ComplementryWage] [numeric](15, 2) NULL,
	[AuditeesAnotherFunds] [numeric](15, 2) NULL,
	[AuditeesShareInInsurance] [numeric](15, 2) NULL,
	[AuditeesBenefits] [numeric](15, 2) NULL,
	[PaymentMethod] [int] NULL,
	[PaymentText] [nvarchar](100) NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsClosed] [bit] NULL,
	[Total_47] [numeric](15, 2) NULL,
	[Total_48] [numeric](15, 2) NULL,
	[Total_49] [numeric](15, 2) NULL,
	[Total_50] [numeric](15, 2) NULL,
	[Total_51] [numeric](15, 2) NULL,
	[Total_52] [numeric](15, 2) NULL,
	[ActivityCode] [nvarchar](50) NULL,
	[Mosahma] [numeric](15, 2) NULL,
	[MosahmaShohadaa] [numeric](15, 2) NULL,
	[AttachedLink] [nvarchar](max) NULL,
	[GehaKind] [nvarchar](50) NULL,
	[IsSend] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsNew] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fourth_Model_Data_Details]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fourth_Model_Data_Details](
	[ForthModelDetailsID] [nvarchar](1000) NULL,
	[EmployeeCode] [nvarchar](1000) NULL,
	[NationalID] [nvarchar](1000) NULL,
	[InsuranceNumber] [nvarchar](1000) NULL,
	[EmployeeName] [nvarchar](1000) NULL,
	[EmployeeTitle] [nvarchar](1000) NULL,
	[WorkPeriod] [nvarchar](1000) NULL,
	[BasicSalary] [nvarchar](1000) NULL,
	[SpecialBonus] [nvarchar](1000) NULL,
	[SpecialBonusTill2013] [nvarchar](1000) NULL,
	[SpecialBonusAfter2013] [nvarchar](1000) NULL,
	[Rewards] [nvarchar](1000) NULL,
	[Allowance] [nvarchar](1000) NULL,
	[InsuranceCost] [nvarchar](1000) NULL,
	[OtherAdvantages] [nvarchar](1000) NULL,
	[ShareAdvantages] [nvarchar](1000) NULL,
	[ServiceCharge] [nvarchar](1000) NULL,
	[PaymentsSpentByLaw] [nvarchar](1000) NULL,
	[Profits] [nvarchar](1000) NULL,
	[TotalIncome] [nvarchar](1000) NULL,
	[SpecialRewards] [nvarchar](1000) NULL,
	[ExemptFunds] [nvarchar](1000) NULL,
	[ExemptSpecialBonusTill2013] [nvarchar](1000) NULL,
	[PersonalExempt] [nvarchar](1000) NULL,
	[SocialInsurance] [nvarchar](1000) NULL,
	[PreviousInsurancePeriod] [nvarchar](1000) NULL,
	[InsuranceContribution] [nvarchar](1000) NULL,
	[Exemptions] [nvarchar](1000) NULL,
	[Win] [nvarchar](1000) NULL,
	[NetIncome] [nvarchar](1000) NULL,
	[PeriodContainer] [nvarchar](1000) NULL,
	[ExemptCategory] [nvarchar](1000) NULL,
	[AnnualContainer] [nvarchar](1000) NULL,
	[ANNUALTax] [nvarchar](1000) NULL,
	[PeriodTax] [nvarchar](1000) NULL,
	[TaxDiscount] [nvarchar](1000) NULL,
	[TaxDue] [nvarchar](1000) NULL,
	[PaidTax] [nvarchar](1000) NULL,
	[InterruptedTax] [nvarchar](1000) NULL,
	[Difference] [nvarchar](1000) NULL,
	[GehaName] [nvarchar](1000) NULL,
	[FileName] [nvarchar](1000) NULL,
	[Sharing] [nvarchar](1000) NULL,
	[SharingPaid] [nvarchar](1000) NULL,
	[Difference2] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fourth_Model_Data_Details_Second_Period]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fourth_Model_Data_Details_Second_Period](
	[ForthModelDetailsID] [nvarchar](1000) NULL,
	[EmployeeCode] [nvarchar](1000) NULL,
	[NationalID] [nvarchar](1000) NULL,
	[InsuranceNumber] [nvarchar](1000) NULL,
	[EmployeeName] [nvarchar](1000) NULL,
	[EmployeeTitle] [nvarchar](1000) NULL,
	[WorkPeriod] [nvarchar](1000) NULL,
	[BasicSalary] [nvarchar](1000) NULL,
	[SpecialBonus] [nvarchar](1000) NULL,
	[SpecialBonusTill2013] [nvarchar](1000) NULL,
	[SpecialBonusAfter2013] [nvarchar](1000) NULL,
	[Rewards] [nvarchar](1000) NULL,
	[CashBenefits] [nvarchar](1000) NULL,
	[Allowance] [nvarchar](1000) NULL,
	[InsuranceCost] [nvarchar](1000) NULL,
	[OtherAdvantages] [nvarchar](1000) NULL,
	[ShareAdvantages] [nvarchar](1000) NULL,
	[ServiceCharge] [nvarchar](1000) NULL,
	[PaymentsSpentByLaw] [nvarchar](1000) NULL,
	[Profits] [nvarchar](1000) NULL,
	[TotalIncome] [nvarchar](1000) NULL,
	[SpecialRewards] [nvarchar](1000) NULL,
	[ExemptFunds] [nvarchar](1000) NULL,
	[ExemptSpecialBonusTill2013] [nvarchar](1000) NULL,
	[PersonalExempt] [nvarchar](1000) NULL,
	[SocialInsurance] [nvarchar](1000) NULL,
	[PreviousInsurancePeriod] [nvarchar](1000) NULL,
	[InsuranceContribution] [nvarchar](1000) NULL,
	[Exemptions] [nvarchar](1000) NULL,
	[Win] [nvarchar](1000) NULL,
	[NetIncome] [nvarchar](1000) NULL,
	[PeriodContainer] [nvarchar](1000) NULL,
	[ExemptCategory] [nvarchar](1000) NULL,
	[AnnualContainer] [nvarchar](1000) NULL,
	[ANNUALTax] [nvarchar](1000) NULL,
	[PeriodTax] [nvarchar](1000) NULL,
	[TaxDiscount] [nvarchar](1000) NULL,
	[TaxDue] [nvarchar](1000) NULL,
	[PaidTax] [nvarchar](1000) NULL,
	[InterruptedTax] [nvarchar](1000) NULL,
	[Difference] [nvarchar](1000) NULL,
	[GehaName] [nvarchar](1000) NULL,
	[FileName] [nvarchar](1000) NULL,
	[Sharing] [nvarchar](1000) NULL,
	[SharingPaid] [nvarchar](1000) NULL,
	[Difference2] [nvarchar](1000) NULL,
	[Derived Column 1] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fourth_Model_SubData_Details]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fourth_Model_SubData_Details](
	[IsNew] [bit] NULL,
	[WorkerCount_FourthModel_SubDataDetails] [int] NULL,
	[PayDate_FourthModel_SubDataDetails] [datetime] NULL,
	[ElectronicCode_FourthModel_SubDataDetails] [varchar](20) NULL,
	[TaxValue_FourthModel_SubDataDetails] [numeric](15, 2) NULL,
	[TotalAmountOfSalaries_FourthModel_SubDataDetails] [numeric](15, 2) NULL,
	[MonthID_FourthModel_SubDataDetails] [tinyint] NULL,
	[SubDataPeriod] [tinyint] NULL,
	[ModelID] [uniqueidentifier] NULL,
	[SubDataID] [uniqueidentifier] NULL,
	[MonthID] [nvarchar](1000) NULL,
	[TotalAmountOfSalaries] [nvarchar](1000) NULL,
	[TaxValue] [nvarchar](1000) NULL,
	[ElectronicCode] [nvarchar](1000) NULL,
	[PayDate] [nvarchar](1000) NULL,
	[WorkerCount] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Second_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Second_Model](
	[IsNew] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[MosahmaShohadaa] [numeric](15, 2) NULL,
	[Mosahma] [numeric](15, 2) NULL,
	[IsClosed] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[PaymentDate] [datetime] NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentText] [nvarchar](100) NULL,
	[DifferenceTaxDues] [numeric](15, 2) NULL,
	[PaymentMethodID] [tinyint] NULL,
	[TaxMonth] [tinyint] NULL,
	[TaxYear] [int] NULL,
	[FacilityName] [nvarchar](1000) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[SecondModelID] [uniqueidentifier] NULL,
	[SecondModelDetailsID] [nvarchar](1000) NULL,
	[EmployeeName] [nvarchar](1000) NULL,
	[NationalID] [nvarchar](1000) NULL,
	[InsuranceNumber] [nvarchar](1000) NULL,
	[TotalPaidMoney] [nvarchar](1000) NULL,
	[TotalTaxDue10Percent] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seventh_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seventh_Model](
	[IsCSV] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsClosed] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[diffrenceContributionTaxMustPaid_21] [numeric](18, 2) NULL,
	[totalPaidContributionTax_20] [numeric](18, 2) NULL,
	[totalPayableContributionTax_19] [numeric](18, 2) NULL,
	[diffrenceTaxMustPaid_18] [numeric](18, 2) NULL,
	[totalPaidTax_17] [numeric](18, 2) NULL,
	[totalDeductionTax_16] [numeric](18, 2) NULL,
	[totalKindWorkerTax_15] [numeric](18, 2) NULL,
	[workerTaxWithModel2_14] [numeric](18, 2) NULL,
	[workerTaxWithModel3_13] [numeric](18, 2) NULL,
	[workerTaxOriginals_12] [numeric](18, 2) NULL,
	[workerTaxWithCode_11] [numeric](18, 2) NULL,
	[annualVolumn_10] [numeric](18, 2) NULL,
	[totalDeductions_9] [numeric](18, 2) NULL,
	[totalYearAccrual_8] [numeric](18, 2) NULL,
	[numberOfEmployees_7] [int] NULL,
	[activityCode] [nvarchar](10) NULL,
	[FacilityName] [nvarchar](100) NULL,
	[TaxYear] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[ID] [uniqueidentifier] NULL,
	[SevenModelDetailsID] [nvarchar](1000) NULL,
	[SeriesNum_1] [nvarchar](1000) NULL,
	[taxDeal_2] [nvarchar](1000) NULL,
	[employeeCode_3] [nvarchar](1000) NULL,
	[insuranceNum_4] [nvarchar](1000) NULL,
	[NationalID_5] [nvarchar](1000) NULL,
	[passportID_6] [nvarchar](1000) NULL,
	[employeeName_7] [nvarchar](1000) NULL,
	[job_8] [nvarchar](1000) NULL,
	[jobPeriod_9] [nvarchar](1000) NULL,
	[basicSalary_10] [nvarchar](1000) NULL,
	[specialBonusTO2013_11] [nvarchar](1000) NULL,
	[specialBonusAfter2013_12] [nvarchar](1000) NULL,
	[salaryTax_13] [nvarchar](1000) NULL,
	[exemptAmountsWithSpecialLaw_14] [nvarchar](1000) NULL,
	[total_15] [nvarchar](1000) NULL,
	[benifits_16] [nvarchar](1000) NULL,
	[tips_17] [nvarchar](1000) NULL,
	[employeesShareProfits_18] [nvarchar](1000) NULL,
	[totalDeserves_19] [nvarchar](1000) NULL,
	[specialBouns_20] [nvarchar](1000) NULL,
	[exemptAmountsWithSpecialLaw_21] [nvarchar](1000) NULL,
	[personalExempt_22] [nvarchar](1000) NULL,
	[employeesShareProfitsWithEnsurrance_23] [nvarchar](1000) NULL,
	[ensurrancePastPerioud_24] [nvarchar](1000) NULL,
	[employeesShareProfitsWithHealthyEnsurrance_25] [nvarchar](1000) NULL,
	[employeesShareProfits_26] [nvarchar](1000) NULL,
	[relativeImprint_27] [nvarchar](1000) NULL,
	[totalExempt_28] [nvarchar](1000) NULL,
	[netRevenue_29] [nvarchar](1000) NULL,
	[subscriptions_30] [nvarchar](1000) NULL,
	[insurancePremiums_31] [nvarchar](1000) NULL,
	[moneyExemptValuesFromSubscriptions_32] [nvarchar](1000) NULL,
	[perioudVolumn_33] [nvarchar](1000) NULL,
	[annualVolumn_34] [nvarchar](1000) NULL,
	[annualTax_35] [nvarchar](1000) NULL,
	[deservedTax_36] [nvarchar](1000) NULL,
	[cutTax_37] [nvarchar](1000) NULL,
	[paidTax_38] [nvarchar](1000) NULL,
	[diffrences1_39] [nvarchar](1000) NULL,
	[shares_40] [nvarchar](1000) NULL,
	[paidShares_41] [nvarchar](1000) NULL,
	[diffrences2_42] [nvarchar](1000) NULL,
	[contributionMartyrsFamilies_43] [nvarchar](1000) NULL,
	[paidContributionMartyrsFamilies_44] [nvarchar](1000) NULL,
	[diffrences3_45] [nvarchar](1000) NULL,
	[GehaName_46] [nvarchar](1000) NULL,
	[FileName] [nvarchar](1000) NULL,
	[Derived Column 1] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sixth_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sixth_Model](
	[IsCSVData] [bit] NULL,
	[TaxPayerName_22] [nvarchar](150) NULL,
	[NumberOfEmloyees_7] [int] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsClosed] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[TotalSymbioticContributionToBePaid_21] [numeric](18, 2) NULL,
	[TotalSymbioticContributionPaid_20] [numeric](18, 2) NULL,
	[TotalSymbioticContributionDue_19] [numeric](18, 2) NULL,
	[TaxDifferences_18] [numeric](18, 2) NULL,
	[TotalPaidTax_17] [numeric](18, 2) NULL,
	[TotalWithholdingTax_16] [numeric](18, 2) NULL,
	[TotalTaxPayableForAllEmploymentTypes_15] [numeric](18, 2) NULL,
	[TaxPayableForModel2Labor_14] [numeric](18, 2) NULL,
	[TaxPayableForModel3Labor_13] [numeric](18, 2) NULL,
	[TaxPayableForMainLabor_12] [numeric](18, 2) NULL,
	[TaxDueWithCodeEmployment1And3_11] [numeric](18, 2) NULL,
	[AnnualTaxBase_10] [numeric](18, 2) NULL,
	[TotalDeductions_9] [numeric](18, 2) NULL,
	[TotalGenralBenfit_8] [numeric](18, 2) NULL,
	[SettlementYear_6] [int] NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[SixthModelID] [uniqueidentifier] NULL,
	[EmployeeCode_3] [nvarchar](1000) NULL,
	[InsuranceNo_4] [nvarchar](1000) NULL,
	[NationalId_5] [nvarchar](1000) NULL,
	[PassportNo_6] [nvarchar](1000) NULL,
	[EmployeeName_7] [nvarchar](1000) NULL,
	[Job_8] [nvarchar](1000) NULL,
	[WorkDuration_9] [nvarchar](1000) NULL,
	[BasicSalary_10] [nvarchar](1000) NULL,
	[SpecialBonusBefore2013_11] [nvarchar](1000) NULL,
	[SpecialBonusAfter2013_12] [nvarchar](1000) NULL,
	[ExemptAmount_13] [nvarchar](1000) NULL,
	[SalaryTax_14] [nvarchar](1000) NULL,
	[TotalColnsSumFrom10To14_15] [nvarchar](1000) NULL,
	[InKindBenfits_16] [nvarchar](1000) NULL,
	[FeesAndTipsAmount_17] [nvarchar](1000) NULL,
	[EmployeesShareOfProfit_18] [nvarchar](1000) NULL,
	[TotalsBenfits_19] [nvarchar](1000) NULL,
	[SpecialBonusUntil2013_20] [nvarchar](1000) NULL,
	[AmountsExemptedBySpecialLaws_21] [nvarchar](1000) NULL,
	[PersonalExemption_22] [nvarchar](1000) NULL,
	[WorkerShareInSocialInsurance_23] [nvarchar](1000) NULL,
	[PreviousInsurancePeriod_24] [nvarchar](1000) NULL,
	[WorkerShareInhealthInsurance_25] [nvarchar](1000) NULL,
	[EmployeeProfitShare_26] [nvarchar](1000) NULL,
	[TotalExemptionsAccordingToArticle13_27] [nvarchar](1000) NULL,
	[TempNetIncome_28] [nvarchar](1000) NULL,
	[InsuranceFundSubscription_29] [nvarchar](1000) NULL,
	[InsurancePremiumsAccordingToClause4_30] [nvarchar](1000) NULL,
	[ExemptionAmount_31] [nvarchar](1000) NULL,
	[PeriodBowl_32] [nvarchar](1000) NULL,
	[AnnualBowl_33] [nvarchar](1000) NULL,
	[AnnualTax_34] [nvarchar](1000) NULL,
	[TaxDue_35] [nvarchar](1000) NULL,
	[WithholdingTax_36] [nvarchar](1000) NULL,
	[PaidTax_37] [nvarchar](1000) NULL,
	[Differences1_38] [nvarchar](1000) NULL,
	[TakafulContribution_39] [nvarchar](1000) NULL,
	[PiadTakafulContribution_40] [nvarchar](1000) NULL,
	[Differences2_41] [nvarchar](1000) NULL,
	[ContributionToMartyrsFamilies_42] [nvarchar](1000) NULL,
	[PaidContributionToMartyrsFamilies_43] [nvarchar](1000) NULL,
	[Differences3_44] [nvarchar](1000) NULL,
	[GehaName_45] [nvarchar](1000) NULL,
	[TaxTreatMent_2] [nvarchar](1000) NULL,
	[SeriesNum_1] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Third_Model]    Script Date: 6/28/2022 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Third_Model](
	[IsCSV] [bit] NULL,
	[IsNew] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[ActivityCode] [nvarchar](3) NULL,
	[MosahmaShohadaa] [numeric](15, 2) NULL,
	[Mosahma] [numeric](15, 2) NULL,
	[IsClosed] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[PostOffice_Bank] [nvarchar](50) NULL,
	[PaymentDate] [datetime] NULL,
	[ReceiptNumber] [varchar](20) NULL,
	[PaymentText] [nvarchar](100) NULL,
	[DifferenceTaxDues] [numeric](15, 2) NULL,
	[PaymentMethodID] [int] NULL,
	[TaxYear] [int] NULL,
	[TotalDifferenceTaxDues] [numeric](15, 2) NULL,
	[TotalAnnualPaidTax] [numeric](15, 2) NULL,
	[TotalAnnualTaxDue] [numeric](15, 2) NULL,
	[TotalAnnualIncom] [numeric](15, 2) NULL,
	[NumberOfEmloyees] [int] NULL,
	[FacilityName] [nvarchar](1000) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[ThirdModelID] [uniqueidentifier] NULL,
	[ThirdModelDetailsID] [nvarchar](1000) NULL,
	[EmployeeName] [nvarchar](1000) NULL,
	[NationalID] [nvarchar](1000) NULL,
	[InsuranceNumber] [nvarchar](1000) NULL,
	[TotalPaidMoney] [nvarchar](1000) NULL,
	[TotalTaxDue] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
