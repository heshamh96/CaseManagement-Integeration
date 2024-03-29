USE [Staging_Area_Increment]
GO
/****** Object:  User [CLOUD\Excel_Admin3]    Script Date: 11/14/2022 6:51:21 AM ******/
CREATE USER [CLOUD\Excel_Admin3] FOR LOGIN [CLOUD\Excel_Admin3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [python]    Script Date: 11/14/2022 6:51:21 AM ******/
CREATE USER [python] FOR LOGIN [python] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin3]
GO
ALTER ROLE [db_owner] ADD MEMBER [python]
GO
/****** Object:  Table [dbo].[102_temp_result]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[102_temp_result](
	[rn] [bigint] NULL,
	[CreationDate] [datetime] NULL,
	[DeclarationType] [varchar](1) NULL,
	[DeclarationNum] [varchar](4) NULL,
	[DeclarationYear] [varchar](4) NULL,
	[Unique_Tax_ID] [varchar](9) NULL,
	[DistrictName] [nvarchar](1000) NULL,
	[mm_from] [varchar](2) NULL,
	[yy_from] [varchar](4) NULL,
	[mm_to] [varchar](2) NULL,
	[yy_to] [varchar](4) NULL,
	[_TaxPeriodFrom] [int] NULL,
	[_TaxPeriodTo] [int] NULL,
	[Income_Net_Sales] [numeric](18, 0) NULL,
	[VAT_Net_Sales] [numeric](18, 0) NULL,
	[Artificial_Key] [varchar](40) NULL,
	[is_Motada5el] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[106_temp_result]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[106_temp_result](
	[rn] [bigint] NULL,
	[CreationDate] [datetime] NULL,
	[DeclarationType] [varchar](1) NULL,
	[DeclarationNum] [varchar](4) NULL,
	[DeclarationYear] [varchar](4) NULL,
	[Unique_Tax_ID] [varchar](9) NULL,
	[DistrictName] [nvarchar](1000) NULL,
	[mm_from] [varchar](2) NULL,
	[yy_from] [varchar](4) NULL,
	[mm_to] [varchar](2) NULL,
	[yy_to] [varchar](4) NULL,
	[_TaxPeriodFrom] [int] NULL,
	[_TaxPeriodTo] [int] NULL,
	[NetIncome_101] [numeric](18, 0) NULL,
	[VariousIncome_705_1] [numeric](18, 0) NULL,
	[CapitalProfit_705_2] [numeric](18, 0) NULL,
	[SalesWaste_705_13] [numeric](18, 0) NULL,
	[Income_Net_Sales] [numeric](21, 0) NULL,
	[VAT_Net_Sales] [int] NULL,
	[Artificial_Key] [varchar](40) NULL,
	[is_Motada5el] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Income_Duplicates_of_102_106_Spooky]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- this view is made to have all the recordes  
--that needs to be deleted from the datawarehouse 102 & 106 Tables
CREATE view [dbo].[vw_Income_Duplicates_of_102_106_Spooky] as 
with Income_102 as (
select * from (
select ROW_NUMBER() over (partition by Unique_Tax_ID+'_'+DeclarationYear order by CreationDate desc  )as rn ,* 
from(

select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,102 as type, 'stg' as db
from [102_temp_result]
union 
select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,102 as type, 'dwh' as db
from DWH_TAX.dbo.Dim_Dec_IncomeTax_102

) as a ) as b
where rn=1
)

,Income_106 as(
select * from (
select ROW_NUMBER() over (partition by Unique_Tax_ID+'_'+DeclarationYear order by CreationDate desc  ) as rn ,* 
from(

select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,106 as type,'stg' as db
from [106_temp_result]
union
select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,106 as type,'dwh' as db
from DWH_TAX.dbo.Dim_Dec_IncomeTax_106
) as a ) as b
where rn=1
)







select * from (
select ROW_NUMBER() over (partition by Unique_Tax_ID,DeclarationYear order by CreationDate asc ) as rn,*
from (
select * from(
select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,102 as type,db
from Income_102
union all
select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,106 as type,db
from Income_106) as rs1
where ak in (select  a.Unique_Tax_ID+'_'+a.DeclarationYear as AK 
					from Income_102 a join Income_106 b 
						on a.Unique_Tax_ID=b.Unique_Tax_ID and 
						a.DeclarationYear=b.DeclarationYear)
				    )as rs2
						) as rs3
						where rn=1
GO
/****** Object:  View [dbo].[Dim_Payments]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Dim_Payments] as
select ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS Payment_ID,rin,taxyrmo,
  case when vat is null then 0 else vat end as Tax_vat_Value,
  case when goods is null then 0 else goods end as Tax_Table_Value from(
  select cons.rin,sum(cons.vat) as vat,sum(cons.goods) as goods,cons.taxyrmo 
from
(
select sp.rin as rin, sp.FilingName ,
case
when sp.FilingName = N'قيمه مضافه'  then sum(TransactionAmount) end as vat,
case 
when sp.FilingName = N'جدول' then sum(TransactionAmount) end as goods,
--,sp.Taxyrmo
convert(smalldatetime,SUBSTRING(convert(varchar (8),SP.taxyrmo,112),1,8)) as taxyrmo

FROM [Sales_Tax_Payments].[dbo].[Sales_Tax_Payments_View] SP
where SP.Name = N'ضريبة إقرار' and 
convert(smalldatetime,SUBSTRING(convert(varchar (8),SP.taxyrmo,112),1,8)) >'2018-12-31 00:00:00'
group by sp.Rin,sp.FilingName,convert(smalldatetime,SUBSTRING(convert(varchar (8),SP.taxyrmo,112),1,8))
--order by sp.Rin asc
) cons
--where cons.rin=100271723 and cons.taxyrmo='2019-01-01 00:00:00'
group by cons.rin , cons.taxyrmo) as  aggregated_Payments
GO
/****** Object:  View [dbo].[vw_5asm_w_Ta7seel_cleansed_New_Implementation]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[vw_5asm_w_Ta7seel_cleansed_New_Implementation] as
SELECT  [TransactionData_Id]
      ,[kst_pageno]
      ,[kst_year] as Tax_Year
      --,[bat_prd]
	  ,case when [bat_prd]='1' then concat([kst_year],'03')
			when [bat_prd]='2' then concat([kst_year],'06')
			when [bat_prd]='3' then concat([kst_year],'09')
			when [bat_prd]='4' then concat([kst_year],'12')
	  	end as Year_quarter_Tax_Period
      --,[kst_docdate]
      --,[kst_jul]
      --,[kst_serl]
      ,[gha_num] as Geha_Unique_Tax_ID
      --,[gha_name] 
      --,[kst_docnum]
      --,[kst_docnum1]
      --,[kst_docnum2]
      --,[kst_ghatype]
      ,[kst_dealtype] as TransactionTypeId
      --,[kst_ksmval] as CollectedMoney
      --,[kst_ratflag]
      --,[kst_flag]
      --,[kst_sysdate]
      --,[kst_ruid]
      --,[kst_rsysdate]
      --,[kst_upuid]
      --,[kst_upsysdate]
      --,[flag]
      --,[Taxpayer_Id]
      ,[kst_taxid] as FinancierUniqueTaxId
      ,[kst_file] as FinancierFileNumber
      --,[kst_date]
	        ,try_cast([kst_date] as Date) as [TransactionDate]
	  ,concat(convert(varchar(4),year([kst_date])),RIGHT( '0'+convert(varchar(2),MONTH([kst_date])),2)) TransactionPeriod
	  ,concat(convert(varchar(4),year([kst_date])),RIGHT( '0'+convert(varchar(2),MONTH([kst_date])),2))+'01' FK_TransactionPeriod_ID
      --,try_Cast([kst_natcode] as float) as TransactionTypeId
      ,try_Cast([kst_totval]  as float) as TransactionTotalValue
      ,[kst_ksmcode] as OpponentTypeId
      ,try_Cast([kst_netval]  as float) as TransactionNet
      ,try_Cast([kst_prcnt]   as float) as OpponentPercentage
      ,try_Cast([kst_taxval]  as float) as CollectedMoney
      ,[kst_currency] as CurrencyId
      ,[kst_uid] as CurrencyName
      --,[kst_reg]
      --,[kst_acttype] 
      --,[bat_branch]
      ,[Zero_Tax_Cause] as Exemption41
      ,[line_Number_Inside_Batch] as TransactionNumber
      --,[Insertion_Date]
      --,[kst_lineno]
      ,[Developed_By]
  FROM [Excel_Withholdings_Transations_Mapping].[dbo].[Full_Withholding_Transactions]

GO
/****** Object:  View [dbo].[vw_Income_102]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_Income_102] as
select*,case 
when yy_to=yy_from 
and convert(int,mm_to)-convert(int,mm_from)=11
then 0 else 1 end as is_Motada5el --into DWH_TAX.dbo.Dim_Dec_IncomeTax_102
from (
SELECT  
Row_number() over (partition by convert(varchar(9),[Declaration.Details.@UniqueTaxID])+'_'+convert(varchar,[DeclarationYear]) order by [CreationDate] desc) as rn,
[CreationDate]
      ,convert(varchar(1),[DeclarationType]) as [DeclarationType]
      ,convert(varchar(4),[DeclarationNum]) as [DeclarationNum]
    --  ,[TaxPayerID]
      ,convert(varchar(4),[DeclarationYear]) as [DeclarationYear]
      ,convert(varchar(9),[Declaration.Details.@UniqueTaxID]) as Unique_Tax_ID
      ,[Declaration.Details.@DistrictName] as DistrictName
      --,[Declaration.Details.@VATDistrictName]
      --,[Declaration.Details.@TaxPerioudddFrom]
      ,convert(varchar(2),[Declaration.Details.@TaxPerioudmmFrom]) mm_from
      ,convert(varchar(4),[Declaration.Details.@TaxPerioudyyFrom]) yy_from
      --,[Declaration.Details.@TaxPerioudddTo]
      ,convert(varchar(2),[Declaration.Details.@TaxPerioudmmTo]) mm_to
      ,convert(varchar(4),[Declaration.Details.@TaxPerioudyyTo] )yy_to
       ,convert(int,convert(varchar(6),TRY_CAST(CAST(TRIM([Declaration.Details.@TaxPerioudyyFrom]) AS VARCHAR(4)) 
	         +'-'+ 
	            CAST(TRIM([Declaration.Details.@TaxPerioudmmFrom]) AS VARCHAR(2)) 
		     +'-'+
		     CAST(TRIM([Declaration.Details.@TaxPerioudddFrom]) AS VARCHAR(2))  
		     AS DATE),112)) AS _TaxPeriodFrom 

	  ,convert(int,convert(varchar(6),TRY_CAST(CAST(TRIM([Declaration.Details.@TaxPerioudyyTo]) AS VARCHAR(4)) 
	         +'-'+  
	            CAST(TRIM([Declaration.Details.@TaxPerioudmmTo]) AS VARCHAR(2)) 
		     +'-'+
		     CAST(TRIM([Declaration.Details.@TaxPerioudddTo]) AS VARCHAR(2))  
		     AS DATE),112)) AS _TaxPeriodTo 
			 ,isnull(try_convert(numeric,[Declaration.Details.@_006_SalesValue] ),0) as Income_Net_Sales
			 ,try_cast(0.0 as decimal) as VAT_Net_Sales
			 ,convert(varchar(9),[Declaration.Details.@UniqueTaxID])+'_'+convert(varchar,[DeclarationYear]) as Artificial_Key
  FROM [Income_Tax_Flattened].[dbo].[Income_Tax_102]) as a
  where a.rn=1
 
GO
/****** Object:  View [dbo].[vw_Income_106]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [dbo].[vw_Income_106] as
select*,case 
when yy_to=yy_from 
and convert(int,mm_to)-convert(int,mm_from)=11
then 0 else 1 end as is_Motada5el --into DWH_TAX.dbo.Dim_Dec_IncomeTax_102
from (
SELECT  
Row_number() over (partition by convert(varchar(9),[Details.@UniqueTaxID])+'_'+convert(varchar,[DeclarationYear]) 
order by [CreationDate] desc) as rn,
[CreationDate]
     

     ,convert(varchar(1),[DeclarationType]) as [DeclarationType]
      ,convert(varchar(4),[DeclarationNum]) as [DeclarationNum]
    --  ,[TaxPayerID]
      ,convert(varchar(4),[DeclarationYear]) as [DeclarationYear]
      ,convert(varchar(9),[Details.@UniqueTaxID]) as Unique_Tax_ID
      , [Details.@DistrictName] as DistrictName 
      --,[Declaration.Details.@DistrictName]
      --,[Declaration.Details.@VATDistrictName]
      --,[Declaration.Details.@TaxPerioudddFrom]
      ,convert(varchar(2),[Details.@TaxPerioudmmFrom]) mm_from
      ,convert(varchar(4),[Details.@TaxPerioudyyFrom]) yy_from
      --,[Declaration.Details.@TaxPerioudddTo]
      ,convert(varchar(2),[Details.@TaxPerioudmmTo]) mm_to
      ,convert(varchar(4),[Details.@TaxPerioudyyTo]) yy_to
       ,convert(int,convert(varchar(6),TRY_CAST(CAST(TRIM([Details.@TaxPerioudyyFrom]) AS VARCHAR(4)) 
	         +'-'+ 
	            CAST(TRIM([Details.@TaxPerioudmmFrom]) AS VARCHAR(2)) 
		     +'-'+
		     CAST(TRIM([Details.@TaxPerioudddFrom]) AS VARCHAR(2))  
		     AS DATE),112)) AS _TaxPeriodFrom 

	  ,convert(int,convert(varchar(6),TRY_CAST(CAST(TRIM([Details.@TaxPerioudyyTo]) AS VARCHAR(4)) 
	         +'-'+  
	            CAST(TRIM([Details.@TaxPerioudmmTo]) AS VARCHAR(2)) 
		     +'-'+
		     CAST(TRIM([Details.@TaxPerioudddTo]) AS VARCHAR(2))  
		     AS DATE),112)) AS _TaxPeriodTo 
			 	,try_convert(numeric,[Details.@NetIncome_101]) as NetIncome_101
				,try_convert(numeric,[Details.@VariousIncome_705_1]) as VariousIncome_705_1
			 ,try_convert(numeric,[Details.@CapitalProfit_705_2]) as CapitalProfit_705_2
			 ,try_convert(numeric,[Details.@SalesWaste_705_13])  as SalesWaste_705_13
			,isnull(try_convert(numeric,[Details.@NetIncome_101]),0)+isnull(try_convert(numeric,[Details.@VariousIncome_705_1]),0)+
			 isnull(try_convert(numeric,[Details.@CapitalProfit_705_2]),0)+isnull(try_convert(numeric,[Details.@SalesWaste_705_13]),0)  as Income_Net_Sales
			 ,null as VAT_Net_Sales
			 , convert(varchar(9),[Details.@UniqueTaxID])+'_'+convert(varchar,[DeclarationYear]) as Artifical_Key
  FROM [Income_Tax_Flattened].[dbo].[Income_Tax_106]) as a
  where a.rn=1
 
GO
/****** Object:  View [dbo].[vw_Income_Duplicates_of_102_106]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- this view is made to have all the recordes  
--that needs to be deleted from the datawarehouse 102 & 106 Tables
CREATE view [dbo].[vw_Income_Duplicates_of_102_106]

as 
select * from (
select ROW_NUMBER() over (partition by Unique_Tax_ID,DeclarationYear order by CreationDate asc ) as rn,*
from (
select * from(
select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,102 as type
from DWH_TAX.dbo.Dim_Dec_IncomeTax_102
union all
select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,106 as type
from DWH_TAX.dbo.Dim_Dec_IncomeTax_106
) as rs1
where ak in (select  a.Unique_Tax_ID+'_'+a.DeclarationYear as AK 
					from DWH_TAX.dbo.Dim_Dec_IncomeTax_102 a join DWH_TAX.dbo.Dim_Dec_IncomeTax_106 b 
						on a.Unique_Tax_ID=b.Unique_Tax_ID and 
						a.DeclarationYear=b.DeclarationYear)
				    )as rs2
						) as rs3
						where rn=1
GO
/****** Object:  Table [dbo].[Declarations_To_Add]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declarations_To_Add](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationTypeID] [int] NULL,
	[Artificial_Key] [nvarchar](18) NULL,
	[FK_VAT_Type_ID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[FK_TaxPeriod_ID] [int] NULL,
	[TableTaxTotal] [numeric](18, 2) NULL,
	[TableTaxAdjustment] [numeric](18, 2) NULL,
	[TableTaxVat] [numeric](18, 2) NULL,
	[SalesTotal] [numeric](18, 2) NULL,
	[SalesAdjustment] [numeric](18, 2) NULL,
	[SalesVat] [numeric](18, 2) NULL,
	[PurchaseTotal] [numeric](18, 2) NULL,
	[PurchaseAdjustment] [numeric](18, 2) NULL,
	[PurchaseVat] [numeric](18, 2) NULL,
	[RecivableTax] [numeric](18, 2) NULL,
	[DebtValue] [numeric](18, 2) NULL,
	[TotalTaxValue] [numeric](18, 2) NULL,
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
	[Fk_Send_Date_ID] [varchar](8) NULL,
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
	[ReconciliationValue] [numeric](18, 2) NULL,
	[Namozag_Name] [int] NULL,
	[Developed_By] [varchar](50) NULL,
	[est5las_Sales_Is_Correct] [decimal](18, 5) NULL,
	[est5las_Purchase_Is_Correct] [decimal](18, 5) NULL,
	[SalesNet] [numeric](18, 2) NULL,
	[SalesTableNet] [numeric](18, 2) NULL,
	[SalesNet_INV] [numeric](19, 3) NULL,
	[PurchasesNet_INV] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Declarations_To_Add] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Declarations_To_Delete]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declarations_To_Delete](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationTypeID] [int] NULL,
	[Artificial_Key] [nvarchar](18) NULL,
	[FK_VAT_Type_ID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[FK_TaxPeriod_ID] [int] NULL,
	[TableTaxTotal] [numeric](18, 2) NULL,
	[TableTaxAdjustment] [numeric](18, 2) NULL,
	[TableTaxVat] [numeric](18, 2) NULL,
	[SalesTotal] [numeric](18, 2) NULL,
	[SalesAdjustment] [numeric](18, 2) NULL,
	[SalesVat] [numeric](18, 2) NULL,
	[PurchaseTotal] [numeric](18, 2) NULL,
	[PurchaseAdjustment] [numeric](18, 2) NULL,
	[PurchaseVat] [numeric](18, 2) NULL,
	[RecivableTax] [numeric](18, 2) NULL,
	[DebtValue] [numeric](18, 2) NULL,
	[TotalTaxValue] [numeric](18, 2) NULL,
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
	[Fk_Send_Date_ID] [varchar](8) NULL,
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
	[ReconciliationValue] [numeric](18, 2) NULL,
	[Namozag_Name] [int] NULL,
	[Developed_By] [varchar](50) NULL,
 CONSTRAINT [PK_Declarations_To_Delete] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Dec_IncomeTax_102_Garbage]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Dec_IncomeTax_102_Garbage](
	[CreationDate] [datetime] NOT NULL,
	[DeclarationType] [varchar](1) NULL,
	[DeclarationNum] [varchar](4) NULL,
	[DeclarationYear] [varchar](4) NULL,
	[Unique_Tax_ID] [varchar](9) NULL,
	[mm_from] [varchar](2) NULL,
	[yy_from] [varchar](4) NULL,
	[mm_to] [varchar](2) NULL,
	[yy_to] [varchar](4) NULL,
	[_TaxPeriodFrom] [int] NULL,
	[_TaxPeriodTo] [int] NULL,
	[Income_Net_Sales] [numeric](18, 0) NULL,
	[VAT_Net_Sales] [numeric](18, 0) NULL,
	[is_Motada5el] [int] NULL,
	[DistrictName] [nvarchar](1000) NULL,
	[VAT_DEC_NET_SALES] [numeric](18, 0) NULL,
	[VAT_DEC_SALES_ADJUSTMENT] [numeric](18, 0) NULL,
	[VAT_DEC_NET_Table_SALES] [numeric](18, 0) NULL,
	[Artificial_Key] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Dec_IncomeTax_102] PRIMARY KEY CLUSTERED 
(
	[CreationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Dec_IncomeTax_106_Garbage]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Dec_IncomeTax_106_Garbage](
	[CreationDate] [datetime] NULL,
	[DeclarationType] [varchar](1) NULL,
	[DeclarationNum] [varchar](4) NULL,
	[DeclarationYear] [varchar](4) NULL,
	[Unique_Tax_ID] [varchar](9) NULL,
	[mm_from] [varchar](2) NULL,
	[yy_from] [varchar](4) NULL,
	[mm_to] [varchar](2) NULL,
	[yy_to] [varchar](4) NULL,
	[_TaxPeriodFrom] [int] NULL,
	[_TaxPeriodTo] [int] NULL,
	[Income_Net_Sales] [numeric](21, 0) NULL,
	[VAT_Net_Sales] [numeric](18, 0) NULL,
	[is_Motada5el] [int] NULL,
	[DistrictName] [nvarchar](1000) NULL,
	[NetIncome_101] [numeric](18, 0) NULL,
	[VariousIncome_705_1] [numeric](18, 0) NULL,
	[CapitalProfit_705_2] [numeric](18, 0) NULL,
	[SalesWaste_705_13] [numeric](18, 0) NULL,
	[VAT_DEC_NET_SALES] [numeric](18, 0) NULL,
	[VAT_DEC_SALES_ADJUSTMENT] [numeric](18, 0) NULL,
	[VAT_DEC_NET_Table_SALES] [numeric](18, 0) NULL,
	[Artificial_Key] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_NonTable_Purchases_Details]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_NonTable_Purchases_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [nvarchar](100) NULL,
	[Id] [nvarchar](1000) NULL,
	[PurchaseTypeValue] [nvarchar](1000) NULL,
	[PurchaseTypeName] [nvarchar](1000) NULL,
	[Local] [nvarchar](1000) NULL,
	[Exported] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_NonTable_Sales_Details]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_NonTable_Sales_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [nvarchar](100) NULL,
	[Id] [nvarchar](1000) NULL,
	[TaxTypeValue] [nvarchar](1000) NULL,
	[TaxTypeName] [nvarchar](1000) NULL,
	[TaxContainer] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL,
	[ItemValue] [nvarchar](1000) NULL,
	[ServiceValue] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_Table_Purchases_Details]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_Table_Purchases_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [nvarchar](1000) NULL,
	[Id] [nvarchar](1000) NULL,
	[PurchaseTypeValue] [nvarchar](1000) NULL,
	[PurchaseTypeName] [nvarchar](1000) NULL,
	[Local] [nvarchar](1000) NULL,
	[Exported] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_Table_Sales_Details]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_Table_Sales_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [nvarchar](100) NULL,
	[Id] [nvarchar](1000) NULL,
	[TaxTypeValue] [nvarchar](1000) NULL,
	[TaxTypeName] [nvarchar](1000) NULL,
	[TaxContainer] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_Table_Tax_Details]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_Table_Tax_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [nvarchar](1000) NULL,
	[Id] [nvarchar](1000) NULL,
	[TaxTypeValue] [nvarchar](1000) NULL,
	[TaxTypeName] [nvarchar](1000) NULL,
	[Quantity] [nvarchar](1000) NULL,
	[ItemValue] [nvarchar](1000) NULL,
	[ServiceValue] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Invoice_Details_Stg]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Invoice_Details_Stg](
	[PurchasesInvoicesDetails_Id] [uniqueidentifier] NULL,
	[Fk_PurchasesInvoices_Id] [uniqueidentifier] NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Fk_ProductType_Id] [int] NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [numeric](19, 3) NULL,
	[Product_Tax_Value] [numeric](19, 3) NULL,
	[Product_Quantity] [numeric](18, 2) NULL,
	[Product_Total_Net] [numeric](19, 3) NULL,
	[Product_Total_Tax_Value] [numeric](19, 3) NULL,
	[Product_Total_Money] [numeric](19, 3) NULL,
	[Replicated] [bit] NULL,
	[Fk_InvoiceType] [int] NULL,
	[Fk_TaxType_Id] [int] NULL,
	[Tax] [numeric](18, 2) NULL,
	[ItemType] [int] NULL,
	[SectionType] [int] NULL,
	[Discount] [numeric](19, 2) NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
	[InvoiceDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Invoices_Master_STG]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Invoices_Master_STG](
	[PurchaseInvoice_Id] [uniqueidentifier] NULL,
	[Company_Taxpayer_Id] [uniqueidentifier] NULL,
	[Company_Unique_Tax_Id] [nvarchar](9) NULL,
	[Invoice_Number] [nvarchar](255) NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [numeric](19, 3) NULL,
	[Invoice_Total_Tax] [numeric](19, 3) NULL,
	[Invoice_Total_Money] [numeric](19, 3) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nvarchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nvarchar](14) NULL,
	[Customer_Mobile] [nvarchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[Replicated] [bit] NULL,
	[InvoiceType] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
	[FK_Inv_Type_ID] [int] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Invoice_Details_Stg]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Invoice_Details_Stg](
	[SalesInvoicesDetails_Id] [uniqueidentifier] NULL,
	[Fk_SalesInvoices_Id] [uniqueidentifier] NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Fk_ProductType_Id] [int] NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [numeric](19, 3) NULL,
	[Product_Tax_Value] [numeric](19, 3) NULL,
	[Product_Quantity] [numeric](18, 2) NULL,
	[Product_Total_Net] [numeric](19, 3) NULL,
	[Product_Total_Tax_Value] [numeric](19, 3) NULL,
	[Product_Total_Money] [numeric](19, 3) NULL,
	[Replicated] [bit] NULL,
	[Fk_InvoiceType] [int] NULL,
	[Fk_TaxType_Id] [int] NULL,
	[Tax] [numeric](18, 2) NULL,
	[ItemType] [int] NULL,
	[SectionType] [int] NULL,
	[Discount] [numeric](19, 2) NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
	[InvoiceDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Invoices_Master_STG]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Invoices_Master_STG](
	[Company_Taxpayer_Id] [uniqueidentifier] NULL,
	[Company_Unique_Tax_Id] [nvarchar](9) NULL,
	[Invoice_Number] [nvarchar](255) NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [numeric](19, 3) NULL,
	[Invoice_Total_Tax] [numeric](19, 3) NULL,
	[Invoice_Total_Money] [numeric](19, 3) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nvarchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nvarchar](14) NULL,
	[Customer_Mobile] [nvarchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[Replicated] [bit] NULL,
	[InvoiceType] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
	[FK_Inv_Type_ID] [int] NULL,
	[SalesInvoice_Id] [uniqueidentifier] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentPurchasesInvoices_Stage]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentPurchasesInvoices_Stage](
	[TaxpayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[PurchaseInvoiceID] [uniqueidentifier] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentSalesInvoices_Stage]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentSalesInvoices_Stage](
	[TaxpayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[SalesInvoiceID] [uniqueidentifier] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_DIm_Declarations_SCD]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_DIm_Declarations_SCD](
	[ID] [uniqueidentifier] NULL,
	[DeclarationTypeID] [int] NULL,
	[Artificial_Key] [nvarchar](18) NULL,
	[FK_VAT_Type_ID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[FK_TaxPeriod_ID] [int] NULL,
	[TableTaxTotal] [numeric](18, 2) NULL,
	[TableTaxAdjustment] [numeric](18, 2) NULL,
	[TableTaxVat] [numeric](18, 2) NULL,
	[SalesTotal] [numeric](18, 2) NULL,
	[SalesAdjustment] [numeric](18, 2) NULL,
	[SalesVat] [numeric](18, 2) NULL,
	[PurchaseTotal] [numeric](18, 2) NULL,
	[PurchaseAdjustment] [numeric](18, 2) NULL,
	[PurchaseVat] [numeric](18, 2) NULL,
	[RecivableTax] [numeric](18, 2) NULL,
	[DebtValue] [numeric](18, 2) NULL,
	[TotalTaxValue] [numeric](18, 2) NULL,
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
	[Fk_Send_Date_ID] [varchar](8) NULL,
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
	[ReconciliationValue] [numeric](18, 2) NULL,
	[Namozag_Name] [int] NULL,
	[Developed_By] [varchar](50) NULL,
	[Version] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[all_declaraitons_with_no_invoices]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declaraitons_with_no_invoices] as
truncate table [Sent_Tables_Try_out].[dbo].[Declarations_Final];


with all_declarations as (
select ID,concat(trim(UniqueTaxID collate Arabic_CI_AI),concat('_',TaxPeriod)) as ak
,UniqueTaxID collate Arabic_CI_AI as UniqueTaxID
,SendDate
,TaxPeriod
,[DeclarationTypeID]
,[SalesTotal],[SalesAdjustment],[SalesVat]
,[PurchaseTotal],[PurchaseAdjustment],[PurchaseVat]
from [TaxVAT].dbo.NonTableVatTax
--where 
--UniqueTaxID='557762456' and
 --TaxPeriod in ('202001','202002','202003')
 
union
select ID,concat(trim(UniqueTaxID collate Arabic_CI_AI),concat('_',TaxPeriod)) as ak
,UniqueTaxID collate Arabic_CI_AI as UniqueTaxID
,SendDate
,TaxPeriod
,[DeclarationTypeID]
,[SalesTableVat],[SalesTableAdjustment],[SalesTableTotal]
,[PurchaseTableTotal],[PurchaseTableAdjustment],[PurchaseTableVat]
from [TaxVAT].dbo.TableVatTax
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
--and(
--(ad.[SalesTotal]!=0 and [SalesAdjustment] !=0 and [SalesVat]!=0 )
--or
--([PurchaseTotal]!=0 and [PurchaseAdjustment]!=0 and [PurchaseVat]!=0)
--)
)

insert into [Sent_Tables_Try_out].[dbo].[Declarations_Final]
select  * -- into [Sent_Tables_Try_out].dbo.all_Declarations_with_no_Invoices   --[dbo].[Declarations_Final]
from final_declaraions fd
where 
fd.ID not in 
(select distinct [TaxVatDecID] from Staging_Area.[dbo].[SentPurshaseInvoices]
union 
select distinct [TaxVatDecID] from Staging_Area.[dbo].[SentSalesInvoices]

)


--insert into [Sent_Tables_Try_out].dbo.Declarations_Finalll 
--select  * --into [Sent_Tables_Try_out].dbo.Declarations_Final 
--from final_declaraions fd
--where 
--fd.ID not in 
--(select distinct [TaxVatDecID] from [TaxVAT].[dbo].[SentPurshaseInvoices]
--union 
--select distinct [TaxVatDecID] from [TaxVAT].[dbo].[SentSalesInvoices])
GO
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion] -- @Period varchar(6)
as 
--truncate table [Sent_Tables_Try_out].dbo.SentPurshaseInvoices ;
with equrar as(
select ad.* from Declarations_To_Add ad --left join SentTables.dbo.SentPurshaseInvoices spinv on ad.ID=spinv.TaxVatDecID --collate database_Default 
where 
ad.ID not in (select distinct spinv.TaxVatDecID from SentTables.dbo.SentPurshaseInvoices spinv with(nolock)) --is null and
and
ad.[DeclarationTypeID] !=2
--and(
--(ad.[SalesTotal]!=0 and [SalesAdjustment] !=0 and [SalesVat]!=0 )
--or
--([PurchaseTotal]!=0 and [PurchaseAdjustment]!=0 and [PurchaseVat]!=0)
--)
)
,fawateer as(
--select *,sum(pttv)over( order by CreationDate asc) acc_pttv from(
select a.PurchaseInvoice_Id,/*b.PurchasesInvoicesDetails_Id,*/a.CreationDate 
,a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) as fk_Ak,a.Company_Unique_Tax_Id as unique_tax_id

