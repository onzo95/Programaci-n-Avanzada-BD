/*	En una plataforma de venta se registra un pedido, pero el equipo de operaciones necesita una
	evidencia de esa alta de la operación */

USE Northwind_S02_Lab;
GO

IF OBJECT_ID('dbo.S11_EJ01_Auditoria', 'U')IS NOT NULL DROP TABLE dbo.S11_EJ01_Auditoria;
IF OBJECT_ID('dbo.S11_EJ01_Pedidos', 'U')IS NOT NULL DROP TABLE dbo.S11_EJ01_Pedidos;

--- Crear disparador que insertará en auditoría un registro en base a la operación de insertado
--- en la tabla pedido
CREATE TABLE S11_EJ01_Auditoria (
	AuditoriaID INT IDENTITY PRIMARY KEY,
	PedidoID INT NOT NULL,
	Accion VARCHAR(10) NOT NULL,
	Fecha DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);

CREATE TABLE S11_EJ01_Pedidos(
	PedidoID INT NOT NULL PRIMARY KEY,
	Cliente VARCHAR(60) NOT NULL
);

CREATE OR ALTER TRIGGER dbo.S11_EJ01_trg_AfterInsert
ON dbo.S11_EJ01_Pedidos AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO S11_EJ01_Auditoria (PedidoID, Accion)
	SELECT i.PedidoID, 'INSERT' FROM INSERTED AS i;
END;
GO

--- Insertar en la tabla Pedido y verificar tabla auditoría.
INSERT INTO dbo.S11_EJ01_Pedidos (PedidoID, Cliente)
VALUES (1100, 'Luigui'), (1200, 'Fatima');

SELECT * FROM S11_EJ01_Auditoria;
SELECT * FROM S11_EJ01_Pedidos;



