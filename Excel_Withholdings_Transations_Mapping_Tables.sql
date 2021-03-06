USE [Excel_Withholdings_Transations_Mapping]
GO
/****** Object:  User [CLOUD\Excel_Admin3]    Script Date: 6/28/2022 7:40:41 PM ******/
CREATE USER [CLOUD\Excel_Admin3] FOR LOGIN [CLOUD\Excel_Admin3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CLOUD\Excel_Admin4]    Script Date: 6/28/2022 7:40:41 PM ******/
CREATE USER [CLOUD\Excel_Admin4] FOR LOGIN [CLOUD\Excel_Admin4] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin3]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin4]
GO
/****** Object:  Table [dbo].[Excel_El_Masla7a_Mapped_Withholding_CLosed_NMZ_41]    Script Date: 6/28/2022 7:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excel_El_Masla7a_Mapped_Withholding_CLosed_NMZ_41](
	[TransactionData_Id] [uniqueidentifier] NULL,
	[kst_pageno] [char](4) NULL,
	[kst_year] [char](4) NULL,
	[bat_prd] [char](1) NULL,
	[kst_docdate] [datetime] NULL,
	[kst_jul] [char](4) NULL,
	[kst_serl] [char](4) NULL,
	[gha_num] [varchar](9) NULL,
	[gha_name] [varchar](60) NULL,
	[kst_docnum] [char](20) NULL,
	[kst_docnum1] [int] NULL,
	[kst_docnum2] [char](5) NULL,
	[kst_ghatype] [char](1) NULL,
	[kst_dealtype] [char](2) NULL,
	[kst_ksmval] [numeric](18, 0) NULL,
	[kst_ratflag] [int] NULL,
	[kst_flag] [int] NULL,
	[kst_sysdate] [int] NULL,
	[kst_ruid] [int] NULL,
	[kst_rsysdate] [int] NULL,
	[kst_upuid] [int] NULL,
	[kst_upsysdate] [int] NULL,
	[flag] [int] NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[kst_taxid] [varchar](9) NULL,
	[kst_file] [varchar](16) NULL,
	[kst_date] [datetime2](7) NULL,
	[kst_natcode] [char](30) NULL,
	[kst_totval] [decimal](18, 2) NULL,
	[kst_ksmcode] [char](1) NULL,
	[kst_netval] [decimal](18, 2) NULL,
	[kst_prcnt] [numeric](18, 0) NULL,
	[kst_taxval] [decimal](18, 2) NULL,
	[kst_currency] [varchar](2) NULL,
	[kst_uid] [varchar](8) NULL,
	[kst_reg] [char](2) NULL,
	[kst_acttype] [nvarchar](3) NULL,
	[bat_branch] [char](3) NULL,
	[Zero_Tax_Cause] [nvarchar](11) NOT NULL,
	[line_Number_Inside_Batch] [char](5) NULL,
	[Insertion_Date] [date] NULL,
	[kst_lineno] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IBM_El_Masla7a_Mapped_Withholding]    Script Date: 6/28/2022 7:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IBM_El_Masla7a_Mapped_Withholding](
	[TransactionData_Id] [varchar](50) NULL,
	[kst_pageno] [varchar](4) NULL,
	[kst_year] [varchar](4) NULL,
	[bat_prd] [varchar](1) NULL,
	[kst_docdate] [datetime] NULL,
	[kst_jul] [varchar](3) NULL,
	[kst_serl] [varchar](3) NULL,
	[gha_num] [varchar](9) NULL,
	[gha_name] [varchar](60) NULL,
	[kst_docnum] [varchar](15) NULL,
	[kst_docnum1] [varchar](8) NULL,
	[kst_docnum2] [varchar](5) NULL,
	[kst_ghatype] [varchar](1) NULL,
	[kst_dealtype] [varchar](2) NULL,
	[kst_ksmval] [numeric](13, 2) NULL,
	[kst_ratflag] [varchar](1) NULL,
	[kst_flag] [varchar](1) NULL,
	[kst_sysdate] [datetime] NULL,
	[kst_ruid] [varchar](8) NULL,
	[kst_rsysdate] [datetime] NULL,
	[kst_upuid] [varchar](8) NULL,
	[kst_upsysdate] [datetime] NULL,
	[flag] [varchar](1) NULL,
	[Taxpayer_Id] [varchar](50) NULL,
	[kst_taxid] [varchar](9) NULL,
	[kst_file] [varchar](16) NULL,
	[kst_date] [datetime] NULL,
	[kst_natcode] [varchar](1) NULL,
	[kst_totval] [numeric](13, 2) NULL,
	[kst_ksmcode] [varchar](1) NULL,
	[kst_netval] [numeric](13, 2) NULL,
	[kst_prcnt] [numeric](5, 2) NULL,
	[kst_taxval] [numeric](13, 2) NULL,
	[kst_currency] [varchar](2) NULL,
	[kst_uid] [varchar](8) NULL,
	[kst_reg] [varchar](3) NULL,
	[kst_acttype] [varchar](1) NULL,
	[bat_branch] [varchar](50) NULL,
	[Zero_Tax_Cause] [nvarchar](50) NULL,
	[line_Number_Inside_Batch] [int] NULL,
	[Insertion_Date] [datetime] NULL,
	[kst_lineno] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Full_Withholding_Transactions]    Script Date: 6/28/2022 7:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[Full_Withholding_Transactions] as 
SELECT  convert(varchar(50),[TransactionData_Id]) as [TransactionData_Id]
      ,[kst_pageno]
      ,[kst_year]
      ,[bat_prd]
      ,[kst_docdate]
      ,[kst_jul]
      ,[kst_serl]
      ,[gha_num]
      ,[gha_name]
      ,[kst_docnum]
      ,[kst_docnum1]
      ,[kst_docnum2]
      ,[kst_ghatype]
      ,[kst_dealtype]
      ,[kst_ksmval]
      ,[kst_ratflag]
      ,[kst_flag]
      ,[kst_sysdate]
      ,[kst_ruid]
      ,[kst_rsysdate]
      ,[kst_upuid]
      ,[kst_upsysdate]
      ,[flag]
      ,[Taxpayer_Id]
      ,[kst_taxid]
      ,[kst_file]
      ,[kst_date]
      ,[kst_natcode]
      ,[kst_totval]
      ,[kst_ksmcode]
      ,[kst_netval]
      ,[kst_prcnt]
      ,[kst_taxval]
      ,[kst_currency]
      ,[kst_uid]
      ,[kst_reg]
      ,[kst_acttype]
      ,[bat_branch]
      ,[Zero_Tax_Cause]
      ,[line_Number_Inside_Batch]
      ,[Insertion_Date]
      ,[kst_lineno]
	  ,'Excel Systems' as Developed_By
  FROM [Excel_Withholdings_Transations_Mapping].[dbo].[Excel_El_Masla7a_Mapped_Withholding_CLosed_NMZ_41]

  union all 

  SELECT [TransactionData_Id]
      ,[kst_pageno]
      ,[kst_year]
      ,[bat_prd]
      ,[kst_docdate]
      ,[kst_jul]
      ,[kst_serl]
      ,[gha_num]
      ,[gha_name]
      ,[kst_docnum]
      ,[kst_docnum1]
      ,[kst_docnum2]
      ,[kst_ghatype]
      ,[kst_dealtype]
      ,[kst_ksmval]
      ,[kst_ratflag]
      ,[kst_flag]
      ,[kst_sysdate]
      ,[kst_ruid]
      ,[kst_rsysdate]
      ,[kst_upuid]
      ,[kst_upsysdate]
      ,[flag]
      ,[Taxpayer_Id]
      ,[kst_taxid]
      ,[kst_file]
      ,[kst_date]
      ,[kst_natcode]
      ,[kst_totval]
      ,[kst_ksmcode]
      ,[kst_netval]
      ,[kst_prcnt]
      ,[kst_taxval]
      ,[kst_currency]
      ,[kst_uid]
      ,[kst_reg]
      ,[kst_acttype]
      ,[bat_branch]
      ,[Zero_Tax_Cause]
      ,[line_Number_Inside_Batch]
      ,[Insertion_Date]
      ,[kst_lineno]
	  ,'IBM' as Developed_By
  FROM [Excel_Withholdings_Transations_Mapping].[dbo].[IBM_El_Masla7a_Mapped_Withholding]
GO
/****** Object:  Table [dbo].[Excel_El_Masla7a_Mapped_Withholding_NMZ_46]    Script Date: 6/28/2022 7:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excel_El_Masla7a_Mapped_Withholding_NMZ_46](
	[TransactionData_Id] [uniqueidentifier] NULL,
	[kst_pageno] [varchar](4) NULL,
	[Closed_Date] [datetime] NULL,
	[Closed] [bit] NULL,
	[kst_year] [varchar](4) NULL,
	[bat_prd] [varchar](1) NULL,
	[kst_jul] [varchar](4) NULL,
	[kst_serl] [varchar](4) NULL,
	[gha_num] [varchar](9) NULL,
	[gha_name] [varchar](60) NULL,
	[kst_docnum1] [int] NULL,
	[kst_ghatype] [varchar](1) NULL,
	[kst_dealtype] [varchar](2) NULL,
	[kst_ratflag] [int] NULL,
	[kst_flag] [int] NULL,
	[kst_sysdate] [int] NULL,
	[kst_ruid] [int] NULL,
	[kst_rsysdate] [int] NULL,
	[kst_upuid] [int] NULL,
	[kst_upsysdate] [int] NULL,
	[flag] [int] NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[Taxpayer_Name] [nvarchar](255) NULL,
	[kst_taxid] [varchar](9) NULL,
	[kst_file] [varchar](16) NULL,
	[kst_date] [datetime2](7) NULL,
	[kst_natcode] [varchar](30) NULL,
	[kst_totval] [numeric](18, 2) NULL,
	[kst_netval] [numeric](18, 2) NULL,
	[kst_taxval] [numeric](18, 2) NULL,
	[kst_currency] [varchar](2) NULL,
	[kst_uid] [varchar](8) NULL,
	[National_ID] [nvarchar](1000) NULL,
	[kst_reg] [varchar](2) NULL,
	[kst_acttype] [nvarchar](3) NULL,
	[bat_branch] [varchar](3) NULL,
	[line_Number_Inside_Batch] [varchar](5) NULL,
	[Insertion_Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excel_El_Masla7a_Mapped_Withholding_NMZ_47]    Script Date: 6/28/2022 7:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excel_El_Masla7a_Mapped_Withholding_NMZ_47](
	[TransactionData_Id] [uniqueidentifier] NULL,
	[kst_pageno] [varchar](4) NULL,
	[Closed_Date] [datetime] NULL,
	[Closed] [bit] NULL,
	[kst_year] [varchar](4) NULL,
	[bat_prd] [varchar](1) NULL,
	[kst_jul] [varchar](4) NULL,
	[kst_serl] [varchar](4) NULL,
	[gha_num] [varchar](9) NULL,
	[gha_name] [varchar](60) NULL,
	[kst_docnum1] [int] NULL,
	[kst_ghatype] [varchar](1) NULL,
	[kst_dealtype] [varchar](2) NULL,
	[kst_ratflag] [int] NULL,
	[kst_flag] [int] NULL,
	[kst_sysdate] [int] NULL,
	[kst_ruid] [int] NULL,
	[kst_rsysdate] [int] NULL,
	[kst_upuid] [int] NULL,
	[kst_upsysdate] [int] NULL,
	[flag] [int] NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[TaxPayer_Name] [nvarchar](1000) NULL,
	[kst_taxid] [varchar](9) NULL,
	[kst_file] [varchar](16) NULL,
	[DistCode] [nvarchar](1000) NULL,
	[DistName] [nvarchar](1000) NULL,
	[kst_taxid_Addr] [nvarchar](1000) NULL,
	[kst_date] [datetime2](7) NULL,
	[kst_natcode] [varchar](30) NULL,
	[kst_totval] [numeric](18, 2) NULL,
	[kst_netval] [numeric](18, 2) NULL,
	[kst_taxval] [numeric](18, 2) NULL,
	[kst_currency] [varchar](2) NULL,
	[kst_uid] [varchar](8) NULL,
	[kst_reg] [varchar](2) NULL,
	[kst_acttype] [nvarchar](3) NULL,
	[bat_branch] [varchar](3) NULL,
	[line_Number_Inside_Batch] [varchar](5) NULL,
	[Insertion_Date] [date] NULL,
	[National_ID] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excel_El_Masla7a_Mapped_Withholding_Not_CLosed_NMZ_41]    Script Date: 6/28/2022 7:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excel_El_Masla7a_Mapped_Withholding_Not_CLosed_NMZ_41](
	[TransactionData_Id] [uniqueidentifier] NULL,
	[kst_pageno] [char](4) NULL,
	[kst_year] [char](4) NULL,
	[bat_prd] [char](1) NULL,
	[kst_docdate] [datetime] NULL,
	[kst_jul] [char](4) NULL,
	[kst_serl] [char](4) NULL,
	[gha_num] [varchar](9) NULL,
	[gha_name] [varchar](60) NULL,
	[kst_docnum] [char](20) NULL,
	[kst_docnum1] [int] NULL,
	[kst_docnum2] [char](5) NULL,
	[kst_ghatype] [char](1) NULL,
	[kst_dealtype] [char](2) NULL,
	[kst_ksmval] [numeric](18, 0) NULL,
	[kst_ratflag] [int] NULL,
	[kst_flag] [int] NULL,
	[kst_sysdate] [int] NULL,
	[kst_ruid] [int] NULL,
	[kst_rsysdate] [int] NULL,
	[kst_upuid] [int] NULL,
	[kst_upsysdate] [int] NULL,
	[flag] [int] NULL,
	[Taxpayer_Id] [uniqueidentifier] NULL,
	[kst_taxid] [varchar](9) NULL,
	[kst_file] [varchar](16) NULL,
	[kst_date] [datetime2](7) NULL,
	[kst_natcode] [char](30) NULL,
	[kst_totval] [decimal](18, 2) NULL,
	[kst_ksmcode] [char](1) NULL,
	[kst_netval] [decimal](18, 2) NULL,
	[kst_prcnt] [numeric](18, 0) NULL,
	[kst_taxval] [decimal](18, 2) NULL,
	[kst_currency] [varchar](2) NULL,
	[kst_uid] [varchar](8) NULL,
	[kst_reg] [char](2) NULL,
	[kst_acttype] [nvarchar](3) NULL,
	[bat_branch] [char](3) NULL,
	[Zero_Tax_Cause] [nvarchar](11) NOT NULL,
	[line_Number_Inside_Batch] [char](5) NULL,
	[Insertion_Date] [date] NULL
) ON [PRIMARY]
GO
