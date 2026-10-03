USE Northwind_S02_Lab;

SELECT TOP (5) ProductID, ProductName, UnitPrice as PrecioAntiguo,
UnitPrice * 1.10 as PrecioEsperado
FROM Products
WHERE CategoryID = 2
ORDER BY ProductID;

BEGIN TRAN;
UPDATE Products
SET UnitPrice=UnitPrice * 1.10
WHERE CategoryID=2

SELECT TOP (5) ProductID, ProductName, UnitPrice
FROM Products
WHERE CategoryID = 2
ORDER BY ProductID;
ROLLBACK;

-------------

SELECT TOP (5) ProductID, ProductName, UnitPrice as PrecioAntiguo,
UnitPrice * 1.30 as PrecioEsperado
FROM Products
WHERE CategoryID = 1
ORDER BY ProductID;

BEGIN TRAN;
UPDATE Products
SET UnitPrice=UnitPrice * 1.30
WHERE CategoryID = 1

SELECT TOP (5) ProductID, ProductName, UnitPrice
FROM Products
WHERE CategoryID = 1
ORDER BY ProductID;
ROLLBACK;