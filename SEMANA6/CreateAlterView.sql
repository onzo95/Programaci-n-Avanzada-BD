USE Northwind_S02_Lab;

ALTER TABLE dbo.Employees
ADD BirthDate DATETIME DEFAULT GETDATE()

UPDATE dbo.Employees SET BirthDate = GETDATE()

UPDATE dbo.Employees SET BirthDate = NULL
WHERE FirstName = 'Steven'

CREATE OR ALTER VIEW dbo.HappybirthdayEmployeeView
AS
SELECT FirstName, LastName, BirthDate
FROM dbo.Employees
WHERE BirthDate IS NOT NULL;
GO

SELECT FirstName, LastName, BirthDate
FROM dbo.HappybirthdayEmployeeView

-----

CREATE OR ALTER VIEW dbo.EmployeesCountryView
AS
SELECT EmployeeID, FirstName, LastName, City
FROM dbo.Employees
WHERE Country = 'UK';

SELECT EmployeeID, FirstName, LastName, City
FROM dbo.EmployeesCountryView

-----

ALTER VIEW dbo.HappybirthdayEmployeeView
AS
SELECT FirstName, LastName, City
FROM dbo.Employees
GO

SELECT FirstName, LastName, City
FROM dbo.HappybirthdayEmployeeView



