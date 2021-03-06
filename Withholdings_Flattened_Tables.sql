USE [Withholdings_Flattened]
GO
/****** Object:  Table [dbo].[CashPayment]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[ChequePayment]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[ElectronicPayment]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  View [dbo].[all_payments]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [dbo].[all_payments] as --3shan ngeeb tafaseel l mdfo3at f namozag_41

--with all_batches as(
--select distinct TransactionData_Id,Creation_Date,Taxpayer_Id
--from [dbo].[Staging_Namozag_41])
--,

with all_Payments_unioned as(
select * from (
select ROW_NUMBER() over (partition by [Fk_TransactionData_Id] order by Payment_Date) as row_num  ,*
from(
select [Fk_TransactionData_Id],Payment_Date,Receipt_Number,1 as fk_payment_ID ,[Tax_Period],[Tax_Year] from [dbo].[CashPayment]

union 

select [Fk_TransactionData_Id],Payment_Date,[Cheque_Number],2 as fk_payment_ID,[Tax_Period], [Tax_Year]from [dbo].[ChequePayment]

union  

select [Fk_TransactionData_Id],Payment_Date,Receipt_Number,1 as fk_payment_ID,[Tax_Period],[Tax_Year] from [dbo].[ElectronicPayment]
) as unioned

) as numbered
where row_num=1
)

select * from
all_Payments_unioned
--all_Payments_aggregated a join all_Payments_unioned b on a.Fk_TransactionData_Id=b.Fk_TransactionData_Id and a.Receipt_Number=b.Receipt_Number
--GO

  --select p.Fk_TransactionData_Id,COUNT(p.Fk_TransactionData_Id)
  --from all_Payments_aggregated p
  --group by p.Fk_TransactionData_Id
  --order by COUNT(p.Fk_TransactionData_Id) desc

GO
/****** Object:  Table [dbo].[igdistrict]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[Namozag_41]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[Geha]    Script Date: 6/28/2022 7:35:44 PM ******/
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
	[Fk_Taxpayer_Category_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_41_Closed_initial_Load]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




















CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_41_Closed_initial_Load] as 

--with batch_in_day as (
--select ROW_NUMBER() over (partition by convert(date,[Creation_Date]) order by [Creation_Date]) as rn
--,* from(
--select distinct [Creation_Date],[Geha_Code]
--from [dbo].[Staging_Namozag_41]
--) as a 
--)


