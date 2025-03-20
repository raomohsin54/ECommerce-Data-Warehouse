USE [ECommerceDW]
GO
/****** Object:  Table [dbo].[DimShipping]    Script Date: 20/03/2025 3:43:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimShipping](
	[ShippingKey] [int] IDENTITY(1,1) NOT NULL,
	[ShippingMethod] [nvarchar](50) NOT NULL,
	[ShippingCost] [decimal](10, 2) NULL,
	[EstimatedDeliveryDays] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ShippingMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
