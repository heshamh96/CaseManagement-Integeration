USE [Sent_Tables_Try_out]
GO
/****** Object:  Table [dbo].[Declarations_Finalll]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declarations_Finalll](
	[ID] [uniqueidentifier] NOT NULL,
	[ak] [nvarchar](22) NOT NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[SendDate] [datetime] NULL,
	[TaxPeriod] [int] NULL,
	[DeclarationTypeID] [int] NULL,
	[SalesTotal] [decimal](18, 2) NULL,
	[SalesAdjustment] [decimal](18, 2) NULL,
	[SalesVat] [decimal](18, 2) NULL,
	[PurchaseTotal] [decimal](18, 2) NULL,
	[PurchaseAdjustment] [decimal](18, 2) NULL,
	[PurchaseVat] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[test_sent_purchases]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE  view [dbo].[test_sent_purchases] as
SELECT top 1000 dc.*--,sinvp.IsDeleted
     
  FROM [Sent_Tables_Try_out].[dbo].[Declarations_Finalll] dc
 -- join TaxVAT.dbo.SentPurshaseInvoices pinv on dc.ID=pinv.TaxVatDecID--joining with all the current sent
  join TaxVAT.[dbo].PurchasesInvoices sinvp
  on dc.ak=sinvp.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),Invoice_Date,112)-- joining only with the invoices
  where CONVERT(varchar(6),Invoice_Date,112) like'%2019%'
    --or CONVERT(varchar(6),Invoice_Date,112) like'%2020%'
  and sinvp.IsDeleted=0
  and dc.SendDate>=sinvp.CreationDate
  order by dc.TaxPeriod
GO
/****** Object:  Table [dbo].[Declarations_Backup]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declarations_Backup](
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
	[Submission_Delay] [int] NULL,
	[FK_SSEND_DDATE] [date] NULL,
	[Developed_By] [varchar](50) NULL,
	[est5las_Sales_Is_Correct] [bit] NULL,
	[Namozag_Name] [int] NULL,
	[SalesNet] [numeric](18, 2) NULL,
	[SalesTableNet] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Declarations_Final]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declarations_Final](
	[ID] [uniqueidentifier] NOT NULL,
	[ak] [nvarchar](22) NOT NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[SendDate] [datetime] NULL,
	[TaxPeriod] [int] NULL,
	[DeclarationTypeID] [int] NULL,
	[SalesTotal] [decimal](18, 2) NULL,
	[SalesAdjustment] [decimal](18, 2) NULL,
	[SalesVat] [decimal](18, 2) NULL,
	[PurchaseTotal] [decimal](18, 2) NULL,
	[PurchaseAdjustment] [decimal](18, 2) NULL,
	[PurchaseVat] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Declarations_SCD_Backup]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declarations_SCD_Backup](
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
	[Dec_ID_S] [int] NOT NULL,
	[Submission_Delay] [int] NULL,
	[FK_SSEND_DDATE] [date] NULL,
	[Developed_By] [varchar](50) NULL,
	[Namozag_Name] [int] NULL,
	[Version] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentPurshaseInvoices]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentPurshaseInvoices](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[PurchaseInvoiceID] [uniqueidentifier] NULL,
	[PurchaseInvoiceDetailsID] [uniqueidentifier] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsReplicated] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentPurshaseInvoices_inc]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentPurshaseInvoices_inc](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[PurchaseInvoiceID] [uniqueidentifier] NULL,
	[PurchaseInvoiceDetailsID] [uniqueidentifier] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsReplicated] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentSalesInvoices]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentSalesInvoices](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[SalesInvoiceID] [uniqueidentifier] NULL,
	[SalesInvoiceDetailsID] [uniqueidentifier] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsReplicated] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentSalesInvoices_inc]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentSalesInvoices_inc](
	[ID] [uniqueidentifier] NOT NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[TaxVatDecID] [uniqueidentifier] NULL,
	[SalesInvoiceID] [uniqueidentifier] NULL,
	[SalesInvoiceDetailsID] [uniqueidentifier] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsReplicated] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[all_declaraitons_with_no_invoices]    Script Date: 6/28/2022 7:39:45 PM ******/
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
where
 SendDate is not null
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
where
 SendDate is not null
--UniqueTaxID='557762456'and
 --TaxPeriod in ('202001','202002','202003')
