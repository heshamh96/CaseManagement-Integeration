USE [Staging_Area]
GO
/****** Object:  User [CLOUD\Excel_Admin3]    Script Date: 11/27/2022 1:37:48 PM ******/
CREATE USER [CLOUD\Excel_Admin3] FOR LOGIN [CLOUD\Excel_Admin3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CLOUD\Excel_Admin4]    Script Date: 11/27/2022 1:37:48 PM ******/
CREATE USER [CLOUD\Excel_Admin4] FOR LOGIN [CLOUD\Excel_Admin4] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [python]    Script Date: 11/27/2022 1:37:48 PM ******/
CREATE USER [python] FOR LOGIN [python] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin3]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin4]
GO
ALTER ROLE [db_owner] ADD MEMBER [python]
GO
/****** Object:  Table [dbo].[Dim_TaxPayers_Registered]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_TaxPayers_Registered](
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
	[IsDataUpdated] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Dummy_Companies]    Script Date: 11/27/2022 1:37:48 PM ******/
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
/****** Object:  Table [dbo].[Gehat_5asm_ta7seel]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehat_5asm_ta7seel](
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Geha_Code] [nvarchar](9) NULL,
	[Unique_Tax_Id] [nvarchar](9) NULL,
	[Geha_Name] [nvarchar](100) NULL,
	[Geha_Address] [nvarchar](100) NULL,
	[Geha_Email] [nvarchar](50) NULL,
	[Geha_Telephone] [nvarchar](20) NULL,
	[Geha_Fax] [nvarchar](20) NULL,
	[Fk_Taxpayer_Category_Id] [int] NULL,
	[rownumb] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Sales_Master]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Sales_Master](
	[rin] [varchar](9) NULL,
	[regname] [nvarchar](60) NULL,
	[officeid] [numeric](18, 0) NULL,
	[officename] [nvarchar](60) NULL,
	[activity_level_onecd] [varchar](1) NULL,
	[activity_level_onedesc] [nvarchar](255) NULL,
	[activity_level_twocd] [varchar](2) NULL,
	[activity_level_twodesc] [nvarchar](255) NULL,
	[activity_level_threecd] [varchar](3) NULL,
	[activity_level_threedesc] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Sales_Master_2]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Sales_Master_2](
	[rin] [varchar](9) NULL,
	[officeid] [varchar](3) NULL,
	[filingcode] [varchar](3) NULL,
	[regname] [varchar](60) NULL,
	[tradename] [varchar](60) NULL,
	[addr1] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[All_Vat_Users]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[All_Vat_Users] as
select b.rin,b.regname,dv.DistrictVat_Code,dv.DistrictVat_Name,dv.District_Type,sr.RegionCode,sr.RegionName from (
select ROW_NUMBER() over (partition by rin order by rnk) as rn 
,*
from
(

select rin,officeid,regname,1 as rnk
from Dim_Sales_Master_2
union
select  rin,officeid,regname,2 as rnk
from Dim_Sales_Master
) as a) as b 
join DWH_TAX.dbo.Dim_Districts_Vat as dv on b.officeid=dv.DistrictVat_Code 
join DWH_TAX.dbo.Dim_Sales_Region sr on dv.DistrictVat_Code=sr.OfficeID  
where rn=1
GO
/****** Object:  Table [dbo].[Dim_ig_Master]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ig_Master](
	[dis_code] [varchar](3) NULL,
	[mas_file] [varchar](16) NULL,
	[mas_taxid] [varchar](9) NULL,
	[mas_name] [varchar](55) NULL,
	[mas_buld] [varchar](5) NULL,
	[mas_adress] [varchar](55) NULL,
	[mas_mail] [varchar](55) NULL,
	[mas_ownr] [varchar](1) NULL,
	[mas_st_date] [datetime] NULL,
	[mas_status] [varchar](1) NULL,
	[Print_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[All_Income_Users]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[All_Income_Users] as 
select * from (
select ROW_NUMBER() over (Partition by Unique_Tax_Id order by rnk desc ) as rn,* from (
select Unique_Tax_Id,Taxpayer_Name,District,1 as rnk 
from Dim_TaxPayers_Registered
union
select mas_taxid,mas_name,dis_code, 2 as rnk 
from Dim_ig_Master) as a
)as b join DWH_TAX.dbo.Dim_Districts dist on dist.District_Code=b.District

where rn=1 
GO
/****** Object:  View [dbo].[Hvw_Tax_Payers_Universe]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--with all_Vat_Users as(
--select * from (
--select ROW_NUMBER() over (partition by rin order by rnk) as rn 
--,*
--from
--(

--select rin,officeid,1 as rnk
--from Dim_Sales_Master_2
--union
--select  rin,officeid,2 as rnk
--from Dim_Sales_Master
--) as a) as b 
--join DWH_TAX.dbo.Dim_Districts_Vat as dv on b.officeid=dv.DistrictVat_Code 
--join DWH_TAX.dbo.Dim_Sales_Region sr on dv.DistrictVat_Code=sr.OfficeID  
--where rn=1
--)
--,
--all_Income_Users as (
--select * from (
--select ROW_NUMBER() over (Partition by Unique_Tax_Id order by rnk desc ) as rn,* from (
--select Unique_Tax_Id,District,1 as rnk 
--from Dim_TaxPayers_Registered
--union
--select mas_taxid,dis_code, 2 as rnk 
--from Dim_ig_Master) as a
--)as b join DWH_TAX.dbo.Dim_Districts dist on dist.District_Code=b.District
--where rn=1 
--)











/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[Hvw_Tax_Payers_Universe]
as
select *  from (
select 
a.Unique_Tax_Id
,a.Taxpayer_Name
,typee --collate database_Default
,a.DistrictVat_Name
,a.DistrictVat_Code
,a.RegionName
,a.RegionCode
,a.District_Code
,a.District_Name
--isnull(a.Unique_Tax_Id,rtp.Unique_Tax_Id) as Unique_Tax_Id
--,isnull(a.Taxpayer_Name,rtp.Taxpayer_Name) as Taxpayer_Name
--,typee --collate database_Default
--,isnull(a.DistrictVat_Name,dv.DistrictVat_Name) as DistrictVat_Name
--,isnull(a.DistrictVat_Code,rtp.DistrictVatt_Code) as DistrictVat_Code
--,isnull(a.RegionName,dsr.RegionName) as RegionName
--,isnull(a.RegionCode,rtp.RegionCode) as RegionCode
--,isnull(a.District_Code,rtp.Districtt_Code) as District_Code
--,isnull(a.District_Name,dst.District_Name) as District_Name
,ROW_NUMBER() over( partition by a.Unique_Tax_Id order by rnk) as rownumb from (

 

  select tp.Unique_Tax_Id
  ,tp.Taxpayer_Name
  , 'Registered' as typee 
  ,vu.DistrictVat_Name
  ,vu.DistrictVat_Code
  ,vu.RegionName
  ,vu.RegionCode
  ,iu.District_Code
  ,iu.District_Name
  ,1 as rnk
  from Staging_Area.[dbo].Dim_TaxPayers_Registered tp  
  left join all_Income_Users iu on tp.Unique_Tax_Id=iu.Unique_Tax_Id 
  left join all_Vat_Users vu on tp.Unique_Tax_Id=vu.rin
  where iu.Unique_Tax_Id is null or vu.rin is null
   --collate database_default
  
  union 


select 
isnull (iu.Unique_Tax_Id,convert (nvarchar,vu.rin)) as rin
,isnull(iu.Taxpayer_Name,vu.regname) as regname
,'Not Registred' as typee
,vu.DistrictVat_Name as DistrictVat_Name
  ,vu.DistrictVat_Code
  ,vu.RegionName
  ,vu.RegionCode
  ,iu.District_Code
  ,iu.District_Name 
  ,2 as rnk
  from  all_Income_Users iu full outer join all_Vat_Users vu on iu.Unique_Tax_Id=vu.rin
   left join Dim_TaxPayers_Registered rtp on rtp.Unique_Tax_Id=iu.Unique_Tax_Id
   where rtp.Unique_Tax_Id is null

  union 

SELECT CONVERT(nvarchar,dc.Unique_Tax_ID) as Unique_Tax_ID
      ,[Company_Name]
    ,'Dummy' as Typee
    ,vu.DistrictVat_Name as DistrictVat_Name
  ,vu.DistrictVat_Code
  ,vu.RegionName
  ,vu.RegionCode
  ,iu.District_Code
  ,iu.District_Name
  ,3 as rnk
  FROM Staging_Area.[dbo].[Dim_Dummy_Companies] dc 
  left join all_Income_Users iu on dc.Unique_Tax_ID=iu.Unique_Tax_Id
  left join all_Vat_Users vu on dc.Unique_Tax_ID=vu.rin
  where iu.Unique_Tax_Id is null or vu.rin is null
  
 union

 select geha.Unique_Tax_Id
		,Geha_Name
		,'Withholing' as Typee
		,vu.DistrictVat_Name as DistrictVat_Name
  ,vu.DistrictVat_Code
  ,vu.RegionName
  ,vu.RegionCode
  ,iu.District_Code
  ,iu.District_Name
  ,4 as rnk
 from Gehat_5asm_ta7seel geha 
 left join all_Income_Users iu on geha.Unique_Tax_Id=iu.Unique_Tax_Id
 left join all_Vat_Users vu on geha.Unique_Tax_Id=vu.rin
  where iu.Unique_Tax_Id is null or vu.rin is null

  --select rin,regname,officename
  --from Hvw_get_not_registered_taxpayer_gamarek
  ) as a 

  --left join All_Registered_TaxPayers rtp on a.Unique_Tax_Id=rtp.Unique_Tax_Id
  --left join DWH_TAX.dbo.[Dim_Districts] dst on rtp.Districtt_Code=dst.District_Code
  --left join DWH_TAX.dbo.Dim_Sales_Region dsr on rtp.DistrictVatt_Code=dsr.OfficeID
  --left join DWH_TAX.dbo.Dim_Districts_Vat dv on rtp.DistrictVatt_Code=dv.DistrictVat_Code 

  --where rin!='100065511' and rin!='100283128' and rin !='100066097' and rin not like '100%'
  --and rin not like '200%' and rin != '201134519' -- '100066003'  '100034098'  '200026402'   
  ) as b
  where rownumb=1
GO
/****** Object:  View [dbo].[Not_Registred_TaxPayers]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[Not_Registred_TaxPayers]
as 


select * from(
select * ,ROW_NUMBER() over (partition by rin order by rin) as rn
from(

select lkp.rin
,lkp.regname 
,lkp.DistrictVat_Name
,lkp.DistrictVat_Code
,lkp.RegionName
,lkp.RegionCode


from  All_Vat_Users lkp
left join Dim_TaxPayers_Registered tp on lkp.rin=tp.Unique_Tax_Id
where tp.Unique_Tax_Id is null

union

select 
dc.Unique_Tax_ID
,dc.Company_Name
,isnull(dc.District_Name,lkp.DistrictVat_Name)
,lkp.DistrictVat_Code
,lkp.RegionName
,lkp.RegionCode

from Dim_Dummy_Companies dc 
left join All_Vat_Users lkp on lkp.rin=dc.Unique_Tax_ID
left join  Dim_TaxPayers_Registered tp on dc.Unique_Tax_ID=tp.Unique_Tax_Id
where dc.Unique_Tax_Id is null


) a
) b
where rn=1
GO
/****** Object:  Table [dbo].[Staging_Declarations]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_Declarations](
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
	[Namozag_Name] [int] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Get_Final_Declaration]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[Get_Final_Declaration]
as 
select Artificial_Key,max(SendDate) as SendDate from
Staging_Declarations
where SendDate is not null
group by Artificial_Key
GO
/****** Object:  View [dbo].[All_LKP_Users]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[All_LKP_Users] as 
select * from (
select ROW_NUMBER() over (Partition BY rin order by rin) as rn
,*
from (
select 
isnull (iu.Unique_Tax_Id,convert (nvarchar,vu.rin)) as rin
,isnull(iu.Taxpayer_Name,vu.regname) as regname
--,'Not Registred' as typee
,vu.DistrictVat_Name as DistrictVat_Name
  ,vu.DistrictVat_Code
  ,vu.RegionName
  ,vu.RegionCode
  ,iu.District_Code
  ,iu.District_Name 
  --,2 as rnk
  from  all_Income_Users iu full outer join all_Vat_Users vu on iu.Unique_Tax_Id=vu.rin) as a
  )as b
  where rn=1
   --left join Dim_TaxPayers_Registered rtp on rtp.Unique_Tax_Id=iu.Unique_Tax_Id
   --where rtp.Unique_Tax_Id is null)
   

   --select rr.* from lol right join Dim_Dummy_Companies  rr on rr.Unique_Tax_ID=lol.rin 
   --where lol.rin is null
GO
/****** Object:  View [dbo].[All_Registered_TaxPayers]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[All_Registered_TaxPayers] as 
select a.*,isnull(lkp.District_Code,a.District) as Districtt_Code
,isnull(lkp.DistrictVat_Code,a.DistrictVAT) as DistrictVatt_Code
,lkp.RegionCode

from (
SELECT
ROW_NUMBER() over( partition by Unique_Tax_Id order by Unique_Tax_Id) as rownumb,
  *

FROM
  [dbo].[Dim_TaxPayers_Registered]) a join All_LKP_Users lkp  on a.Unique_Tax_Id=lkp.rin
where rownumb=1



--select * from Hvw_Tax_Payers_Universe tpu  --join rtp on tpu.Unique_Tax_Id=rtp.Unique_Tax_Id
--where tpu.District_Code is null
----and tpu.Unique_Tax_Id is null
GO
/****** Object:  View [dbo].[Hvw_Tax_Payers_Universe_new]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Hvw_Tax_Payers_Universe_new] as


select *  from (
select 
a.Unique_Tax_Id
,a.Taxpayer_Name
,typee --collate database_Default
,a.DistrictVat_Name
,a.DistrictVat_Code
,a.RegionName
,a.RegionCode
,a.District_Code
,a.District_Name
--isnull(a.Unique_Tax_Id,rtp.Unique_Tax_Id) as Unique_Tax_Id
--,isnull(a.Taxpayer_Name,rtp.Taxpayer_Name) as Taxpayer_Name
--,typee --collate database_Default
--,isnull(a.DistrictVat_Name,dv.DistrictVat_Name) as DistrictVat_Name
--,isnull(a.DistrictVat_Code,rtp.DistrictVatt_Code) as DistrictVat_Code
--,isnull(a.RegionName,dsr.RegionName) as RegionName
--,isnull(a.RegionCode,rtp.RegionCode) as RegionCode
--,isnull(a.District_Code,rtp.Districtt_Code) as District_Code
--,isnull(a.District_Name,dst.District_Name) as District_Name
,ROW_NUMBER() over( partition by a.Unique_Tax_Id order by rnk) as rownumb from (

 

  select tp.Unique_Tax_Id
  ,tp.Taxpayer_Name
  , 'Registered' as typee 
  ,lkp.DistrictVat_Name
  ,lkp.DistrictVat_Code
  ,lkp.RegionName
  ,lkp.RegionCode
  ,isnull(lkp.District_Code,tp.District) as District_Code
  ,lkp.District_Name
  ,1 as rnk
  from Staging_Area.[dbo].Dim_TaxPayers_Registered tp  
  left join All_LKP_Users lkp on tp.Unique_Tax_Id=lkp.rin
  --where lkp.rin is null --or lkp.rin is null
   --collate database_default
  
  union 


select 
convert (nvarchar,Lkp.rin) as rin
,lkp.regname as regname
,'Not Registred' as typee
  ,lkp.DistrictVat_Name as DistrictVat_Name
  ,lkp.DistrictVat_Code
  ,lkp.RegionName
  ,lkp.RegionCode
  ,lkp.District_Code
  ,lkp.District_Name 
  ,2 as rnk
  from  All_LKP_Users lkp
   left join Dim_TaxPayers_Registered rtp on rtp.Unique_Tax_Id=lkp.rin
   where rtp.Unique_Tax_Id is null

  union 

SELECT CONVERT(nvarchar,dc.Unique_Tax_ID) as Unique_Tax_ID
      ,[Company_Name]
    ,'Dummy' as Typee
  ,lkp.DistrictVat_Name as DistrictVat_Name
  ,lkp.DistrictVat_Code
  ,lkp.RegionName
  ,lkp.RegionCode
  ,lkp.District_Code
  ,lkp.District_Name
  ,3 as rnk
  FROM Staging_Area.[dbo].[Dim_Dummy_Companies] dc 
  left join All_LKP_Users lkp on lkp.rin=dc.Unique_Tax_ID
  where lkp.rin is null
  
 union

 select geha.Unique_Tax_Id
		,Geha_Name
		,'Withholing' as Typee
  ,lkp.DistrictVat_Name as DistrictVat_Name
  ,lkp.DistrictVat_Code
  ,lkp.RegionName
  ,lkp.RegionCode
  ,lkp.District_Code
  ,lkp.District_Name
  ,4 as rnk
 from Gehat_5asm_ta7seel geha 
 left join All_LKP_Users lkp on geha.Unique_Tax_Id=lkp.rin
  where lkp.rin is null --or vu.rin is null

  --select rin,regname,officename
  --from Hvw_get_not_registered_taxpayer_gamarek
  ) as a 

  --left join All_Registered_TaxPayers rtp on a.Unique_Tax_Id=rtp.Unique_Tax_Id
  --left join DWH_TAX.dbo.[Dim_Districts] dst on rtp.Districtt_Code=dst.District_Code
  --left join DWH_TAX.dbo.Dim_Sales_Region dsr on rtp.DistrictVatt_Code=dsr.OfficeID
  --left join DWH_TAX.dbo.Dim_Districts_Vat dv on rtp.DistrictVatt_Code=dv.DistrictVat_Code 

  --where rin!='100065511' and rin!='100283128' and rin !='100066097' and rin not like '100%'
  --and rin not like '200%' and rin != '201134519' -- '100066003'  '100034098'  '200026402'   
  ) as b
  where rownumb=1 and District_Code is not null
GO
/****** Object:  View [dbo].[All_Declarations]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[All_Declarations] as 
select * from (
SELECT  
	   [ID]																			
      ,[DeclarationTypeID]															
	  , trim([UniqueTaxID] collate Arabic_CI_AI)+'_'+convert(nchar(8),[TaxPeriod]) as Artificial_Key
	  ,1 as FK_VAT_Type_ID															
      ,[DocumentNum]																collate Arabic_CI_AI as [DocumentNum]
      ,[LinkCodeID]																	
      ,[TaxpayerID]																	
      ,[UniqueTaxID]																collate Arabic_CI_AI as [UniqueTaxID]
      ,[TaxPeriod]																	
	  ,convert(int,cast(TaxPeriod as varchar(10))+'01') as FK_TaxPeriod_ID			
      --,'' as TableTaxDetails														collate Arabic_CI_AI
	  ,Null as TableTaxTotal														
	  ,Null as TableTaxAdjustment													
	  ,Null as TableTaxVat															
	  --,[SalesDetails]																collate Arabic_CI_AI
      ,[SalesTotal]																	
      ,[SalesAdjustment]															
      ,[SalesVat]																	
      --,[PurchaseDetails]															collate Arabic_CI_AI
      ,[PurchaseTotal]																
      ,[PurchaseAdjustment]															
      ,[PurchaseVat]																
      ,[RecivableTax]																
      ,[DebtValue]																	
      ,[TotalTaxValue]																
      ,[ApplicantName]																collate Arabic_CI_AI as [ApplicantName]		
      ,[NationalPassNum]															collate Arabic_CI_AI as [NationalPassNum]	
      ,[IsSigned]																	collate Arabic_CI_AI as [IsSigned]			
      ,[Representitive]																collate Arabic_CI_AI as [Representitive]		
      ,[AuthorizationNumber]														collate Arabic_CI_AI as [AuthorizationNumber]
      ,[SignedDate]																	
      ,[CreationDate]																
      ,[UpdatedDate]																
      ,[IsDeleted]																	
      ,[IsSend]																		
      ,[SendDate]																	
	  ,convert(varchar(8),SendDate ,112) as Fk_Send_Date_ID							
      ,[IsPaid]																		
      ,[IsReplicated]																
      ,[PaymentDate]																
      ,[PaymentMethod]																
      ,[PersonalizeTypeID]															
      ,[ReconciliationType]															
      ,[AcceptanceDate]																
      ,[RejectionDate]																
      ,[RecoPaymentDate]															
	  ,'' as IsPaidTable															
      ,[ReconciliationValue]														
	  ,10 as Namozag_Name															
	  ,'Excel Systems' as Developed_By 												
  FROM [TaxVAT].[dbo].[NonTableVatTax]
--where TaxPeriod=?

  

  union

  SELECT  
	   [ID]																						
      ,[DeclarationTypeID]																		
	  , trim([UniqueTaxID] collate Arabic_CI_AI)+'_'+convert(nchar(8),[TaxPeriod] ) as Artificial_Key					
	  ,2 as FK_VAT_Type_ID																		
      ,[DocumentNum]																			collate Arabic_CI_AI 
      ,[LinkCodeID]																				
      ,[TaxpayerID]																				
      ,[UniqueTaxID]																			collate Arabic_CI_AI
      ,[TaxPeriod]																				
	  ,convert(int,cast(TaxPeriod as varchar(10))+'01') as FK_TaxPeriod_ID	
      --,[TableTaxDetails]																		collate Arabic_CI_AI
      ,[TableTaxTotal]																			
      ,[TableTaxAdjustment]																		
      ,[TableTaxVat]																			
      --,[SalesTableDetails]																	collate Arabic_CI_AI
      ,[SalesTableVat]																			
      ,[SalesTableAdjustment]																	
      ,[SalesTableTotal]																		
      --,[PurchaseTableDetails]																	collate Arabic_CI_AI
      ,[PurchaseTableTotal]																		
      ,[PurchaseTableAdjustment]																
      ,[PurchaseTableVat]																		
      ,[RecivableTableTax]																		
      ,[DebtTableValue]																			
      ,[TotalTableTaxValue]																		
      ,[ApplicantName]																			collate Arabic_CI_AI
      ,[NationalPassNum]																		collate Arabic_CI_AI
      ,[IsSigned]																				collate Arabic_CI_AI
      ,[Representitive]																			collate Arabic_CI_AI
      ,[AuthorizationNumber]																	collate Arabic_CI_AI
      ,[SignedDate]																				
      ,[CreationDate]																			
      ,[UpdatedDate]																			
      ,[IsDeleted]																				
      ,[IsSend]																					
      ,[SendDate]																				
	  ,convert(varchar(8),SendDate ,112) as Fk_Send_Date_ID					
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
	  ,101 as Namozag_Name																		
	  ,'Excel Systems' as Developed_By															
  FROM [TaxVAT].[dbo].[TableVatTax]
--where TaxPeriod=?

--union

--SELECT  
--	   [ID]
--      ,[DeclarationTypeID]
--	  , trim([UniqueTaxID])+'_'+convert(nchar(8),[TaxPeriod]) as Artificial_Key
--	  ,1 as FK_VAT_Type_ID
--      ,[DocumentNum]
--      ,[LinkCodeID]
--      ,[TaxpayerID]
--      ,[UniqueTaxID]
--      ,[TaxPeriod]
--	  ,convert(int,cast(TaxPeriod as varchar(10))+'01') as FK_TaxPeriod_ID
--      --,'' as TableTaxDetails
--	  ,Null as TableTaxTotal
--	  ,Null as TableTaxAdjustment
--	  ,Null as TableTaxVat
--	  --,[SalesDetails]
--      ,[SalesTotal]
--      ,[SalesAdjustment]
--      ,[SalesVat]
--      --,[PurchaseDetails]
--      ,[PurchaseTotal]
--      ,[PurchaseAdjustment]
--      ,[PurchaseVat]
--      ,[RecivableTax]
--      ,[DebtValue]
--      ,[TotalTaxValue]
--      ,[ApplicantName]
--      ,[NationalPassNum]
--      ,[IsSigned]
--      ,[Representitive]
--      ,[AuthorizationNumber]
--      ,[SignedDate]
--      ,[CreationDate]
--      ,[UpdatedDate]
--      ,[IsDeleted]
--      ,[IsSend]
--      ,[SendDate]
--	  ,convert(varchar(8),SendDate,112) as Fk_Send_Date_ID
--      ,[IsPaid]
--      ,[IsReplicated]
--      ,[PaymentDate]
--      ,[PaymentMethod]
--      ,[PersonalizeTypeID]
--      ,[ReconciliationType]
--      ,[AcceptanceDate]
--      ,[RejectionDate]
--      ,[RecoPaymentDate]
--	  ,'' as IsPaidTable
--      ,[ReconciliationValue]
--	  ,10 as Namozag_Name
--	  ,'IBM' as Developed_By 
--  FROM [Coexistence_GTA].[dbo].[NonTableVatTax]
----where TaxPeriod=?


--union
--  SELECT  
--	   [ID]
--      ,[DeclarationTypeID]
--	  , trim([UniqueTaxID])+'_'+convert(nchar(8),[TaxPeriod]) as Artificial_Key
--	  ,2 as FK_VAT_Type_ID
--      ,[DocumentNum]
--      ,[LinkCodeID]
--      ,[TaxpayerID]
--      ,[UniqueTaxID]
--      ,[TaxPeriod]
--	  ,convert(int,cast(TaxPeriod as varchar(10))+'01') as FK_TaxPeriod_ID
--      --,[TableTaxDetails]
--      ,[TableTaxTotal]
--      ,[TableTaxAdjustment]
--      ,[TableTaxVat]
--      --,[SalesTableDetails]
--      ,[SalesTableTotal]
--      ,[SalesTableAdjustment]
--      ,[SalesTableVat]
--      --,[PurchaseTableDetails]
--      ,[PurchaseTableTotal]
--      ,[PurchaseTableAdjustment]
--      ,[PurchaseTableVat]
--      ,[RecivableTableTax]
--      ,[DebtTableValue]
--      ,[TotalTableTaxValue]
--      ,[ApplicantName]
--      ,[NationalPassNum]
--      ,[IsSigned]
--      ,[Representitive]
--      ,[AuthorizationNumber]
--      ,[SignedDate]
--      ,[CreationDate]
--      ,[UpdatedDate]
--      ,[IsDeleted]
--      ,[IsSend]
--      ,[SendDate]
--	  ,convert(varchar(8),SendDate,112) as Fk_Send_Date_ID
--      ,[IsPaid]
--      ,[IsReplicated]
--      ,[PaymentDate]
--      ,[PaymentMethod]
--      ,[PersonalizeTypeID]
--      ,[ReconciliationType]
--      ,[AcceptanceDate]
--      ,[RejectionDate]
--      ,[RecoPaymentDate]
--      ,[IsPaidTable]
--      ,[ReconciliationValue]
--	  ,101 as Namozag_Name
--	  ,'IBM' as Developed_By
--  FROM Coexistence_GTA.[dbo].[TableVatTax]
----where TaxPeriod=?

) as declarations 
GO
/****** Object:  View [dbo].[PurchasesInvoices]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[PurchasesInvoices] as
select 
 [PurchaseInvoice_Id]
,[Company_Taxpayer_Id]
,[Company_Unique_Tax_Id]		collate Arabic_CI_AI as [Company_Unique_Tax_Id]
,[Invoice_Number]				collate Arabic_CI_AI as [Invoice_Number]		
,[Invoice_Date]					
,[Invoice_Total_Net]			
,[Invoice_Total_Tax]			
,[Invoice_Total_Money]			
,[Customer_Name]				collate Arabic_CI_AI as [Customer_Name]			
,[Customer_Unique_Tax_Id]		collate Arabic_CI_AI as [Customer_Unique_Tax_Id]	
,[Customer_File_Number]			collate Arabic_CI_AI as [Customer_File_Number]		
,[Customer_National_Id]			collate Arabic_CI_AI as [Customer_National_Id]		
,[Customer_Mobile]				collate Arabic_CI_AI as [Customer_Mobile]			
,[Customer_Address]				collate Arabic_CI_AI as [Customer_Address]			
,[Replicated]
,[InvoiceType]
,[IsDeleted]					
,[CreationDate]					
,[UpdatedDate]					
,[IsAPI]						
, N'Excel Systems' as Developed_By from
[TaxVAT].[dbo].PurchasesInvoices 


union


select 
 [PurchaseInvoice_Id]
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
, N'IBM' as Developed_By from
Coexistence_GTA.[dbo].PurchasesInvoices 
GO
/****** Object:  View [dbo].[PurchasesInvoicesDetails]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[PurchasesInvoicesDetails] as
select
 [PurchasesInvoicesDetails_Id] 
,[Fk_PurchasesInvoices_Id]	   
,[Product_Name]				   collate Arabic_CI_AI as [Product_Name] 
,[Product_Code]				   collate Arabic_CI_AI as [Product_Code]
,[Fk_ProductType_Id]		   
,[Product_Unit]				   collate Arabic_CI_AI as [Product_Unit]
,[Product_Unit_Price]		   
,[Product_Tax_Value]		   
,[Product_Quantity]			   
,[Product_Total_Net]		   
,[Product_Total_Tax_Value]	   
,[Product_Total_Money]		   
,[Replicated]				   
,[Fk_InvoiceType]			   
,[Fk_TaxType_Id]			   
,[Tax]						   
,[ItemType]					   
,[SectionType]				   
,[Discount]					   
,[IsDeleted]				   
,[CreationDate]				   
,[UpdatedDate]				   
,[IsAPI]					   
,[InvoiceDate]				   
from
[TaxVAT].[dbo].PurchasesInvoicesDetails 

union

select
 [PurchasesInvoicesDetails_Id]
,[Fk_PurchasesInvoices_Id]
,[Product_Name]
,[Product_Code]
,[Fk_ProductType_Id]
,[Product_Unit]
,[Product_Unit_Price]
,[Product_Tax_Value]
,[Product_Quantity]
,[Product_Total_Net]
,[Product_Total_Tax_Value]
,[Product_Total_Money]
,[Replicated]
,[Fk_InvoiceType]
,[Fk_TaxType_Id]
,[Tax]
,[ItemType]
,[SectionType]
,[Discount]
,[IsDeleted]
,[CreationDate]
,[UpdatedDate]
,[IsAPI]
,[InvoiceDate]
from
Coexistence_GTA.[dbo].PurchasesInvoicesDetails 
GO
/****** Object:  View [dbo].[Realestate]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [dbo].[Realestate] as
select tax.Taxpayer_Name,tax.National_Id,real.DisposedToName collate Arabic_100_CI_AI as DisposedToName
,
convert(varchar(14),real.DisposedToNationalID) collate Arabic_100_CI_AI as DisposedToNationalID,
case when real.[RealEstateType]=0 then 'سكني' 
when real.[RealEstateType]=1 then 'اداري'
when real.[RealEstateType]=2 then 'تجاري' 
end collate Arabic_100_CI_AI as RealEstateType,
case when real.[DispositionType]=0 then 'بيع' 
when real.[RealEstateType]=1 then 'حق انتفاع'
when real.[RealEstateType]=2 then 'هبه' 
when real.[RealEstateType]=2 then 'تبرع'
end collate Arabic_100_CI_AI as DispositionType,
convert(varchar(9),cit.CityName)+'_'+convert(varchar,real.RealEstateArea)+'_'+RealEstateStreetName+'_'+real.RealEstateStreetNumber collate Arabic_100_CI_AI as Address  , 
[RealEstateCityID],[RealEstateArea],[RealEstateStreetNumber],[RealEstateStreetName],real.RealEstateDivision,
cit.CityName,real.TaxValue,isnull(real.Paid,0) as Paid,(isnull(real.TaxValue,0)-isnull(real.Paid,0)) as Unpaid
,real.LatePaymentFees,
dis.District_Name,real.UniqueTaxID,
real.DispositionDate
from
RealEstateDisposal.dbo.RealEstateDisposition real
join 
RealEstateDisposal.dbo.Cities cit
on real.DisposedToCityID=cit.ID
join
DWH_TAX.[dbo].[Dim_Registered_TaxPayers] tax
on tax.Unique_Tax_Id=real.UniqueTaxID collate Arabic_100_CI_AI
join DWH_TAX.dbo.Dim_Districts dis
on tax.District=dis.District_Code
GO
/****** Object:  View [dbo].[SalesInvoices]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[SalesInvoices] as
select 
 [SalesInvoice_Id]
,[Company_Taxpayer_Id]
,[Company_Unique_Tax_Id]		collate Arabic_CI_AI as [Company_Unique_Tax_Id]
,[Invoice_Number]				collate Arabic_CI_AI as [Invoice_Number]		
,[Invoice_Date]					
,[Invoice_Total_Net]			
,[Invoice_Total_Tax]			
,[Invoice_Total_Money]			
,[Customer_Name]				collate Arabic_CI_AI as [Customer_Name]			
,[Customer_Unique_Tax_Id]		collate Arabic_CI_AI as [Customer_Unique_Tax_Id]	
,[Customer_File_Number]			collate Arabic_CI_AI as [Customer_File_Number]		
,[Customer_National_Id]			collate Arabic_CI_AI as [Customer_National_Id]		
,[Customer_Mobile]				collate Arabic_CI_AI as [Customer_Mobile]			
,[Customer_Address]				collate Arabic_CI_AI as [Customer_Address]			
,[Replicated]
,[InvoiceType]
,[IsDeleted]					
,[CreationDate]					
,[UpdatedDate]					
,[IsAPI]						
, N'Excel Systems' as Developed_By 
from
[TaxVAT].[dbo].SalesInvoices 
union
select 
 [SalesInvoice_Id]
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
,N'IBM' as Developed_By from
Coexistence_GTA.[dbo].SalesInvoices 
GO
/****** Object:  View [dbo].[SalesInvoicesDetails]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[SalesInvoicesDetails] as
select
 [SalesInvoicesDetails_Id]
,[Fk_SalesInvoices_Id]  
,[Product_Name]				   collate Arabic_CI_AI as [Product_Name] 
,[Product_Code]				   collate Arabic_CI_AI as [Product_Code]
,[Fk_ProductType_Id]		   
,[Product_Unit]				   collate Arabic_CI_AI as [Product_Unit]
,[Product_Unit_Price]		   
,[Product_Tax_Value]		   
,[Product_Quantity]			   
,[Product_Total_Net]		   
,[Product_Total_Tax_Value]	   
,[Product_Total_Money]		   
,[Replicated]				   
,[Fk_InvoiceType]			   
,[Fk_TaxType_Id]			   
,[Tax]						   
,[ItemType]					   
,[SectionType]				   
,[Discount]					   
,[IsDeleted]				   
,[CreationDate]				   
,[UpdatedDate]				   
,[IsAPI]					   
,[InvoiceDate]				   
from
[TaxVAT].[dbo].SalesInvoicesDetails 

union

select
 [SalesInvoicesDetails_Id]
,[Fk_SalesInvoices_Id]
,[Product_Name]
,[Product_Code]
,[Fk_ProductType_Id]
,[Product_Unit]
,[Product_Unit_Price]
,[Product_Tax_Value]
,[Product_Quantity]
,[Product_Total_Net]
,[Product_Total_Tax_Value]
,[Product_Total_Money]
,[Replicated]
,[Fk_InvoiceType]
,[Fk_TaxType_Id]
,[Tax]
,[ItemType]
,[SectionType]
,[Discount]
,[IsDeleted]
,[CreationDate]
,[UpdatedDate]
,[IsAPI]
,[InvoiceDate]
from
Coexistence_GTA.[dbo].SalesInvoicesDetails  
GO
/****** Object:  View [dbo].[SentPurshaseInvoices]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[SentPurshaseInvoices]
as 
select * from SentTables.dbo.SentPurshaseInvoices
union
select *,null as Developed_By from Sent_Tables_Try_out.dbo.SentPurshaseInvoices
GO
/****** Object:  View [dbo].[SentSalesInvoices]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[SentSalesInvoices]
as 
select * from SentTables.dbo.SentSalesInvoices
union
select *,null as Developed_By from Sent_Tables_Try_out.dbo.SentSalesInvoices
GO
/****** Object:  View [dbo].[vw_5asm_w_Ta7seel_cleansed]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/

CREATE View [dbo].[vw_5asm_w_Ta7seel_cleansed] as
SELECT --TOP (1000)
	   [Replicated]
      ,[Closed_Date]
      ,[Closed]
      ,[Last_Transaction_Number]
      ,[Total_Taxes_Money]
      ,[Total_Money]
      ,[Tax_Year]
      ,[Tax_Period]
      ,[Modification_Date]
      ,[Creation_Date]
      ,[Geha_Code]
      ,[Taxpayer_Id]
      ,[TransactionData_Id],
	  -----------------------------------------------
      Try_Cast([P_Transactions_@Period] as int) [P_Transactions_@Period]
      ,[P_Transactions_@Year]
      --,[@IsAdded]
      --,Try_Cast([@TransactionDataId] as datetime2) [@TransactionDataId] 
      ,[@TaxPayerId] as [TaxPayerId]
      ,[@GehaCode] as [GehaCode]
      ,case when [@TaxPeriod]='1' then concat([P_Transactions_@Year],'03')
			when [@TaxPeriod]='2' then concat([P_Transactions_@Year],'06')
			when [@TaxPeriod]='3' then concat([P_Transactions_@Year],'09')
			when [@TaxPeriod]='4' then concat([P_Transactions_@Year],'12')
	  	end as Year_quarter_Tax_Period
      ,[@TaxPeriodNamed] as [TaxPeriodNamed]
      ,[@TaxYear] as [TaxYear]
      --,[@TransactionId]
	  --,ROW_NUMBER() over (partition by [TransactionData_Id] order by [@TransactionDate] ) as [TransactionNumber_Sequential]
      ,try_cast([@TransactionNumber] as int)[TransactionNumber]
      ,[@FinancierUniqueTaxId] as [FinancierUniqueTaxId]
      ,[@FinancierFileNumber] as [FinancierFileNumber]
      --,[@FinancierFileNumberLPart1]
      --,[@FinancierFileNumberLPart2]
      --,[@FinancierFileNumberLPart3]
      --,[@FinancierFileNumberLPart4]
      --,[@FinancierFileNumberLPart5]
      --,[@FinancierFileNumberLPart6]
      ,[@FinancierName] as [FinancierName]
      --,[@FinancierAddress]
      --,[@TaxDistrictCode]
      --,[@TaxDistrictName]
      ,try_cast([@TransactionDate] as Date)[TransactionDate]
	  ,concat(convert(varchar(4),year([@TransactionDate])),RIGHT( '0'+convert(varchar(2),MONTH([@TransactionDate])),2)) TransactionPeriod
	  ,concat(convert(varchar(4),year([@TransactionDate])),RIGHT( '0'+convert(varchar(2),MONTH([@TransactionDate])),2))+'01' FK_TransactionPeriod_ID
     --,[@TransactionDatestr]
      ,[@TransactionTypeId] as [TransactionTypeId]
      ,[@TransactionType] as [TransactionType]
      --,[@TransactionDescription]
      --,[@TransactionPercentage]
      ,try_cast([@TransactionTotalValue]as float) [TransactionTotalValue]
      --,[@TotalValue]
      ,[@OpponentTypeId] as [OpponentTypeId]
      ,[@OpponentType] as [OpponentType]
      ,try_cast([@TransactionNet] as float) as [TransactionNet]
      ,try_cast([@OpponentPercentage] as float) as [OpponentPercentage]
      ,try_cast([@CollectedMoney] as float ) as  CollectedMoney
      --?,[@TotalCollectedMoney]
      --,[@CurrencyId] as [CurrencyId]
      ,[@CurrencyName] as [CurrencyName]
      ,[@FinancierNationalId] as [FinancierNationalId]
      --,[@SelcectedCurrencyType]
      --,[@TransactionCreationDate]
     -- ,[@TransactionModificationDate]
      ,[@Exemption41] as [Exemption41]
      ,[@AdvancedPayment] [AdvancedPayment]
      --,[@Exemption41Name]
     -- ,[@AdvancedPaymentName] as [AdvancedPaymentName]
      --,[@TransactionDetails]
  FROM [Withholdings_Flattened].[dbo].[Namozag_41]
  --where 
  ----(   [Replicated]							is not null or [Replicated]						 !='')
  ----and([Closed_Date]							is not null or [Closed_Date]						 !='')
  ----and([Closed]								is not null or [Closed]							 !='')
  ----and([Last_Transaction_Number]				is not null or [Last_Transaction_Number]			 !='')
  ----and([Total_Taxes_Money]					is not null or [Total_Taxes_Money]				 !='')
  ----and([Total_Money]							is not null or [Total_Money]						 !='')
  ----and([Tax_Year]							is not null or [Tax_Year]						 !='')
  ----and([Tax_Period]							is not null or [Tax_Period]						 !='')
  ----and([Modification_Date]					is not null or [Modification_Date]				 !='')
  ----and([Creation_Date]						is not null or [Creation_Date]					 !='')
  ----and([Geha_Code]							is not null or [Geha_Code]						 !='')
  ----and([Taxpayer_Id]							is not null or [Taxpayer_Id]						 !='')
  ----and([TransactionData_Id]					is not null or [TransactionData_Id]				 !='')
  --([P_Transactions_@Period]				is not null or [P_Transactions_@Period]			 !='')
  --and([P_Transactions_@Year]				is not null or [P_Transactions_@Year]			 !='')
  --and([@IsAdded]							is not null or [@IsAdded]						 !='')
  --and([@TransactionDataId]					is not null or [@TransactionDataId]				 !='')
  --and([@TaxPayerId]							is not null or [@TaxPayerId]						 !='')
  --and([@GehaCode]							is not null or [@GehaCode]						 !='')
  --and([@TaxPeriod]							is not null or [@TaxPeriod]						 !='')
  --and([@TaxPeriodNamed]						is not null or [@TaxPeriodNamed]					 !='')
  --and([@TaxYear]							is not null or [@TaxYear]						 !='')
  --and([@TransactionId]						is not null or [@TransactionId]					 !='')
  --and([@TransactionNumber]					is not null or [@TransactionNumber]				 !='')
  --and([@FinancierUniqueTaxId]				is not null or [@FinancierUniqueTaxId]			 !='')
  --and([@FinancierFileNumber]				is not null or [@FinancierFileNumber]			 !='')
  --and([@FinancierFileNumberLPart1]			is not null or [@FinancierFileNumberLPart1]		 !='')
  --and([@FinancierFileNumberLPart2]			is not null or [@FinancierFileNumberLPart2]		 !='')
  --and([@FinancierFileNumberLPart3]			is not null or [@FinancierFileNumberLPart3]		 !='')
  --and([@FinancierFileNumberLPart4]			is not null or [@FinancierFileNumberLPart4]		 !='')
  --and([@FinancierFileNumberLPart5]			is not null or [@FinancierFileNumberLPart5]		 !='')
  --and([@FinancierFileNumberLPart6]			is not null or [@FinancierFileNumberLPart6]		 !='')
  --and([@FinancierName]						is not null or [@FinancierName]					 !='')
  --and([@FinancierAddress]					is not null or [@FinancierAddress]				 !='')
  --and([@TaxDistrictCode]					is not null or [@TaxDistrictCode]				 !='')
  --and([@TaxDistrictName]					is not null or [@TaxDistrictName]				 !='')
  --and([@TransactionDate]					is not null or [@TransactionDate]				 !='')
  --and([@TransactionDatestr]					is not null or [@TransactionDatestr]				 !='')
  --and([@TransactionTypeId]					is not null or [@TransactionTypeId]				 !='')
  --and([@TransactionType]					is not null or [@TransactionType]				 !='')
  --and([@TransactionDescription]				is not null or [@TransactionDescription]			 !='')
  --and([@TransactionPercentage]				is not null or [@TransactionPercentage]			 !='')
  --and([@TransactionTotalValue]				is not null or [@TransactionTotalValue]			 !='')
  --and([@TotalValue]							is not null or [@TotalValue]						 !='')
  --and([@OpponentTypeId]						is not null or [@OpponentTypeId]					 !='')
  --and([@OpponentType]						is not null or [@OpponentType]					 !='')
  --and([@TransactionNet]						is not null or [@TransactionNet]					 !='')
  --and([@OpponentPercentage]					is not null or [@OpponentPercentage]				 !='')
  --and([@CollectedMoney]						is not null or [@CollectedMoney]					 !='')
  --and([@TotalCollectedMoney]				is not null or [@TotalCollectedMoney]			 !='')
  --and([@CurrencyId]							is not null or [@CurrencyId]						 !='')
  --and([@CurrencyName]						is not null or [@CurrencyName]					 !='')
  --and([@FinancierNationalId]				is not null or [@FinancierNationalId]			 !='')
  --and([@SelcectedCurrencyType]				is not null or [@SelcectedCurrencyType]			 !='')
  --and([@TransactionCreationDate]			is not null or [@TransactionCreationDate]		 !='')
  --and([@TransactionModificationDate]		is not null or [@TransactionModificationDate]	 !='')
  --and([@Exemption41]						is not null or [@Exemption41]					 !='')
  --and([@AdvancedPayment]					is not null or [@AdvancedPayment]				 !='')
  --and([@Exemption41Name]					is not null or [@Exemption41Name]				 !='')
  --and([@AdvancedPaymentName]				is not null or [@AdvancedPaymentName]			 !='')
  --and([@TransactionDetails]					is not null or [@TransactionDetails]				 !='')
GO
/****** Object:  View [dbo].[vw_5asm_w_Ta7seel_cleansed_New_Implementation]    Script Date: 11/27/2022 1:37:48 PM ******/
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
/****** Object:  View [dbo].[vw_Income_102]    Script Date: 11/27/2022 1:37:48 PM ******/
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
/****** Object:  View [dbo].[vw_Income_106]    Script Date: 11/27/2022 1:37:48 PM ******/
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
/****** Object:  View [dbo].[vw_Income_Duplicates_of_102_106]    Script Date: 11/27/2022 1:37:48 PM ******/
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
from DWH_TAX.dbo.Dim_Dec_IncomeTax_102--vw_Income_102
union all
select Unique_Tax_ID,CreationDate,DeclarationYear, Unique_Tax_ID+'_'+DeclarationYear as AK,106 as type
from DWH_TAX.dbo.Dim_Dec_IncomeTax_106--vw_Income_106
) as rs1
where ak in (select  a.Unique_Tax_ID+'_'+a.DeclarationYear as AK 
					from DWH_TAX.dbo.Dim_Dec_IncomeTax_102/*vw_Income_102*/ a join DWH_TAX.dbo.Dim_Dec_IncomeTax_106 /*vw_Income_106*/ b 
						on a.Unique_Tax_ID=b.Unique_Tax_ID and 
						a.DeclarationYear=b.DeclarationYear)
				    )as rs2
						) as rs3
						where rn=1
