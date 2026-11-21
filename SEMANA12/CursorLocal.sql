USE Northwind_S02_Lab;
GO

SELECT TOP(5) CustomerID, ContactName 
FROM dbo.Customers
ORDER BY CustomerID;

DECLARE @Nombre NVARCHAR(50);
DECLARE cur_s12_Cliente CURSOR LOCAL FAST_FORWARD FOR
	SELECT TOP(5) ContactName FROM dbo.Customers
	ORDER BY CustomerID;
OPEN cur_s12_Cliente
FETCH NEXT FROM cur_s12_Cliente INTO @Nombre;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @Nombre
	FETCH NEXT FROM cur_s12_Cliente INTO @Nombre;
END;

CLOSE cur_s12_Cliente;
DEALLOCATE cur_S12_Cliente;
