USE Northwind_S02_Lab;
GO

SET IMPLICIT_TRANSACTIONS OFF;

IF @@ROWCOUNT <> 0 THROW 51102, 'Existe una transacción pendiente', 1;
DECLARE @PaisAntes NVARCHAR(15);
SELECT @PaisAntes = Country FROM dbo.S10_ClientesLab WHERE CustomerID = 'ALFKI';


--- Activar "Transacción Implícita"
SET IMPLICIT_TRANSACTIONS ON;

BEGIN TRY

	UPDATE dbo.S10_ClientesLab SET Country = 'Peru' WHERE CustomerID = 'ALFKI';

	SELECT Country AS PaisProvisional, @@TRANCOUNT AS Transacciones
	FROM dbo.S10_ClientesLab WHERE CustomerID = 'ALFKI';

	ROLLBACK TRANSACTION;

	SET IMPLICIT_TRANSACTIONS OFF;

END TRY


BEGIN CATCH
	
	IF XACT_STATE() <> 0 ROLLBACK TRANSACTION
	SET IMPLICIT_TRANSACTIONS OFF;
	
	THROW;

END CATCH

SELECT @PaisAntes AS PaisAntes, Country AS PaisDespues, @@TRANCOUNT AS TransaccionesPendientes
FROM dbo.S10_ClientesLab WHERE CustomerID = 'ALFKI';



