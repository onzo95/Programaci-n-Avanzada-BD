USE Northwind_S02_Lab;
GO

SET IMPLICIT_TRANSACTIONS OFF;

DECLARE @PaisAntes NVARCHAR(15);

SELECT @PaisAntes = Country FROM dbo.S10_ClientesLab WHERE CustomerID = 'ANATR';

BEGIN TRY
	BEGIN TRANSACTION
		UPDATE dbo.S10_ClientesLab SET Country = 'Ecuador' WHERE CustomerID = 'ANATR';

		IF(@@ROWCOUNT <> 1) THROW 51104, 'Cliente no encontrado', 1;

		SELECT Country AS PaisProvisional, @@TRANCOUNT AS Transacciones
		FROM dbo.S10_ClientesLab WHERE CustomerID = 'ANATR';

		ROLLBACK TRANSACTION;

END TRY

BEGIN CATCH

	IF XACT_STATE() <> 0 ROLLBACK TRANSACTION
	THROW;

END CATCH

SELECT @PaisAntes AS PaisAntes, Country AS PaisDespues, @@TRANCOUNT AS TransaccionesPendientes
FROM dbo.S10_ClientesLab WHERE CustomerID = 'ANATR';