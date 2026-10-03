USE Northwind_S02_Lab;

SELECT SupplierID, CompanyName
FROM Suppliers
WHERE CompanyName = 'Exotic Liquids';

SELECT ProductID, ProductName, SupplierID, CategoryID
FROM Products
WHERE SupplierID IN (
	SELECT SupplierID
	FROM Suppliers
	WHERE CompanyName = 'Exotic Liquids'
)

BEGIN TRAN;

UPDATE Products
SET CategoryID = 2
WHERE SupplierID IN (
	SELECT SupplierID
	FROM Suppliers
	WHERE CompanyName = 'Exotic Liquids'
)

SELECT ProductID, ProductName, SupplierID, CategoryID
FROM Products
WHERE SupplierID IN (
	SELECT SupplierID
	FROM Suppliers
	WHERE CompanyName = 'Exotic Liquids'
)

ROLLBACK;
