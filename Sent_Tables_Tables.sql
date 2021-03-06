USE [SentTables]
GO
/****** Object:  Table [dbo].[SentPurshaseInvoices]    Script Date: 9/12/2021 10:37:37 AM ******/
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
/****** Object:  Table [dbo].[SentSalesInvoices]    Script Date: 9/12/2021 10:37:37 AM ******/
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
/****** Object:  Index [IDX_TaxVatDecID]    Script Date: 9/12/2021 10:37:37 AM ******/
CREATE NONCLUSTERED INDEX [IDX_TaxVatDecID] ON [dbo].[SentPurshaseInvoices]
(
	[TaxVatDecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [<Name of Missing Index, sysname,>]    Script Date: 9/12/2021 10:37:37 AM ******/
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON [dbo].[SentSalesInvoices]
(
	[TaxVatDecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_SalesInvoiceID]    Script Date: 9/12/2021 10:37:37 AM ******/
CREATE NONCLUSTERED INDEX [IDX_SalesInvoiceID] ON [dbo].[SentSalesInvoices]
(
	[SalesInvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
