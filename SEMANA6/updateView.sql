USE Northwind_S02_Lab;

BEGIN TRANSACTION

SELECT EmployeeID, FirstName, LastName, City
FROM dbo.Employees
WHERE FirstName = 'Nancy';

UPDATE dbo.HappybirthdayEmployeeView
SET City = 'Lima'
WHERE FirstName = 'Nancy';

SELECT FirstName, LastName, City
FROM dbo.HappybirthdayEmployeeView
WHERE FirstName = 'Nancy';

SELECT EmployeeID, FirstName, LastName, City
FROM dbo.Employees
WHERE FirstName = 'Nancy';

ROLLBACK;