from TaxVAT.dbo.PurchasesInvoices a with(nolock)  
--join PurchasesInvoicesDetails b 
--on a.PurchaseInvoice_Id=b.Fk_PurchasesInvoices_Id
where --a.Company_Unique_Tax_Id='100270468' and 
a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) collate database_Default in (select Artificial_Key from equrar)
and a.IsDeleted=0
--and b.IsDeleted=0
--and a.CreationDate not in(2,3)
--group by a.PurchaseInvoice_Id,a.CreationDate
--) x
)

insert into [Sent_Tables_Try_out].dbo.SentPurshaseInvoices_inc (
[ID]
--,[TaxpayerID]
,[TaxVatDecID]
,[PurchaseInvoiceID]
--,[PurchaseInvoiceDetailsID]
,CreationDate
)
select distinct newid() as id,/*rtp.Taxpayer_Id,*/a.ID,b.PurchaseInvoice_Id,/*b.PurchasesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.Artificial_Key=b.fk_Ak collate database_Default
--join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
left join (select distinct PurchaseInvoiceID,TaxVatDecID from SentTables.dbo.SentPurshaseInvoices with(nolock)) as spik 
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
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion]    Script Date: 11/14/2022 6:51:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion] --@Period varchar(6)

as 
--truncate table [Sent_Tables_Try_out].dbo.SentSalesInvoices ;
with equrar as(
select ad.* from Declarations_To_Add ad --left join SentTables.dbo.SentSalesInvoices ssinv on ad.ID=ssinv.TaxVatDecID --collate database_Default 
where 
ad.ID not in (select distinct ssinv.TaxVatDecID from   SentTables.dbo.SentSalesInvoices ssinv with(nolock)) --is null and
and
ad.[DeclarationTypeID] !=2
--and(
--(ad.[SalesTotal]!=0 and [SalesAdjustment] !=0 and [SalesVat]!=0 )
--or
--([PurchaseTotal]!=0 and [PurchaseAdjustment]!=0 and [PurchaseVat]!=0)
--)
)
,fawateer as(
--select *,sum(pttv)over( order by CreationDate asc) acc_pttv from(
select a.SalesInvoice_Id,/*b.SalesInvoicesDetails_Id,*/a.CreationDate 
,a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) as fk_Ak,a.Company_Unique_Tax_Id as unique_tax_id

