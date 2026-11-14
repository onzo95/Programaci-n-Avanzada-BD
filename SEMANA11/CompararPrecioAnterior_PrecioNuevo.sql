/* El área comercial modifica precios y necesita recuperar el valor anterior de precio de cada producto,
no solamente su valor actual*/

USE Northwind_S02_Lab;
GO

IF OBJECT_ID('dbo.S11_EJ02_Cambios', 'U') IS NOT NULL DROP TABLE dbo.S11_EJ02_Cambios;
IF OBJECT_ID('dbo.S11_EJ02_Productos', 'U') IS NOT NULL DROP TABLE dbo.S11_EJ02_Productos;

CREATE TABLE dbo.S11_EJ02_Productos(
	ProductID INT PRIMARY KEY,
	Nombre NVARCHAR(60),
	UnitPrice DECIMAL(10,2)
);

CREATE TABLE dbo.S11_EJ02_Cambios(
	CambioID INT IDENTITY PRIMARY KEY,
	ProductID INT,
	PrecioAnterior DECIMAL(10,2),
	PrecioNuevo DECIMAL(10,2)
);

INSERT INTO dbo.S11_EJ02_Productos
VALUES (1, 'Té', 10),(2, 'Café', 30);

SELECT * FROM dbo.S11_EJ02_Productos;

/* Creación de trigger el cual, registrará en la tabla cambio actualizaciones de precio de cada producto */
CREATE OR ALTER TRIGGER dbo.S11_EJ02_trg_AfterUpdate
ON dbo.S11_EJ02_Productos AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.S11_EJ02_Cambios (ProductID, PrecioAnterior, PrecioNuevo)
	SELECT i.ProductID, d.UnitPrice, i.UnitPrice
	FROM inserted AS i JOIN deleted AS d ON d.ProductID = i.ProductID
	WHERE i.UnitPrice <> d.UnitPrice
END;
GO

/* Validar que se está insertando en la tabla Cambios al actualizar el precio del producto */
UPDATE dbo.S11_EJ02_Productos SET UnitPrice = UnitPrice + 5 WHERE ProductID IN (1,2);
SELECT * FROM dbo.S11_EJ02_Cambios ORDER BY CambioID;
UPDATE dbo.S11_EJ02_Productos SET Nombre = 'Pantalla' WHERE ProductID = 1;
SELECT * FROM dbo.S11_EJ02_Cambios ORDER BY CambioID;