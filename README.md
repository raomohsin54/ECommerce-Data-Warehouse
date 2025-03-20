# E-Commerce Data Warehouse

## Overview
This repository contains the design and implementation of an **E-Commerce Data Warehouse (DW)** for managing and analyzing sales data. The goal is to provide a structured environment for querying and analyzing key business insights such as customer purchases, product performance, payment methods, shipping costs, and sales trends. The data warehouse is built using SQL Server with a star schema approach, featuring fact and dimension tables.

## Key Features:
- **Star Schema Design**: Consists of multiple dimension tables (Customer, Product, Date, Payment Method, Shipping) and one fact table (Sales).
- **Advanced SQL Queries**: Includes complex queries for reporting and business insights, focusing on analyzing sales data, performance, and trends.
- **Scalable Architecture**: Designed to scale as more data is added, ensuring high performance and optimized querying.

## Database Tables:
- **DimCustomer**: Contains customer details (ID, name, email, etc.).
- **DimProduct**: Holds product information (ID, name, category, etc.).
- **DimDate**: Contains date-related information (year, month, day, weekday).
- **DimPaymentMethod**: Includes payment method details (e.g., Credit Card, PayPal).
- **DimShipping**: Contains shipping information (method, cost, estimated delivery time).
- **FactSales**: The fact table containing sales transactions, linking dimension tables with sales data (e.g., total amount, quantity, order status).

## SQL Queries:
The `Reports-insights.sql` file includes advanced SQL queries designed to extract valuable insights from the sales data. These queries are written to:
- Perform data aggregations
- Generate performance metrics
- Provide meaningful insights into sales and product performance

### Sample Queries in `Reports-insights.sql`:
- **Sales Performance by Product**: Analyzing total sales and quantities sold by product.
- **Customer Purchase Behavior**: Understanding the frequency and amount of customer purchases.
- **Payment Method Analysis**: Identifying trends in payment methods used by customers.
- **Shipping Analysis**: Analyzing shipping costs and delivery performance over time.

## Getting Started:
1. **Clone the repository**:
   To clone this repository to your local machine, use the following command:

   ```bash
   git clone https://github.com/raomohsin54/ECommerce-Data-Warehouse.git
