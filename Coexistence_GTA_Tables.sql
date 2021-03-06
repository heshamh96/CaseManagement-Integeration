USE [Coexistence_GTA]
GO
/****** Object:  User [CLOUD\Excel_Admin3]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [CLOUD\Excel_Admin3] FOR LOGIN [CLOUD\Excel_Admin3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CLOUD\Excel_Admin4]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [CLOUD\Excel_Admin4] FOR LOGIN [CLOUD\Excel_Admin4] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DB_Prog]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [DB_Prog] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [e_finanace]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [e_finanace] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [e_finance]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [e_finance] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ExcelUser]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [ExcelUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [LTC]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [LTC] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa_comp]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [sa_comp] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa_gat]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [sa_gat] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa_vat]    Script Date: 6/28/2022 7:41:57 PM ******/
CREATE USER [sa_vat] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin3]
GO
ALTER ROLE [db_owner] ADD MEMBER [CLOUD\Excel_Admin4]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DB_Prog]
GO
ALTER ROLE [db_datareader] ADD MEMBER [e_finanace]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [e_finance]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ExcelUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [LTC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [sa_comp]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [sa_comp]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa_gat]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa_vat]
GO
ALTER ROLE [db_datareader] ADD MEMBER [sa_vat]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [sa_vat]
GO
/****** Object:  Table [dbo].[retgoodsale]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retgoodsale](
	[officeid] [numeric](18, 0) NOT NULL,
	[retgoodsaleid] [numeric](18, 0) NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[goodsid] [numeric](18, 0) NOT NULL,
	[salqty] [numeric](16, 6) NOT NULL,
	[salval] [numeric](14, 2) NOT NULL,
	[appltax] [numeric](14, 2) NOT NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[SAP_ID] [uniqueidentifier] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[officeid] ASC,
	[retgoodsaleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[retgoodsale_view]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[retgoodsale_view] 
as 
SELECT  [officeid]
     -- ,[retgoodsaleid]
      ,[returnsgoodretid]
      ,[goodsid]
      ,sum([salqty]) as [salqty]
      ,sum([salval])as [salval]
      ,sum([appltax])as [appltax]
      --,[targetoffid]
      --,[moddate]
      --,[moduser]
      --,[SAP_ID]
  FROM [Coexistence_GTA].[dbo].[retgoodsale]
  group by [officeid],[returnsgoodretid]
      ,[goodsid] 
      --,[targetoffid]
      --,[moddate]
      --,[moduser]
      --,[SAP_ID]
GO
/****** Object:  Table [dbo].[_dif_master_record]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_dif_master_record](
	[mas_taxid] [nvarchar](9) NOT NULL,
	[mas_name] [nvarchar](60) NOT NULL,
	[mas_address] [nvarchar](60) NULL,
	[dis_code] [nvarchar](3) NOT NULL,
	[dis_desc] [nvarchar](18) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_ltc]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_ltc](
	[rin] [char](9) NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_ltc2]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_ltc2](
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_ltc3]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_ltc3](
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_ltc33]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_ltc33](
	[returnsgoodretid] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_mehan]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_mehan](
	[rin] [char](9) NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_mehan2]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_mehan2](
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_mehan3]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_mehan3](
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_mtc]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_mtc](
	[rin] [char](9) NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_mtc2]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_mtc2](
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_mtc3]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_mtc3](
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_o10]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_o10](
	[rin] [char](9) NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[returnsid] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_o101]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_o101](
	[rin] [char](9) NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_P2019_SAP]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_P2019_SAP](
	[Company_Unique_Tax_Id] [nchar](9) NOT NULL,
	[Invoice_Number] [nvarchar](255) NOT NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [decimal](19, 5) NULL,
	[Invoice_Total_Tax] [decimal](19, 5) NULL,
	[Invoice_Total_Money] [decimal](19, 5) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nchar](14) NULL,
	[Customer_Mobile] [nchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[InvoiceTypeDesc] [nvarchar](200) NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Description] [nvarchar](50) NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [decimal](19, 5) NULL,
	[Product_Tax_Value] [decimal](19, 5) NULL,
	[Product_Quantity] [decimal](19, 5) NULL,
	[Product_Total_Net] [decimal](19, 5) NULL,
	[Product_Total_Tax_Value] [decimal](19, 5) NULL,
	[Product_Total_Money] [decimal](19, 5) NULL,
	[Tax] [decimal](19, 5) NULL,
	[Discount] [decimal](19, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_P2020_SAP]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_P2020_SAP](
	[Company_Unique_Tax_Id] [nchar](9) NOT NULL,
	[Invoice_Number] [nvarchar](255) NOT NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [decimal](19, 5) NULL,
	[Invoice_Total_Tax] [decimal](19, 5) NULL,
	[Invoice_Total_Money] [decimal](19, 5) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nchar](14) NULL,
	[Customer_Mobile] [nchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[InvoiceTypeDesc] [nvarchar](200) NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Description] [nvarchar](50) NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [decimal](19, 5) NULL,
	[Product_Tax_Value] [decimal](19, 5) NULL,
	[Product_Quantity] [decimal](19, 5) NULL,
	[Product_Total_Net] [decimal](19, 5) NULL,
	[Product_Total_Tax_Value] [decimal](19, 5) NULL,
	[Product_Total_Money] [decimal](19, 5) NULL,
	[Tax] [decimal](19, 5) NULL,
	[Discount] [decimal](19, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_P2021_SAP]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_P2021_SAP](
	[Company_Unique_Tax_Id] [nchar](9) NOT NULL,
	[Invoice_Number] [nvarchar](255) NOT NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [decimal](19, 5) NULL,
	[Invoice_Total_Tax] [decimal](19, 5) NULL,
	[Invoice_Total_Money] [decimal](19, 5) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nchar](14) NULL,
	[Customer_Mobile] [nchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[InvoiceTypeDesc] [nvarchar](200) NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Description] [nvarchar](50) NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [decimal](19, 5) NULL,
	[Product_Tax_Value] [decimal](19, 5) NULL,
	[Product_Quantity] [decimal](19, 5) NULL,
	[Product_Total_Net] [decimal](19, 5) NULL,
	[Product_Total_Tax_Value] [decimal](19, 5) NULL,
	[Product_Total_Money] [decimal](19, 5) NULL,
	[Tax] [decimal](19, 5) NULL,
	[Discount] [decimal](19, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_r_not]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_r_not](
	[rin] [char](9) NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[id] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_sr10]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_sr10](
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_sr101]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_sr101](
	[doclocnum] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[address]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[addressid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[branchid] [nvarchar](13) NOT NULL,
	[addresscode] [char](1) NOT NULL,
	[addr1] [varchar](60) NOT NULL,
	[addr2] [varchar](60) NULL,
	[city] [varchar](60) NOT NULL,
	[postalcode] [char](6) NULL,
	[buildingcd] [char](6) NULL,
	[fromdate] [datetime] NOT NULL,
	[todate] [datetime] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[rin] [nvarchar](9) NOT NULL,
 CONSTRAINT [address_pk] PRIMARY KEY CLUSTERED 
(
	[addressid] ASC,
	[officeid] ASC,
	[rin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bank_info]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bank_info](
	[mas_taxid] [char](9) NULL,
	[mas_name] [char](60) NULL,
	[Bank_name_id] [char](4) NOT NULL,
	[Bank_name] [nvarchar](50) NOT NULL,
	[Bank_Branch_id] [char](4) NOT NULL,
	[Branch_name] [nchar](10) NOT NULL,
	[account_number] [char](19) NOT NULL,
 CONSTRAINT [PK_bank_info] PRIMARY KEY CLUSTERED 
(
	[Bank_name_id] ASC,
	[Bank_Branch_id] ASC,
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[block_period_data_reason]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[block_period_data_reason](
	[data_source] [char](1) NOT NULL,
	[block_reason] [char](1) NOT NULL,
	[block_name] [char](50) NULL,
 CONSTRAINT [PK_block_period_data_reson] PRIMARY KEY CLUSTERED 
(
	[data_source] ASC,
	[block_reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[block_test]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[block_test](
	[dis_code] [char](3) NULL,
	[data_source] [varchar](1) NOT NULL,
	[mas_taxid] [char](9) NOT NULL,
	[period_from] [datetime] NOT NULL,
	[period_to] [datetime] NOT NULL,
	[block_reason] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blocked_period_data_source]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blocked_period_data_source](
	[data_source] [char](1) NOT NULL,
	[data_source_name] [char](15) NOT NULL,
 CONSTRAINT [PK_blocked_period_data_sourse] PRIMARY KEY CLUSTERED 
(
	[data_source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blocked_Periods]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocked_Periods](
	[datasource] [int] NULL,
	[officeid] [nvarchar](50) NULL,
	[rin] [char](9) NOT NULL,
	[period_from] [datetime] NOT NULL,
	[period_to] [datetime] NOT NULL,
	[block_reason] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blocked_Periods_All]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocked_Periods_All](
	[dis_code] [char](3) NOT NULL,
	[data_source] [char](1) NOT NULL,
	[rin] [char](9) NOT NULL,
	[period_from] [datetime] NOT NULL,
	[period_to] [datetime] NOT NULL,
	[block_reason] [char](1) NULL,
 CONSTRAINT [PK__Blocked_Periods_cairo4] PRIMARY KEY CLUSTERED 
(
	[data_source] ASC,
	[rin] ASC,
	[period_from] ASC,
	[period_to] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blocked_Periods_income]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocked_Periods_income](
	[rin] [char](9) NOT NULL,
	[block_year] [char](4) NOT NULL,
	[block_reason] [nvarchar](255) NULL,
 CONSTRAINT [PK__Blocked_Periods11] PRIMARY KEY CLUSTERED 
(
	[rin] ASC,
	[block_year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branchid] [nvarchar](13) NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[branchcode] [smallint] NOT NULL,
	[locationid] [numeric](18, 0) NOT NULL,
	[branchgroupid] [numeric](18, 0) NULL,
	[sourcecode] [smallint] NULL,
	[branchnum] [smallint] NOT NULL,
	[mgrname] [varchar](60) NULL,
	[startdate] [datetime] NOT NULL,
	[ceasedate] [datetime] NULL,
	[certprint] [datetime] NULL,
	[AccountInd] [smallint] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[rin] [nvarchar](9) NULL,
 CONSTRAINT [PK_branch] PRIMARY KEY CLUSTERED 
(
	[branchid] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branchgroup]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branchgroup](
	[branchgroupid] [numeric](18, 0) NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[rin] [char](9) NOT NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NOT NULL,
 CONSTRAINT [PK_branchgroup_1] PRIMARY KEY CLUSTERED 
(
	[branchgroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[mas_taxid] [char](9) NOT NULL,
	[car_type] [char](1) NULL,
	[car_number] [char](10) NULL,
	[car_st_date] [datetime] NULL,
	[car_mark] [char](20) NULL,
	[car_load] [numeric](18, 2) NULL,
	[car_load_NO_pass] [numeric](18, 2) NULL,
	[car_man_year] [char](4) NULL,
	[car_foil] [char](1) NULL,
	[car_shas_no] [char](15) NOT NULL,
	[car_motor] [char](15) NULL,
	[tr_office] [char](50) NULL,
	[car_number2] [char](10) NULL,
	[car_shas_no2] [char](15) NULL,
	[car_load2] [numeric](18, 2) NULL,
	[car_mark2] [char](20) NULL,
	[car_dervier] [char](50) NULL,
	[car_sysdate] [datetime] NULL,
	[exclude_flag] [char](1) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_car] PRIMARY KEY CLUSTERED 
(
	[car_shas_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[car_info]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car_info](
	[car_num] [char](10) NOT NULL,
	[car_type] [char](1) NULL,
	[car_st_date] [datetime] NULL,
	[car_mark] [char](20) NULL,
	[car_load] [decimal](18, 0) NULL,
	[car_man_year] [char](4) NULL,
	[car_foil] [char](1) NULL,
	[car_shas_no] [char](15) NOT NULL,
	[car_motor] [char](15) NULL,
	[tr_office] [char](50) NULL,
	[drvr_insur] [char](50) NULL,
	[act_prn] [char](4) NULL,
	[mas_st_date] [datetime] NULL,
	[mas_end_date] [datetime] NULL,
 CONSTRAINT [PK_car_info_1] PRIMARY KEY CLUSTERED 
(
	[car_num] ASC,
	[car_shas_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_log]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_log](
	[mas_taxid] [char](9) NOT NULL,
	[car_type] [char](1) NULL,
	[car_number] [char](10) NULL,
	[car_st_date] [datetime] NULL,
	[car_mark] [char](20) NULL,
	[car_load] [numeric](18, 2) NULL,
	[car_load_NO_pass] [numeric](18, 2) NULL,
	[car_man_year] [char](4) NULL,
	[car_foil] [char](1) NULL,
	[car_shas_no] [char](15) NOT NULL,
	[car_motor] [char](15) NULL,
	[tr_office] [char](50) NULL,
	[car_number2] [char](10) NULL,
	[car_shas_no2] [char](15) NULL,
	[car_load2] [numeric](18, 2) NULL,
	[car_mark2] [char](20) NULL,
	[car_dervier] [char](50) NULL,
	[car_sysdate] [datetime] NULL,
	[exclude_flag] [char](1) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_car_log] PRIMARY KEY CLUSTERED 
(
	[car_shas_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Form_Status]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form_Status](
	[FORMID] [decimal](18, 0) NOT NULL,
	[STATUS] [char](110) NOT NULL,
	[STAT_DESCRIPTION] [char](20) NULL,
 CONSTRAINT [PK_Form_Status] PRIMARY KEY CLUSTERED 
(
	[FORMID] ASC,
	[STATUS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goods_vat]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goods_vat](
	[goodsid] [numeric](18, 0) NOT NULL,
	[unitcode] [char](2) NOT NULL,
	[goodscd] [char](8) NOT NULL,
	[goodsdesc] [nvarchar](255) NULL,
	[taxprc] [decimal](9, 4) NOT NULL,
	[prcdsc] [char](1) NOT NULL,
	[minflg] [char](1) NOT NULL,
	[minval] [decimal](9, 4) NULL,
	[minunt] [smallint] NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NOT NULL,
	[rettype] [int] NULL,
	[addedvalue] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ig_LK_RetCategory]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ig_LK_RetCategory](
	[Ret_Catg] [varchar](3) NOT NULL,
	[Ret_Catg_Desc] [varchar](300) NOT NULL,
	[Ret_Type_Code] [char](1) NOT NULL,
	[Ret_Flg_Usd] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igactivity_branch]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igactivity_branch](
	[act_bab] [nvarchar](1) NOT NULL,
	[act_sec] [nvarchar](2) NOT NULL,
	[act_grp] [nvarchar](3) NOT NULL,
	[act_brn] [nvarchar](4) NOT NULL,
	[act_desc] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igaddionalact]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igaddionalact](
	[mas_taxid] [char](9) NOT NULL,
	[act_brn] [char](4) NOT NULL,
	[mas_st_date] [datetime] NOT NULL,
	[mas_end_date] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[IsTansferedToGat] [char](1) NOT NULL,
 CONSTRAINT [PK_Igaddionalact] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC,
	[act_brn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igaddionalact_log]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igaddionalact_log](
	[mas_taxid] [char](9) NOT NULL,
	[act_brn] [char](4) NOT NULL,
	[mas_st_date] [datetime] NOT NULL,
	[mas_end_date] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[IsTansferedToGat] [char](1) NOT NULL,
 CONSTRAINT [PK_Igaddionalact1] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC,
	[act_brn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IgCardRequest]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IgCardRequest](
	[mas_taxid] [char](9) NOT NULL,
	[smart_card_id] [nvarchar](16) NOT NULL,
	[req_printdate] [datetime] NULL,
	[req_tempdate] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_IgCardRequest] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC,
	[smart_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IgCardRequest_log]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IgCardRequest_log](
	[mas_taxid] [char](9) NOT NULL,
	[smart_card_id] [nvarchar](16) NOT NULL,
	[req_printdate] [datetime] NULL,
	[req_tempdate] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_IgCardRequest1] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC,
	[smart_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IgContactData]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IgContactData](
	[mas_taxid] [char](9) NOT NULL,
	[telno] [char](11) NOT NULL,
	[email] [char](30) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_IgContactData] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC,
	[telno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IgContactData_log]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IgContactData_log](
	[mas_taxid] [char](9) NOT NULL,
	[telno] [char](11) NOT NULL,
	[email] [char](30) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_IgContactData1] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC,
	[telno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igdistrict]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igdistrict](
	[dis_code] [char](3) NOT NULL,
	[dis_desc] [varchar](100) NULL,
	[Gov_Code] [char](2) NULL,
	[Reg_Code] [char](2) NULL,
	[bran_code] [char](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igMainMaster]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igMainMaster](
	[mas_taxid] [char](9) NOT NULL,
	[mas_file] [char](16) NULL,
	[mas_name] [varchar](55) NULL,
	[mas_buld] [varchar](5) NULL,
	[mas_adress] [varchar](55) NULL,
	[dis_code] [char](3) NULL,
	[mas_type] [char](1) NULL,
	[act_acode] [char](3) NULL,
	[mas_ownr] [char](1) NULL,
	[mas_st_date] [date] NULL,
	[mas_oact] [char](3) NULL,
	[ID] [bigint] NOT NULL,
	[insert_user] [char](8) NULL,
	[insert_date] [datetime] NULL,
	[update_user] [char](8) NULL,
	[update_date] [datetime] NULL,
	[mas_knowdate] [date] NULL,
	[ot_flag] [tinyint] NULL,
	[act_brn] [char](4) NULL,
	[mas_status] [char](1) NULL,
	[email] [varchar](55) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igmas_main]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igmas_main](
	[mas_taxid] [varchar](9) NOT NULL,
	[mas_name] [nvarchar](60) NULL,
	[mas_address] [nvarchar](60) NULL,
	[dis_code] [char](3) NOT NULL,
	[dis_desc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_igmas_main] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igmaster]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igmaster](
	[mas_taxid] [char](9) NOT NULL,
	[mas_name] [varchar](55) NOT NULL,
	[sub_subplc] [char](2) NULL,
	[sub_plc] [char](2) NULL,
	[act_brn] [char](4) NOT NULL,
	[mas_omain] [char](1) NOT NULL,
	[mas_st_date] [datetime] NOT NULL,
	[mas_end_date] [datetime] NULL,
	[mas_ownr] [char](1) NOT NULL,
	[com_inv_cap] [decimal](13, 2) NULL,
	[mas_trade_name] [char](100) NOT NULL,
	[mas_type] [char](1) NULL,
	[mas_lgdate] [datetime] NOT NULL,
	[mas_saveldate] [datetime] NULL,
	[com_amt1] [decimal](13, 2) NULL,
	[com_amt2] [decimal](13, 2) NULL,
	[mas_buld] [char](5) NOT NULL,
	[mas_address] [varchar](100) NOT NULL,
	[mas_gov] [char](2) NOT NULL,
	[dis_code] [char](3) NOT NULL,
	[reg_code] [char](3) NOT NULL,
	[com_sctor] [char](1) NOT NULL,
	[f_start_date] [datetime] NOT NULL,
	[f_end_date] [datetime] NOT NULL,
	[com_num_empl] [varchar](5) NULL,
	[mas_file_damgh] [char](16) NULL,
	[mas_file_kasb] [char](16) NULL,
	[mas_name_Lg_represent] [char](55) NULL,
	[mas_knowdate] [datetime] NULL,
	[mas_status] [char](1) NOT NULL,
	[commerialid] [char](10) NULL,
	[fax] [char](11) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_igmaster] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igmaster_log]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igmaster_log](
	[mas_taxid] [char](9) NOT NULL,
	[mas_name] [varchar](55) NOT NULL,
	[sub_subplc] [char](2) NULL,
	[sub_plc] [char](2) NULL,
	[act_brn] [char](4) NOT NULL,
	[mas_omain] [char](1) NOT NULL,
	[mas_st_date] [datetime] NOT NULL,
	[mas_end_date] [datetime] NULL,
	[mas_ownr] [char](1) NOT NULL,
	[com_inv_cap] [decimal](13, 2) NULL,
	[mas_trade_name] [char](100) NOT NULL,
	[mas_type] [char](1) NULL,
	[mas_lgdate] [datetime] NOT NULL,
	[mas_saveldate] [datetime] NULL,
	[com_amt1] [decimal](13, 2) NULL,
	[com_amt2] [decimal](13, 2) NULL,
	[mas_buld] [char](5) NOT NULL,
	[mas_address] [varchar](100) NOT NULL,
	[mas_gov] [char](2) NOT NULL,
	[dis_code] [char](3) NOT NULL,
	[reg_code] [char](3) NOT NULL,
	[com_sctor] [char](1) NOT NULL,
	[f_start_date] [datetime] NOT NULL,
	[f_end_date] [datetime] NOT NULL,
	[com_num_empl] [varchar](5) NULL,
	[mas_file_damgh] [char](16) NULL,
	[mas_file_kasb] [char](16) NULL,
	[mas_name_Lg_represent] [char](55) NULL,
	[mas_knowdate] [datetime] NULL,
	[mas_status] [char](1) NOT NULL,
	[commerialid] [char](10) NULL,
	[fax] [char](11) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
 CONSTRAINT [PK_igmaster1] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igmaster_updates]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igmaster_updates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[mas_taxid] [char](9) NOT NULL,
	[o_mas_name] [varchar](55) NULL,
	[n_mas_name] [varchar](55) NULL,
	[sub_subplc] [char](2) NULL,
	[sub_plc] [char](2) NULL,
	[o_act_brn] [char](4) NULL,
	[n_act_brn] [char](4) NULL,
	[mas_omain] [char](1) NULL,
	[o_mas_st_date] [datetime] NULL,
	[n_mas_st_date] [datetime] NULL,
	[o_mas_end_date] [datetime] NULL,
	[n_mas_end_date] [datetime] NULL,
	[o_mas_ownr] [char](1) NULL,
	[n_mas_ownr] [char](1) NULL,
	[o_com_inv_cap] [decimal](13, 2) NULL,
	[n_com_inv_cap] [decimal](13, 2) NULL,
	[o_mas_trade_name] [char](100) NULL,
	[n_mas_trade_name] [char](100) NULL,
	[o_mas_type] [char](1) NULL,
	[n_mas_type] [char](1) NULL,
	[o_mas_lgdate] [datetime] NULL,
	[n_mas_lgdate] [datetime] NULL,
	[o_mas_saveldate] [datetime] NULL,
	[n_mas_saveldate] [datetime] NULL,
	[o_com_amt1] [decimal](13, 2) NULL,
	[n_com_amt1] [decimal](13, 2) NULL,
	[o_com_amt2] [decimal](13, 2) NULL,
	[n_com_amt2] [decimal](13, 2) NULL,
	[o_mas_buld] [char](5) NULL,
	[n_mas_buld] [char](5) NULL,
	[o_mas_address] [varchar](55) NULL,
	[n_mas_address] [varchar](55) NULL,
	[o_mas_gov] [char](2) NULL,
	[n_mas_gov] [char](2) NULL,
	[o_dis_code] [char](3) NULL,
	[n_dis_code] [char](3) NULL,
	[o_reg_code] [char](3) NULL,
	[n_reg_code] [char](3) NULL,
	[o_com_sctor] [char](1) NULL,
	[n_com_sctor] [char](1) NULL,
	[o_f_start_date] [datetime] NULL,
	[n_f_start_date] [datetime] NULL,
	[o_f_end_date] [datetime] NULL,
	[n_f_end_date] [datetime] NULL,
	[o_com_num_empl] [varchar](5) NULL,
	[n_com_num_empl] [varchar](5) NULL,
	[o_mas_file_damgh] [char](16) NULL,
	[n_mas_file_damgh] [char](16) NULL,
	[o_mas_file_kasb] [char](16) NULL,
	[n_mas_file_kasb] [char](16) NULL,
	[o_mas_name_Lg_represent] [char](55) NULL,
	[n_mas_name_Lg_represent] [char](55) NULL,
	[o_mas_knowdate] [datetime] NULL,
	[n_mas_knowdate] [datetime] NULL,
	[o_mas_status] [char](1) NULL,
	[n_mas_status] [char](1) NULL,
	[o_commerialid] [char](10) NULL,
	[n_commerialid] [char](10) NULL,
	[o_fax] [char](11) NULL,
	[n_fax] [char](11) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
	[user_modified] [nvarchar](255) NULL,
	[AppName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Igmaster_updates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igparown]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igparown](
	[BPPartner] [char](10) NOT NULL,
	[BPmain] [char](10) NOT NULL,
	[mas_taxid] [char](9) NOT NULL,
	[par_taxid] [char](9) NULL,
	[par_lg_entity] [char](1) NOT NULL,
	[par_name] [varchar](55) NOT NULL,
	[par_buld] [char](5) NOT NULL,
	[par_addres] [varchar](55) NOT NULL,
	[par_govcode] [char](2) NULL,
	[par_nality] [char](2) NOT NULL,
	[par_id_NationalID] [char](14) NULL,
	[par_id_Passport] [char](14) NULL,
	[par_idp] [char](20) NULL,
	[par_idd] [datetime] NULL,
	[dis_code] [char](3) NULL,
	[par_st_date] [datetime] NOT NULL,
	[par_end_date] [datetime] NULL,
	[par_share] [varchar](10) NULL,
	[DateModified] [datetime] NULL,
	[IsTransferedToGat] [char](1) NULL,
 CONSTRAINT [PK_igparown] PRIMARY KEY CLUSTERED 
(
	[BPPartner] ASC,
	[BPmain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igparown_log]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igparown_log](
	[BPPartner] [char](10) NOT NULL,
	[BPmain] [char](10) NOT NULL,
	[mas_taxid] [char](9) NOT NULL,
	[par_taxid] [char](9) NULL,
	[par_lg_entity] [char](1) NOT NULL,
	[par_name] [varchar](55) NOT NULL,
	[par_buld] [char](5) NOT NULL,
	[par_addres] [varchar](55) NOT NULL,
	[par_govcode] [char](2) NULL,
	[par_nality] [char](2) NOT NULL,
	[par_id_NationalID] [char](14) NULL,
	[par_id_Passport] [char](14) NULL,
	[par_idp] [char](20) NULL,
	[par_idd] [datetime] NULL,
	[dis_code] [char](3) NULL,
	[par_st_date] [datetime] NOT NULL,
	[par_end_date] [datetime] NULL,
	[par_share] [varchar](10) NULL,
	[DateModified] [datetime] NULL,
	[IsTransferedToGat] [char](1) NULL,
 CONSTRAINT [PK_igparown1] PRIMARY KEY CLUSTERED 
(
	[BPPartner] ASC,
	[BPmain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igparown_updates]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igparown_updates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BPPartner] [char](10) NULL,
	[BPmain] [char](10) NULL,
	[mas_taxid] [char](9) NULL,
	[o_par_taxid] [char](9) NULL,
	[n_par_taxid] [char](9) NULL,
	[o_par_lg_entity] [char](1) NULL,
	[n_par_lg_entity] [char](1) NULL,
	[o_par_name] [varchar](55) NULL,
	[n_par_name] [varchar](55) NULL,
	[o_par_buld] [char](5) NULL,
	[n_par_buld] [char](5) NULL,
	[o_par_addres] [varchar](55) NULL,
	[n_par_addres] [varchar](55) NULL,
	[o_par_govcode] [char](2) NULL,
	[n_par_govcode] [char](2) NULL,
	[o_par_nality] [char](2) NULL,
	[n_par_nality] [char](2) NULL,
	[o_par_id_NationalID] [char](14) NULL,
	[n_par_id_NationalID] [char](14) NULL,
	[o_par_id_Passport] [char](14) NULL,
	[n_par_id_Passport] [char](14) NULL,
	[o_par_idp] [char](20) NULL,
	[n_par_idp] [char](20) NULL,
	[o_par_idd] [datetime] NULL,
	[n_par_idd] [datetime] NULL,
	[o_dis_code] [char](3) NULL,
	[n_dis_code] [char](3) NULL,
	[o_par_st_date] [datetime] NULL,
	[n_par_st_date] [datetime] NULL,
	[o_par_end_date] [datetime] NULL,
	[n_par_end_date] [datetime] NULL,
	[o_par_share] [varchar](10) NULL,
	[n_par_share] [varchar](10) NULL,
	[DateModified] [datetime] NULL,
	[IsTansferedToGat] [char](1) NULL,
	[user_modified] [nvarchar](255) NULL,
	[AppName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Igparown_updates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igRetKey]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igRetKey](
	[FBNUM] [char](12) NULL,
	[Ret_WardNo] [varchar](10) NOT NULL,
	[Ret_WardYear] [char](4) NOT NULL,
	[Ret_Dist] [char](3) NOT NULL,
	[mas_file] [char](16) NOT NULL,
	[mas_taxid] [char](9) NULL,
	[par_serl] [char](4) NOT NULL,
	[ret_year] [char](4) NOT NULL,
	[ret_type] [char](1) NOT NULL,
	[mas_ownr] [char](1) NULL,
	[mas_ownrdate] [datetime] NULL,
	[mas_stod] [char](5) NOT NULL,
	[ret_fldate] [datetime] NOT NULL,
	[Ret_Fdate] [datetime] NOT NULL,
	[Ret_Edate] [datetime] NOT NULL,
	[Ret_Acc] [char](1) NOT NULL,
	[Ret_exmt] [char](1) NOT NULL,
	[Ret_currancy] [char](2) NOT NULL,
	[Ret_EkrarType] [bit] NOT NULL,
	[Ret_BuildFlag] [char](1) NULL,
	[Ret_Time] [bit] NULL,
	[ret_a53] [bit] NULL,
	[Method_Code] [char](1) NOT NULL,
	[Ret_RecitNo] [varchar](16) NULL,
	[Ret_Check] [char](16) NULL,
	[Ret_CheckDate] [datetime] NULL,
	[Ret_MamId] [char](8) NOT NULL,
	[Ret_UsrId] [char](8) NOT NULL,
	[Ret_UpdateUsr] [char](8) NULL,
	[Ret_UpdateDate] [datetime] NULL,
	[Ret_TaxAmtFalg] [char](1) NOT NULL,
	[Ret_K] [char](1) NULL,
	[Ret_Kind] [char](3) NULL,
	[Ret_30] [char](1) NULL,
	[Ret_Details_Flg] [bit] NULL,
	[Ret_ExcRate] [decimal](18, 2) NULL,
	[Ret_VeryFy] [char](1) NULL,
	[Ret_CurrancyDetails] [char](2) NULL,
	[ret_oilnum] [char](2) NULL,
	[ret_oilyear] [char](4) NULL,
	[Ret_TaxDue] [decimal](18, 2) NULL,
	[Ret_Status] [smallint] NULL,
	[Ret_Corrective] [smallint] NULL,
	[manfz_code] [char](3) NULL,
	[Ret_AccountantName] [varchar](150) NULL,
	[Ret_AccountatNo] [varchar](100) NULL,
	[Ret_GetDate] [datetime] NULL,
	[fk_ret_catg] [varchar](3) NULL,
	[Ret_record_date] [datetime] NULL,
	[paid_with_ekrar] [decimal](18, 2) NULL,
	[Ret_enterDate] [datetime] NULL,
	[Ret_enterkUsr] [char](8) NULL,
	[Ret_revUsr] [char](8) NULL,
	[Ret_revDate] [datetime] NULL,
	[par_id] [varchar](14) NULL,
	[Ret_final_stop] [nchar](1) NOT NULL,
	[inv_name] [varchar](50) NULL,
	[inv_spname] [varchar](50) NULL,
	[sels_tax] [varchar](150) NULL,
	[forgin_comp] [varchar](150) NULL,
	[trafic_dep] [varchar](50) NULL,
	[union_name] [varchar](50) NULL,
	[branch_count] [int] NULL,
	[emp_count] [int] NULL,
	[khsm_num] [varchar](9) NULL,
	[Check1_mah] [nchar](18) NULL,
	[ModifiedDate] [datetime] NULL,
	[istransfered] [char](1) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [XPKigReturnKey] PRIMARY KEY CLUSTERED 
(
	[Ret_WardNo] ASC,
	[Ret_WardYear] ASC,
	[Ret_Dist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igretkey_backup]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igretkey_backup](
	[Ret_WardNo] [varchar](10) NOT NULL,
	[Ret_WardYear] [char](4) NOT NULL,
	[Ret_Dist] [char](3) NOT NULL,
	[mas_file] [char](16) NOT NULL,
	[mas_taxid] [char](9) NULL,
	[par_serl] [char](4) NOT NULL,
	[ret_year] [char](4) NOT NULL,
	[ret_type] [char](1) NOT NULL,
	[mas_ownr] [char](1) NULL,
	[mas_ownrdate] [datetime] NULL,
	[mas_stod] [char](5) NOT NULL,
	[ret_fldate] [datetime] NOT NULL,
	[Ret_Fdate] [datetime] NOT NULL,
	[Ret_Edate] [datetime] NOT NULL,
	[Ret_Acc] [char](1) NOT NULL,
	[Ret_exmt] [char](1) NOT NULL,
	[Ret_currancy] [char](2) NOT NULL,
	[Ret_EkrarType] [bit] NOT NULL,
	[Ret_BuildFlag] [char](1) NULL,
	[Ret_Time] [bit] NULL,
	[ret_a53] [bit] NULL,
	[Method_Code] [char](1) NOT NULL,
	[Ret_RecitNo] [varchar](16) NULL,
	[Ret_Check] [char](16) NULL,
	[Ret_CheckDate] [datetime] NULL,
	[Ret_MamId] [char](8) NOT NULL,
	[Ret_UsrId] [char](8) NOT NULL,
	[Ret_UpdateUsr] [char](8) NULL,
	[Ret_UpdateDate] [datetime] NULL,
	[Ret_TaxAmtFalg] [char](1) NOT NULL,
	[Ret_K] [char](1) NULL,
	[Ret_Kind] [char](3) NULL,
	[Ret_30] [char](1) NULL,
	[Ret_Details_Flg] [bit] NULL,
	[Ret_ExcRate] [decimal](18, 2) NULL,
	[Ret_VeryFy] [char](1) NULL,
	[Ret_CurrancyDetails] [char](2) NULL,
	[ret_oilnum] [char](2) NULL,
	[ret_oilyear] [char](4) NULL,
	[Ret_TaxDue] [decimal](18, 2) NULL,
	[Ret_Status] [smallint] NULL,
	[Ret_Corrective] [smallint] NULL,
	[manfz_code] [char](3) NULL,
	[Ret_AccountantName] [varchar](150) NULL,
	[Ret_AccountatNo] [varchar](100) NULL,
	[Ret_GetDate] [datetime] NULL,
	[fk_ret_catg] [varchar](3) NULL,
	[Ret_record_date] [datetime] NULL,
	[paid_with_ekrar] [decimal](18, 2) NULL,
	[Ret_enterDate] [datetime] NULL,
	[Ret_enterkUsr] [char](8) NULL,
	[Ret_revUsr] [char](8) NULL,
	[Ret_revDate] [datetime] NULL,
	[par_id] [varchar](14) NULL,
	[Ret_final_stop] [nchar](1) NOT NULL,
	[inv_name] [varchar](50) NULL,
	[inv_spname] [varchar](50) NULL,
	[sels_tax] [varchar](150) NULL,
	[forgin_comp] [varchar](150) NULL,
	[trafic_dep] [varchar](50) NULL,
	[union_name] [varchar](50) NULL,
	[branch_count] [int] NULL,
	[emp_count] [int] NULL,
	[khsm_num] [varchar](9) NULL,
	[Check1_mah] [nchar](18) NULL,
	[ModifiedDate] [datetime] NULL,
	[istransfered] [char](1) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igretkey_consolidated]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igretkey_consolidated](
	[FBNUM] [char](12) NOT NULL,
	[Ret_wardno] [varchar](10) NOT NULL,
	[TIN] [varchar](9) NOT NULL,
	[Change_date] [datetime] NOT NULL,
	[Batch_date] [datetime] NOT NULL,
	[Period] [char](4) NOT NULL,
	[Sys_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Igretkey_consolidated] PRIMARY KEY CLUSTERED 
(
	[Ret_wardno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igRetKey_error]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igRetKey_error](
	[FBNUM] [char](12) NULL,
	[Ret_WardNo] [varchar](10) NOT NULL,
	[Ret_WardYear] [char](4) NOT NULL,
	[Ret_Dist] [char](3) NOT NULL,
	[mas_file] [char](16) NOT NULL,
	[mas_taxid] [char](9) NULL,
	[par_serl] [char](4) NOT NULL,
	[ret_year] [char](4) NOT NULL,
	[ret_type] [char](1) NOT NULL,
	[mas_ownr] [char](1) NULL,
	[mas_ownrdate] [datetime] NULL,
	[mas_stod] [char](5) NOT NULL,
	[ret_fldate] [datetime] NOT NULL,
	[Ret_Fdate] [datetime] NOT NULL,
	[Ret_Edate] [datetime] NOT NULL,
	[Ret_Acc] [char](1) NOT NULL,
	[Ret_exmt] [char](1) NOT NULL,
	[Ret_currancy] [char](2) NOT NULL,
	[Ret_EkrarType] [bit] NOT NULL,
	[Ret_BuildFlag] [char](1) NULL,
	[Ret_Time] [bit] NULL,
	[ret_a53] [bit] NULL,
	[Method_Code] [char](1) NOT NULL,
	[Ret_RecitNo] [varchar](16) NULL,
	[Ret_Check] [char](16) NULL,
	[Ret_CheckDate] [datetime] NULL,
	[Ret_MamId] [char](8) NOT NULL,
	[Ret_UsrId] [char](8) NOT NULL,
	[Ret_UpdateUsr] [char](8) NULL,
	[Ret_UpdateDate] [datetime] NULL,
	[Ret_TaxAmtFalg] [char](1) NOT NULL,
	[Ret_K] [char](1) NULL,
	[Ret_Kind] [char](3) NULL,
	[Ret_30] [char](1) NULL,
	[Ret_Details_Flg] [bit] NULL,
	[Ret_ExcRate] [decimal](18, 2) NULL,
	[Ret_VeryFy] [char](1) NULL,
	[Ret_CurrancyDetails] [char](2) NULL,
	[ret_oilnum] [char](2) NULL,
	[ret_oilyear] [char](4) NULL,
	[Ret_TaxDue] [decimal](18, 2) NULL,
	[Ret_Status] [smallint] NULL,
	[Ret_Corrective] [smallint] NULL,
	[manfz_code] [char](3) NULL,
	[Ret_AccountantName] [varchar](150) NULL,
	[Ret_AccountatNo] [varchar](100) NULL,
	[Ret_GetDate] [datetime] NULL,
	[fk_ret_catg] [varchar](3) NULL,
	[Ret_record_date] [datetime] NULL,
	[paid_with_ekrar] [decimal](18, 2) NULL,
	[Ret_enterDate] [datetime] NULL,
	[Ret_enterkUsr] [char](8) NULL,
	[Ret_revUsr] [char](8) NULL,
	[Ret_revDate] [datetime] NULL,
	[par_id] [varchar](14) NULL,
	[Ret_final_stop] [nchar](1) NOT NULL,
	[inv_name] [varchar](50) NULL,
	[inv_spname] [varchar](50) NULL,
	[sels_tax] [varchar](150) NULL,
	[forgin_comp] [varchar](150) NULL,
	[trafic_dep] [varchar](50) NULL,
	[union_name] [varchar](50) NULL,
	[branch_count] [int] NULL,
	[emp_count] [int] NULL,
	[khsm_num] [varchar](9) NULL,
	[Check1_mah] [nchar](18) NULL,
	[ModifiedDate] [datetime] NULL,
	[istransfered] [char](1) NULL,
	[id] [int] NULL,
 CONSTRAINT [XPKigReturnKey_error] PRIMARY KEY CLUSTERED 
(
	[Ret_WardNo] ASC,
	[Ret_WardYear] ASC,
	[Ret_Dist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igRetKey_excluded]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igRetKey_excluded](
	[Ret_WardNo] [varchar](10) NOT NULL,
	[Ret_WardYear] [char](4) NOT NULL,
	[Ret_Dist] [char](3) NOT NULL,
	[mas_file] [char](16) NOT NULL,
	[mas_taxid] [char](9) NULL,
	[par_serl] [char](4) NOT NULL,
	[ret_year] [char](4) NOT NULL,
	[ret_type] [char](1) NOT NULL,
	[mas_ownr] [char](1) NULL,
	[mas_ownrdate] [datetime] NULL,
	[mas_stod] [char](5) NOT NULL,
	[ret_fldate] [datetime] NOT NULL,
	[Ret_Fdate] [datetime] NOT NULL,
	[Ret_Edate] [datetime] NOT NULL,
	[Ret_Acc] [char](1) NOT NULL,
	[Ret_exmt] [char](1) NOT NULL,
	[Ret_currancy] [char](2) NOT NULL,
	[Ret_EkrarType] [bit] NOT NULL,
	[Ret_BuildFlag] [char](1) NULL,
	[Ret_Time] [bit] NULL,
	[ret_a53] [bit] NULL,
	[Method_Code] [char](1) NOT NULL,
	[Ret_RecitNo] [varchar](16) NULL,
	[Ret_Check] [char](16) NULL,
	[Ret_CheckDate] [datetime] NULL,
	[Ret_MamId] [char](8) NOT NULL,
	[Ret_UsrId] [char](8) NOT NULL,
	[Ret_UpdateUsr] [char](8) NULL,
	[Ret_UpdateDate] [datetime] NULL,
	[Ret_TaxAmtFalg] [char](1) NOT NULL,
	[Ret_K] [char](1) NULL,
	[Ret_Kind] [char](3) NULL,
	[Ret_30] [char](1) NULL,
	[Ret_Details_Flg] [bit] NULL,
	[Ret_ExcRate] [decimal](18, 2) NULL,
	[Ret_VeryFy] [char](1) NULL,
	[Ret_CurrancyDetails] [char](2) NULL,
	[ret_oilnum] [char](2) NULL,
	[ret_oilyear] [char](4) NULL,
	[Ret_TaxDue] [decimal](18, 2) NULL,
	[Ret_Status] [smallint] NULL,
	[Ret_Corrective] [smallint] NULL,
	[manfz_code] [char](3) NULL,
	[Ret_AccountantName] [varchar](150) NULL,
	[Ret_AccountatNo] [varchar](100) NULL,
	[Ret_GetDate] [datetime] NULL,
	[fk_ret_catg] [varchar](3) NULL,
	[Ret_record_date] [datetime] NULL,
	[paid_with_ekrar] [decimal](18, 2) NULL,
	[Ret_enterDate] [datetime] NULL,
	[Ret_enterkUsr] [char](8) NULL,
	[Ret_revUsr] [char](8) NULL,
	[Ret_revDate] [datetime] NULL,
	[par_id] [varchar](14) NULL,
	[Ret_final_stop] [nchar](1) NOT NULL,
	[inv_name] [varchar](50) NULL,
	[inv_spname] [varchar](50) NULL,
	[sels_tax] [varchar](150) NULL,
	[forgin_comp] [varchar](150) NULL,
	[trafic_dep] [varchar](50) NULL,
	[union_name] [varchar](50) NULL,
	[branch_count] [int] NULL,
	[emp_count] [int] NULL,
	[khsm_num] [varchar](9) NULL,
	[Check1_mah] [nchar](18) NULL,
 CONSTRAINT [XPKigReturnKey_excluded] PRIMARY KEY CLUSTERED 
(
	[Ret_WardNo] ASC,
	[Ret_WardYear] ASC,
	[Ret_Dist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igRetKey_temp]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igRetKey_temp](
	[FBNUM] [char](12) NULL,
	[Ret_WardNo] [varchar](10) NOT NULL,
	[Ret_WardYear] [char](4) NOT NULL,
	[Ret_Dist] [char](3) NOT NULL,
	[mas_file] [char](16) NOT NULL,
	[mas_taxid] [char](9) NULL,
	[par_serl] [char](4) NOT NULL,
	[ret_year] [char](4) NOT NULL,
	[ret_type] [char](1) NOT NULL,
	[mas_ownr] [char](1) NULL,
	[mas_ownrdate] [datetime] NULL,
	[mas_stod] [char](5) NOT NULL,
	[ret_fldate] [datetime] NOT NULL,
	[Ret_Fdate] [datetime] NOT NULL,
	[Ret_Edate] [datetime] NOT NULL,
	[Ret_Acc] [char](1) NOT NULL,
	[Ret_exmt] [char](1) NOT NULL,
	[Ret_currancy] [char](2) NOT NULL,
	[Ret_EkrarType] [bit] NOT NULL,
	[Ret_BuildFlag] [char](1) NULL,
	[Ret_Time] [bit] NULL,
	[ret_a53] [bit] NULL,
	[Method_Code] [char](1) NOT NULL,
	[Ret_RecitNo] [varchar](16) NULL,
	[Ret_Check] [char](16) NULL,
	[Ret_CheckDate] [datetime] NULL,
	[Ret_MamId] [char](8) NOT NULL,
	[Ret_UsrId] [char](8) NOT NULL,
	[Ret_UpdateUsr] [char](8) NULL,
	[Ret_UpdateDate] [datetime] NULL,
	[Ret_TaxAmtFalg] [char](1) NOT NULL,
	[Ret_K] [char](1) NULL,
	[Ret_Kind] [char](3) NULL,
	[Ret_30] [char](1) NULL,
	[Ret_Details_Flg] [bit] NULL,
	[Ret_ExcRate] [decimal](18, 2) NULL,
	[Ret_VeryFy] [char](1) NULL,
	[Ret_CurrancyDetails] [char](2) NULL,
	[ret_oilnum] [char](2) NULL,
	[ret_oilyear] [char](4) NULL,
	[Ret_TaxDue] [decimal](18, 2) NULL,
	[Ret_Status] [smallint] NULL,
	[Ret_Corrective] [smallint] NULL,
	[manfz_code] [char](3) NULL,
	[Ret_AccountantName] [varchar](150) NULL,
	[Ret_AccountatNo] [varchar](100) NULL,
	[Ret_GetDate] [datetime] NULL,
	[fk_ret_catg] [varchar](3) NULL,
	[Ret_record_date] [datetime] NULL,
	[paid_with_ekrar] [decimal](18, 2) NULL,
	[Ret_enterDate] [datetime] NULL,
	[Ret_enterkUsr] [char](8) NULL,
	[Ret_revUsr] [char](8) NULL,
	[Ret_revDate] [datetime] NULL,
	[par_id] [varchar](14) NULL,
	[Ret_final_stop] [nchar](1) NOT NULL,
	[inv_name] [varchar](50) NULL,
	[inv_spname] [varchar](50) NULL,
	[sels_tax] [varchar](150) NULL,
	[forgin_comp] [varchar](150) NULL,
	[trafic_dep] [varchar](50) NULL,
	[union_name] [varchar](50) NULL,
	[branch_count] [int] NULL,
	[emp_count] [int] NULL,
	[khsm_num] [varchar](9) NULL,
	[Check1_mah] [nchar](18) NULL,
	[ModifiedDate] [datetime] NULL,
	[istransfered] [char](1) NULL,
	[id] [int] NULL,
 CONSTRAINT [XPKigReturnKey_temp] PRIMARY KEY CLUSTERED 
(
	[Ret_WardNo] ASC,
	[Ret_WardYear] ASC,
	[Ret_Dist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igretkeyall]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igretkeyall](
	[FBNUM] [char](12) NULL,
	[Ret_WardNo] [varchar](10) NOT NULL,
	[Ret_WardYear] [char](4) NOT NULL,
	[Ret_Dist] [char](3) NOT NULL,
	[mas_file] [char](16) NOT NULL,
	[mas_taxid] [char](9) NULL,
	[par_serl] [char](4) NOT NULL,
	[ret_year] [char](4) NOT NULL,
	[ret_type] [char](1) NOT NULL,
	[mas_ownr] [char](1) NULL,
	[mas_ownrdate] [datetime] NULL,
	[mas_stod] [char](5) NOT NULL,
	[ret_fldate] [datetime] NOT NULL,
	[Ret_Fdate] [datetime] NOT NULL,
	[Ret_Edate] [datetime] NOT NULL,
	[Ret_Acc] [char](1) NOT NULL,
	[Ret_exmt] [char](1) NOT NULL,
	[Ret_currancy] [char](2) NOT NULL,
	[Ret_EkrarType] [bit] NOT NULL,
	[Ret_BuildFlag] [char](1) NULL,
	[Ret_Time] [bit] NULL,
	[ret_a53] [bit] NULL,
	[Method_Code] [char](1) NOT NULL,
	[Ret_RecitNo] [varchar](16) NULL,
	[Ret_Check] [char](16) NULL,
	[Ret_CheckDate] [datetime] NULL,
	[Ret_MamId] [char](8) NOT NULL,
	[Ret_UsrId] [char](8) NOT NULL,
	[Ret_UpdateUsr] [char](8) NULL,
	[Ret_UpdateDate] [datetime] NULL,
	[Ret_TaxAmtFalg] [char](1) NOT NULL,
	[Ret_K] [char](1) NULL,
	[Ret_Kind] [char](3) NULL,
	[Ret_30] [char](1) NULL,
	[Ret_Details_Flg] [bit] NULL,
	[Ret_ExcRate] [decimal](18, 2) NULL,
	[Ret_VeryFy] [char](1) NULL,
	[Ret_CurrancyDetails] [char](2) NULL,
	[ret_oilnum] [char](2) NULL,
	[ret_oilyear] [char](4) NULL,
	[Ret_TaxDue] [decimal](18, 2) NULL,
	[Ret_Status] [smallint] NULL,
	[Ret_Corrective] [smallint] NULL,
	[manfz_code] [char](3) NULL,
	[Ret_AccountantName] [varchar](150) NULL,
	[Ret_AccountatNo] [varchar](100) NULL,
	[Ret_GetDate] [datetime] NULL,
	[fk_ret_catg] [varchar](3) NULL,
	[Ret_record_date] [datetime] NULL,
	[paid_with_ekrar] [decimal](18, 2) NULL,
	[Ret_enterDate] [datetime] NULL,
	[Ret_enterkUsr] [char](8) NULL,
	[Ret_revUsr] [char](8) NULL,
	[Ret_revDate] [datetime] NULL,
	[par_id] [varchar](14) NULL,
	[Ret_final_stop] [nchar](1) NOT NULL,
	[inv_name] [varchar](50) NULL,
	[inv_spname] [varchar](50) NULL,
	[sels_tax] [varchar](150) NULL,
	[forgin_comp] [varchar](150) NULL,
	[trafic_dep] [varchar](50) NULL,
	[union_name] [varchar](50) NULL,
	[branch_count] [int] NULL,
	[emp_count] [int] NULL,
	[khsm_num] [varchar](9) NULL,
	[Check1_mah] [nchar](18) NULL,
	[ModifiedDate] [datetime] NULL,
	[istransfered] [char](1) NULL,
	[id] [int] NULL,
 CONSTRAINT [PK_igretkeyall] PRIMARY KEY CLUSTERED 
(
	[Ret_WardNo] ASC,
	[Ret_WardYear] ASC,
	[Ret_Dist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igRetYearlyItemsValues]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igRetYearlyItemsValues](
	[fk_Ret_WardNo] [char](10) NOT NULL,
	[fk_Ret_WardYear] [char](4) NOT NULL,
	[fk_Ret_Dist] [char](3) NOT NULL,
	[fk_Ret_Catg] [varchar](3) NOT NULL,
	[fk_Ret_Items] [int] NOT NULL,
	[fk_Ret_Year] [char](4) NOT NULL,
	[Ret_ForYear] [char](4) NOT NULL,
	[Ret_Values] [decimal](18, 2) NOT NULL,
	[Ret_Code] [char](8) NOT NULL,
	[mas_File] [varchar](16) NOT NULL,
	[Ret_CorrectValues] [decimal](18, 2) NULL,
	[Ret_UsrId] [char](8) NOT NULL,
	[Ret_SysDate] [datetime] NOT NULL,
	[Ret_UpdateUsr] [char](8) NULL,
	[Ret_UpdateDate] [datetime] NULL,
	[ret_reviewusr] [char](9) NULL,
	[ret_reviewdate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[istransfered] [char](1) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_igRetYearlyItemsValues] PRIMARY KEY CLUSTERED 
(
	[fk_Ret_WardNo] ASC,
	[fk_Ret_WardYear] ASC,
	[fk_Ret_Dist] ASC,
	[fk_Ret_Catg] ASC,
	[fk_Ret_Items] ASC,
	[fk_Ret_Year] ASC,
	[Ret_ForYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igwared]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igwared](
	[war_no] [char](10) NOT NULL,
	[war_year] [char](4) NOT NULL,
	[war_kind] [char](3) NOT NULL,
	[war_date] [datetime] NOT NULL,
	[mas_file] [char](16) NOT NULL,
	[par_serl] [char](4) NULL,
	[mas_ownr] [char](1) NULL,
	[year_from] [char](4) NULL,
	[year_to] [char](4) NULL,
	[war_uid] [char](8) NOT NULL,
	[war_sysdate] [datetime] NOT NULL,
	[war_rcvdate] [datetime] NOT NULL,
	[mas_taxid] [char](9) NULL,
	[dis_code] [char](3) NOT NULL,
	[istransfered] [char](1) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[isupdated] [int] NULL,
	[insert_date] [datetime] NULL,
 CONSTRAINT [PK_igwared11] PRIMARY KEY CLUSTERED 
(
	[war_no] ASC,
	[war_year] ASC,
	[war_kind] ASC,
	[dis_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khasm]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khasm](
	[kst_year] [char](4) NOT NULL,
	[kst_jul] [char](3) NOT NULL,
	[kst_serl] [char](3) NOT NULL,
	[kst_docdate] [datetime] NULL,
	[kst_docnum] [char](15) NULL,
	[kst_docnum1] [char](8) NULL,
	[kst_docnum2] [char](5) NULL,
	[kst_pageno] [char](4) NOT NULL,
	[kst_lineno] [char](5) NOT NULL,
	[kst_taxid] [char](9) NULL,
	[kst_file] [char](16) NULL,
	[kst_reg] [char](3) NULL,
	[kst_acttype] [char](1) NULL,
	[kst_ghatype] [char](1) NULL,
	[kst_date] [datetime] NULL,
	[kst_natcode] [char](1) NULL,
	[kst_ksmcode] [char](1) NULL,
	[kst_dealtype] [char](2) NULL,
	[kst_totval] [decimal](13, 2) NULL,
	[kst_ksmval] [decimal](13, 2) NULL,
	[kst_netval] [decimal](13, 2) NULL,
	[kst_prcnt] [decimal](5, 2) NULL,
	[kst_taxval] [decimal](13, 2) NULL,
	[kst_ratflag] [char](1) NULL,
	[kst_flag] [char](1) NULL,
	[kst_currency] [char](2) NULL,
	[kst_uid] [char](8) NULL,
	[kst_sysdate] [datetime] NULL,
	[kst_ruid] [char](8) NULL,
	[kst_rsysdate] [datetime] NULL,
	[kst_upuid] [char](8) NULL,
	[kst_upsysdate] [datetime] NULL,
	[gha_name] [char](60) NULL,
	[gha_num] [char](9) NOT NULL,
	[flag] [char](1) NULL,
	[web_date] [datetime] NULL,
	[entry_source_code] [tinyint] NULL,
	[bat_branch] [int] NOT NULL,
	[notes] [varchar](200) NULL,
	[update_flag] [int] NULL,
	[nat_id] [char](14) NULL,
	[taxpayer_name] [char](100) NULL,
	[address] [char](100) NULL,
	[form_bundle] [char](12) NOT NULL,
	[Ded_date] [date] NULL,
	[batch_date] [datetime] NULL,
	[TransferedToETAFlag] [tinyint] NULL,
	[TransferedToETADate] [datetime] NULL,
 CONSTRAINT [PK_khasm] PRIMARY KEY CLUSTERED 
(
	[bat_branch] ASC,
	[kst_year] ASC,
	[kst_jul] ASC,
	[kst_serl] ASC,
	[kst_pageno] ASC,
	[kst_lineno] ASC,
	[form_bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khasm_Excel]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khasm_Excel](
	[kst_year] [char](4) NOT NULL,
	[kst_jul] [char](3) NOT NULL,
	[kst_serl] [char](3) NOT NULL,
	[kst_docdate] [datetime] NULL,
	[kst_docnum] [char](15) NULL,
	[kst_docnum1] [char](8) NULL,
	[kst_docnum2] [char](5) NULL,
	[kst_pageno] [char](4) NOT NULL,
	[kst_lineno] [char](5) NOT NULL,
	[kst_taxid] [char](9) NULL,
	[kst_file] [char](16) NULL,
	[kst_reg] [char](3) NULL,
	[kst_acttype] [char](1) NULL,
	[kst_ghatype] [char](1) NULL,
	[kst_date] [datetime] NULL,
	[kst_natcode] [char](1) NULL,
	[kst_ksmcode] [char](1) NULL,
	[kst_dealtype] [char](2) NULL,
	[kst_totval] [decimal](13, 2) NULL,
	[kst_ksmval] [decimal](13, 2) NULL,
	[kst_netval] [decimal](13, 2) NULL,
	[kst_prcnt] [decimal](5, 2) NULL,
	[kst_taxval] [decimal](13, 2) NULL,
	[kst_ratflag] [char](1) NULL,
	[kst_flag] [char](1) NULL,
	[kst_currency] [char](2) NULL,
	[kst_uid] [char](8) NULL,
	[kst_sysdate] [datetime] NULL,
	[kst_ruid] [char](8) NULL,
	[kst_rsysdate] [datetime] NULL,
	[kst_upuid] [char](8) NULL,
	[kst_upsysdate] [datetime] NULL,
	[gha_name] [char](60) NULL,
	[gha_num] [char](9) NOT NULL,
	[flag] [char](1) NULL,
	[web_date] [datetime] NULL,
	[entry_source_code] [tinyint] NULL,
	[bat_branch] [int] NOT NULL,
	[notes] [varchar](200) NULL,
	[update_flag] [int] NULL,
	[nat_id] [char](14) NULL,
	[taxpayer_name] [char](100) NULL,
	[address] [char](100) NULL,
	[form_bundle] [char](12) NOT NULL,
	[Ded_date] [date] NULL,
	[batch_date] [datetime] NULL,
	[TransferedToETAFlag] [tinyint] NULL,
	[TransferedToETADate] [datetime] NULL,
	[tax_period] [char](1) NULL,
	[tax_period_year] [char](4) NULL,
 CONSTRAINT [PK_khasm41] PRIMARY KEY CLUSTERED 
(
	[bat_branch] ASC,
	[kst_year] ASC,
	[kst_jul] ASC,
	[kst_serl] ASC,
	[kst_pageno] ASC,
	[kst_lineno] ASC,
	[form_bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khasm_online_Core]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khasm_online_Core](
	[kst_year] [char](4) NOT NULL,
	[kst_jul] [char](3) NOT NULL,
	[kst_serl] [char](3) NOT NULL,
	[kst_docdate] [datetime] NULL,
	[kst_docnum] [char](15) NULL,
	[kst_docnum1] [char](8) NULL,
	[kst_docnum2] [char](5) NULL,
	[kst_pageno] [char](4) NOT NULL,
	[kst_lineno] [char](5) NOT NULL,
	[kst_taxid] [char](9) NULL,
	[kst_file] [char](16) NULL,
	[kst_reg] [char](3) NULL,
	[kst_acttype] [char](1) NULL,
	[kst_ghatype] [char](1) NULL,
	[kst_date] [datetime] NULL,
	[kst_natcode] [char](1) NULL,
	[kst_ksmcode] [char](1) NULL,
	[kst_dealtype] [char](2) NULL,
	[kst_totval] [decimal](13, 2) NULL,
	[kst_ksmval] [decimal](13, 2) NULL,
	[kst_netval] [decimal](13, 2) NULL,
	[kst_prcnt] [decimal](5, 2) NULL,
	[kst_taxval] [decimal](13, 2) NULL,
	[kst_ratflag] [char](1) NULL,
	[kst_flag] [char](1) NULL,
	[kst_currency] [char](2) NULL,
	[kst_uid] [char](8) NULL,
	[kst_sysdate] [datetime] NULL,
	[kst_ruid] [char](8) NULL,
	[kst_rsysdate] [datetime] NULL,
	[kst_upuid] [char](8) NULL,
	[kst_upsysdate] [datetime] NULL,
	[gha_name] [char](60) NULL,
	[gha_num] [char](9) NOT NULL,
	[flag] [char](1) NULL,
	[web_date] [datetime] NULL,
	[entry_source_code] [tinyint] NULL,
	[bat_branch] [int] NOT NULL,
	[notes] [varchar](200) NULL,
	[update_flag] [int] NULL,
	[nat_id] [char](14) NULL,
	[taxpayer_name] [char](100) NULL,
	[address] [char](100) NULL,
	[form_bundle] [char](12) NOT NULL,
	[TransferedToETA] [tinyint] NULL,
 CONSTRAINT [PK_khasm_online] PRIMARY KEY CLUSTERED 
(
	[kst_year] ASC,
	[kst_jul] ASC,
	[kst_serl] ASC,
	[kst_pageno] ASC,
	[kst_lineno] ASC,
	[bat_branch] ASC,
	[form_bundle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[license]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[license](
	[licenseid] [numeric](18, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[rin] [char](9) NOT NULL,
	[licensecode] [smallint] NOT NULL,
	[licensenum] [varchar](60) NOT NULL,
	[licensedate] [datetime] NOT NULL,
	[fromdate] [datetime] NOT NULL,
	[todate] [datetime] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
 CONSTRAINT [PK_license] PRIMARY KEY CLUSTERED 
(
	[licenseid] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LK_Regions]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LK_Regions](
	[Code] [char](3) NOT NULL,
	[ArabicName] [nvarchar](255) NULL,
	[EnglishName] [nvarchar](255) NULL,
 CONSTRAINT [PK_LK_Regions] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lkpInvoiceType]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lkpInvoiceType](
	[ID] [int] NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logmaster_audit]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logmaster_audit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[n_mas_taxid] [varchar](9) NULL,
	[o_mas_taxid] [varchar](9) NULL,
	[n_mas_file] [char](16) NULL,
	[o_mas_file] [char](16) NULL,
	[n_dis_code] [char](3) NULL,
	[o_dis_code] [char](3) NULL,
	[n_mas_name] [varchar](55) NULL,
	[o_mas_name] [varchar](55) NULL,
	[n_mas_buld] [varchar](5) NULL,
	[o_mas_buld] [varchar](5) NULL,
	[n_mas_adress] [varchar](55) NULL,
	[o_mas_adress] [varchar](55) NULL,
	[n_mas_mail] [varchar](55) NULL,
	[o_mas_mail] [varchar](55) NULL,
	[n_mas_ownr] [char](1) NULL,
	[o_mas_ownr] [char](1) NULL,
	[n_mas_st_date] [datetime] NULL,
	[o_mas_st_date] [datetime] NULL,
	[n_mas_end_date] [datetime] NULL,
	[o_mas_end_date] [datetime] NULL,
	[n_mas_status] [char](1) NULL,
	[o_mas_status] [char](1) NULL,
	[n_mas_omain] [char](1) NULL,
	[o_mas_omain] [char](1) NULL,
	[n_mas_trade_name] [char](100) NULL,
	[o_mas_trade_name] [char](100) NULL,
	[n_desc_act_acode] [varchar](500) NULL,
	[o_desc_act_acode] [varchar](500) NULL,
	[n_act_brn] [char](4) NULL,
	[o_act_brn] [char](4) NULL,
	[Modified_date] [datetime] NULL,
	[User_modified] [varchar](200) NULL,
	[AppName] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mainactivity]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mainactivity](
	[mainactivityid] [numeric](18, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[mainactvcode] [smallint] NOT NULL,
	[rin] [char](9) NOT NULL,
	[sourcecode] [smallint] NULL,
	[mainact] [char](1) NULL,
	[startdate] [datetime] NOT NULL,
	[enddate] [datetime] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
 CONSTRAINT [PK_mainactivity] PRIMARY KEY CLUSTERED 
(
	[mainactivityid] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mas_info]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mas_info](
	[mas_taxid] [char](9) NOT NULL,
	[mas_name] [char](60) NOT NULL,
	[mas_ownr] [char](1) NOT NULL,
	[ms_trade_name] [char](60) NOT NULL,
	[mas_omain] [char](1) NOT NULL,
	[mas_name_Lg_represent] [char](55) NULL,
	[num_Lg_repre_id] [char](14) NULL,
	[mas_st_date] [datetime] NOT NULL,
	[mas_lgdate] [datetime] NOT NULL,
	[act_brn] [char](4) NULL,
	[mas_saveldate] [datetime] NULL,
	[mas_buld] [char](5) NULL,
	[mas_address] [varchar](100) NULL,
	[mas_gov] [char](2) NULL,
	[mas_end_date] [datetime] NULL,
	[com_inv_cap] [decimal](18, 0) NULL,
	[com_amt1] [decimal](18, 0) NULL,
	[com_amt2] [decimal](18, 0) NULL,
	[commerialid] [char](10) NULL,
	[com_stor] [char](1) NULL,
	[mas_stod] [char](5) NULL,
	[com_num_empl] [char](5) NULL,
 CONSTRAINT [PK_mas_info] PRIMARY KEY CLUSTERED 
(
	[mas_taxid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master](
	[rin] [char](9) NOT NULL,
	[inctaxdistid] [char](3) NULL,
	[regstatuscode] [smallint] NULL,
	[legalcode] [smallint] NOT NULL,
	[sectorcode] [smallint] NULL,
	[rincode] [char](1) NOT NULL,
	[filingcode] [smallint] NOT NULL,
	[casecode] [char](1) NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[taxphasecode] [smallint] NOT NULL,
	[parentrin] [char](9) NULL,
	[regname] [varchar](60) NOT NULL,
	[tradename] [varchar](60) NULL,
	[regdate] [datetime] NOT NULL,
	[deregdate] [datetime] NULL,
	[taxfileno] [char](16) NULL,
	[accptcheck] [char](1) NULL,
	[email] [varchar](60) NULL,
	[tmpnobrnch] [smallint] NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[begturnover] [numeric](14, 2) NULL,
	[par_id] [char](14) NULL,
	[passportno] [varchar](30) NULL,
	[begturnover_sdate] [datetime] NULL,
	[begturnover_edate] [datetime] NULL,
	[nationality] [smallint] NULL,
	[finance_edate] [int] NULL,
	[website] [nvarchar](100) NULL,
	[segel] [nvarchar](9) NULL,
	[old_filingcode] [smallint] NULL,
 CONSTRAINT [PK_master] PRIMARY KEY CLUSTERED 
(
	[rin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[master_record]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[master_record](
	[mas_taxid] [nvarchar](9) NOT NULL,
	[mas_name] [nvarchar](60) NOT NULL,
	[mas_address] [nvarchar](60) NULL,
	[dis_code] [nvarchar](3) NOT NULL,
	[dis_desc] [nvarchar](18) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[new_regactivity]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[new_regactivity](
	[new_regactivityid] [numeric](18, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[sourcecode] [smallint] NULL,
	[taxationcode] [smallint] NOT NULL,
	[activity_level_fourid] [numeric](18, 0) NOT NULL,
	[branchid] [nvarchar](13) NOT NULL,
	[primact] [char](1) NOT NULL,
	[actturnover] [numeric](14, 2) NOT NULL,
	[fromdate] [datetime] NOT NULL,
	[todate] [datetime] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[rin] [nvarchar](9) NULL,
 CONSTRAINT [PK_new_regactivity] PRIMARY KEY CLUSTERED 
(
	[new_regactivityid] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NonTableVatTax]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonTableVatTax](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationTypeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[SalesDetails] [ntext] NULL,
	[SalesTotal] [decimal](18, 2) NULL,
	[SalesAdjustment] [decimal](18, 2) NULL,
	[SalesVat] [decimal](18, 2) NULL,
	[PurchaseDetails] [ntext] NULL,
	[PurchaseTotal] [decimal](18, 2) NULL,
	[PurchaseAdjustment] [decimal](18, 2) NULL,
	[PurchaseVat] [decimal](18, 2) NULL,
	[RecivableTax] [decimal](18, 2) NULL,
	[DebtValue] [decimal](18, 2) NULL,
	[TotalTaxValue] [decimal](18, 2) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[PersonalizeTypeID] [int] NULL,
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
	[ReconciliationType] [int] NULL,
	[ReconciliationValue] [decimal](18, 2) NULL,
	[AcceptanceDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[RecoPaymentDate] [datetime] NULL,
	[InquiryTransAmountVAT] [decimal](18, 2) NULL,
	[IsExtracted] [bit] NULL,
	[ExtractedDate] [datetime] NULL,
 CONSTRAINT [PK_NonTableVatTax] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[par_info]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[par_info](
	[par_taxid] [char](9) NOT NULL,
	[par_name] [char](60) NOT NULL,
	[par_buld] [char](5) NULL,
	[par_address] [varchar](100) NULL,
	[par_gov] [char](2) NULL,
	[par_nat] [char](2) NOT NULL,
	[par_id] [char](14) NOT NULL,
	[par_idp] [char](14) NOT NULL,
	[par_idd] [datetime] NOT NULL,
	[par_entity] [char](1) NULL,
	[mas_knowdate] [datetime] NOT NULL,
	[mas_opdate] [datetime] NOT NULL,
	[par_st_date] [datetime] NOT NULL,
	[par_end_date] [datetime] NULL,
	[par_share] [char](5) NOT NULL,
	[email] [char](30) NULL,
	[fax] [char](14) NULL,
 CONSTRAINT [PK_par_info] PRIMARY KEY CLUSTERED 
(
	[par_taxid] ASC,
	[par_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone](
	[phoneid] [numeric](18, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[contactcode] [smallint] NULL,
	[branchid] [nvarchar](13) NOT NULL,
	[phonecode] [char](1) NOT NULL,
	[phonenum] [varchar](12) NOT NULL,
	[fromdate] [datetime] NOT NULL,
	[todate] [datetime] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[rin] [nvarchar](9) NULL,
 CONSTRAINT [PK_phone] PRIMARY KEY CLUSTERED 
(
	[phoneid] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductType_Id] [int] NOT NULL,
	[Product_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasesInvoices]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasesInvoices](
	[PurchaseInvoice_Id] [uniqueidentifier] NOT NULL,
	[InvoiceType] [int] NULL,
	[Company_Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Company_Unique_Tax_Id] [nchar](9) NOT NULL,
	[Invoice_Number] [nvarchar](255) NOT NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [decimal](19, 5) NULL,
	[Invoice_Total_Tax] [decimal](19, 5) NULL,
	[Invoice_Total_Money] [decimal](19, 5) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nchar](14) NULL,
	[Customer_Mobile] [nchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[Replicated] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
 CONSTRAINT [PK_PurchasesInvoices] PRIMARY KEY NONCLUSTERED 
(
	[PurchaseInvoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasesInvoicesDetails]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasesInvoicesDetails](
	[PurchasesInvoicesDetails_Id] [uniqueidentifier] NOT NULL,
	[Fk_PurchasesInvoices_Id] [uniqueidentifier] NOT NULL,
	[Fk_InvoiceType] [int] NULL,
	[InvoiceDate] [date] NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Fk_ProductType_Id] [int] NULL,
	[Fk_TaxType_Id] [int] NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [decimal](19, 5) NULL,
	[Tax] [decimal](19, 5) NULL,
	[Product_Tax_Value] [decimal](19, 5) NULL,
	[Product_Quantity] [decimal](19, 5) NULL,
	[Product_Total_Net] [decimal](19, 5) NULL,
	[Product_Total_Tax_Value] [decimal](19, 5) NULL,
	[Product_Total_Money] [decimal](19, 5) NULL,
	[Replicated] [bit] NULL,
	[ItemType] [int] NULL,
	[SectionType] [int] NULL,
	[Discount] [decimal](19, 5) NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
 CONSTRAINT [PK_PurchasesInvoicesDetails] PRIMARY KEY CLUSTERED 
(
	[PurchasesInvoicesDetails_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegMasterDoc]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegMasterDoc](
	[rin] [char](9) NOT NULL,
	[branchnum] [smallint] NOT NULL,
	[branchcode] [smallint] NOT NULL,
	[filingcode] [smallint] NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[regname] [varchar](60) NOT NULL,
	[regdate] [datetime] NOT NULL,
	[deregdate] [datetime] NULL,
	[addr1] [varchar](60) NOT NULL,
	[addr2] [varchar](60) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[certstatus] [char](1) NULL,
	[branchid] [numeric](18, 0) NULL,
	[printnum] [int] NULL,
	[validfrom] [datetime] NULL,
	[validto] [datetime] NULL,
	[lostcert] [char](1) NULL,
 CONSTRAINT [pk_regmasterDoc] PRIMARY KEY CLUSTERED 
(
	[rin] ASC,
	[branchnum] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[retgoodpurch]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retgoodpurch](
	[officeid] [numeric](18, 0) NOT NULL,
	[retgoodpurchid] [numeric](18, 0) NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[taxrateid] [numeric](18, 0) NOT NULL,
	[localval] [numeric](14, 2) NULL,
	[expval] [numeric](14, 2) NULL,
	[purchval] [numeric](14, 2) NOT NULL,
	[purchtax] [numeric](14, 2) NOT NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[SAP_ID] [uniqueidentifier] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[officeid] ASC,
	[retgoodpurchid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[retgoodreceit]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retgoodreceit](
	[officeid] [numeric](18, 0) NOT NULL,
	[retgoodreceitid] [numeric](18, 0) NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[recietcode] [smallint] NOT NULL,
	[recietno] [int] NOT NULL,
	[recietserialfrom] [nvarchar](50) NULL,
	[recietserialto] [nvarchar](50) NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[SAP_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK__retgoodreceit] PRIMARY KEY NONCLUSTERED 
(
	[officeid] ASC,
	[retgoodreceitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[retgoodvat]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retgoodvat](
	[officeid] [numeric](18, 0) NOT NULL,
	[retgoodvatid] [numeric](18, 0) NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[taxrateid] [numeric](18, 0) NOT NULL,
	[vatval] [numeric](14, 2) NULL,
	[vattax] [numeric](14, 2) NOT NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[SAP_ID] [uniqueidentifier] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[officeid] ASC,
	[retgoodvatid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[retpurch]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retpurch](
	[officeid] [numeric](18, 0) NOT NULL,
	[retpurchid] [numeric](18, 0) NOT NULL,
	[returnsid] [numeric](18, 0) NOT NULL,
	[taxrateid] [numeric](18, 0) NOT NULL,
	[purchval] [numeric](14, 2) NOT NULL,
	[purchtax] [numeric](14, 2) NOT NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[localval] [numeric](14, 2) NULL,
	[expval] [numeric](14, 2) NULL,
	[SAP_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_retpurch] PRIMARY KEY CLUSTERED 
(
	[officeid] ASC,
	[retpurchid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[retreceit]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retreceit](
	[officeid] [numeric](18, 0) NOT NULL,
	[retreceitid] [numeric](18, 0) NOT NULL,
	[returnsid] [numeric](18, 0) NOT NULL,
	[recietcode] [smallint] NOT NULL,
	[recietno] [int] NOT NULL,
	[recietserialfrom] [nvarchar](50) NULL,
	[recietserialto] [nvarchar](50) NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[SAP_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK__retreceit] PRIMARY KEY NONCLUSTERED 
(
	[officeid] ASC,
	[retreceitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[retsale]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retsale](
	[officeid] [numeric](18, 0) NOT NULL,
	[retsaleid] [numeric](18, 0) NOT NULL,
	[returnsid] [numeric](18, 0) NOT NULL,
	[taxrateid] [numeric](18, 0) NOT NULL,
	[saleval] [numeric](14, 2) NOT NULL,
	[saletax] [numeric](14, 2) NOT NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[goodval] [numeric](14, 2) NULL,
	[serviceval] [numeric](14, 2) NULL,
	[SAP_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_retsale] PRIMARY KEY CLUSTERED 
(
	[officeid] ASC,
	[retsaleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[returns]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[returns](
	[officeid] [numeric](18, 0) NOT NULL,
	[returnsid] [numeric](18, 0) NOT NULL,
	[rin] [char](9) NOT NULL,
	[errwarid] [int] NULL,
	[assescode] [smallint] NULL,
	[returncode] [smallint] NOT NULL,
	[returnstatuscode] [smallint] NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[transdate] [datetime] NOT NULL,
	[salealtc] [numeric](14, 2) NOT NULL,
	[purctdt2] [numeric](14, 2) NOT NULL,
	[nettaxpy] [numeric](14, 2) NOT NULL,
	[errcount] [smallint] NOT NULL,
	[noretsale] [int] NULL,
	[noretpurch] [int] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[taxratesflg] [smallint] NULL,
	[doclocnum] [varchar](20) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[returndoccode] [smallint] NULL,
	[supplytotal] [numeric](14, 2) NULL,
	[supplydis] [numeric](14, 2) NULL,
	[inputtotal] [numeric](14, 2) NULL,
	[inputdis] [numeric](14, 2) NULL,
	[prev_rassed] [numeric](14, 2) NULL,
	[toteradate] [numeric](14, 2) NULL,
	[totmoshtriat] [numeric](14, 2) NULL,
	[SAP_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_returns] PRIMARY KEY CLUSTERED 
(
	[officeid] ASC,
	[returnsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[returnsgoodret]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[returnsgoodret](
	[officeid] [numeric](18, 0) NOT NULL,
	[returnsgoodretid] [numeric](18, 0) NOT NULL,
	[rin] [char](9) NOT NULL,
	[assescode] [smallint] NULL,
	[returncode] [smallint] NOT NULL,
	[returnstatuscode] [smallint] NOT NULL,
	[taxyrmo] [datetime] NOT NULL,
	[transdate] [datetime] NOT NULL,
	[goodtotal] [numeric](14, 2) NULL,
	[gooddis] [numeric](14, 2) NULL,
	[goodtax] [numeric](14, 2) NULL,
	[vattotal] [numeric](14, 2) NULL,
	[vatdis] [numeric](14, 2) NULL,
	[vattax] [numeric](14, 2) NULL,
	[inputtotal] [numeric](14, 2) NULL,
	[inputdis] [numeric](14, 2) NULL,
	[inputtax] [numeric](14, 2) NOT NULL,
	[prev_rassed] [numeric](14, 2) NULL,
	[nettaxpy] [numeric](14, 2) NOT NULL,
	[toteradate] [numeric](14, 2) NULL,
	[totmoshtriat] [numeric](14, 2) NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[doclocnum] [varchar](20) NULL,
	[moddate] [datetime] NULL,
	[moduser] [smallint] NULL,
	[returndoccode] [smallint] NULL,
	[SAP_ID] [uniqueidentifier] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[officeid] ASC,
	[returnsgoodretid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rin_banks]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rin_banks](
	[rin_banksid] [numeric](18, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[rin] [char](9) NOT NULL,
	[bankid] [int] NULL,
	[accountno] [varchar](50) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[BKVID] [char](4) NULL,
 CONSTRAINT [rin_banks_pk] PRIMARY KEY CLUSTERED 
(
	[rin_banksid] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rin_parteners]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rin_parteners](
	[rin_partenerssid] [numeric](18, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[rin] [char](9) NOT NULL,
	[partener_rin] [char](9) NULL,
	[partener_name] [varchar](60) NULL,
	[partener_par_id] [char](16) NULL,
	[partener_sefa] [varchar](60) NULL,
	[partener_address] [varchar](60) NULL,
	[partener_phone] [varchar](12) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[partenerscode] [smallint] NULL,
	[targetoffid] [numeric](18, 0) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
	[PARTINER1] [char](10) NULL,
	[PARTINER2] [char](10) NULL,
 CONSTRAINT [rin_parteners_pk] PRIMARY KEY CLUSTERED 
(
	[rin_partenerssid] ASC,
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoices]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoices](
	[SalesInvoice_Id] [uniqueidentifier] NOT NULL,
	[InvoiceType] [int] NULL,
	[Company_Taxpayer_Id] [uniqueidentifier] NOT NULL,
	[Company_Unique_Tax_Id] [nchar](9) NOT NULL,
	[Invoice_Number] [nvarchar](255) NOT NULL,
	[Invoice_Date] [date] NULL,
	[Invoice_Total_Net] [decimal](19, 5) NULL,
	[Invoice_Total_Tax] [decimal](19, 5) NULL,
	[Invoice_Total_Money] [decimal](19, 5) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Unique_Tax_Id] [nchar](9) NULL,
	[Customer_File_Number] [nvarchar](16) NULL,
	[Customer_National_Id] [nchar](14) NULL,
	[Customer_Mobile] [nchar](15) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[Replicated] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
 CONSTRAINT [PK_SalesInvoices] PRIMARY KEY CLUSTERED 
(
	[SalesInvoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesInvoicesDetails]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesInvoicesDetails](
	[SalesInvoicesDetails_Id] [uniqueidentifier] NOT NULL,
	[Fk_SalesInvoices_Id] [uniqueidentifier] NOT NULL,
	[Fk_InvoiceType] [int] NULL,
	[InvoiceDate] [date] NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Fk_ProductType_Id] [int] NULL,
	[Fk_TaxType_Id] [int] NULL,
	[Product_Unit] [nvarchar](255) NULL,
	[Product_Unit_Price] [decimal](19, 5) NULL,
	[Tax] [decimal](19, 5) NULL,
	[Product_Tax_Value] [decimal](19, 5) NULL,
	[Product_Quantity] [decimal](19, 5) NULL,
	[Product_Total_Net] [decimal](19, 5) NULL,
	[Product_Total_Tax_Value] [decimal](19, 5) NULL,
	[Product_Total_Money] [decimal](19, 5) NULL,
	[Replicated] [bit] NULL,
	[ItemType] [int] NULL,
	[SectionType] [int] NULL,
	[Discount] [decimal](19, 5) NULL,
	[IsDeleted] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsAPI] [bit] NULL,
 CONSTRAINT [PK_SalesInvoicesDetails] PRIMARY KEY NONCLUSTERED 
(
	[SalesInvoicesDetails_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seasontrans]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seasontrans](
	[officeid] [numeric](18, 0) NOT NULL,
	[seasontransid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[rin] [char](9) NOT NULL,
	[yrmobeg] [datetime] NOT NULL,
	[yrmoend] [datetime] NOT NULL,
	[reversed] [char](1) NULL,
	[moddate] [datetime] NOT NULL,
	[moduser] [smallint] NULL,
 CONSTRAINT [pk_seasontrans] PRIMARY KEY CLUSTERED 
(
	[officeid] ASC,
	[seasontransid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentPurshaseInvoices]    Script Date: 6/28/2022 7:41:57 PM ******/
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
	[IsReplicated] [bit] NULL,
 CONSTRAINT [PK_SentPurshaseInvoices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentSalesInvoices]    Script Date: 6/28/2022 7:41:57 PM ******/
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
	[IsReplicated] [bit] NULL,
 CONSTRAINT [PK_SentSalesInvoices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableVatTax]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableVatTax](
	[ID] [uniqueidentifier] NOT NULL,
	[DeclarationTypeID] [int] NULL,
	[DocumentNum] [nvarchar](20) NULL,
	[LinkCodeID] [int] NULL,
	[TaxpayerID] [uniqueidentifier] NULL,
	[UniqueTaxID] [nchar](9) NULL,
	[TaxPeriod] [int] NULL,
	[TableTaxDetails] [ntext] NULL,
	[TableTaxTotal] [decimal](18, 2) NULL,
	[TableTaxAdjustment] [decimal](18, 2) NULL,
	[TableTaxVat] [decimal](18, 2) NULL,
	[SalesTableDetails] [ntext] NULL,
	[SalesTableTotal] [decimal](18, 2) NULL,
	[SalesTableAdjustment] [decimal](18, 2) NULL,
	[SalesTableVat] [decimal](18, 2) NULL,
	[PurchaseTableDetails] [ntext] NULL,
	[PurchaseTableTotal] [decimal](18, 2) NULL,
	[PurchaseTableAdjustment] [decimal](18, 2) NULL,
	[PurchaseTableVat] [decimal](18, 2) NULL,
	[RecivableTableTax] [decimal](18, 2) NULL,
	[DebtTableValue] [decimal](18, 2) NULL,
	[TotalTableTaxValue] [decimal](18, 2) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[PersonalizeTypeID] [int] NULL,
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
	[ReconciliationType] [int] NULL,
	[ReconciliationValue] [decimal](18, 2) NULL,
	[AcceptanceDate] [datetime] NULL,
	[RejectionDate] [datetime] NULL,
	[RecoPaymentDate] [datetime] NULL,
	[IsPaidTable] [bit] NULL,
	[InquiryTransAmountTVAT] [decimal](18, 2) NULL,
	[InquiryTransAmountVAT] [decimal](18, 2) NULL,
	[IsExtracted] [bit] NULL,
	[ExtractedDate] [datetime] NULL,
 CONSTRAINT [PK_TableVatTax] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taxid]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxid](
	[Taxid] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxType]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaxType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[TIN] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VAT_SAP_Office_Mapping]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAT_SAP_Office_Mapping](
	[VAT_Code] [int] NULL,
	[SAP_Code] [nvarchar](255) NULL,
	[OfficeName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithholdingPosting]    Script Date: 6/28/2022 7:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithholdingPosting](
	[kst_year] [char](4) NOT NULL,
	[kst_jul] [char](3) NOT NULL,
	[kst_serl] [char](3) NOT NULL,
	[kst_docdate] [datetime] NULL,
	[kst_docnum] [char](15) NULL,
	[kst_docnum1] [char](8) NULL,
	[kst_docnum2] [char](5) NULL,
	[kst_pageno] [char](4) NOT NULL,
	[kst_lineno] [char](7) NOT NULL,
	[kst_taxid] [char](9) NULL,
	[kst_file] [char](16) NULL,
	[kst_reg] [char](3) NULL,
	[kst_acttype] [char](1) NULL,
	[kst_ghatype] [char](1) NULL,
	[kst_date] [datetime] NULL,
	[kst_natcode] [char](1) NULL,
	[kst_ksmcode] [char](1) NULL,
	[kst_dealtype] [char](2) NULL,
	[kst_totval] [decimal](13, 2) NULL,
	[kst_ksmval] [decimal](13, 2) NULL,
	[kst_netval] [decimal](13, 2) NULL,
	[kst_prcnt] [decimal](5, 2) NULL,
	[kst_taxval] [decimal](13, 2) NULL,
	[kst_ratflag] [char](1) NULL,
	[kst_flag] [char](1) NULL,
	[kst_currency] [char](2) NULL,
	[kst_uid] [char](8) NULL,
	[kst_sysdate] [datetime] NULL,
	[kst_ruid] [char](8) NULL,
	[kst_rsysdate] [datetime] NULL,
	[kst_upuid] [char](8) NULL,
	[kst_upsysdate] [datetime] NULL,
	[gha_name] [char](60) NULL,
	[gha_num] [char](9) NOT NULL,
	[flag] [char](1) NULL,
	[web_date] [datetime] NULL,
	[entry_source_code] [tinyint] NULL,
	[bat_branch] [int] NOT NULL,
	[notes] [varchar](200) NULL,
	[update_flag] [int] NULL,
	[nat_id] [char](14) NULL,
	[taxpayer_name] [char](100) NULL,
	[address] [char](100) NULL,
	[form_bundle] [char](12) NULL,
	[Ded_date] [date] NULL,
	[batch_date] [datetime] NULL,
	[TransferedToIBMFlag] [tinyint] NULL,
	[TransferedToIBMDate] [datetime] NULL,
 CONSTRAINT [PK_Withhld] PRIMARY KEY CLUSTERED 
(
	[bat_branch] ASC,
	[kst_year] ASC,
	[kst_jul] ASC,
	[kst_serl] ASC,
	[kst_pageno] ASC,
	[kst_lineno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_car_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_car_IsTansferedToGat]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[Car_log] ADD  CONSTRAINT [DF_car_DateModified1]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Car_log] ADD  CONSTRAINT [DF_car_IsTansferedToGat1]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[Igaddionalact] ADD  CONSTRAINT [DF_add_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Igaddionalact] ADD  CONSTRAINT [DF_add_IsTansferedToGat]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[Igaddionalact_log] ADD  CONSTRAINT [DF_add_DateModified1]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Igaddionalact_log] ADD  CONSTRAINT [DF_add_IsTansferedToGat1]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[IgCardRequest] ADD  CONSTRAINT [DF_card_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[IgCardRequest] ADD  CONSTRAINT [DF_card_IsTansferedToGat]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[IgCardRequest_log] ADD  CONSTRAINT [DF_card_DateModified1]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[IgCardRequest_log] ADD  CONSTRAINT [DF_card_IsTansferedToGat1]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[IgContactData] ADD  CONSTRAINT [DF_con_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[IgContactData] ADD  CONSTRAINT [DF_con_IsTansferedToGat]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[IgContactData_log] ADD  CONSTRAINT [DF_con_DateModified1]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[IgContactData_log] ADD  CONSTRAINT [DF_con_IsTansferedToGat1]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[Igmaster] ADD  CONSTRAINT [DF_Igmaster_sub_subplc]  DEFAULT ('00') FOR [sub_subplc]
GO
ALTER TABLE [dbo].[Igmaster] ADD  CONSTRAINT [DF_Igmaster_sub_plc]  DEFAULT ('00') FOR [sub_plc]
GO
ALTER TABLE [dbo].[Igmaster] ADD  CONSTRAINT [DF_Igmaster_mas_omain]  DEFAULT ('1') FOR [mas_omain]
GO
ALTER TABLE [dbo].[Igmaster] ADD  CONSTRAINT [DF_igmaster_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Igmaster] ADD  CONSTRAINT [DF_igmaster_IsTansferedToGat]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[Igmaster_log] ADD  CONSTRAINT [DF_Igmaster_sub_subplc1]  DEFAULT ('00') FOR [sub_subplc]
GO
ALTER TABLE [dbo].[Igmaster_log] ADD  CONSTRAINT [DF_Igmaster_sub_plc1]  DEFAULT ('00') FOR [sub_plc]
GO
ALTER TABLE [dbo].[Igmaster_log] ADD  CONSTRAINT [DF_Igmaster_mas_omain1]  DEFAULT ('1') FOR [mas_omain]
GO
ALTER TABLE [dbo].[Igmaster_log] ADD  CONSTRAINT [DF_igmaster_DateModified1]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Igmaster_log] ADD  CONSTRAINT [DF_igmaster_IsTansferedToGat1]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[Igmaster_updates] ADD  CONSTRAINT [DF_Igmaster_sub_sub0plc]  DEFAULT ('00') FOR [sub_subplc]
GO
ALTER TABLE [dbo].[Igmaster_updates] ADD  CONSTRAINT [DF_Igmaster_sub0_plc]  DEFAULT ('00') FOR [sub_plc]
GO
ALTER TABLE [dbo].[Igmaster_updates] ADD  CONSTRAINT [DF_igmaster_DateModified0]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Igmaster_updates] ADD  CONSTRAINT [DF_igmaster_IsTansferedToGat0]  DEFAULT ((0)) FOR [IsTansferedToGat]
GO
ALTER TABLE [dbo].[Igparown] ADD  CONSTRAINT [DF_igparown_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Igparown] ADD  CONSTRAINT [DF_igparown_IsTransferedToGat]  DEFAULT ((0)) FOR [IsTransferedToGat]
GO
ALTER TABLE [dbo].[Igparown_log] ADD  CONSTRAINT [DF_igparown_DateModified1]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Igparown_log] ADD  CONSTRAINT [DF_igparown_IsTransferedToGat1]  DEFAULT ((0)) FOR [IsTransferedToGat]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeymas_taxid('000000000')]  DEFAULT ('000000000') FOR [mas_taxid]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyret_type(0)]  DEFAULT ((0)) FOR [ret_type]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeymas_stod('31/12')]  DEFAULT ('31/12') FOR [mas_stod]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyret_fldate(getdate())]  DEFAULT (getdate()) FOR [ret_fldate]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_Acc(0)]  DEFAULT ((0)) FOR [Ret_Acc]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_exmt(0)]  DEFAULT ((0)) FOR [Ret_exmt]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_currancy('01')]  DEFAULT ('01') FOR [Ret_currancy]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_EkrarType(0)]  DEFAULT ((0)) FOR [Ret_EkrarType]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_BuildFlag(1)]  DEFAULT ((1)) FOR [Ret_BuildFlag]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_Time(0)]  DEFAULT ((0)) FOR [Ret_Time]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyret_a53(0)]  DEFAULT ((0)) FOR [ret_a53]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyMethod_Code(0)]  DEFAULT ((0)) FOR [Method_Code]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_MamId('')]  DEFAULT ('') FOR [Ret_MamId]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_TaxAmtFalg(1)]  DEFAULT ((1)) FOR [Ret_TaxAmtFalg]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_Kind('01')]  DEFAULT ('01') FOR [Ret_Kind]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_Details_Flg(0)]  DEFAULT ((0)) FOR [Ret_Details_Flg]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_ExcRate(1)]  DEFAULT ((1)) FOR [Ret_ExcRate]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_CurrancyDetails('01')]  DEFAULT ('01') FOR [Ret_CurrancyDetails]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyret_oilnum(0)]  DEFAULT ((0)) FOR [ret_oilnum]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_Status(0)]  DEFAULT ((0)) FOR [Ret_Status]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_Corrective(0)]  DEFAULT ((0)) FOR [Ret_Corrective]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_GetDate(getdate())]  DEFAULT (getdate()) FOR [Ret_GetDate]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [igRetKeyRet_record_date(getdate())]  DEFAULT (getdate()) FOR [Ret_record_date]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [DF_igRetKey_Ret_final_stop]  DEFAULT ('0') FOR [Ret_final_stop]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [DF_igRetKey_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[igRetKey] ADD  CONSTRAINT [DF_igRetKey_istransfered]  DEFAULT ('0') FOR [istransfered]
GO
ALTER TABLE [dbo].[Igretkey_consolidated] ADD  CONSTRAINT [DF_Igretkey_consolidated_Sys_date]  DEFAULT (getdate()) FOR [Sys_date]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedmas_taxid('000000000')]  DEFAULT ('000000000') FOR [mas_taxid]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedret_type(0)]  DEFAULT ((0)) FOR [ret_type]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedmas_stod('31/12')]  DEFAULT ('31/12') FOR [mas_stod]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedret_fldate(getdate())]  DEFAULT (getdate()) FOR [ret_fldate]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_Acc(0)]  DEFAULT ((0)) FOR [Ret_Acc]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_exmt(0)]  DEFAULT ((0)) FOR [Ret_exmt]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_currancy('01')]  DEFAULT ('01') FOR [Ret_currancy]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_EkrarType(0)]  DEFAULT ((0)) FOR [Ret_EkrarType]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_BuildFlag(1)]  DEFAULT ((1)) FOR [Ret_BuildFlag]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_Time(0)]  DEFAULT ((0)) FOR [Ret_Time]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedret_a53(0)]  DEFAULT ((0)) FOR [ret_a53]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedMethod_Code(0)]  DEFAULT ((0)) FOR [Method_Code]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_MamId('')]  DEFAULT ('') FOR [Ret_MamId]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_TaxAmtFalg(1)]  DEFAULT ((1)) FOR [Ret_TaxAmtFalg]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_Kind('01')]  DEFAULT ('01') FOR [Ret_Kind]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_Details_Flg(0)]  DEFAULT ((0)) FOR [Ret_Details_Flg]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_ExcRate(1)]  DEFAULT ((1)) FOR [Ret_ExcRate]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_CurrancyDetails('01')]  DEFAULT ('01') FOR [Ret_CurrancyDetails]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedret_oilnum(0)]  DEFAULT ((0)) FOR [ret_oilnum]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_Status(0)]  DEFAULT ((0)) FOR [Ret_Status]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_Corrective(0)]  DEFAULT ((0)) FOR [Ret_Corrective]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_GetDate(getdate())]  DEFAULT (getdate()) FOR [Ret_GetDate]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [igRetKey_excludedRet_record_date(getdate())]  DEFAULT (getdate()) FOR [Ret_record_date]
GO
ALTER TABLE [dbo].[igRetKey_excluded] ADD  CONSTRAINT [DF_igRetKey_excluded_Ret_final_stop]  DEFAULT ('0') FOR [Ret_final_stop]
GO
ALTER TABLE [dbo].[igRetKey_temp] ADD  CONSTRAINT [DF_igRetKey_temp_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[igRetYearlyItemsValues] ADD  CONSTRAINT [igRetYearlyItemsValuesRet_SysDate(getdate())]  DEFAULT (getdate()) FOR [Ret_SysDate]
GO
ALTER TABLE [dbo].[igRetYearlyItemsValues] ADD  CONSTRAINT [DF_igRetYearlyItemsValues_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[igRetYearlyItemsValues] ADD  CONSTRAINT [DF_igRetYearlyItemsValues_istransfered]  DEFAULT ('0') FOR [istransfered]
GO
ALTER TABLE [dbo].[Igwared] ADD  DEFAULT ('0') FOR [istransfered]
GO
ALTER TABLE [dbo].[Igwared] ADD  DEFAULT (getdate()) FOR [insert_date]
GO
ALTER TABLE [dbo].[khasm] ADD  CONSTRAINT [DF__khasm__update_fl__503BEA1C]  DEFAULT ((0)) FOR [update_flag]
GO
ALTER TABLE [dbo].[khasm] ADD  CONSTRAINT [DF_khasm_TransferedToETA]  DEFAULT ((0)) FOR [TransferedToETAFlag]
GO
ALTER TABLE [dbo].[khasm_Excel] ADD  CONSTRAINT [DF__khasm__update_fl__503BEA1C1]  DEFAULT ((0)) FOR [update_flag]
GO
ALTER TABLE [dbo].[khasm_Excel] ADD  CONSTRAINT [DF_khasm_TransferedToETA1]  DEFAULT ((0)) FOR [TransferedToETAFlag]
GO
ALTER TABLE [dbo].[khasm_online_Core] ADD  CONSTRAINT [DF_khasm_online_Core_TransferedToETA]  DEFAULT ((0)) FOR [TransferedToETA]
GO
ALTER TABLE [dbo].[logmaster_audit] ADD  CONSTRAINT [DF_IgMaster_Audit_Modified_date]  DEFAULT (getdate()) FOR [Modified_date]
GO
ALTER TABLE [dbo].[NonTableVatTax] ADD  CONSTRAINT [DF_NonTableVatTax_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[NonTableVatTax] ADD  CONSTRAINT [DF_NonTableVatTax_IsSend]  DEFAULT ((0)) FOR [IsSend]
GO
ALTER TABLE [dbo].[NonTableVatTax] ADD  CONSTRAINT [DF_NonTableVatTax_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[NonTableVatTax] ADD  CONSTRAINT [DF_NonTableVatTax_IsReplicated]  DEFAULT ((0)) FOR [IsReplicated]
GO
ALTER TABLE [dbo].[NonTableVatTax] ADD  CONSTRAINT [DF_NonTableVatTax_IsExtracted]  DEFAULT ((0)) FOR [IsExtracted]
GO
ALTER TABLE [dbo].[PurchasesInvoices] ADD  CONSTRAINT [DF_PurchasesInvoices_Replicated]  DEFAULT ((0)) FOR [Replicated]
GO
ALTER TABLE [dbo].[PurchasesInvoices] ADD  CONSTRAINT [DF_PurchasesInvoices_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PurchasesInvoices] ADD  DEFAULT ((0)) FOR [IsAPI]
GO
ALTER TABLE [dbo].[PurchasesInvoicesDetails] ADD  CONSTRAINT [DF_PurchasesInvoicesDetails_Replicated]  DEFAULT ((0)) FOR [Replicated]
GO
ALTER TABLE [dbo].[PurchasesInvoicesDetails] ADD  CONSTRAINT [DF_PurchasesInvoicesDetails_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[PurchasesInvoicesDetails] ADD  CONSTRAINT [DF_PurchasesInvoicesDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PurchasesInvoicesDetails] ADD  CONSTRAINT [DF__Purchases__IsAPI__3943762B]  DEFAULT ((0)) FOR [IsAPI]
GO
ALTER TABLE [dbo].[SalesInvoices] ADD  CONSTRAINT [DF_SalesInvoices_Replicated]  DEFAULT ((0)) FOR [Replicated]
GO
ALTER TABLE [dbo].[SalesInvoices] ADD  CONSTRAINT [DF_SalesInvoices_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SalesInvoices] ADD  DEFAULT ((0)) FOR [IsAPI]
GO
ALTER TABLE [dbo].[SalesInvoicesDetails] ADD  CONSTRAINT [DF_SalesInvoicesDetails_Replicated]  DEFAULT ((0)) FOR [Replicated]
GO
ALTER TABLE [dbo].[SalesInvoicesDetails] ADD  CONSTRAINT [DF_SalesInvoicesDetails_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[SalesInvoicesDetails] ADD  CONSTRAINT [DF_SalesInvoicesDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SalesInvoicesDetails] ADD  CONSTRAINT [DF__SalesInvo__IsAPI__3B2BBE9D]  DEFAULT ((0)) FOR [IsAPI]
GO
ALTER TABLE [dbo].[SentPurshaseInvoices] ADD  CONSTRAINT [DF_SentPurshaseInvoices_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SentPurshaseInvoices] ADD  CONSTRAINT [DF_SentPurshaseInvoices_IsReplicated_1]  DEFAULT ((0)) FOR [IsReplicated]
GO
ALTER TABLE [dbo].[SentSalesInvoices] ADD  CONSTRAINT [DF_SentSalesInvoices_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SentSalesInvoices] ADD  CONSTRAINT [DF_SentSalesInvoices_IsReplicated]  DEFAULT ((0)) FOR [IsReplicated]
GO
ALTER TABLE [dbo].[TableVatTax] ADD  CONSTRAINT [DF_TableVatTax_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TableVatTax] ADD  CONSTRAINT [DF_TableVatTax_IsSend]  DEFAULT ((0)) FOR [IsSend]
GO
ALTER TABLE [dbo].[TableVatTax] ADD  CONSTRAINT [DF_TableVatTax_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[TableVatTax] ADD  CONSTRAINT [DF_TableVatTax_IsReplicated]  DEFAULT ((0)) FOR [IsReplicated]
GO
ALTER TABLE [dbo].[TableVatTax] ADD  CONSTRAINT [DF_TableVatTax_IsExtracted]  DEFAULT ((0)) FOR [IsExtracted]
GO
ALTER TABLE [dbo].[WithholdingPosting] ADD  CONSTRAINT [DF__kwith__update_fl__503BEA1C]  DEFAULT ((0)) FOR [update_flag]
GO
ALTER TABLE [dbo].[WithholdingPosting] ADD  CONSTRAINT [DF_thhold_TransferedToIBM]  DEFAULT ((0)) FOR [TransferedToIBMFlag]
GO
ALTER TABLE [dbo].[PurchasesInvoicesDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchasesInvoicesDetails_PurchasesInvoices] FOREIGN KEY([Fk_PurchasesInvoices_Id])
REFERENCES [dbo].[PurchasesInvoices] ([PurchaseInvoice_Id])
GO
ALTER TABLE [dbo].[PurchasesInvoicesDetails] CHECK CONSTRAINT [FK_PurchasesInvoicesDetails_PurchasesInvoices]
GO
ALTER TABLE [dbo].[SalesInvoicesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalesInvoicesDetails_SalesInvoices] FOREIGN KEY([Fk_SalesInvoices_Id])
REFERENCES [dbo].[SalesInvoices] ([SalesInvoice_Id])
GO
ALTER TABLE [dbo].[SalesInvoicesDetails] CHECK CONSTRAINT [FK_SalesInvoicesDetails_SalesInvoices]
GO
ALTER TABLE [dbo].[igRetKey]  WITH NOCHECK ADD  CONSTRAINT [CK_igRetKey] CHECK  (([Method_Code]='3' OR ([Method_Code]='2' OR ([Method_Code]='1' OR ([Method_Code]='0' OR [Method_Code]='4')))))
GO
ALTER TABLE [dbo].[igRetKey] NOCHECK CONSTRAINT [CK_igRetKey]
GO
ALTER TABLE [dbo].[igRetKey]  WITH NOCHECK ADD  CONSTRAINT [CK_igRetKey_ret_wardno] CHECK  ((len([ret_wardno])=(10)))
GO
ALTER TABLE [dbo].[igRetKey] NOCHECK CONSTRAINT [CK_igRetKey_ret_wardno]
GO
ALTER TABLE [dbo].[igRetKey]  WITH NOCHECK ADD  CONSTRAINT [CK_igRetKey_TEMP] CHECK  (([Method_Code]='3' OR ([Method_Code]='2' OR ([Method_Code]='1' OR ([Method_Code]='0' OR [Method_Code]='4')))))
GO
ALTER TABLE [dbo].[igRetKey] NOCHECK CONSTRAINT [CK_igRetKey_TEMP]
GO
ALTER TABLE [dbo].[igRetKey_excluded]  WITH NOCHECK ADD  CONSTRAINT [CK_igRetKey_excluded] CHECK  (([Method_Code]='3' OR ([Method_Code]='2' OR ([Method_Code]='1' OR ([Method_Code]='0' OR [Method_Code]='4')))))
GO
ALTER TABLE [dbo].[igRetKey_excluded] NOCHECK CONSTRAINT [CK_igRetKey_excluded]
GO
ALTER TABLE [dbo].[igRetKey_excluded]  WITH NOCHECK ADD  CONSTRAINT [CK_igRetKey_excluded_ret_wardno] CHECK  ((len([ret_wardno])=(10)))
GO
ALTER TABLE [dbo].[igRetKey_excluded] NOCHECK CONSTRAINT [CK_igRetKey_excluded_ret_wardno]
GO
ALTER TABLE [dbo].[igRetKey_excluded]  WITH NOCHECK ADD  CONSTRAINT [CK_igRetKey_excluded_TEMP] CHECK  (([Method_Code]='3' OR ([Method_Code]='2' OR ([Method_Code]='1' OR ([Method_Code]='0' OR [Method_Code]='4')))))
GO
ALTER TABLE [dbo].[igRetKey_excluded] NOCHECK CONSTRAINT [CK_igRetKey_excluded_TEMP]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الوارد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_WardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سنة الوارد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_WardYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأموريه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Dist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الملف' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'mas_file'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'mas_taxid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مسلسل الشريك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'par_serl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سنة المحاسبه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'ret_year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع الاقرار (0 – اصلي ، 1- نهائي – 2 معدل ،    3- طلب مد معياد )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'ret_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الكيان القانونى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'mas_ownr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الكيان القانونى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'mas_ownrdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نهاية السنه الماليه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'mas_stod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ تقديم الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'ret_fldate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبة من' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Fdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة إلي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Edate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع المحاسبه ( 0 تقديرى – 1 حسابات )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Acc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مؤشر الخضوع (0 خاضع – 1 معفى – 2 غير خاضع)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_exmt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع العملة (01= جنية مصري)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_currancy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إقرار لشخص (0- اعتباري ، 1- طبيعي)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_EkrarType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مؤشر محاسبة الثروة العقارية (0- فعلي ، 1- حكمي ، 2- لا يوجد بيان)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_BuildFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مد طلب ميعاد الإقرار (0- لا يوجد طلب ، 1- يوجد طلب)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'موشر الخضوع للمادة 47 ( 0ـ غير خاضع  1ـ خاضع )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'ret_a53'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الايصال' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_RecitNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الشيك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Check'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الشيك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_CheckDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمور' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_MamId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود معدل البيان' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_UpdateUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ تعديل البيان' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'?µ? ?????µ?? ???? ?µ? ??? ????? ???' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مؤشر ادخال تفاصيل الاقرار(0-لم يدخل /1-ادخل)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Details_Flg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سعر الصرف (1 للجنيه المصري)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_ExcRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم اتفاقية البترول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'ret_oilnum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سنة اتفاقية البترول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'ret_oilyear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الضريبه الواجب سدادها' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_TaxDue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حالة الاقرار(0-الاقرار الحالي/1-اقرار قديم)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'طبيعة الاقرار(.-عادي/2-مصحح)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_Corrective'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المنفذ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'manfz_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم المحاسب' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_AccountantName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم قيد المحاسب' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_AccountatNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تحريرا في' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_GetDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مسلسل  الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'fk_ret_catg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ تسجيل الاقرار بالحاسب' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_record_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود مراجع الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_revUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ مراجعه الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_revDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'par_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'فلاج خاص باقرار التوقف' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'Ret_final_stop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم صندوق الاستثمار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'inv_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وكيل صندوق الاستثمار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'inv_spname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم ماموريه المبيعات المسجل بها' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'sels_tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'فرع لمنشأة أجنبيه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'forgin_comp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وحدة المرور التابع لها خاص باقرار السيارات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'trafic_dep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم النقابه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'union_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عدد الفروع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey', @level2type=N'COLUMN',@level2name=N'branch_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الوارد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_WardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سنة الوارد' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_WardYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأموريه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Dist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الملف' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'mas_file'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'mas_taxid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مسلسل الشريك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'par_serl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سنة المحاسبه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'ret_year'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع الاقرار (0 – اصلي ، 1- نهائي – 2 معدل ،    3- طلب مد معياد )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'ret_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الكيان القانونى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'mas_ownr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الكيان القانونى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'mas_ownrdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نهاية السنه الماليه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'mas_stod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ تقديم الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'ret_fldate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة الضريبة من' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Fdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفترة إلي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Edate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع المحاسبه ( 0 تقديرى – 1 حسابات )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Acc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مؤشر الخضوع (0 خاضع – 1 معفى – 2 غير خاضع)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_exmt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع العملة (01= جنية مصري)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_currancy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إقرار لشخص (0- اعتباري ، 1- طبيعي)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_EkrarType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مؤشر محاسبة الثروة العقارية (0- فعلي ، 1- حكمي ، 2- لا يوجد بيان)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_BuildFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مد طلب ميعاد الإقرار (0- لا يوجد طلب ، 1- يوجد طلب)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'موشر الخضوع للمادة 47 ( 0ـ غير خاضع  1ـ خاضع )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'ret_a53'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الايصال' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_RecitNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الشيك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Check'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الشيك' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_CheckDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المأمور' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_MamId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود معدل البيان' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_UpdateUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ تعديل البيان' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'?µ? ?????µ?? ???? ?µ? ??? ????? ???' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مؤشر ادخال تفاصيل الاقرار(0-لم يدخل /1-ادخل)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Details_Flg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سعر الصرف (1 للجنيه المصري)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_ExcRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم اتفاقية البترول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'ret_oilnum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سنة اتفاقية البترول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'ret_oilyear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الضريبه الواجب سدادها' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_TaxDue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حالة الاقرار(0-الاقرار الحالي/1-اقرار قديم)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'طبيعة الاقرار(.-عادي/2-مصحح)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_Corrective'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المنفذ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'manfz_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم المحاسب' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_AccountantName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم قيد المحاسب' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_AccountatNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تحريرا في' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_GetDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مسلسل  الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'fk_ret_catg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ تسجيل الاقرار بالحاسب' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_record_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود مراجع الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_revUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ مراجعه الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_revDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'par_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'فلاج خاص باقرار التوقف' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'Ret_final_stop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم صندوق الاستثمار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'inv_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وكيل صندوق الاستثمار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'inv_spname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم ماموريه المبيعات المسجل بها' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'sels_tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'فرع لمنشأة أجنبيه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'forgin_comp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وحدة المرور التابع لها خاص باقرار السيارات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'trafic_dep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم النقابه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'union_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عدد الفروع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'igRetKey_excluded', @level2type=N'COLUMN',@level2name=N'branch_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نونع الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'DeclarationTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مسلسل الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'DocumentNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اصلى /معدل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'LinkCodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'TaxpayerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'UniqueTaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفتره الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'TaxPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تفاصيل المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'SalesDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اجمالى المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'SalesTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تسوية المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'SalesAdjustment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ضريبة المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'SalesVat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تفاصيل المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اجمالى المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تسوية المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseAdjustment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ضريبة المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseVat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الضريبة المستحقه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'RecivableTax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رصيد الدائن' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'DebtValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اجمالى الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'TotalTaxValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم المقر' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'ApplicantName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع الهوية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'PersonalizeTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومى / جواز السفر' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'NationalPassNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم التوقيع ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'IsSigned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الصفه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'Representitive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التوكيل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'AuthorizationNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التوقيع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'SignedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الانشاء' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التحديث' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'UpdatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم الحذف ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم الارسال ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'IsSend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الارسال' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'SendDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم الدفع ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'IsPaid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم النقل ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'IsReplicated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الدفع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'PaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'طريقة الدفع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'PaymentMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع التصالح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'ReconciliationType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الموافقة على التصالح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'AcceptanceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الرفض' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'RejectionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ سداد التصالح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NonTableVatTax', @level2type=N'COLUMN',@level2name=N'RecoPaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'InvoiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود ممول الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Company_Taxpayer_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم التسجيلي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Company_Unique_Tax_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي صافي الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Total_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي قيمة الضريبة في الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Total_Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي قيمة الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Total_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم العميل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي للعميل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Unique_Tax_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الملف رقم الملف الضريبي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_File_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الموبيل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان العميل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Fk_InvoiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'InvoiceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وصف المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Fk_ProductType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود فئة الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Fk_TaxType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وحدة قياس المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سعر الوحدة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Unit_Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ضريبة المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Tax_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كمية المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي صافي المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Total_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي ضريبة المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Total_Tax_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي مبلغ المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Total_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع الضريبة ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'ItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع سلعة الجدول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'SectionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تخفيض' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchasesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'SalesInvoice_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'InvoiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود ممول الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Company_Taxpayer_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم التسجيلي للممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Company_Unique_Tax_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي صافي الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Total_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي قيمة الضريبة في الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Total_Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي قيمة الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Invoice_Total_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم العميل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبي للعميل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Unique_Tax_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الملف رقم الملف الضريبي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_File_Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومي' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_National_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم الموبيل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'عنوان العميل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Customer_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حالة النقل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'Replicated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حالة المسح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ خلق الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التعديل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoices', @level2type=N'COLUMN',@level2name=N'UpdatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود ا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'SalesInvoicesDetails_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Fk_SalesInvoices_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Fk_InvoiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الفاتورة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'InvoiceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وصف المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Fk_ProductType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود فئة الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Fk_TaxType_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'وحدة قياس المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'سعر الوحدة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Unit_Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ضريبة المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Tax_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كمية المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي صافي المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Total_Net'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي ضريبة المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Total_Tax_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'إجمالي مبلغ المنتج' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Product_Total_Money'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع الضريبة ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'ItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كزد نوع سلعة الجدول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'SectionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تخفيض' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesInvoicesDetails', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentPurshaseInvoices', @level2type=N'COLUMN',@level2name=N'TaxpayerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentPurshaseInvoices', @level2type=N'COLUMN',@level2name=N'TaxVatDecID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود فاتورة المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentPurshaseInvoices', @level2type=N'COLUMN',@level2name=N'PurchaseInvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود تفاصيل فاتورة المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentPurshaseInvoices', @level2type=N'COLUMN',@level2name=N'PurchaseInvoiceDetailsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentSalesInvoices', @level2type=N'COLUMN',@level2name=N'TaxPayerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentSalesInvoices', @level2type=N'COLUMN',@level2name=N'TaxVatDecID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود فاتورة المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentSalesInvoices', @level2type=N'COLUMN',@level2name=N'SalesInvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود تفاصيل فاتورة المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SentSalesInvoices', @level2type=N'COLUMN',@level2name=N'SalesInvoiceDetailsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود نوع الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'DeclarationTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مسلسل الاقرار' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'DocumentNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اصلى /معدل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'LinkCodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'كود الممول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'TaxpayerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التسجيل الضريبى' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'UniqueTaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الفتره الضريبية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'TaxPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تفاصيل سلع الجدول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'TableTaxDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اجمالى سلع الجدول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'TableTaxTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة تسويات ضريبة الجدول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'TableTaxAdjustment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ضريبة الجدول' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'TableTaxVat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تفاصيل مبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'SalesTableDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اجمالى المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'SalesTableTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة تسويات المبيعات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'SalesTableAdjustment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ضريبة القيمة المضافه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'SalesTableVat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تفاصيل المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseTableDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اجمالى المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseTableTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'قيمة تسويات المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseTableAdjustment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ضريبة المشتريات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'PurchaseTableVat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الضريبة المستحقه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'RecivableTableTax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رصيد الدائن' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'DebtTableValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اجمالى الضريبة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'TotalTableTaxValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اسم المقر' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'ApplicantName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع الهوية' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'PersonalizeTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الرقم القومى / جواز السفر' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'NationalPassNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم التوقيع ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'IsSigned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'الصفه' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'Representitive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رقم التوكيل' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'AuthorizationNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التوقيع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'SignedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الانشاء' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ التحديث' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'UpdatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم الحذف ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم الارسال ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'IsSend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الارسال' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'SendDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم الدفع ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'IsPaid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تم النقل ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'IsReplicated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الدفع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'PaymentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'طريقة الدفع' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'PaymentMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نوع التصالح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'ReconciliationType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ الموافقة على التصالح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'AcceptanceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ رفض التصالح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'RejectionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ سداد التصالح' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableVatTax', @level2type=N'COLUMN',@level2name=N'RecoPaymentDate'
GO
