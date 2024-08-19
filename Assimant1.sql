CREATE DATABASE SALESTABLE;
USE SALESTABLE; 
CREATE TABLE Sales1 (
    ProductCategory VARCHAR(50),
    ProductName VARCHAR(50),
    SaleAmount int
);
INSERT INTO Sales1 (ProductCategory, ProductName, SaleAmount) VALUES
('Electronics', 'Laptop', 1000.00),
('Electronics', 'Phone', 800.00),
('Electronics', 'Tablet', 500.00),
('Clothing', 'Shirt', 300.00),
('Clothing', 'Pants', 400.00),
('Furniture', 'Sofa', 1200.00),
('Furniture', 'Bed', 900.00);
SELECT * FROM Sales1;

SELECT 
    COALESCE(ProductCategory, 'Total') AS ProductCategory,
    CASE
        WHEN ProductCategory IS NULL THEN 'Total'
        ELSE COALESCE(ProductName, 'Total')
    END AS ProductName,
    SUM(SaleAmount) AS TotalSales
FROM 
    Sales1
GROUP BY 
    ProductCategory, ProductName WITH ROLLUP
ORDER BY 
    CASE 
        WHEN ProductCategory IS NULL THEN 1 
    END,
    ProductCategory,
    CASE 
        WHEN ProductName IS NULL THEN 1 
    END,
    ProductName;


