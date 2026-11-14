/* El área comercial pide que los nuevos proveedores deben tener correo de ser registrados */

USE Northwind_S02_Lab;
GO

IF OBJECT_ID('dbo.S11_EJ04_Proveedores', 'U')IS NOT NULL DROP TABLE dbo.S11_EJ04_Proveedores;
CREATE TABLE dbo.S11_EJ04_Proveedores(
	ProveedorID INT PRIMARY KEY,
	Nombre NVARCHAR(60),
	Correo NVARCHAR(100) NULL
);

/* Crear un disparador que valide si el proveedor tiene correo para registrarlo */

CREATE OR ALTER TRIGGER dbo.S11_EJ04_trg_InsteadInsert
ON dbo.S11_EJ04_Proveedores INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM inserted WHERE NULLIF(LTRIM(RTRIM(Correo)), '') IS NULL)
	BEGIN
		THROW 51004, 'Correo es obligatorio, registro rechazado',1;
	END;
	INSERT INTO dbo.S11_EJ04_Proveedores(ProveedorID, Nombre, Correo)
	SELECT ProveedorID, Nombre, Correo FROM inserted;
END;
GO

/* Validar registro de proveedor antes de insertarlo */

INSERT INTO dbo.S11_EJ04_Proveedores
VALUES (1, 'Luigui', 'luigui@gmail.com');

BEGIN TRY
	INSERT INTO dbo.S11_EJ04_Proveedores
	VALUES (1, 'Anthony', '');
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorEsperado
END CATCH;

SELECT * FROM S11_EJ04_Proveedores