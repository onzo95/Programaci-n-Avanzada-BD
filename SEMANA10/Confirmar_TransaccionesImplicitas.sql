USE Northwind_S02_Lab;
GO

SET IMPLICIT_TRANSACTIONS OFF;

DECLARE @ContactoAntes NVARCHAR(30), @Filas INT;
SELECT @ContactoAntes = ContactName FROM dbo.S10_ClientesLab WHERE CustomerID = 'ALFKI';

BEGIN TRY
	BEGIN TRANSACTION;
		UPDATE dbo.S10_ClientesLab SET ContactName = 'Luigui'
		WHERE CustomerID = 'ALFKI';

		SET @Filas = @@ROWCOUNT;
		IF (@Filas <> 1) THROW 51103, 'Se espera actualizar un cliente', 1;

		COMMIT;

END TRY

BEGIN CATCH
	
	IF XACT_STATE() <> 0 ROLLBACK TRANSACTION
	THROW;

END CATCH;

SELECT @ContactoAntes AS ContactoAntes, ContactName AS ContactoConfirmado,
@Filas AS FilasAfectadas, @@TRANCOUNT AS TransaccionesPendientes
FROM dbo.S10_ClientesLab WHERE CustomerID = 'ALFKI';