--and Active=1


)
---------
,temp as(
select ak,max(ad.SendDate) as mx
from all_declarations ad
where
 SendDate is not null
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
/****** Object:  StoredProcedure [dbo].[all_declaraitons_with_no_invoices_loop]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declaraitons_with_no_invoices_loop] @Period varchar(6) 
as
--truncate table [Sent_Tables_Try_out].[dbo].[Declarations_Final];


with all_declarations as (
select ID,concat(trim(UniqueTaxID collate Arabic_CI_AI),concat('_',TaxPeriod)) as ak
,UniqueTaxID collate Arabic_CI_AI as UniqueTaxID
,SendDate
,TaxPeriod
,[DeclarationTypeID]
,[SalesTotal],[SalesAdjustment],[SalesVat]
,[PurchaseTotal],[PurchaseAdjustment],[PurchaseVat]
from [TaxVAT].dbo.NonTableVatTax
where TaxPeriod=@Period
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
where TaxPeriod=@Period and
 SendDate is not null
--where 
--UniqueTaxID='557762456'and
 --TaxPeriod in ('202001','202002','202003')
--and Active=1


)
---------
,temp as(
select ak,max(ad.SendDate) as mx
from all_declarations ad
where
 SendDate is not null
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
/****** Object:  StoredProcedure [dbo].[all_declaraitons_with_no_invoices_The_Rest]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declaraitons_with_no_invoices_The_Rest] as
truncate table [Sent_Tables_Try_out].[dbo].[Declarations_Finalll];


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

--insert into [Sent_Tables_Try_out].dbo.Declarations_Final 
--select  * --into [Sent_Tables_Try_out].dbo.Declarations_Final 
--from final_declaraions fd
--where 
--fd.ID not in 
--(select distinct [TaxVatDecID] from [SentTables].[dbo].[SentPurshaseInvoices]
--union 
--select distinct [TaxVatDecID] from [SentTables].[dbo].[SentSalesInvoices])


insert into [Sent_Tables_Try_out].dbo.Declarations_Finalll 
select  * --into [Sent_Tables_Try_out].dbo.Declarations_Final 
from final_declaraions fd
where 
fd.ID not in 
(select distinct [TaxVatDecID] from SentTables.[dbo].[SentPurshaseInvoices]
union 
select distinct [TaxVatDecID] from SentTables.[dbo].[SentSalesInvoices])
GO
/****** Object:  StoredProcedure [dbo].[all_declaraitons_with_no_invoices_The_Rest_Loop]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declaraitons_with_no_invoices_The_Rest_Loop] @Period varchar(6) 
as
--truncate table [Sent_Tables_Try_out].[dbo].[Declarations_Finalll];


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
 where TaxPeriod=@Period
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
where TaxPeriod=@Period 

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

--insert into [Sent_Tables_Try_out].dbo.Declarations_Final 
--select  * --into [Sent_Tables_Try_out].dbo.Declarations_Final 
--from final_declaraions fd
--where 
--fd.ID not in 
--(select distinct [TaxVatDecID] from [SentTables].[dbo].[SentPurshaseInvoices]
--union 
--select distinct [TaxVatDecID] from [SentTables].[dbo].[SentSalesInvoices])


insert into [Sent_Tables_Try_out].dbo.Declarations_Finalll 
select  * --into [Sent_Tables_Try_out].dbo.Declarations_Final 
from final_declaraions fd
where 
fd.ID not in 
(select distinct [TaxVatDecID] from SentTables.[dbo].[SentPurshaseInvoices]
union 
select distinct [TaxVatDecID] from SentTables.[dbo].[SentSalesInvoices])
GO
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion] -- @Period varchar(6)
as 
--truncate table [Sent_Tables_Try_out].dbo.SentPurshaseInvoices ;
with equrar as(
select * from [Sent_Tables_Try_out].dbo.Declarations_Final fd 
--where --UniqueTaxID='100270468' and 
--TaxPeriod=@Period
)
,fawateer as(
--select *,sum(pttv)over( order by CreationDate asc) acc_pttv from(
select a.PurchaseInvoice_Id,/*b.PurchasesInvoicesDetails_Id,*/a.CreationDate 
,a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) as fk_Ak,a.Company_Unique_Tax_Id as unique_tax_id

