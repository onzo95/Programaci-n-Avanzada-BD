USE Northwind_S02_Lab;

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE EmployeeID = 1

BEGIN TRAN;

UPDATE Employees
SET FirstName='John',
LastName = 'Smith'
WHERE EmployeeID = 1

ROLLBACK;

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE EmployeeID = 1

---------------

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE EmployeeID = 5

BEGIN TRAN;

UPDATE Employees
SET FirstName='Juan',
LastName = 'Rojas'
WHERE EmployeeID = 5

ROLLBACK;

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE EmployeeID = 5






