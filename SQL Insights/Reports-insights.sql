-- 1. Total Sales per Customer (Top 10 customers by total amount spent)
SELECT TOP 10 
    c.FullName AS CustomerName,
    SUM(f.FinalAmount) AS TotalAmountSpent
FROM 
    FactSales f
JOIN 
    DimCustomer c ON f.CustomerKey = c.CustomerKey
GROUP BY 
    c.FullName
ORDER BY 
    TotalAmountSpent DESC;

-- 2. Monthly Sales Trend (Total sales for each month)
SELECT 
    d.Year,
    d.Month,
    SUM(f.FinalAmount) AS MonthlySales
FROM 
    FactSales f
JOIN 
    DimDate d ON f.DateKey = d.DateKey
GROUP BY 
    d.Year, d.Month
ORDER BY 
    d.Year, d.Month;

-- 3. Sales by Product Category (Total sales per category)
SELECT 
    p.Category AS ProductCategory,
    SUM(f.FinalAmount) AS TotalSales
FROM 
    FactSales f
JOIN 
    DimProduct p ON f.ProductKey = p.ProductKey
GROUP BY 
    p.Category
ORDER BY 
    TotalSales DESC;

-- 4. Average Order Value by Customer (How much each customer spends on average per order)
SELECT 
    c.FullName AS CustomerName,
    AVG(f.FinalAmount) AS AverageOrderValue
FROM 
    FactSales f
JOIN 
    DimCustomer c ON f.CustomerKey = c.CustomerKey
GROUP BY 
    c.FullName
ORDER BY 
    AverageOrderValue DESC;

-- 5. Sales Performance by Payment Method (Total sales by payment method)
SELECT 
    pm.PaymentMethod AS PaymentMethod,
    SUM(f.FinalAmount) AS TotalSales
FROM 
    FactSales f
JOIN 
    DimPaymentMethod pm ON f.PaymentMethodKey = pm.PaymentMethodKey
GROUP BY 
    pm.PaymentMethod
ORDER BY 
    TotalSales DESC;

-- 6. Shipping Performance: Average Delivery Time by Shipping Method
SELECT 
    s.ShippingMethod AS ShippingMethod,
    AVG(s.EstimatedDeliveryDays) AS AvgDeliveryTime
FROM 
    FactSales f
JOIN 
    DimShipping s ON f.ShippingKey = s.ShippingKey
GROUP BY 
    s.ShippingMethod
ORDER BY 
    AvgDeliveryTime;

-- 7. Discount Effect: Total Sales vs Discount (Effect of discount on total sales)
SELECT 
    SUM(f.TotalAmount) AS TotalSales,
    SUM(f.Discount) AS TotalDiscount,
    SUM(f.FinalAmount) AS SalesAfterDiscount
FROM 
    FactSales f;

-- 8. Top 5 Products by Sales (Top 5 products based on sales revenue)
SELECT TOP 5 
    p.ProductName AS ProductName,
    SUM(f.FinalAmount) AS TotalSales
FROM 
    FactSales f
JOIN 
    DimProduct p ON f.ProductKey = p.ProductKey
GROUP BY 
    p.ProductName
ORDER BY 
    TotalSales DESC;

-- 9. Sales by Year and Quarter (Total sales by year and quarter)
SELECT 
    d.Year,
    d.Quarter,
    SUM(f.FinalAmount) AS TotalSales
FROM 
    FactSales f
JOIN 
    DimDate d ON f.DateKey = d.DateKey
GROUP BY 
    d.Year, d.Quarter
ORDER BY 
    d.Year, d.Quarter;

-- 10. Customer Order Count (How many orders each customer made)
SELECT 
    c.FullName AS CustomerName,
    COUNT(f.SalesKey) AS OrderCount
FROM 
    FactSales f
JOIN 
    DimCustomer c ON f.CustomerKey = c.CustomerKey
GROUP BY 
    c.FullName
ORDER BY 
    OrderCount DESC;

-- 11. Most Popular Products (Top 5 products by quantity sold)
SELECT TOP 5 
    p.ProductName AS ProductName,
    SUM(f.Quantity) AS QuantitySold
FROM 
    FactSales f
JOIN 
    DimProduct p ON f.ProductKey = p.ProductKey
GROUP BY 
    p.ProductName
ORDER BY 
    QuantitySold DESC;

-- 12. Customer Sales Segmentation (Total sales for customers who spent below and above $1000)
SELECT 
    CASE 
        WHEN SUM(f.FinalAmount) > 1000 THEN 'High Spender'
        ELSE 'Low Spender'
    END AS CustomerSegment,
    COUNT(DISTINCT c.CustomerKey) AS CustomerCount,
    SUM(f.FinalAmount) AS TotalSales
FROM 
    FactSales f
JOIN 
    DimCustomer c ON f.CustomerKey = c.CustomerKey
GROUP BY 
    CASE 
        WHEN SUM(f.FinalAmount) > 1000 THEN 'High Spender'
        ELSE 'Low Spender'
    END;

-- 13. Total Orders vs Sales by Shipping Method
SELECT 
    s.ShippingMethod AS ShippingMethod,
    COUNT(f.SalesKey) AS TotalOrders,
    SUM(f.FinalAmount) AS TotalSales
FROM 
    FactSales f
JOIN 
    DimShipping s ON f.ShippingKey = s.ShippingKey
GROUP BY 
    s.ShippingMethod
ORDER BY 
    TotalSales DESC;

-- 14. Sales Distribution by Weekday (Sales per weekday)
SELECT 
    d.WeekdayName AS Weekday,
    SUM(f.FinalAmount) AS TotalSales
FROM 
    FactSales f
JOIN 
    DimDate d ON f.DateKey = d.DateKey
GROUP BY 
    d.WeekdayName
ORDER BY 
    TotalSales DESC;
