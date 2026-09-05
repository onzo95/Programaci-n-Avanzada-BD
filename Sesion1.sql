CREATE DATABASE alquilerCoches
GO

USE alquilerCoches
GO

CREATE TABLE ClienteDemo(
	IdCliente INT,
	Nombre VARCHAR(80),
	DNI CHAR(8) UNIQUE
);
GO

ALTER TABLE ClienteDemo
ADD DNI CHAR(8) NULL;
GO

--PARA ELIMINAR UN ATRIBUTO: EJEMPLO
---------------------------
--ALTER TABLE ClienteDemo
--DROP DNI CHAR(8) NULL;
--GO
---------------------------

--DROP TABLE ClienteDemo;
--GO

INSERT INTO ClienteDemo (IdCliente, Nombre, DNI)
VALUES (1,'Pedro','12345678');
GO

INSERT INTO ClienteDemo (IdCliente, Nombre, DNI)
VALUES (2,'Ana','87654321');
GO

SELECT * FROM ClienteDemo;
GO

--PARA FILTRAR DATOS EN ESPECIFICO: EJEMPLO
----------------------------
--SELECT Nombre FROM ClienteDemo;
--GO
----------------------------

UPDATE ClienteDemo
SET Nombre='Pedro Sanchez'
WHERE IdCliente=1;
GO

--MODIFICAR UN DATO: EJEMPLO
-----------------------------
--UPDATE ClienteDemo
--SET Nombre='Wilder'
--WHERE IdCliente=1;
--GO

-----------------------------
--PARA ELIMINAR DATOS: EJEMPLO
-----------------------------
--DELETE FROM ClienteDemo
--WHERE IdCliente=1;
--GO

ALTER TABLE ClienteDemo
ADD DepartInicial CHAR(2) NULL
DEFAULT 'LI';
GO

INSERT INTO ClienteDemo (IdCliente, Nombre, DNI)
VALUES (3,'Juan','74185263');
GO

CREATE TABLE Agencia(
	IdAgencia INT PRIMARY KEY IDENTITY NOT NULL,
	Agencia VARCHAR(100)
);
GO

SELECT * FROM Agencia;
GO

INSERT INTO Agencia (Agencia)
VALUES ('Los Andes');
GO

INSERT INTO Agencia (Agencia)
VALUES ('Los Pinos');
GO