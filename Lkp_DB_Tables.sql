USE [Lkp_DB]
GO
/****** Object:  Table [dbo].[Dim_ActivitiesVat]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ActivitiesVat](
	[Activity_Vat_ID_S] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Activity_Vat__code] [varchar](50) NULL,
	[Activity_Vat__desc] [varchar](255) NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_InvoiceTypes]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_InvoiceTypes](
	[Inv_Type_ID] [int] NOT NULL,
	[Inv_Type_Desc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_InvoiceType] PRIMARY KEY CLUSTERED 
(
	[Inv_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictsDetails]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictsDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[District_Code] [varchar](3) NULL,
	[District_Name] [nvarchar](50) NULL,
	[District_Account] [nvarchar](50) NULL,
 CONSTRAINT [PK_DistrictsDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excel_sales_master]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excel_sales_master](
	[rin] [char](9) NOT NULL,
	[regname] [varchar](60) NOT NULL,
	[officeid] [numeric](18, 0) NOT NULL,
	[officename] [varchar](60) NULL,
	[activity_level_onecd] [char](1) NULL,
	[activity_level_onedesc] [varchar](255) NULL,
	[activity_level_twocd] [char](2) NULL,
	[activity_level_twodesc] [varchar](255) NULL,
	[activity_level_threecd] [char](3) NULL,
	[activity_level_threedesc] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igactivity]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igactivity](
	[act_acode] [char](3) NOT NULL,
	[act_desc] [nvarchar](50) NULL,
	[cat_code] [char](1) NULL,
 CONSTRAINT [PK_Igactivity] PRIMARY KEY CLUSTERED 
(
	[act_acode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igdistrict]    Script Date: 9/12/2021 10:49:18 AM ******/
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
/****** Object:  Table [dbo].[ItemTypes]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTypes](
	[Item_Type_ID] [int] NOT NULL,
	[Item_Type_Desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpDeclarationType]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpDeclarationType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpDeclarationType_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lkpInvoiceType]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lkpInvoiceType](
	[ID] [int] NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_lkpInvoiceType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpLinkType]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpLinkType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpLinkType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpSectionNum]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpSectionNum](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpSectionNum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpTaxTableCategory]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpTaxTableCategory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpTaxTableCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LkpVatType]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LkpVatType](
	[ID] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LkpDeclarationType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductType_Id] [int] NOT NULL,
	[Product_Description] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Office]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Office](
	[officeid] [varchar](3) NOT NULL,
	[OfficeName] [nvarchar](60) NOT NULL,
	[ID] [varchar](3) NULL,
	[Settlement_Unit_ID] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Region]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Region](
	[RegionCode] [varchar](3) NULL,
	[RegionName] [varchar](200) NULL,
	[OfficeID] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionTypes]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTypes](
	[Section_Type_ID] [int] NOT NULL,
	[Section_Type_Desc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_SectionType] PRIMARY KEY CLUSTERED 
(
	[Section_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxTableItem]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxTableItem](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CategoryID] [int] NOT NULL,
	[TaxVatValue] [decimal](18, 3) NULL,
	[TaxTableValue] [decimal](18, 3) NULL,
	[SectionID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxType]    Script Date: 9/12/2021 10:49:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