from TaxVAT.dbo.PurchasesInvoices a  
--join PurchasesInvoicesDetails b 
--on a.PurchaseInvoice_Id=b.Fk_PurchasesInvoices_Id
where --a.Company_Unique_Tax_Id='100270468' and 
--CONVERT(varchar(6),a.Invoice_Date,112) = @Period and 
a.IsDeleted=0
--and b.IsDeleted=0
--and a.CreationDate not in(2,3)
--group by a.PurchaseInvoice_Id,a.CreationDate
--) x
)

insert into [Sent_Tables_Try_out].dbo.SentPurshaseInvoices (
[ID]
--,[TaxpayerID]
,[TaxVatDecID]
,[PurchaseInvoiceID]
--,[PurchaseInvoiceDetailsID]
,CreationDate
)
select distinct newid() as id,/*rtp.Taxpayer_Id,*/a.ID,b.PurchaseInvoice_Id,/*b.PurchasesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.ak=b.fk_Ak collate database_Default
--join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
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
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion_loop]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declarations_with_no_invoices_sent_purchases_insertion_loop] @Period varchar(6)
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

from TaxVAT.dbo.PurchasesInvoices a  
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
--,[TaxpayerID]
,[TaxVatDecID]
,[PurchaseInvoiceID]
--,[PurchaseInvoiceDetailsID]
,CreationDate
)
select distinct newid() as id,/*rtp.Taxpayer_Id,*/a.ID,b.PurchaseInvoice_Id,/*b.PurchasesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.ak=b.fk_Ak collate database_Default
--join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
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
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion] --@Period varchar(6)

as 
--truncate table [Sent_Tables_Try_out].dbo.SentSalesInvoices ;
with equrar as(
select * from [Sent_Tables_Try_out].dbo.Declarations_Final fd 
--where --UniqueTaxID='100270468' and 
--TaxPeriod=@Period
)
,fawateer as(
--select *,sum(pttv)over( order by CreationDate asc) acc_pttv from(
select a.SalesInvoice_Id,/*b.SalesInvoicesDetails_Id,*/a.CreationDate 
,a.Company_Unique_Tax_Id+'_'+CONVERT(varchar(6),a.Invoice_Date,112) as fk_Ak,a.Company_Unique_Tax_Id as unique_tax_id

from TaxVAT.dbo.SalesInvoices a 
--join SalesInvoicesDetails b 
--on a.SalesInvoice_Id=b.Fk_SalesInvoices_Id 
where --a.Company_Unique_Tax_Id='100270468' and 
--CONVERT(varchar(6),a.Invoice_Date,112) = @Period and
 a.IsDeleted=0
--and b.IsDeleted=0
--and a.CreationDate not in(2,3)
--group by a.PurchaseInvoice_Id,a.CreationDate
--) x
)

