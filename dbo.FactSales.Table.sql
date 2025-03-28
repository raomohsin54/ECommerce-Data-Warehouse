USE [ECommerceDW]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 20/03/2025 3:43:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesKey] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NOT NULL,
	[CustomerKey] [int] NULL,
	[ProductKey] [int] NULL,
	[DateKey] [int] NULL,
	[PaymentMethodKey] [int] NULL,
	[ShippingKey] [int] NULL,
	[Quantity] [int] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Discount] [decimal](10, 2) NULL,
	[FinalAmount] [decimal](10, 2) NULL,
	[OrderStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([PaymentMethodKey])
REFERENCES [dbo].[DimPaymentMethod] ([PaymentMethodKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ShippingKey])
REFERENCES [dbo].[DimShipping] ([ShippingKey])
GO
