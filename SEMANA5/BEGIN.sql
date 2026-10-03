USE Northwind_S02_Lab;

SELECT
CustomerID,
CompanyName,
ContactName,
Country
FROM Customers
WHERE CustomerID = 'LAC01'

BEGIN TRAN;

INSERT INTO Customers(CustomerID, CompanyName, ContactName, Country)
VALUES('LAC01', 'Lideratec Academy', 'Wilder', 'Perú')

SELECT
CustomerID,
CompanyName,
ContactName,
Country
FROM Customers
WHERE CustomerID = 'LAC01'

ROLLBACK;

SELECT
CustomerID,
CompanyName,
ContactName,
Country
FROM Customers
WHERE CustomerID = 'LAC01'

---- INSERTAR UNA TABLA PROVEEDOR QUE NO EXISTA, USANDO LA TABLA Suppliers

SELECT 
SupplierID,
CompanyName,
Country
FROM Suppliers
WHERE SupplierID = '01'

BEGIN TRAN;

INSERT INTO Suppliers(SupplierID, CompanyName, Country)
VALUES('01', 'Lideratec Academy', 'Perú')

SELECT 
SupplierID,
CompanyName,
Country
FROM Suppliers
WHERE SupplierID = '01'

ROLLBACK;

SELECT 
SupplierID,
CompanyName,
Country
FROM Suppliers
WHERE SupplierID = '01'

