USE Northwind_S02_Lab;
GO

SELECT TOP(5) EmployeeID, FirstName, LastName 
FROM dbo.Employees
ORDER BY EmployeeID;

CREATE OR ALTER FUNCTION dbo.fn_s12_NombreCompleto(@EmpleadoID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
	DECLARE @NombreCompleto NVARCHAR(100);
	SELECT @NombreCompleto = CONCAT(FirstName, ' ', LastName)
	FROM dbo.Employees
	WHERE EmployeeID = @EmpleadoID;
	RETURN @NombreCompleto;
END;

SELECT dbo.fn_s12_NombreCompleto(5) AS NombreEmpleado;
SELECT dbo.fn_s12_NombreCompleto(-1) AS NombreEmpleado;