from TaxVAT.dbo.SalesInvoices a with(nolock)
--join SalesInvoicesDetails b 
--on a.SalesInvoice_Id=b.Fk_SalesInvoices_Id 
where --a.Company_Unique_Tax_Id='100270468' and 
a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) collate database_Default in (select Artificial_Key from equrar)
and a.IsDeleted=0
--and b.IsDeleted=0
--and a.CreationDate not in(2,3)
--group by a.PurchaseInvoice_Id,a.CreationDate
--) x
)

insert into [Sent_Tables_Try_out].dbo.SentSalesInvoices_inc(
ID
--,[TaxpayerID]
,[TaxVatDecID]
,SalesInvoiceID
--,SalesInvoiceDetailsID
,CreationDate

)
select distinct newid() as id,/*rtp.Taxpayer_Id,*/a.ID,b.SalesInvoice_Id,/*b.SalesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.Artificial_Key=b.fk_Ak collate database_Default
--join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
left join (select distinct SalesInvoiceID,TaxVatDecID from SentTables.dbo.SentSalesInvoices with(nolock)) as ssik 
on b.SalesInvoice_Id=ssik.SalesInvoiceID and a.ID=ssik.TaxVatDecID
where a.SendDate>=b.CreationDate
and ssik.SalesInvoiceID is null
and ssik.TaxVatDecID is null
GO
