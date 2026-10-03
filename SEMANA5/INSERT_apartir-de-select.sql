USE Northwind_S02_Lab;

SELECT CustomerID, CompanyName
FROM Customers
WHERE CustomerID = 'ALFKI'

BEGIN TRAN

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Freight)
SELECT 10280, CustomerID, GETDATE(), 25
FROM Customers
WHERE CustomerID = 'ALFKI'

SELECT TOP (1) OrderID, CustomerID, OrderDate
FROM Orders
WHERE CustomerID = 'ALFKI'
ORDER BY OrderID desc;

ROLLBACK;