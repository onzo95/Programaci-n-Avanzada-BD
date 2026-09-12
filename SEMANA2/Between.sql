Use Northwind_S02_Lab;

SELECT ProductID, ProductName, UnitsInStock
FROM dbo.Products
WHERE UnitsInStock BETWEEN 10 AND 20
ORDER BY ProductName

SELECT ProductID, ProductName, CategoryID
FROM dbo.Products
WHERE ProductName IN ('Chai','Chang')
ORDER BY ProductName

SELECT ProductID, ProductName, UnitPrice, CategoryID
FROM dbo.Products
WHERE UnitPrice BETWEEN 10
AND 30 AND CategoryID IN (2,7,8);