insert into [Sent_Tables_Try_out].dbo.SentSalesInvoices(
ID
--,[TaxpayerID]
,[TaxVatDecID]
,SalesInvoiceID
--,SalesInvoiceDetailsID
,CreationDate
)
select distinct newid() as id,/*rtp.Taxpayer_Id,*/a.ID,b.SalesInvoice_Id,/*b.SalesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.ak=b.fk_Ak collate database_Default
--join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
left join (select distinct SalesInvoiceID,TaxVatDecID from SentTables.dbo.SentSalesInvoices) as ssik 
on b.SalesInvoice_Id=ssik.SalesInvoiceID and a.ID=ssik.TaxVatDecID
where a.SendDate>=b.CreationDate
and ssik.SalesInvoiceID is null
and ssik.TaxVatDecID is null
GO
/****** Object:  StoredProcedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion_loop]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[all_declarations_with_no_invoices_sent_sales_insertion_loop] @Period varchar(6)

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

from TaxVAT.dbo.SalesInvoices a 
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
--,[TaxpayerID]
,[TaxVatDecID]
,SalesInvoiceID
--,SalesInvoiceDetailsID
,CreationDate
)
select distinct newid() as id,/*rtp.Taxpayer_Id,*/a.ID,b.SalesInvoice_Id,/*b.SalesInvoicesDetails_Id,*/b.CreationDate 
from fawateer b join equrar a on a.ak=b.fk_Ak collate database_Default
--join DWH_TAX.dbo.Dim_Registered_TaxPayers rtp on rtp.Unique_Tax_Id=a.UniqueTaxID collate database_default
left join (select distinct SalesInvoiceID,TaxVatDecID from SentTables.dbo.SentSalesInvoices) as ssik 
on b.SalesInvoice_Id=ssik.SalesInvoiceID and a.ID=ssik.TaxVatDecID
where a.SendDate>=b.CreationDate
and ssik.SalesInvoiceID is null
and ssik.TaxVatDecID is null
GO
/****** Object:  StoredProcedure [dbo].[Insert_remainnig_Purchase_fix_2020]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE  [dbo].[Insert_remainnig_Purchase_fix_2020]
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
	SELECT  TaxPeriod, EQRID, le.TaxpayerID, PurchaseTotal, PurchaseAdjustment--,t.InvoiceTaxCount,t. NoticesAddCount,t.NoticesDiscountCount,t.OtherCount
  FROM TaxVat.[dbo].[LastIqrarSentOfTaxpayer] le with(nolock) 
  left join SentTables.dbo.SentPurshaseInvoices ss with(nolock)  on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
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
	   from TAXVAT.dbo.PurchasesInvoices s with(nolock)
	   where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=4)

  )

 set @PurchaseAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
 from TAXVAT.dbo.PurchasesInvoices s with(nolock) 
 where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @PurchaseSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
  from TAXVAT.dbo.PurchasesInvoices s with(nolock) 
  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@PurchaseFatoraTotal,0)=round(@PurchaseTotal,0) and round(@PurchaseAdjustment,0)=round(@PurchaseAddAdj-@PurchaseSubAdj,0) )
  begin
  insert into SentTables.dbo.SentPurshaseInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[PurchaseInvoice_Id] PurchaseInvoiceID,null PurchaseInvoiceDetailsID ,null CreationDate,
  null UpdatedDate,0 IsDeleted,null IsReplicated ,null
  from TAXVAT.dbo.PurchasesInvoices s with(nolock) 
  where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[Insert_remainnig_Sales_fix_2020]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Insert_remainnig_Sales_fix_2020]
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
  FROM TaxVat.[dbo].[LastIqrarSentOfTaxpayer] le With(nolock)
  left join SentTables.dbo.SentSalesInvoices ss With(nolock) on le.EQRID=ss.TaxVatDecID --inner join TaxDocument t on le.EQRID=t.DeclarationID
  where ss.TaxVatDecID is null and le.DeclarationTypeID!=2 and le.SalesTotal!=0  
  ---and le.TaxPeriod=202009
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
	   from TaxVAT.dbo.SalesInvoices s  WITH(NOLOCK) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  and (InvoiceType=1 or InvoiceType=6 or  InvoiceType=5)

  )

 set @SalesAddAdj=( select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
 from TaxVAT.dbo.SalesInvoices s WITH(NOLOCK) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
 
  and InvoiceType=2 )

  set @SalesSubAdj=(  select ISNULL(sum(s.Invoice_Total_Tax), 0 ) tax 
  from TaxVAT.dbo.SalesInvoices s WITH(NOLOCK) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
  
  and InvoiceType=3 )

  if(round(@SalesFatoraTotal,0)=round(@SalesTotal,0) and round(@SalesAdjustment,0)=round(@SalesAddAdj-@SalesSubAdj,0) )
  begin
  insert into SentTables.dbo.SentSalesInvoices
  select newid() ID,[Company_Taxpayer_Id] TaxPayerID,@EQRID TaxVatDecID ,s.[SalesInvoice_Id] SalesInvoiceID,null SalesInvoiceDetailsID ,null CreationDate, null UpdatedDate,0 IsDeleted,null IsReplicated,null 
   from TaxVAT.dbo.SalesInvoices s With(nolock) where year(s.Invoice_Date)=left(@TaxPeriod,4) and month(s.Invoice_Date)=right(@TaxPeriod,2) and IsDeleted=0 and s.Company_Taxpayer_Id=@TaxpayerID
   End

        SET @Counter = @Counter + 1
    END 

GO
/****** Object:  StoredProcedure [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_2020]    Script Date: 6/28/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create  PROCEDURE   [dbo].[InsertLastIqrarSentOfTaxpayerPeriod_2020] 
	-- Add the parameters for the stored procedure here
@TaxPeriod nvarchar(6)
	  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	TRUNCATE TABLE [TaxVAT].[dbo].LastIqrarSentOfTaxpayer  
    -- Insert statements for procedure here
	
 --  DECLARE @TaxPeriod nvarchar(6)
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

INSERT INTO [TaxVAT].[dbo].LastIqrarSentOfTaxpayer
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
