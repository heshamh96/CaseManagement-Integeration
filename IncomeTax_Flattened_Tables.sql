USE [Income_Tax_Flattened]
GO
/****** Object:  Table [dbo].[Income_Tax_102]    Script Date: 6/28/2022 7:44:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Income_Tax_102](
	[CreationDate] [datetime] NULL,
	[DeclarationType] [int] NULL,
	[DeclarationNum] [int] NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[Declaration.Details.@UniqueTaxID] [nvarchar](1000) NULL,
	[Declaration.Details.@DistrictName] [nvarchar](1000) NULL,
	[Declaration.Details.@VATDistrictName] [nvarchar](1000) NULL,
	[Declaration.Details.@TaxPerioudddFrom] [nvarchar](1000) NULL,
	[Declaration.Details.@TaxPerioudmmFrom] [nvarchar](1000) NULL,
	[Declaration.Details.@TaxPerioudyyFrom] [nvarchar](1000) NULL,
	[Declaration.Details.@TaxPerioudddTo] [nvarchar](1000) NULL,
	[Declaration.Details.@TaxPerioudmmTo] [nvarchar](1000) NULL,
	[Declaration.Details.@TaxPerioudyyTo] [nvarchar](1000) NULL,
	[Declaration.Details.@_006_SalesValue] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Income_Tax_106]    Script Date: 6/28/2022 7:44:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Income_Tax_106](
	[CreationDate] [datetime] NULL,
	[DeclarationType] [int] NULL,
	[DeclarationNum] [int] NULL,
	[TaxPayerID] [uniqueidentifier] NULL,
	[DeclarationYear] [int] NULL,
	[Details.@UniqueTaxID] [nvarchar](1000) NULL,
	[Details.@DistrictName] [nvarchar](1000) NULL,
	[Details.@VATDistrictName] [nvarchar](1000) NULL,
	[Details.@TaxPerioudddFrom] [nvarchar](1000) NULL,
	[Details.@TaxPerioudmmFrom] [nvarchar](1000) NULL,
	[Details.@TaxPerioudyyFrom] [nvarchar](1000) NULL,
	[Details.@TaxPerioudddTo] [nvarchar](1000) NULL,
	[Details.@TaxPerioudmmTo] [nvarchar](1000) NULL,
	[Details.@TaxPerioudyyTo] [nvarchar](1000) NULL,
	[Details.@NetIncome_101] [nvarchar](1000) NULL,
	[Details.@VariousIncome_705_1] [nvarchar](1000) NULL,
	[Details.@CapitalProfit_705_2] [nvarchar](1000) NULL,
	[Details.@SalesWaste_705_13] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