SELECT  --TOP (1000)
nmz.TransactionData_Id,
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno ,

	  --[Replicated]
      --,[Closed_Date]
      --,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
      try_cast(nmz.[Tax_Year] as char(4)) as kst_year 

      ,try_cast(nmz.[Tax_Period]as char(1)) as bat_prd
      --,[Modification_Date]
      ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	  ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	  ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	  ,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  ,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[Taxpayer_Id]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
      ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
      ,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      ,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
      ,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      ,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      --,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      --,[@FinancierNationalId] 
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(nmz.[@FinancierFileNumber],10,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	,case 
      when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM [dbo].Namozag_41 nmz with(nolock)
left join [dbo].[igdistrict] dist with(nolock) on substring(nmz.[@FinancierFileNumber],1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join [dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.Taxpayer_Id 
left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id 
where geha.Unique_Tax_Id!='561964467'
and nmz.Closed=1



--and pay.Tax_Year=nmz.[Tax_Year]  and pay.Tax_Period=nmz.[Tax_Period]
			--and convert(date,nmz.Creation_Date)=convert(date,pay.Payment_Date)
			--and convert(date,nmz.Modification_Date)=convert(date,pay.Payment_Date)
			--and convert(date,nmz.Closed_Date)=convert(date,pay.Payment_Date)--and nmz.Taxpayer_Id=pay.Taxpayer_Id
 --left join [dbo].[Igactivity] act with(nolock) on substring(nmz.[@FinancierFileNumber],10,3)=act.act_acode
-- where substring(nmz.[@FinancierFileNumberLPart4],1,1) != '' and substring(nmz.[@FinancierFileNumberLPart4],1,1) is not null
--where nmz.[Geha_Code] is not null
--where nmz.TransactionData_Id='A638634C-3AD9-4B61-A0AB-D0F24693A3BE'
GO
/****** Object:  Table [dbo].[Namozag_47]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_47]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_47] as
SELECT  --TOP (1000)
nmz.TransactionData_Id,
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno 

	  --[Replicated]
      ,[Closed_Date]
      ,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
      ,try_cast(nmz.[Tax_Year] as char(4)) as kst_year 

      ,try_cast(nmz.[Tax_Period]as char(1)) as bat_prd
      --,[Modification_Date]
     -- ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	 -- ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	 -- ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	  ,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  --,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[Taxpayer_Id]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
	  ,[@FinancierName] as TaxPayer_Name
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
	  ,[@TaxDistrictCode] AS DistCode
      ,[@TaxDistrictName] AS DistName
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      ,[@FinancierAddress] as kst_taxid_Addr
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
      ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
      --,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      ,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
     -- ,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      ,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      --,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      ,[@FinancierNationalId] as National_ID
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(nmz.[@FinancierFileNumber],10,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	--,case 
 --     when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	--  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	--  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM Withholdings_Flattened.[dbo].Namozag_47 nmz with(nolock)
left join Withholdings_Flattened.[dbo].[igdistrict] dist with(nolock) on substring(nmz.[@FinancierFileNumber],1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join Withholdings_Flattened.[dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.Taxpayer_Id
--left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id 
where geha.Unique_Tax_Id!='561964467'
--and nmz.Closed=1

GO
/****** Object:  Table [dbo].[Namozag_46]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_46]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_46] as
SELECT  --TOP (1000)
nmz.TransactionData_Id,
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno 

	  --[Replicated]
      ,[Closed_Date]
      ,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
     , try_cast(nmz.[Tax_Year] as char(4)) as kst_year 

      ,try_cast(nmz.[Tax_Period]as char(1)) as bat_prd
      --,[Modification_Date]
     -- ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	 -- ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	 -- ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	  ,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  --,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[Taxpayer_Id]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
	  ,taxpayers.Taxpayer_Name
	  --,[@FinancierName]
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
      ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
      --,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      ,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
     -- ,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      ,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      --,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      ,[@FinancierNationalId] as National_ID
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(nmz.[@FinancierFileNumber],10,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	--,case 
 --     when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	--  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	--  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM Withholdings_Flattened.[dbo].Namozag_46 nmz with(nolock)
left join Withholdings_Flattened.[dbo].[igdistrict] dist with(nolock) on substring(nmz.[@FinancierFileNumber],1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join Withholdings_Flattened.[dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.Taxpayer_Id
left join DWH_TAX.dbo.Dim_TaxPayers_Universe taxpayers on taxpayers.Unique_Tax_Id=nmz.[@FinancierUniqueTaxId]
--left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id 
where geha.Unique_Tax_Id!='561964467'
--and nmz.Closed=1

GO
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_41_Closed_Increment]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO























CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_41_Closed_Increment] as 

--with batch_in_day as (
--select ROW_NUMBER() over (partition by convert(date,[Creation_Date]) order by [Creation_Date]) as rn
--,* from(
--select distinct [Creation_Date],[Geha_Code]
--from [dbo].[Staging_Namozag_41]
--) as a 
--)


SELECT  --TOP (1000)
nmz.TransactionData_Id,
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno ,

	  --[Replicated]
      --,[Closed_Date]
      --,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
      try_cast(nmz.[Tax_Year] as char(4)) as kst_year 

      ,try_cast(nmz.[Tax_Period]as char(1)) as bat_prd
      --,[Modification_Date]
      ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	  ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	  ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	  ,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  ,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[Taxpayer_Id]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
      ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
      ,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      ,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
      ,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      ,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      --,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      --,[@FinancierNationalId] 
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(nmz.[@FinancierFileNumber],10,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	,case 
      when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM [dbo].Namozag_41 nmz with(nolock)
left join [dbo].[igdistrict] dist with(nolock) on substring(nmz.[@FinancierFileNumber],1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join [dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.Taxpayer_Id 
left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id 
where geha.Unique_Tax_Id!='561964467'
--and nmz.Closed=1
and (nmz.Closed =1 or nmz.Closed_Date is not null)
and nmz.TransactionData_Id not in
( select distinct TransactionData_Id from [Excel_Withholdings_Transations_Mapping].[dbo].[Excel_El_Masla7a_Mapped_Withholding_CLosed_NMZ_41]
)



--and pay.Tax_Year=nmz.[Tax_Year]  and pay.Tax_Period=nmz.[Tax_Period]
			--and convert(date,nmz.Creation_Date)=convert(date,pay.Payment_Date)
			--and convert(date,nmz.Modification_Date)=convert(date,pay.Payment_Date)
			--and convert(date,nmz.Closed_Date)=convert(date,pay.Payment_Date)--and nmz.Taxpayer_Id=pay.Taxpayer_Id
 --left join [dbo].[Igactivity] act with(nolock) on substring(nmz.[@FinancierFileNumber],10,3)=act.act_acode
-- where substring(nmz.[@FinancierFileNumberLPart4],1,1) != '' and substring(nmz.[@FinancierFileNumberLPart4],1,1) is not null
--where nmz.[Geha_Code] is not null
--where nmz.TransactionData_Id='A638634C-3AD9-4B61-A0AB-D0F24693A3BE'
GO
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_41_Not_Closed]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





















CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_41_Not_Closed] as 

--with batch_in_day as (
--select ROW_NUMBER() over (partition by convert(date,[Creation_Date]) order by [Creation_Date]) as rn
--,* from(
--select distinct [Creation_Date],[Geha_Code]
--from [dbo].[Staging_Namozag_41]
--) as a 
--)


SELECT  --TOP (1000)
nmz.TransactionData_Id,
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno ,

	  --[Replicated]
      --,[Closed_Date]
      --,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
      try_cast(nmz.[Tax_Year] as char(4)) as kst_year 

      ,try_cast(nmz.[Tax_Period]as char(1)) as bat_prd
      --,[Modification_Date]
      ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	  ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	  ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	  ,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  ,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[Taxpayer_Id]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
      ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
      ,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      ,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
      ,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      ,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      --,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      --,[@FinancierNationalId] 
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(nmz.[@FinancierFileNumber],10,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	,case 
      when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM [dbo].Namozag_41 nmz with(nolock)
left join [dbo].[igdistrict] dist with(nolock) on substring(nmz.[@FinancierFileNumber],1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join [dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.Taxpayer_Id 
left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id 
where geha.Unique_Tax_Id!='561964467'
and nmz.Closed=0



--and pay.Tax_Year=nmz.[Tax_Year]  and pay.Tax_Period=nmz.[Tax_Period]
			--and convert(date,nmz.Creation_Date)=convert(date,pay.Payment_Date)
			--and convert(date,nmz.Modification_Date)=convert(date,pay.Payment_Date)
			--and convert(date,nmz.Closed_Date)=convert(date,pay.Payment_Date)--and nmz.Taxpayer_Id=pay.Taxpayer_Id
 --left join [dbo].[Igactivity] act with(nolock) on substring(nmz.[@FinancierFileNumber],10,3)=act.act_acode
-- where substring(nmz.[@FinancierFileNumberLPart4],1,1) != '' and substring(nmz.[@FinancierFileNumberLPart4],1,1) is not null
--where nmz.[Geha_Code] is not null
--where nmz.TransactionData_Id='A638634C-3AD9-4B61-A0AB-D0F24693A3BE'
GO
/****** Object:  Table [dbo].[Namozag_42_44]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Namozag_42_44](
	[TransactionDate] [date] NULL,
	[RecordDate_Year] [nvarchar](50) NULL,
	[RecordTypeName] [nvarchar](50) NULL,
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
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_42_44]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_42_44] as
SELECT  --TOP (1000)
nmz.[@TransactionDataId],
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno 

	  --[Replicated]
      ,[Closed_Date]
      ,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
     , try_cast(nmz.[@TaxYear]  as char(4)) as kst_year 

      --,try_cast(nmz.[@TaxPeriod]as char(1)) as bat_prd
	 
      --,[Modification_Date]
     -- ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	 -- ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	 -- ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	 -- ,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  --,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[@TaxpayerId]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
	  ,taxpayers.Taxpayer_Name
	  --,[@FinancierName]
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
    --  ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
      --,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      ,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
     -- ,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      ,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      --,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      ,[@FinancierNationalId] as National_ID
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(nmz.[@FinancierFileNumber],10,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	--,case 
 --     when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	--  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	--  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM [Withholdings_Flattened].[dbo].[Namozag_42_44] nmz with(nolock)
left join [dbo].[igdistrict] dist with(nolock) on substring(nmz.[@FinancierFileNumber],1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join [dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.[@TaxPayerId]
left join DWH_TAX.dbo.Dim_TaxPayers_Universe taxpayers on taxpayers.Unique_Tax_Id=nmz.[@FinancierUniqueTaxId]
--left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id 
where geha.Unique_Tax_Id!='561964467'
--and nmz.Closed=1
GO
/****** Object:  Table [dbo].[Namozag_45]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_45_Closed_initial_Load]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_45_Closed_initial_Load] as 

SELECT  --TOP (1000)
nmz.TransactionData_Id,
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno 

	  --[Replicated]
      ,[Closed_Date]
      ,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
     , try_cast(nmz.[Tax_Year] as char(4)) as kst_year 

      --,try_cast(nmz.[Tax_Period]as char(1)) as bat_prd
      --,[Modification_Date]
      ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	  ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	  ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	 -- ,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  ,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[Taxpayer_Id]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
     -- ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
      --,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      --,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
      ,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      ,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      --,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      --,[@FinancierNationalId] 
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(nmz.[@FinancierFileNumber],10,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	--,case 
 --     when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	--  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	--  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM [dbo].Namozag_45 nmz with(nolock)
left join [dbo].[igdistrict] dist with(nolock) on substring(nmz.[@FinancierFileNumber],1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join [dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.Taxpayer_Id 
left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id 
where geha.Unique_Tax_Id!='561964467'
--and nmz.Closed=1
GO
/****** Object:  Table [dbo].[Namozag_43]    Script Date: 6/28/2022 7:35:44 PM ******/
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
	[@CodingNumber] [nvarchar](50) NULL,
	[@IsLegalNatural] [nvarchar](28) NULL,
	[@SelcectedCurrencyType] [bigint] NULL,
	[@TransactionCreationDate] [datetime] NULL,
	[@TransactionModificationDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EL_Masla7a_Mapping_Final_Namozag_43_Closed_initial_Load]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[EL_Masla7a_Mapping_Final_Namozag_43_Closed_initial_Load] as 

SELECT  --TOP (1000)
nmz.TransactionData_Id,
--nmz.[Creation_Date],
--try_cast(ROW_NUMBER()  over (partition by nmz.[TransactionData_Id] order by [@TransactionNumber] ) as char (5))as kst_lineno  ,
 try_cast('1' as char(4)) as kst_pageno 

	  --[Replicated]
      ,[Closed_Date]
      ,[Closed]
      --,[Last_Transaction_Number]
      --,[Total_Taxes_Money]
     -- ,[Total_Money]
     , try_cast(nmz.[Tax_Year] as char(4)) as kst_year 

     -- ,try_cast(nmz.[Tax_Period]as char(1)) as bat_prd
      --,[Modification_Date]
      ,pay.Payment_Date as kst_docdate  
	  ,try_cast('1' as char(4)) as kst_jul										--,convert(char(3),DATENAME(dayofyear, nmz.[Creation_Date])) as kst_jul 
	  ,try_cast('1' as char(4)) as kst_serl										--	, try_cast(cte.rn as char(3)) as  kst_serl 
      ,convert(varchar(9),geha.Unique_Tax_Id) as gha_num
	  ,convert(varchar(60),geha.Geha_Name) as gha_name
	  ,try_cast(pay.Receipt_Number as char(20)) as kst_docnum 
	  ,null as kst_docnum1
	  ,try_cast(pay.fk_payment_ID as char(5)) as kst_docnum2
      ,try_cast(geha.Fk_Taxpayer_Category_Id as char(1)) as kst_ghatype 
	  --,try_cast([@TransactionTypeId] as char(2)) as kst_dealtype 
	  --,try_cast([@CollectedMoney] as numeric) as kst_ksmval 
	  ,null as kst_ratflag 
	  ,null as kst_flag
	  ,null as kst_sysdate 
	  ,null as kst_ruid 
	  ,null as kst_rsysdate
	  ,null as kst_upuid 
	  ,null as kst_upsysdate 
	  ,null as flag

	  ,nmz.[Taxpayer_Id]                       
   --   ,[P_Transactions_@Period]
   --   ,[P_Transactions_@Year]
   --   ,[@IsAdded]
   --   ,[@TransactionDataId]
   --   ,[@TaxPayerId]
   --   ,[@GehaCode]
   --   ,[@TaxPeriod]
   --   ,[@TaxPeriodNamed]
   --   ,[@TaxYear]
   --   ,[@TransactionId]
--    ,try_cast([@TransactionNumber] as char(5)) as  kst_lineno
      ,convert(varchar(9),[@FinancierUniqueTaxId]) as kst_taxid 
      ,convert(varchar(16),[@FinancierFileNumber]) as kst_file  
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as datetime2) as kst_date 

      --,[@TransactionDatestr]
     -- ,convert(char,[@TransactionTypeId]) as kst_natcode 
	  
      --,[@TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as Decimal(18,2)) as kst_totval

      --,[@TotalValue]
     -- ,convert(char(1),[@OpponentTypeId]) as kst_ksmcode 

      --,[@OpponentType]
      --,try_cast([@TransactionNet] as Decimal(18,2)) as kst_netval 
      --,try_cast([@OpponentPercentage] as numeric) kst_prcnt
      --,try_cast([@CollectedMoney] as Decimal(18,2))as kst_taxval 
      ----,[@TotalCollectedMoney]
      ,convert(varchar(2),[@CurrencyId])  as kst_currency
      ,convert(varchar(8),[@CurrencyName]) as kst_uid
      --,[@FinancierNationalId] 
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
      --,[@TransactionModificationDate]
      --,[@Exemption41]
      --,[@AdvancedPayment]
      --,[@Exemption41Name]
      --,[@AdvancedPaymentName]
      --,[@TransactionDetails]
	,dist.Reg_Code as kst_reg 
	,substring(try_cast(nmz.[@FinancierFileNumber] as varchar),1,3) as kst_acttype
	--,act.act_acode as kst_acttype 
	,dist.bran_code as bat_branch


	--,case 
 --     when [@AdvancedPayment] ='True' and try_cast([@CollectedMoney] as numeric)=0 then N'دفعات مقدمة'
	--  when [@Exemption41] = 'True' and try_cast([@CollectedMoney] as numeric)=0 then N'أعفاء'
	--  else '' end as Zero_Tax_Cause


	, try_cast([@TransactionNumber] as char(5)) as  line_Number_Inside_Batch


	,cast (GetDate() as Date) as Insertion_Date

  FROM [dbo].Namozag_43 nmz with(nolock)
left join [dbo].[igdistrict] dist with(nolock) on substring(try_cast(nmz.[@FinancierFileNumber] as varchar),1,3) = dist.dis_code collate database_default
--left join batch_in_day cte on nmz.Creation_Date=cte.Creation_Date and nmz.Geha_Code=cte.Geha_Code
left join [dbo].[Geha] geha with(nolock) on geha.[Taxpayer_Id]=nmz.Taxpayer_Id 
left join [dbo].[all_payments] pay on nmz.TransactionData_Id=pay.Fk_TransactionData_Id
where geha.Unique_Tax_Id!='561964467'

GO
/****** Object:  Table [dbo].[Banks]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[Id] [int] NOT NULL,
	[Bank_Code] [nvarchar](50) NULL,
	[Bank_Branch_Code] [nvarchar](50) NULL,
	[Branch_Name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyTypes]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyTypes](
	[Currency_Id] [int] NOT NULL,
	[Currency_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictsDetails]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictsDetails](
	[District_Code] [int] NOT NULL,
	[District_Name] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FawryPayment]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[Gehat_5asm_w_Ta7seel]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[GehaType]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GehaType](
	[GehaTypeId] [int] NOT NULL,
	[GehaTypeName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncorrectTransactions]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncorrectTransactions](
	[Transaction_Id] [int] NOT NULL,
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
	[Fk_Currency_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LT_FawryStatus]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 6/28/2022 7:35:44 PM ******/
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
/****** Object:  Table [dbo].[RecordTypes42_44]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordTypes42_44](
	[Record_Id] [int] NOT NULL,
	[Record_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedRate42_44]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedRate42_44](
	[Reserved_Id] [int] NOT NULL,
	[Reserved_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxpayerCategories]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxpayerCategories](
	[Id] [int] NOT NULL,
	[Category_Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionTypes]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTypes](
	[TransactionType_Id] [int] NOT NULL,
	[TransactionType_Name] [nvarchar](75) NULL,
	[TransactionPercentage] [int] NULL,
	[TransactionDescription] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithHoldingTypes]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithHoldingTypes](
	[Opponent_Id] [int] NOT NULL,
	[Opponent_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FawryPayment]  WITH CHECK ADD  CONSTRAINT [FK_FawryPayment_LT_FawryStatus] FOREIGN KEY([FawryStatusID])
REFERENCES [dbo].[LT_FawryStatus] ([ID])
GO
ALTER TABLE [dbo].[FawryPayment] CHECK CONSTRAINT [FK_FawryPayment_LT_FawryStatus]
GO
/****** Object:  StoredProcedure [dbo].[Currency_Cleansing_NMZ_41]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [Currency_Id]
--      ,[Currency_Name]
--  FROM [Withholdings_Flattened].[dbo].[CurrencyTypes];

  -- select distinct [@CurrencyId] from Namozag_41

  /*SELECT [@CurrencyId], COUNT(*)
  FROM Namozag_41
  WHERE [@CurrencyId] NOT IN (1, 2, 3, 4, 5, 6, 7)
  GROUP BY [@CurrencyId]*/

  --SELECT  *
  --FROM Namozag_41
  --WHERE [@CurrencyId] = 0
  ----and [@CurrencyName] is null or [@CurrencyName] =''
  --and [@CurrencyName] <> 'جنيه'


  --select [@CurrencyId],[@CurrencyName] , count(*)
  --from Namozag_41
  --group by [@CurrencyId],[@CurrencyName] ;

CREATE procedure [dbo].[Currency_Cleansing_NMZ_41] as
update Namozag_41 
set [@CurrencyName]=N'جنيه'
where [@CurrencyName]='pound';

update Namozag_41 
set [@CurrencyId]=1
where [@CurrencyName]='جنيه';

update Namozag_41 
set [@CurrencyId]= 3
where [@CurrencyName]='استرلينى';

update Namozag_41 
set [@CurrencyId]= 6
where [@CurrencyName]='درهم';

update Namozag_41 
set [@CurrencyId]= 2
where [@CurrencyName]='دولار';

update Namozag_41 
set [@CurrencyId]= 5
where [@CurrencyName]='ريال';

update Namozag_41 
set [@CurrencyId]= 4
where [@CurrencyName]='يورو';

update Namozag_41 
set [@CurrencyId]= 1, [@CurrencyName] = 'جنيه'
where [@CurrencyName]='' AND [@CurrencyId] NOT IN (2, 3, 4, 5, 6, 7);

update nmz 
set nmz.[@TransactionTypeId]=lkp.TransactionType_Id
from Namozag_41 nmz join TransactionTypes lkp on nmz.[@TransactionType]=lkp.TransactionType_Name  
;
GO
/****** Object:  StoredProcedure [dbo].[Currency_Cleansing_NMZ_46]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [Currency_Id]
--      ,[Currency_Name]
--  FROM [Withholdings_Flattened].[dbo].[CurrencyTypes];

  -- select distinct [@CurrencyId] from Namozag_46

  /*SELECT [@CurrencyId], COUNT(*)
  FROM Namozag_46
  WHERE [@CurrencyId] NOT IN (1, 2, 3, 4, 5, 6, 7)
  GROUP BY [@CurrencyId]*/

  --SELECT  *
  --FROM Namozag_46
  --WHERE [@CurrencyId] = 0
  ----and [@CurrencyName] is null or [@CurrencyName] =''
  --and [@CurrencyName] <> 'جنيه'


  --select [@CurrencyId],[@CurrencyName] , count(*)
  --from Namozag_46
  --group by [@CurrencyId],[@CurrencyName] ;

CREATE procedure [dbo].[Currency_Cleansing_NMZ_46] as
update Namozag_46 
set [@CurrencyName]=N'جنيه'
where [@CurrencyName]='pound';

update Namozag_46 
set [@CurrencyId]=1
where [@CurrencyName]='جنيه';

update Namozag_46 
set [@CurrencyId]= 3
where [@CurrencyName]='استرلينى';

update Namozag_46 
set [@CurrencyId]= 6
where [@CurrencyName]='درهم';

update Namozag_46 
set [@CurrencyId]= 2
where [@CurrencyName]='دولار';

update Namozag_46 
set [@CurrencyId]= 5
where [@CurrencyName]='ريال';

update Namozag_46 
set [@CurrencyId]= 4
where [@CurrencyName]='يورو';

update Namozag_46 
set [@CurrencyId]= 1, [@CurrencyName] = 'جنيه'
where [@CurrencyName]='' AND [@CurrencyId] NOT IN (2, 3, 4, 5, 6, 7);

update nmz 
set nmz.[@TransactionTypeId]=lkp.TransactionType_Id
from Namozag_46 nmz join TransactionTypes lkp on nmz.[@TransactionType]=lkp.TransactionType_Name  

GO
/****** Object:  StoredProcedure [dbo].[Currency_Cleansing_NMZ_47]    Script Date: 6/28/2022 7:35:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [Currency_Id]
--      ,[Currency_Name]
--  FROM [Withholdings_Flattened].[dbo].[CurrencyTypes];

  -- select distinct [@CurrencyId] from Namozag_47

  /*SELECT [@CurrencyId], COUNT(*)
  FROM Namozag_47
  WHERE [@CurrencyId] NOT IN (1, 2, 3, 4, 5, 6, 7)
  GROUP BY [@CurrencyId]*/

  --SELECT  *
  --FROM Namozag_47
  --WHERE [@CurrencyId] = 0
  ----and [@CurrencyName] is null or [@CurrencyName] =''
  --and [@CurrencyName] <> 'جنيه'


  --select [@CurrencyId],[@CurrencyName] , count(*)
  --from Namozag_47
  --group by [@CurrencyId],[@CurrencyName] ;

CREATE procedure [dbo].[Currency_Cleansing_NMZ_47] as
update Namozag_47 
set [@CurrencyName]=N'جنيه'
where [@CurrencyName]='pound';

update Namozag_47 
set [@CurrencyId]=1
where [@CurrencyName]='جنيه';

update Namozag_47 
set [@CurrencyId]= 3
where [@CurrencyName]='استرلينى';

update Namozag_47 
set [@CurrencyId]= 6
where [@CurrencyName]='درهم';

update Namozag_47 
set [@CurrencyId]= 2
where [@CurrencyName]='دولار';

update Namozag_47 
set [@CurrencyId]= 5
where [@CurrencyName]='ريال';

update Namozag_47 
set [@CurrencyId]= 4
where [@CurrencyName]='يورو';

update Namozag_47 
set [@CurrencyId]= 1, [@CurrencyName] = 'جنيه'
where [@CurrencyName]='' AND [@CurrencyId] NOT IN (2, 3, 4, 5, 6, 7);

update nmz 
set nmz.[@TransactionTypeId]=lkp.TransactionType_Id
from Namozag_47 nmz join TransactionTypes lkp on nmz.[@TransactionType]=lkp.TransactionType_Name  
GO
