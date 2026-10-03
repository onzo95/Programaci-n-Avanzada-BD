USE Northwind_S02_Lab;

SELECT
EmployeeID, LastName, FirstName
FROM Employees
WHERE LastName IN ('Poma','Corrales')

BEGIN TRAN;

INSERT INTO Employees(EmployeeID, LastName, FirstName, City, Country)
VALUES 
(8,'Poma','Juan','Lima','Perú'),
(9,'Corrales','Pablo','Lima','Perú');

SELECT EmployeeID, LastName, FirstName
FROM Employees
WHERE LastName IN ('Poma','Corrales')

ROLLBACK;

SELECT EmployeeID, LastName, FirstName
FROM Employees
WHERE LastName IN ('Poma','Corrales');

--- A esta misma transación, ingresar 3 empleados con los apellidos: Pérez, Mamani y Chávez

SELECT
EmployeeID, LastName, FirstName
FROM Employees
WHERE LastName IN ('Pérez','Mamani','Chávez')

BEGIN TRAN;

INSERT INTO Employees(EmployeeID, LastName)
VALUES 
(8,'Pérez','Pancho','Lima','Perú'),
(9,'Mamani','Maria','Lima','Perú'),
(10,'Chávez','Pepe','Lima','Perú');


SELECT EmployeeID, LastName, FirstName
FROM Employees 
WHERE LastName IN('Pérez', 'Mamani', 'Chávez');

ROLLBACK;

SELECT EmployeeID, LastName, FirstName
FROM Employees
WHERE LastName IN ('Pérez', 'Mamani', 'Chávez');


