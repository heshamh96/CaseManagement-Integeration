USE [DWH_TAX]
GO
/****** Object:  Table [dbo].[Dim_Registered_TaxPayers]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Registered_TaxPayers](
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Unique_Tax_Id] [nvarchar](9) NULL,
	[Taxpayer_Name] [nvarchar](100) NULL,
	[Taxpayer_Address] [nvarchar](100) NULL,
	[Taxpayer_ContactAddress] [nvarchar](100) NULL,
	[Fk_Taxpayer_Type] [int] NULL,
	[Fk_Taxpayer_Category_Id] [int] NULL,
	[Taxpayer_Email] [nvarchar](50) NULL,
	[Taxpayer_Telephone] [nvarchar](20) NULL,
	[Taxpayer_Fax] [nvarchar](20) NULL,
	[National_Id] [nvarchar](14) NULL,
	[Create_Date] [datetime] NULL,
	[Modify_Date] [datetime] NULL,
	[Email_Confirmation_Code] [nvarchar](100) NULL,
	[Email_IsConfirmed] [bit] NULL,
	[Account_IsConfirmed] [bit] NULL,
	[District] [varchar](3) NULL,
	[AgentName] [nvarchar](50) NULL,
	[AgentNationalId] [nvarchar](14) NULL,
	[AuthNum] [nvarchar](50) NULL,
	[IsValueAdded] [bit] NULL,
	[IsTableItem] [bit] NULL,
	[DistrictVAT] [varchar](3) NULL,
	[Nationality] [int] NULL,
	[licenceNum] [varchar](12) NULL,
	[firstName] [varchar](50) NULL,
	[secondName] [varchar](50) NULL,
	[thirdName] [varchar](50) NULL,
	[forthName] [varchar](50) NULL,
	[BirthDate] [date] NULL,
	[commercialRegisterNum] [varchar](50) NULL,
	[insuranceNum] [varchar](50) NULL,
	[bankName] [varchar](50) NULL,
	[bankBranchName] [varchar](50) NULL,
	[bankAccountNum] [varchar](50) NULL,
	[financialYearEnd] [varchar](5) NULL,
	[EconomicCategory] [int] NULL,
	[IsUpdated] [bit] NULL,
	[PostalCode] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[MangerName] [varchar](100) NULL,
	[TradeName] [varchar](100) NULL,
	[PassportNum] [nvarchar](50) NULL,
	[SubscriptionEndDate] [date] NULL,
	[Old_UniqueTaxId] [nvarchar](9) NULL,
	[ModifiedDate_UTId] [datetime] NULL,
	[IsEarnWork] [bit] NULL,
	[NumOfEmployees] [int] NULL,
	[DateOfLastPaid] [date] NULL,
	[Website] [nvarchar](150) NULL,
	[Taxpayer_Mobile] [nvarchar](20) NULL,
	[IsDataUpdated] [bit] NULL,
	[is_not_sending_Declarations] [bit] NULL,
	[is_Dummy_Company] [bit] NULL,
	[is_sent_Zero_or_NoValue_Dec_3times] [int] NULL,
	[FK_Region_id] [int] NULL,
	[Activity_Level_1_Description] [nvarchar](150) NULL,
	[Activity_Level_2_Description] [nvarchar](150) NULL,
	[Activity_Level_3_Description] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Not_Registred_TaxPayers_After_Sync]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Not_Registred_TaxPayers_After_Sync]
as 
select * from(
select * ,ROW_NUMBER() over (partition by rin order by rin) as rn
from(
select sm.rin,sm.regname
from [Staging_Area].dbo.Dim_Sales_Master sm left join [dbo].[Dim_Registered_TaxPayers] tp on sm.rin=tp.Unique_Tax_Id
where tp.Unique_Tax_Id is null

union

select dc.Unique_Tax_ID,dc.Company_Name
from [Staging_Area].dbo.Dim_Dummy_Companies dc left join  [dbo].[Dim_Registered_TaxPayers] tp on dc.Unique_Tax_ID=tp.Unique_Tax_Id
where dc.Unique_Tax_Id is null
) a
) b
where rn=1
GO
/****** Object:  Table [dbo].[Dim_Declarations_SCD]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Declarations_SCD](
	[ID] [uniqueidentifier] NULL,
	[DeclarationTypeID] [int] NULL,
	[FK_VAT_Type_ID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxPeriod] [int] NULL,
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
	[Artificial_Key] [nvarchar](18) NULL,
	[FK_TaxPeriod_ID] [int] NULL,
	[Fk_Send_Date_ID] [varchar](8) NULL,
	[Dec_ID_S] [int] IDENTITY(1,1) NOT NULL,
	[Submission_Delay]  AS (datediff(month,CONVERT([date],CONVERT([varchar](8),[FK_TaxPeriod_ID])),[SendDate])),
	[FK_SSEND_DDATE]  AS (CONVERT([date],[Fk_Send_Date_ID])),
	[Developed_By] [varchar](50) NULL,
	[Namozag_Name] [int] NULL,
	[Version] [int] NULL,
 CONSTRAINT [PK_Dim_Declarations_SCD] PRIMARY KEY CLUSTERED 
(
	[Dec_ID_S] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Declarations_Versions]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

create view [dbo].[vw_Declarations_Versions] as

select * from (
SELECT
	   row_number() over (partition by [Artificial_Key] order by[SendDate] desc) as version  
	   ,[Artificial_Key]
	   ,[SendDate]
	   [ID]
      ,[DeclarationTypeID]
      ,[FK_VAT_Type_ID]
      ,[DocumentNum]
      ,[LinkCodeID]
      ,[TaxpayerID]
      ,[UniqueTaxID]
      ,[TaxPeriod]
      ,[TableTaxTotal]
      ,[TableTaxAdjustment]
      ,[TableTaxVat]
      ,[SalesTotal]
      ,[SalesAdjustment]
      ,[SalesVat]
      ,[PurchaseTotal]
      ,[PurchaseAdjustment]
      ,[PurchaseVat]
      ,[RecivableTax]
      ,[DebtValue]
      ,[TotalTaxValue]
      ,[ApplicantName]
      ,[NationalPassNum]
      ,[IsSigned]
      ,[Representitive]
      ,[AuthorizationNumber]
      ,[SignedDate]
      ,[CreationDate]
      ,[UpdatedDate]
      ,[IsDeleted]
      ,[IsSend]
      
      ,[IsPaid]
      ,[IsReplicated]
      ,[PaymentDate]
      ,[PaymentMethod]
      ,[PersonalizeTypeID]
      ,[ReconciliationType]
      ,[AcceptanceDate]
      ,[RejectionDate]
      ,[RecoPaymentDate]
      ,[IsPaidTable]
      ,[ReconciliationValue]
      
      ,[FK_TaxPeriod_ID]
      ,[Fk_Send_Date_ID]
      ,[Dec_ID_S]
      ,[Submission_Delay]
      ,[FK_SSEND_DDATE]
  FROM [DWH_TAX].[dbo].[Dim_Declarations_SCD]) as a 
  --order by Artificial_Key asc
GO
/****** Object:  View [dbo].[B_Hvw_Dim_TaxPayers]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [dbo].[B_Hvw_Dim_TaxPayers]
as 

select tax.*,act.Activity_level1_desc, act.Activity_level2_desc
from  dw_tax.dbo.Dim_TaxPayers tax
full join dw_tax.dbo.Dim_Activities act
on  tax.Fk_Activity_ID_S=act.Activity_ID_S
--and act.Activity_ID_S is null
where TaxPayer_ID_S in (
select MAX(TaxPayer_ID_S)TaxPayer_ID_S
from  dw_tax.dbo.Dim_TaxPayers

group by Unique_Tax_Id)



GO
/****** Object:  View [dbo].[C_Hvw_Dim_Payments]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE view [dbo].[C_Hvw_Dim_Payments] as
  
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

FROM [Sales_Tax_Payments].[dbo].[Sales_Tax_Payments_View_table] SP
where SP.Name = N'ضريبة إقرار' and 
convert(smalldatetime,SUBSTRING(convert(varchar (8),SP.taxyrmo,112),1,8)) >'2018-12-31 00:00:00'
group by sp.Rin,sp.FilingName,convert(smalldatetime,SUBSTRING(convert(varchar (8),SP.taxyrmo,112),1,8))
--order by sp.Rin asc
) cons
--where cons.rin=100271723 and cons.taxyrmo='2019-01-01 00:00:00'
group by cons.rin , cons.taxyrmo) as  aggregated_Payments
GO
/****** Object:  View [dbo].[Hvw_decs_to_exclude]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[Hvw_decs_to_exclude] as


select   * from(
select Fk_TaxPeriod_ID,FK_Unique_Tax_Id,sum(convert(int,active)) count_of_declaration_versions,trim(FK_Unique_Tax_Id)+'_'+CONVERT(nchar(8),fk_taxperiod_id) as Artificial_PK
from dw_tax.dbo.Dim_Declarations
where Active=1 and FK_Unique_Tax_Id is not null
group by Fk_TaxPeriod_ID,FK_Unique_Tax_Id

)
a 
where  count_of_declaration_versions>1
GO
/****** Object:  View [dbo].[Hvw_DIM_Invoices]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[Hvw_DIM_Invoices] as 
select * from (
select 0 [Invoice_ID_1],
PurchaseInvoice_Id as Invoice_Master_ID
	  ,PurchasesInvoicesDetails_Id as Invoice_Details_ID
	  , 1 as Fk_Inv_Type_ID
      ,[InvoiceType] as Fk_Sub_Inv_Type_ID_S
	  ,convert(varchar(8),Invoice_Date,112) as Fk_Inv_Date_ID
	  ,[ItemType] as Fk_Item_Type_ID_S
	  ,[Fk_ProductType_Id] as Fk_Prod_Type_ID_S
	  ,0 [Fk_TaxPayer_ID_S]
	  ,[Fk_TaxType_Id] as Fk_Tax_Type_ID_S
	  ,[SectionType] as Fk_Section_Type_ID_S
	  ,[Invoice_Number]
      ,[Product_Name]
      ,[Product_Code]
      ,[Product_Unit_Price]
	  ,[Discount] as Product_Discount
	  ,[Tax] as Product_Tax_Perc
      ,[Product_Tax_Value]
      ,[Product_Quantity]
      ,[Product_Total_Net]
      ,[Product_Total_Tax_Value]
      ,[Product_Total_Money]
	  ,[Customer_Unique_Tax_Id] as Customer_UniqueID
	  ,[Customer_Name] 
	  ,0 [FK_Declaration_id]
	  ,convert(varchar(8),Invoice_Date,112) as [FK_TaxPeriod]
	  ,0 [Active]
	  , null [Send_Time]
	  , Invoice_Date as [Creation_Date]
	   , 0 [From_Himself]
	   ,[Product_Unit]
	   ,[Customer_National_Id] as Customer_National_ID
	   ,[Company_Unique_Tax_Id] as Company_UniqueID
	   --,[Invoice_Total_Net]
       --,[Invoice_Total_Tax]
       --,[Invoice_Total_Money]
       --,[Customer_File_Number]
       --,[Customer_Mobile]
       --,[Customer_Address]
       --,inv2.[IsDeleted]
       --,[Company_Taxpayer_Id]
     
      
      
      
      
      
      
      
      

from [TaxVAT].dbo.[PurchasesInvoices] inv1
join [TaxVAT].dbo.[PurchasesInvoicesDetails] inv2
on inv1.PurchaseInvoice_Id=inv2.Fk_PurchasesInvoices_Id

union

select  0 [Invoice_ID_1],
SalesInvoice_Id as Invoice_Master_ID
	  ,SalesInvoicesDetails_Id as Invoice_Details_ID
	  , 1 as Fk_Inv_Type_ID
      ,[InvoiceType] as Fk_Sub_Inv_Type_ID_S
	  ,convert(varchar(8),Invoice_Date,112) as Fk_Inv_Date_ID
	  ,[ItemType] as Fk_Item_Type_ID_S
	  ,[Fk_ProductType_Id] as Fk_Prod_Type_ID_S
	  ,0 [Fk_TaxPayer_ID_S]
	  ,[Fk_TaxType_Id] as Fk_Tax_Type_ID_S
	  ,[SectionType] as Fk_Section_Type_ID_S
	  ,[Invoice_Number]
      ,[Product_Name]
      ,[Product_Code]
      ,[Product_Unit_Price]
	  ,[Discount] as Product_Discount
	  ,[Tax] as Product_Tax_Perc
      ,[Product_Tax_Value]
      ,[Product_Quantity]
      ,[Product_Total_Net]
      ,[Product_Total_Tax_Value]
      ,[Product_Total_Money]
	  ,[Customer_Unique_Tax_Id] as Customer_UniqueID
	  ,[Customer_Name] 
	  ,0 [FK_Declaration_id]
	  ,convert(varchar(8),Invoice_Date,112) as [FK_TaxPeriod]
	  ,0 [Active]
	  , null [Send_Time]
	  , Invoice_Date as [Creation_Date]
	   , 0 [From_Himself]
	   ,[Product_Unit]
	   ,[Customer_National_Id] as Customer_National_ID
	   ,[Company_Unique_Tax_Id] as Company_UniqueID
	   --,[Invoice_Total_Net]
       --,[Invoice_Total_Tax]
       --,[Invoice_Total_Money]
       --,[Customer_File_Number]
       --,[Customer_Mobile]
       --,[Customer_Address]
       --,inv2.[IsDeleted]
       --,[Company_Taxpayer_Id]

from [TaxVAT].dbo.SalesInvoices  inv1
join [TaxVAT].dbo.SalesInvoicesDetails  inv2
on inv1.SalesInvoice_Id=inv2.Fk_SalesInvoices_Id
) as a

--select
----[Invoice_ID_1]
--      --,[FK_Declaration_id]    
--     -- ,[Active]
--     -- ,[Send_Time]
--     -- ,[From_Himself]
      
      
      

--from [dbo].[PurchasesInvoices] inv1
--join [dbo].[PurchasesInvoicesDetails] inv2
--on inv1.PurchaseInvoice_Id=inv2.Fk_PurchasesInvoices_Id
GO
/****** Object:  View [dbo].[Hvw_get_not_registered_taxpayer]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[Hvw_get_not_registered_taxpayer]
as

--with get_not_register

select s.* from [DW_Tax].dbo.Dim_SalesMaster s
left join [DW_Tax].[dbo].[vw_customer_id] t
on s.rin collate database_default=t.Unique_Tax_Id
where t.Unique_Tax_Id is null 

union

select s.* from [DW_Tax].dbo.Dim_SalesMaster s
 join [DW_Tax].[dbo].Dim_Invoices inv
on s.rin collate database_default=inv.Customer_UniqueID
where inv.Customer_UniqueID is not null and Company_UniqueID is not null

union

select s.* from [DW_Tax].dbo.Dim_SalesMaster s
 join [DW_Tax].[dbo].Dim_Sales_Gamarek sg
on s.rin collate database_default=sg.CDLRNumber
--where inv.Customer_UniqueID is not null and Company_UniqueID is not null

GO
/****** Object:  View [dbo].[Hvw_not_sending_decs_TP]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[Hvw_not_sending_decs_TP] as
select a.* from(
select tp.*
from [DW_Tax].dbo.vw_customer_id tp left join 
(select * from [DW_Tax].dbo.Dim_Declarations
where Active=1
and FK_Unique_Tax_Id is not null) dc
on tp.Unique_Tax_Id=dc.FK_Unique_Tax_Id
where dc.FK_Unique_Tax_Id is null) a
join [DW_Tax].dbo.Dim_Invoices inv on inv.Customer_UniqueID=a.Unique_Tax_Id
where inv.Company_UniqueID is not null and inv.Customer_UniqueID is not null
GO
/****** Object:  View [dbo].[Hvw_Tax_Payers_Universe_Others]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[Hvw_Tax_Payers_Universe_Others]
as
select * from (
select Unique_Tax_Id,Taxpayer_Name,District_Name,ROW_NUMBER() over( partition by Unique_Tax_Id/*, regname*/ order by Unique_Tax_Id/*,regname*/) as rownumb from (

 

  select Unique_Tax_Id,Taxpayer_Name,ds.District_Name
  from [DW_Tax].[dbo].vw_customer_id tp join [DW_Tax].[dbo].Dim_Districts ds on tp.District_Code=ds.District_Code

  union 


select rin,regname,officename
  from [DW_Tax].[dbo].Dim_SalesMaster 

  union 

SELECT [Unique_Tax_ID]
      ,[Company_Name]
      ,[District_Name]
      
  FROM [DW_Tax].[dbo].[Dim_Dummy_Companies]

 

  

  --select rin,regname,officename
  --from Hvw_get_not_registered_taxpayer_gamarek
  ) as a 
  
  --where rin!='100065511' and rin!='100283128' and rin !='100066097' and rin not like '100%'
  --and rin not like '200%' and rin != '201134519' -- '100066003'  '100034098'  '200026402'   
  ) as b
  where rownumb=1
