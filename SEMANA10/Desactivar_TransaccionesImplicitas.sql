USE Northwind_S02_Lab;
GO

SET IMPLICIT_TRANSACTIONS OFF;

SELECT Codigo, Descripcion FROM dbo.S10_EventosLab WHERE codigo = 'EJ01';

IF NOT EXISTS (SELECT 1 FROM dbo.S10_EventosLab WHERE codigo = 'EJ01')
	INSERT INTO dbo.S10_EventosLab (Codigo, Descripcion)
	VALUES ('EJ01', 'Revision del cliente');

SELECT Codigo, Descripcion FROM dbo.S10_EventosLab WHERE Codigo = 'EJ01';
SELECT @@TRANCOUNT AS TransaccionesPendientes;