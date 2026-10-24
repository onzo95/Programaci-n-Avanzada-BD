USE Lideratec_Repaso_S05_S07;

IF NOT EXISTS (SELECT 1 FROM dbo.PedidosPractica)
BEGIN
	INSERT INTO dbo.PedidosPractica
	(PedidoID, ClienteID, FechaPedido, CostoEnvio, Empresa, Pais)
	SELECT TOP(12)
	o.OrderID, o.CustomerID, CAST(o.OrderDate as DATE), CAST(COALESCE(o.Freight,0) AS DECIMAL(12,2)),
	c.CompanyName, c.Country
	FROM
	Northwind_S02_Lab.dbo.Orders AS o
	INNER JOIN Northwind_S02_Lab.dbo.Customers AS c
	ON c.CustomerID = o.CustomerID
	WHERE c.Country = 'Germany'
	ORDER BY o.OrderID;

END;