GO
/****** Object:  View [dbo].[vw_customer_id]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view  [dbo].[vw_customer_id]
as 

select tax.*,act.Activity_level1_desc, act.Activity_level2_desc
from [DW_Tax].dbo.Dim_TaxPayers tax
full join [DW_Tax].dbo.Dim_Activities act
on  tax.Fk_Activity_ID_S=act.Activity_ID_S
--and act.Activity_ID_S is null
where TaxPayer_ID_S in (
select MAX(TaxPayer_ID_S)TaxPayer_ID_S
from [DW_Tax].dbo.Dim_TaxPayers

group by Unique_Tax_Id)



GO
/****** Object:  Table [dbo].[bkp_dummy_Companies]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bkp_dummy_Companies](
	[Unique_Tax_ID] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](255) NULL,
	[District_Name] [nvarchar](255) NULL,
	[Is_Regestered] [nvarchar](255) NULL,
	[Is_Value_Added] [datetime] NULL,
	[IS_Table] [nvarchar](255) NULL,
	[FK_TaxPayer_ID_S] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bkp_not_registered_TaxPayers]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bkp_not_registered_TaxPayers](
	[rin] [nvarchar](50) NULL,
	[regname] [nvarchar](255) NULL,
	[rn] [bigint] NULL,
	[DistrictVat_Name] [nvarchar](255) NULL,
	[DistrictVat_Code] [varchar](20) NULL,
	[Region_Name] [nvarchar](255) NULL,
	[Region_Code] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bkp_registered_TaxPayers]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bkp_registered_TaxPayers](
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Unique_Tax_Id] [nvarchar](9) NULL,
	[Taxpayer_Name] [nvarchar](100) NULL,
	[Taxpayer_Address] [nvarchar](100) NULL,
	[Taxpayer_ContactAddress] [nvarchar](100) NULL,
	[Fk_Taxpayer_Type] [int] NULL,
	[Fk_Taxpayer_Category_Id] [int] NULL,
	[Taxpayer_Email] [nvarchar](50) NULL,
	[Taxpayer_Telephone] [nvarchar](20) NULL,
	[Taxpayer_Fax] [nvarchar](20) NULL,
	[National_Id] [nvarchar](14) NULL,
	[Create_Date] [datetime] NULL,
	[Modify_Date] [datetime] NULL,
	[Email_Confirmation_Code] [nvarchar](100) NULL,
	[Email_IsConfirmed] [bit] NULL,
	[Account_IsConfirmed] [bit] NULL,
	[District] [varchar](3) NULL,
	[AgentName] [nvarchar](50) NULL,
	[AgentNationalId] [nvarchar](14) NULL,
	[AuthNum] [nvarchar](50) NULL,
	[IsValueAdded] [bit] NULL,
	[IsTableItem] [bit] NULL,
	[DistrictVAT] [varchar](3) NULL,
	[Nationality] [int] NULL,
	[licenceNum] [varchar](12) NULL,
	[firstName] [varchar](50) NULL,
	[secondName] [varchar](50) NULL,
	[thirdName] [varchar](50) NULL,
	[forthName] [varchar](50) NULL,
	[BirthDate] [date] NULL,
	[commercialRegisterNum] [varchar](50) NULL,
	[insuranceNum] [varchar](50) NULL,
	[bankName] [varchar](50) NULL,
	[bankBranchName] [varchar](50) NULL,
	[bankAccountNum] [varchar](50) NULL,
	[financialYearEnd] [varchar](5) NULL,
	[EconomicCategory] [int] NULL,
	[IsUpdated] [bit] NULL,
	[PostalCode] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[MangerName] [varchar](100) NULL,
	[TradeName] [varchar](100) NULL,
	[PassportNum] [nvarchar](50) NULL,
	[SubscriptionEndDate] [date] NULL,
	[Old_UniqueTaxId] [nvarchar](9) NULL,
	[ModifiedDate_UTId] [datetime] NULL,
	[IsEarnWork] [bit] NULL,
	[NumOfEmployees] [int] NULL,
	[DateOfLastPaid] [date] NULL,
	[Website] [nvarchar](150) NULL,
	[Taxpayer_Mobile] [nvarchar](20) NULL,
	[IsDataUpdated] [bit] NULL,
	[is_not_sending_Declarations] [bit] NULL,
	[is_Dummy_Company] [bit] NULL,
	[is_sent_Zero_or_NoValue_Dec_3times] [int] NULL,
	[FK_Region_id] [int] NULL,
	[Activity_Level_1_Description] [nvarchar](150) NULL,
	[Activity_Level_2_Description] [nvarchar](150) NULL,
	[Activity_Level_3_Description] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bkp_taxpayer_Universe]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bkp_taxpayer_Universe](
	[Unique_Tax_Id] [nvarchar](50) NOT NULL,
	[Taxpayer_Name] [nvarchar](255) NULL,
	[type] [varchar](13) NULL,
	[rownumb] [bigint] NULL,
	[IS_Registered] [bit] NULL,
	[IS_Not_Registered] [bit] NULL,
	[IS_Dummy] [bit] NULL,
	[DistrictVat_Name] [nvarchar](255) NULL,
	[Region_Name] [nvarchar](255) NULL,
	[DistrictVat_Code] [varchar](10) NULL,
	[Region_Code] [varchar](10) NULL,
	[IS_Income_Registered] [bit] NULL,
	[IS_Vat_Registred] [bit] NULL,
	[District_Name] [nvarchar](255) NULL,
	[District_Code] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Activities]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Activities](
	[activity_level_onedesc] [nvarchar](255) NULL,
	[activity_level_twodesc] [nvarchar](255) NULL,
	[activity_level_threecd] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date_ID] [int] NOT NULL,
	[Date_Iso] [date] NULL,
	[Day]  AS (datepart(day,[Date_Iso])),
	[DayName]  AS (datename(weekday,[Date_Iso])),
	[Month]  AS (datepart(month,[Date_Iso])),
	[MonthName]  AS (datename(month,[Date_Iso])),
	[Week]  AS (datepart(week,[Date_Iso])),
	[DayOfWeek]  AS (datepart(weekday,[Date_Iso])),
	[Quarter]  AS ('Q'+CONVERT([varchar],datepart(quarter,[Date_Iso]))),
	[Year]  AS (datepart(year,[Date_Iso])),
	[taxperiod]  AS (left(CONVERT([varchar],[Date_Iso],(112)),(6))),
	[Year_Quarter_Period]  AS (case when datepart(quarter,[Date_Iso])=(1) then concat(datepart(year,[Date_Iso]),'03') when datepart(quarter,[Date_Iso])=(2) then concat(datepart(year,[Date_Iso]),'06') when datepart(quarter,[Date_Iso])=(3) then concat(datepart(year,[Date_Iso]),'09') when datepart(quarter,[Date_Iso])=(4) then concat(datepart(year,[Date_Iso]),'12')  end),
 CONSTRAINT [PK__Dim_Date__1F9B72AB5977342A] PRIMARY KEY CLUSTERED 
(
	[Date_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Dec_IncomeTax_102]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Dec_IncomeTax_102](
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
	[Income_Net_Sales] [numeric](18, 0) NULL,
	[VAT_Net_Sales] [numeric](18, 0) NULL,
	[is_Motada5el] [int] NULL,
	[DistrictName] [nvarchar](1000) NULL,
	[VAT_DEC_NET_SALES] [numeric](18, 0) NULL,
	[VAT_DEC_SALES_ADJUSTMENT] [numeric](18, 0) NULL,
	[VAT_DEC_NET_Table_SALES] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Dec_IncomeTax_106]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Dec_IncomeTax_106](
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
	[VAT_DEC_NET_Table_SALES] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Declarations]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Declarations](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationTypeID] [int] NULL,
	[FK_VAT_Type_ID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxPeriod] [int] NULL,
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
	[Artificial_Key] [nvarchar](18) NULL,
	[FK_TaxPeriod_ID] [int] NULL,
	[Fk_Send_Date_ID] [varchar](8) NULL,
	[Dec_ID_S] [int] NULL,
	[Submission_Delay]  AS (datediff(month,CONVERT([date],CONVERT([varchar](8),[FK_TaxPeriod_ID])),[SendDate])),
	[FK_SSEND_DDATE]  AS (CONVERT([date],[Fk_Send_Date_ID])),
	[Developed_By] [varchar](50) NULL,
	[est5las_Sales_Is_Correct] [bit] NULL,
	[Namozag_Name] [int] NULL,
	[SalesNet] [numeric](18, 2) NULL,
	[SalesTableNet] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Dim_Declarations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_DeclarationTypes]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_DeclarationTypes](
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Districts]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Districts](
	[District_Code] [varchar](3) NULL,
	[District_Name] [nvarchar](50) NULL,
	[District_Type] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Districts_Vat]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Districts_Vat](
	[DistrictVat_Code] [varchar](3) NULL,
	[DistrictVat_Name] [nvarchar](60) NULL,
	[District_Type] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Dummy_Companies]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Dummy_Companies](
	[Unique_Tax_ID] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](255) NULL,
	[District_Name] [nvarchar](255) NULL,
	[Is_Regestered] [nvarchar](255) NULL,
	[Is_Value_Added] [datetime] NULL,
	[IS_Table] [nvarchar](255) NULL,
	[FK_TaxPayer_ID_S] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Gamarek_Invoices_Details]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Gamarek_Invoices_Details](
	[DCRTNIsn] [bigint] NULL,
	[DDBIdentification] [int] NULL,
	[INVITIsn] [bigint] NULL,
	[INVITDDB] [int] NULL,
	[valueOfItem] [float] NULL,
	[INVITKgNet] [float] NULL,
	[INVITLineItemQuantity] [float] NULL,
	[UOMArabicName] [nvarchar](40) NULL,
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
	[Tax_37_Temp] [float] NULL,
	[ID]  AS ((CONVERT([varchar](50),[DCRTNIsn])+'_')+CONVERT([varchar](50),[DDBIdentification]))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Gamarek_Invoices_Master]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Gamarek_Invoices_Master](
	[DCRTNIsn] [bigint] NULL,
	[DDBIdentification] [int] NULL,
	[DCRTNMainType] [smallint] NULL,
	[Description] [nvarchar](50) NULL,
	[DCRTNYear] [smallint] NULL,
	[CCPXIsn] [bigint] NULL,
	[CCPXCode] [bigint] NULL,
	[DCRTNRegBook] [bigint] NULL,
	[DCRTNRegistrationNumber] [bigint] NULL,
	[DCRTNRegistrationDate] [datetime] NULL,
	[CSVPCode] [int] NULL,
	[CSVPName] [nvarchar](100) NULL,
	[DCRTNStatedValue] [float] NULL,
	[CCPXName] [nvarchar](255) NULL,
	[CUSTCode] [bigint] NULL,
	[CUSTArabicName] [varchar](40) NULL,
	[CDLRNumber] [bigint] NULL,
	[CDLRArabicName] [nvarchar](80) NULL,
	[CDLRAddress] [nvarchar](150) NULL,
	[appdealernum] [bigint] NULL,
	[appdealername] [nvarchar](80) NULL,
	[appdealeraddress] [nvarchar](150) NULL,
	[valueOfInvoice] [numeric](38, 12) NULL,
	[finalValue] [float] NULL,
	[importReceiptNumber] [bigint] NULL,
	[importReceiptDate] [datetime] NULL,
	[LoadingPORTArabicName] [varchar](255) NULL,
	[TaxReceiptNumber] [bigint] NULL,
	[TaxReceiptDate] [datetime] NULL,
	[TaxFlag] [int] NULL,
	[recieve_date] [datetime2](7) NULL,
	[DCRTNCrs] [smallint] NULL,
	[TaxLoss] [decimal](18, 0) NULL,
	[taxperiod]  AS (left(CONVERT([varchar],[DCRTNRegistrationDate],(112)),(6))),
	[ID]  AS ((CONVERT([varchar](50),[DCRTNIsn])+'_')+CONVERT([varchar](50),[DDBIdentification])),
	[FK_Taxperiod]  AS (concat(left(CONVERT([varchar],[DCRTNRegistrationDate],(112)),(6)),'01')),
	[FK_Artificial_Key]  AS (concat(concat(CONVERT([varchar],[CDLRNumber]),'_'),left(CONVERT([varchar],[DCRTNRegistrationDate],(112)),(6))))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Gehat_5asm_w_ta7seel]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Gehat_5asm_w_ta7seel](
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Geha_Code] [nvarchar](9) NULL,
	[Unique_Tax_Id] [nvarchar](9) NULL,
	[Geha_Name] [nvarchar](100) NULL,
	[Geha_Address] [nvarchar](100) NULL,
	[Geha_Email] [nvarchar](50) NULL,
	[Geha_Telephone] [nvarchar](20) NULL,
	[Geha_Fax] [nvarchar](20) NULL,
	[Fk_Taxpayer_Category_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Gehat_Categories]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Gehat_Categories](
	[Id] [int] NULL,
	[Category_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Invoice_Types]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Invoice_Types](
	[Inv_Type_ID] [int] NULL,
	[Inv_Type_Desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Invoices]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Invoices](
	[Invoice_Id] [uniqueidentifier] NULL,
	[Company_Taxpayer_Id] [uniqueidentifier] NULL,
	[Company_Unique_Tax_Id] [nvarchar](50) NULL,
	[Invoice_Number] [nvarchar](255) NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [numeric](19, 3) NULL,
	[Invoice_Total_Tax] [numeric](19, 3) NULL,
	[Invoice_Total_Money] [numeric](19, 3) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nvarchar](9) NULL,
	[Customer_National_Id] [nvarchar](14) NULL,
	[Customer_Mobile] [nvarchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[FK_Inv_Type_ID] [int] NULL,
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
	[FK_Sub_inv_type] [int] NULL,
	[Fk_TaxType_Id] [int] NULL,
	[Tax] [numeric](18, 2) NULL,
	[ItemType] [int] NULL,
	[SectionType] [int] NULL,
	[Discount] [numeric](19, 2) NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[InvoiceDate] [date] NULL,
	[FK_Dec_ID_S] [int] NULL,
	[Invoice_ID_S] [int] IDENTITY(1,1) NOT NULL,
	[FK_Artificial_Key]  AS (([Company_Unique_Tax_Id]+'_')+[TaxPeriod]),
	[FK_TaxPeriod_ID] [varchar](50) NULL,
	[TaxPeriod] [varchar](50) NULL,
	[cc__Customer_Artificial_Key]  AS (([Customer_Unique_Tax_Id]+'_')+[TaxPeriod]),
	[Invoice_Detail_ID] [uniqueidentifier] NULL,
	[Developed_By] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Invoices] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID_S] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Invoices_5asm_w_Ta7seel]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Invoices_5asm_w_Ta7seel](
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
	[P_Transactions_@Period] [int] NULL,
	[P_Transactions_@Year] [nvarchar](1000) NULL,
	[TaxPayerId] [nvarchar](1000) NULL,
	[GehaCode] [nvarchar](1000) NULL,
	[Year_quarter_Tax_Period] [nvarchar](1002) NULL,
	[TaxPeriodNamed] [nvarchar](1000) NULL,
	[TaxYear] [nvarchar](1000) NULL,
	[TransactionNumber] [int] NULL,
	[FinancierUniqueTaxId] [nvarchar](1000) NULL,
	[FinancierFileNumber] [nvarchar](1000) NULL,
	[FinancierName] [nvarchar](1000) NULL,
	[TransactionDate] [date] NULL,
	[TransactionPeriod] [varchar](6) NULL,
	[FK_TransactionPeriod_ID] [varchar](8) NULL,
	[TransactionTypeId] [nvarchar](1000) NULL,
	[TransactionType] [nvarchar](1000) NULL,
	[TransactionTotalValue] [float] NULL,
	[OpponentTypeId] [nvarchar](1000) NULL,
	[OpponentType] [nvarchar](1000) NULL,
	[TransactionNet] [float] NULL,
	[OpponentPercentage] [float] NULL,
	[CollectedMoney] [float] NULL,
	[CurrencyName] [nvarchar](1000) NULL,
	[FinancierNationalId] [nvarchar](1000) NULL,
	[Exemption41] [nvarchar](1000) NULL,
	[AdvancedPayment] [nvarchar](1000) NULL,
	[Geha_Unique_Tax_ID] [nchar](10) NULL,
	[FK_Artifical_Key]  AS (([FinancierUniqueTaxId]+'_')+[TransactionPeriod])
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_ItemTypes]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ItemTypes](
	[Item_Type_ID] [int] NULL,
	[Item_Type_Desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_LinkTypes]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_LinkTypes](
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_NonTable_Purchases_Details_Jason]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_NonTable_Purchases_Details_Jason](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [bigint] NULL,
	[PurchaseTypeValue] [float] NULL,
	[PurchaseTypeName] [nvarchar](60) NULL,
	[Local] [float] NULL,
	[Exported] [float] NULL,
	[TotalValue] [float] NULL,
	[Tax] [float] NULL,
	[IDS] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Dim_NonTable_Purchases_Details_Jason] PRIMARY KEY CLUSTERED 
(
	[IDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_NonTable_Sales_Details_Jason]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_NonTable_Sales_Details_Jason](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [bigint] NULL,
	[TaxTypeValue] [float] NULL,
	[TaxTypeName] [nvarchar](50) NULL,
	[Tax] [float] NULL,
	[ItemValue] [float] NULL,
	[ServiceValue] [float] NULL,
	[TotalValue] [float] NULL,
	[IDS] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Dim_NonTable_Sales_Details_Jason] PRIMARY KEY CLUSTERED 
(
	[IDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Not_Registered_TaxPayers]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Not_Registered_TaxPayers](
	[rin] [nvarchar](50) NULL,
	[regname] [nvarchar](255) NULL,
	[rn] [bigint] NULL,
	[DistrictVat_Name] [nvarchar](255) NULL,
	[DistrictVat_Code] [varchar](20) NULL,
	[Region_Name] [nvarchar](255) NULL,
	[Region_Code] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Payments]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Payments](
	[Payment_ID] [bigint] NULL,
	[rin] [varchar](10) NULL,
	[taxyrmo] [datetime] NULL,
	[Tax_vat_Value] [float] NULL,
	[Tax_Table_Value] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_ProductTypes]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ProductTypes](
	[ProductType_Id] [int] NULL,
	[Product_Description] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Region]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Region](
	[RegionCode] [varchar](3) NULL,
	[RegionName] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Sales_Region]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Sales_Region](
	[RegionCode] [varchar](3) NULL,
	[RegionName] [nvarchar](50) NULL,
	[OfficeID] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_SectionTypes]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_SectionTypes](
	[Section_Type_ID] [int] NULL,
	[Section_Type_Desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Sub_Invoice_Types]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Sub_Invoice_Types](
	[ID] [int] NULL,
	[Name] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Table_Purchases_Details_Jason]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Table_Purchases_Details_Jason](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [bigint] NULL,
	[PurchaseTypeValue] [float] NULL,
	[PurchaseTypeName] [nvarchar](140) NULL,
	[Local] [float] NULL,
	[Exported] [float] NULL,
	[TotalValue] [float] NULL,
	[Tax] [float] NULL,
	[IDS] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Dim_Table_Purchases_Details_Jason] PRIMARY KEY CLUSTERED 
(
	[IDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Table_Sales_Details_Jason]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Table_Sales_Details_Jason](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [bigint] NULL,
	[Tax] [float] NULL,
	[TaxTypeValue] [float] NULL,
	[TaxTypeName] [nvarchar](50) NULL,
	[TaxContainer] [float] NULL,
	[IDS] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Dim_Table_Sales_Details_Jason] PRIMARY KEY CLUSTERED 
(
	[IDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Table_Tax_Details_Jason]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Table_Tax_Details_Jason](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [bigint] NULL,
	[TaxTypeValue] [float] NULL,
	[TaxTypeName] [nvarchar](120) NULL,
	[Quantity] [float] NULL,
	[ItemValue] [float] NULL,
	[ServiceValue] [float] NULL,
	[TotalValue] [float] NULL,
	[Tax] [float] NULL,
	[IDS] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Dim_Table_Tax_Details_Jason] PRIMARY KEY CLUSTERED 
(
	[IDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_TaxPayer_Categories]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_TaxPayer_Categories](
	[Id] [int] NULL,
	[Category_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_TaxPayer_Types]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_TaxPayer_Types](
	[Id] [int] NULL,
	[Type_Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_TaxPayers_Universe]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_TaxPayers_Universe](
	[Unique_Tax_Id] [nvarchar](50) NOT NULL,
	[Taxpayer_Name] [nvarchar](255) NULL,
	[type] [varchar](13) NULL,
	[rownumb] [bigint] NULL,
	[IS_Registered] [bit] NULL,
	[IS_Not_Registered] [bit] NULL,
	[IS_Dummy] [bit] NULL,
	[DistrictVat_Name] [nvarchar](255) NULL,
	[Region_Name] [nvarchar](255) NULL,
	[DistrictVat_Code] [varchar](10) NULL,
	[Region_Code] [varchar](10) NULL,
	[IS_Income_Registered] [bit] NULL,
	[IS_Vat_Registred] [bit] NULL,
	[District_Name] [nvarchar](255) NULL,
	[District_Code] [varchar](10) NULL,
 CONSTRAINT [PK_Dim_TaxPayers_Universe] PRIMARY KEY CLUSTERED 
(
	[Unique_Tax_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_TaxTypes]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_TaxTypes](
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_VatTypes]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_VatTypes](
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_431394]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_431394](
	[Active] [bit] NULL,
	[FK_Declaration_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unv_bkp]    Script Date: 2/9/2022 2:35:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unv_bkp](
	[Unique_Tax_Id] [nvarchar](50) NULL,
	[Taxpayer_Name] [nvarchar](255) NULL,
	[type] [varchar](13) NULL,
	[rownumb] [bigint] NULL,
	[IS_Registered] [bit] NULL,
	[IS_Not_Registered] [bit] NULL,
	[IS_Dummy] [bit] NULL,
	[DistrictVat_Name] [nvarchar](255) NULL,
	[Region_Name] [nvarchar](255) NULL,
	[DistrictVat_Code] [varchar](10) NULL,
	[Region_Code] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_FK_TaxPeriod_ID]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_TaxPeriod_ID] ON [dbo].[Dim_Declarations]
(
	[FK_TaxPeriod_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ID&Namozag_Name]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ID&Namozag_Name] ON [dbo].[Dim_Declarations]
(
	[ID] ASC,
	[Namozag_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Update_Namozag_Name_&_ID]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Update_Namozag_Name_&_ID] ON [dbo].[Dim_Declarations]
(
	[Namozag_Name] ASC
)
INCLUDE([ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Unique_Tax_Id]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Unique_Tax_Id] ON [dbo].[Dim_Dummy_Companies]
(
	[Unique_Tax_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Unique_Tax_Id]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Unique_Tax_Id] ON [dbo].[Dim_Gehat_5asm_w_ta7seel]
(
	[Unique_Tax_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_for_update_Income]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_for_update_Income] ON [dbo].[Dim_Invoices]
(
	[FK_Inv_Type_ID] ASC,
	[Company_Unique_Tax_Id] ASC
)
INCLUDE([Product_Total_Net],[FK_Sub_inv_type],[TaxPeriod]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_FK_ID]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_ID] ON [dbo].[Dim_NonTable_Sales_Details_Jason]
(
	[FK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Rin]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Rin] ON [dbo].[Dim_Not_Registered_TaxPayers]
(
	[rin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_Dim_Registered_TaxPayers_11_1349579846__K2_K23_K56_3]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Dim_Registered_TaxPayers_11_1349579846__K2_K23_K56_3] ON [dbo].[Dim_Registered_TaxPayers]
(
	[Unique_Tax_Id] ASC,
	[DistrictVAT] ASC,
	[FK_Region_id] ASC
)
INCLUDE([Taxpayer_Name]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Unique_Tax_Id]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Unique_Tax_Id] ON [dbo].[Dim_Registered_TaxPayers]
(
	[Unique_Tax_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_FK_ID]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FK_ID] ON [dbo].[Dim_Table_Sales_Details_Jason]
(
	[FK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_UPDATE_TotalValue&FK_ID&Tax]    Script Date: 2/9/2022 2:35:06 PM ******/
CREATE NONCLUSTERED INDEX [IDX_UPDATE_TotalValue&FK_ID&Tax] ON [dbo].[Dim_Table_Tax_Details_Jason]
(
	[TotalValue] ASC
)
INCLUDE([FK_ID],[Tax]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
