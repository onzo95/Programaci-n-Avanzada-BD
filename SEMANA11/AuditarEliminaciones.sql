/* Se elimina un producto del catálogo de la empresa y el equipo necesita saber que producto desapareció */

USE Northwind_S02_Lab;
GO

IF OBJECT_ID('dbo.S11_EJ03_Bajas', 'U')IS NOT NULL DROP TABLE dbo.S11_EJ03_Bajas;
IF OBJECT_ID('dbo.S11_EJ03_Productos', 'U')IS NOT NULL DROP TABLE dbo.S11_EJ03_Productos;

CREATE TABLE dbo.S11_EJ03_Productos(
	ProductID INT PRIMARY KEY,
	Nombre NVARCHAR(60)
);

CREATE TABLE dbo.S11_EJ03_Bajas(
	BajaID INT IDENTITY PRIMARY KEY,
	ProductID INT,
	Nombre NVARCHAR(60),
	Fecha DATETIME DEFAULT SYSDATETIME()
);

INSERT INTO dbo.S11_EJ03_Productos
VALUES (1, 'Cuaderno'),(2, 'Folder'),(3, 'Lapicero');

/* Crear trigger para registrar en la tabla bajas en caso se elimine algun producto */

CREATE OR ALTER TRIGGER dbo.S11_EJ03_trg_AfterDelete
ON dbo.S11_EJ03_Productos AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO dbo.S11_EJ03_Bajas (ProductID, Nombre)
	SELECT d.ProductID, d.Nombre FROM deleted AS d;
END;
GO

/* Validar que se está insertando en la tabla Bajas el producto eliminado */
DELETE FROM dbo.S11_EJ03_Productos
WHERE ProductID IN (1,2);

SELECT * FROM dbo.S11_EJ03_Productos;
SELECT * FROM dbo.S11_EJ03_Bajas;