GO
/****** Object:  Table [dbo].[Declaration_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declaration_Details](
	[ID] [uniqueidentifier] NULL,
	[FK_Detail_Type] [int] NULL,
	[TaxTypeValue] [float] NULL,
	[TaxTypeName] [nvarchar](60) NULL,
	[ItemValue] [float] NULL,
	[ServiceValue] [float] NULL,
	[TotalValue] [float] NULL,
	[Tax] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Declarations_Final]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declarations_Final](
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
	[Namozag_Name] [int] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Payments]    Script Date: 11/27/2022 1:37:48 PM ******/
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
/****** Object:  Table [dbo].[IncomeTax_102_Flattened]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeTax_102_Flattened](
	[DeclarationNum] [int] NULL,
	[AcceptanceDate] [datetime] NULL,
	[AccountantId] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[IsAccepted] [bit] NULL,
	[PaymentTypeID] [int] NULL,
	[PaidMoney] [numeric](18, 2) NULL,
	[ViewSnapshot] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[DeclarationType] [int] NULL,
	[DeclarationYear] [int] NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[NetProfitDeclarationID] [uniqueidentifier] NULL,
	[Declaration.Details.@UniqueTaxID] [nvarchar](50) NULL,
	[Declaration.Details.@TaxPerioudddFrom] [bigint] NULL,
	[Declaration.Details.@TaxPerioudmmFrom] [bigint] NULL,
	[Declaration.Details.@TaxPerioudyyFrom] [bigint] NULL,
	[Declaration.Details.@TaxPerioudddTo] [bigint] NULL,
	[Declaration.Details.@TaxPerioudmmTo] [bigint] NULL,
	[Declaration.Details.@TaxPerioudyyTo] [bigint] NULL,
	[Declaration.Details.@_006_SalesValue] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_NonTable_Purchases_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_NonTable_Purchases_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[PurchaseTypeValue] [nvarchar](1000) NULL,
	[PurchaseTypeName] [nvarchar](1000) NULL,
	[Local] [nvarchar](1000) NULL,
	[Exported] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_NonTable_Sales_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_NonTable_Sales_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[json_Table_Purchases_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_Table_Purchases_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[PurchaseTypeValue] [nvarchar](1000) NULL,
	[PurchaseTypeName] [nvarchar](1000) NULL,
	[Local] [nvarchar](1000) NULL,
	[Exported] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_Table_Sales_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_Table_Sales_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[TaxTypeValue] [nvarchar](1000) NULL,
	[TaxTypeName] [nvarchar](1000) NULL,
	[TaxContainer] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[json_Table_Tax_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[json_Table_Tax_Details](
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[FK_ID] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[LastIqrarSentOfTaxpayer2020]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastIqrarSentOfTaxpayer2020](
	[TaxPeriod] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[EQRID] [uniqueidentifier] NOT NULL,
	[TotalTaxValue] [numeric](18, 2) NULL,
	[SalesTotal] [numeric](18, 2) NULL,
	[SalesAdjustment] [numeric](18, 2) NULL,
	[SalesVat] [numeric](18, 2) NULL,
	[PurchaseTotal] [numeric](18, 2) NULL,
	[PurchaseAdjustment] [numeric](18, 2) NULL,
	[PurchaseVat] [numeric](18, 2) NULL,
	[SendDate] [datetime] NULL,
	[DeclarationTypeID] [int] NULL,
	[TableTaxTotal] [numeric](18, 2) NULL,
	[TableTaxAdjustment] [numeric](18, 2) NULL,
	[TableTaxVat] [numeric](18, 2) NULL,
	[VatType] [nchar](10) NULL,
	[Rk] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[new_Ma2moreyat_with_its_users]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[new_Ma2moreyat_with_its_users](
	[rin] [int] NOT NULL,
	[regname] [nvarchar](100) NOT NULL,
	[officeid] [int] NOT NULL,
	[officename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_new_Ma2moreyat_with_its_users] PRIMARY KEY CLUSTERED 
(
	[rin] ASC,
	[regname] ASC,
	[officeid] ASC,
	[officename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NonTable_Purchases_Details_Jason]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonTable_Purchases_Details_Jason](
	[Developed_By] [varchar](50) NULL,
	[ExtractedDate] [datetime] NULL,
	[IsExtracted] [bit] NULL,
	[InquiryTransAmountVAT] [numeric](18, 2) NULL,
	[ReconciliationValue] [numeric](18, 2) NULL,
	[RecoPaymentDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[AcceptanceDate] [datetime] NULL,
	[ReconciliationType] [int] NULL,
	[PersonalizeTypeID] [int] NULL,
	[PaymentMethod] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[IsReplicated] [bit] NULL,
	[IsPaid] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[SignedDate] [date] NULL,
	[AuthorizationNumber] [nvarchar](50) NULL,
	[Representitive] [nvarchar](50) NULL,
	[IsSigned] [nvarchar](100) NULL,
	[NationalPassNum] [nvarchar](50) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[TotalTaxValue] [numeric](18, 2) NULL,
	[DebtValue] [numeric](18, 2) NULL,
	[RecivableTax] [numeric](18, 2) NULL,
	[PurchaseVat] [numeric](18, 2) NULL,
	[PurchaseAdjustment] [numeric](18, 2) NULL,
	[PurchaseTotal] [numeric](18, 2) NULL,
	[SalesVat] [numeric](18, 2) NULL,
	[SalesAdjustment] [numeric](18, 2) NULL,
	[SalesTotal] [numeric](18, 2) NULL,
	[SalesDetails] [nvarchar](max) NULL,
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[LinkCodeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[DeclarationTypeID] [int] NULL,
	[JSON Parser Transform 1.ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[NonTableVatID] [nvarchar](1000) NULL,
	[PurchaseTypeValue] [nvarchar](1000) NULL,
	[PurchaseTypeName] [nvarchar](1000) NULL,
	[Local] [nvarchar](1000) NULL,
	[Exported] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL,
	[NonTable_Purchases_Details_Jason.ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NonTable_Sales_Details_Jason]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonTable_Sales_Details_Jason](
	[Developed_By] [varchar](50) NULL,
	[TotalTaxValue] [numeric](18, 2) NULL,
	[DebtValue] [numeric](18, 2) NULL,
	[RecivableTax] [numeric](18, 2) NULL,
	[PurchaseVat] [numeric](18, 2) NULL,
	[PurchaseAdjustment] [numeric](18, 2) NULL,
	[PurchaseTotal] [numeric](18, 2) NULL,
	[PurchaseDetails] [nvarchar](max) NULL,
	[SalesVat] [numeric](18, 2) NULL,
	[SalesAdjustment] [numeric](18, 2) NULL,
	[SalesTotal] [numeric](18, 2) NULL,
	[ExtractedDate] [datetime] NULL,
	[IsExtracted] [bit] NULL,
	[InquiryTransAmountVAT] [numeric](18, 2) NULL,
	[ReconciliationValue] [numeric](18, 2) NULL,
	[RecoPaymentDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[AcceptanceDate] [datetime] NULL,
	[ReconciliationType] [int] NULL,
	[PersonalizeTypeID] [int] NULL,
	[PaymentMethod] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[IsReplicated] [bit] NULL,
	[IsPaid] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[SignedDate] [date] NULL,
	[AuthorizationNumber] [nvarchar](50) NULL,
	[Representitive] [nvarchar](50) NULL,
	[IsSigned] [nvarchar](100) NULL,
	[NationalPassNum] [nvarchar](50) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[LinkCodeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[DeclarationTypeID] [int] NULL,
	[JSON Parser Transform 1 1.ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[TableVatID] [nvarchar](1000) NULL,
	[TaxTypeValue] [nvarchar](1000) NULL,
	[TaxTypeName] [nvarchar](1000) NULL,
	[TaxContainer] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL,
	[NonTableVatID] [nvarchar](1000) NULL,
	[ItemValue] [nvarchar](1000) NULL,
	[ServiceValue] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[NonTable_Sales_Details_Jason.ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Master_Stage]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Master_Stage](
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
/****** Object:  Table [dbo].[Sales_Master_Stage]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Master_Stage](
	[SalesInvoice_Id] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[SentPurchasesInvoices_Stage]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentPurchasesInvoices_Stage](
	[ID] [uniqueidentifier] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[PurchaseInvoiceID] [uniqueidentifier] NULL,
	[PurchaseInvoiceDetailsID] [uniqueidentifier] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsReplicated] [bit] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentSalesInvoices_Stage]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentSalesInvoices_Stage](
	[ID] [uniqueidentifier] NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[SalesInvoiceID] [uniqueidentifier] NULL,
	[SalesInvoiceDetailsID] [uniqueidentifier] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsReplicated] [bit] NULL,
	[Developed_By] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_Purchase_Invoice_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_Purchase_Invoice_Details](
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
/****** Object:  Table [dbo].[STG_Sales_Invoice_Details]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_Sales_Invoice_Details](
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
	[InvoiceDate] [date] NULL,
	[InvoiceDate2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Purchases_Details_Jason]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Purchases_Details_Jason](
	[Developed_By] [varchar](50) NULL,
	[ExtractedDate] [datetime] NULL,
	[IsExtracted] [bit] NULL,
	[InquiryTransAmountTVAT] [numeric](18, 2) NULL,
	[InquiryTransAmountVAT] [numeric](18, 2) NULL,
	[ReconciliationValue] [numeric](18, 2) NULL,
	[IsPaidTable] [bit] NULL,
	[RecoPaymentDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[AcceptanceDate] [datetime] NULL,
	[ReconciliationType] [int] NULL,
	[PersonalizeTypeID] [int] NULL,
	[PaymentMethod] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[IsReplicated] [bit] NULL,
	[IsPaid] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[SignedDate] [date] NULL,
	[AuthorizationNumber] [nvarchar](50) NULL,
	[Representitive] [nvarchar](50) NULL,
	[IsSigned] [nvarchar](100) NULL,
	[NationalPassNum] [nvarchar](50) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[TotalTableTaxValue] [numeric](18, 2) NULL,
	[DebtTableValue] [numeric](18, 2) NULL,
	[RecivableTableTax] [numeric](18, 2) NULL,
	[PurchaseTableVat] [numeric](18, 2) NULL,
	[PurchaseTableAdjustment] [numeric](18, 2) NULL,
	[PurchaseTableTotal] [numeric](18, 2) NULL,
	[SalesTableVat] [numeric](18, 2) NULL,
	[SalesTableAdjustment] [numeric](18, 2) NULL,
	[SalesTableTotal] [numeric](18, 2) NULL,
	[SalesTableDetails] [nvarchar](max) NULL,
	[TableTaxVat] [numeric](18, 2) NULL,
	[TableTaxAdjustment] [numeric](18, 2) NULL,
	[TableTaxTotal] [numeric](18, 2) NULL,
	[TableTaxDetails] [nvarchar](max) NULL,
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[LinkCodeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[DeclarationTypeID] [int] NULL,
	[JSON Parser Transform 1 2.ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[TableVatID] [nvarchar](1000) NULL,
	[PurchaseTypeValue] [nvarchar](1000) NULL,
	[PurchaseTypeName] [nvarchar](1000) NULL,
	[Local] [nvarchar](1000) NULL,
	[Exported] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL,
	[Table_Purchases_Details_Jason.ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Sales_Details_Jason]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Sales_Details_Jason](
	[Developed_By] [varchar](50) NULL,
	[ExtractedDate] [datetime] NULL,
	[IsExtracted] [bit] NULL,
	[InquiryTransAmountTVAT] [numeric](18, 2) NULL,
	[InquiryTransAmountVAT] [numeric](18, 2) NULL,
	[ReconciliationValue] [numeric](18, 2) NULL,
	[IsPaidTable] [bit] NULL,
	[RecoPaymentDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[AcceptanceDate] [datetime] NULL,
	[ReconciliationType] [int] NULL,
	[PersonalizeTypeID] [int] NULL,
	[PaymentMethod] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[IsReplicated] [bit] NULL,
	[IsPaid] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[SignedDate] [date] NULL,
	[AuthorizationNumber] [nvarchar](50) NULL,
	[Representitive] [nvarchar](50) NULL,
	[IsSigned] [nvarchar](100) NULL,
	[NationalPassNum] [nvarchar](50) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[TotalTableTaxValue] [numeric](18, 2) NULL,
	[DebtTableValue] [numeric](18, 2) NULL,
	[RecivableTableTax] [numeric](18, 2) NULL,
	[PurchaseTableVat] [numeric](18, 2) NULL,
	[PurchaseTableAdjustment] [numeric](18, 2) NULL,
	[PurchaseTableTotal] [numeric](18, 2) NULL,
	[PurchaseTableDetails] [nvarchar](max) NULL,
	[SalesTableVat] [numeric](18, 2) NULL,
	[SalesTableAdjustment] [numeric](18, 2) NULL,
	[SalesTableTotal] [numeric](18, 2) NULL,
	[TableTaxVat] [numeric](18, 2) NULL,
	[TableTaxAdjustment] [numeric](18, 2) NULL,
	[TableTaxTotal] [numeric](18, 2) NULL,
	[TableTaxDetails] [nvarchar](max) NULL,
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[LinkCodeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[DeclarationTypeID] [int] NULL,
	[JSON Parser Transform 1.ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[TableVatID] [nvarchar](1000) NULL,
	[TaxTypeValue] [nvarchar](1000) NULL,
	[TaxTypeName] [nvarchar](1000) NULL,
	[TaxContainer] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL,
	[Table_Sales_Details_Jason.ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Tax_Details_Jason]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Tax_Details_Jason](
	[Developed_By] [varchar](50) NULL,
	[ExtractedDate] [datetime] NULL,
	[IsExtracted] [bit] NULL,
	[InquiryTransAmountTVAT] [numeric](18, 2) NULL,
	[InquiryTransAmountVAT] [numeric](18, 2) NULL,
	[ReconciliationValue] [numeric](18, 2) NULL,
	[IsPaidTable] [bit] NULL,
	[RecoPaymentDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[AcceptanceDate] [datetime] NULL,
	[ReconciliationType] [int] NULL,
	[PersonalizeTypeID] [int] NULL,
	[PaymentMethod] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[IsReplicated] [bit] NULL,
	[IsPaid] [bit] NULL,
	[SendDate] [datetime] NULL,
	[IsSend] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[SignedDate] [date] NULL,
	[AuthorizationNumber] [nvarchar](50) NULL,
	[Representitive] [nvarchar](50) NULL,
	[IsSigned] [nvarchar](100) NULL,
	[NationalPassNum] [nvarchar](50) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[TotalTableTaxValue] [numeric](18, 2) NULL,
	[DebtTableValue] [numeric](18, 2) NULL,
	[RecivableTableTax] [numeric](18, 2) NULL,
	[PurchaseTableVat] [numeric](18, 2) NULL,
	[PurchaseTableAdjustment] [numeric](18, 2) NULL,
	[PurchaseTableTotal] [numeric](18, 2) NULL,
	[PurchaseTableDetails] [nvarchar](max) NULL,
	[SalesTableVat] [numeric](18, 2) NULL,
	[SalesTableAdjustment] [numeric](18, 2) NULL,
	[SalesTableTotal] [numeric](18, 2) NULL,
	[SalesTableDetails] [nvarchar](max) NULL,
	[TableTaxVat] [numeric](18, 2) NULL,
	[TableTaxAdjustment] [numeric](18, 2) NULL,
	[TableTaxTotal] [numeric](18, 2) NULL,
	[TaxPeriod] [int] NULL,
	[UniqueTaxID] [nvarchar](9) NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[LinkCodeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[DeclarationTypeID] [int] NULL,
	[JSON Parser Transform.ID] [uniqueidentifier] NULL,
	[Id] [nvarchar](1000) NULL,
	[TableVatID] [nvarchar](1000) NULL,
	[TaxTypeValue] [nvarchar](1000) NULL,
	[TaxTypeName] [nvarchar](1000) NULL,
	[Quantity] [nvarchar](1000) NULL,
	[ItemValue] [nvarchar](1000) NULL,
	[ServiceValue] [nvarchar](1000) NULL,
	[TotalValue] [nvarchar](1000) NULL,
	[Tax] [nvarchar](1000) NULL,
	[Table_Tax_Details_Jason.ID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAX_VAT_DUMMY_COMPANIES]    Script Date: 11/27/2022 1:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAX_VAT_DUMMY_COMPANIES](
	[Unique_Tax_ID] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](255) NULL,
	[District_Name] [nvarchar](255) NULL,
	[Is_Regestered] [nvarchar](255) NULL,
	[Is_Value_Added] [datetime] NULL,
	[IS_Table] [nvarchar](255) NULL,
	[FK_TaxPayer_ID_S] [nvarchar](255) NULL
) ON [PRIMARY]
GO
