-- Crear usuarios para este laboratorio sin "Login"

-- Crear entidades de prueba

USE S13_Seguridad_Lab;
GO

IF DATABASE_PRINCIPAL_ID('Lector_S13') IS NULL
	CREATE USER Lector_S13 WITHOUT LOGIN;

IF DATABASE_PRINCIPAL_ID('Auditor_S13') IS NULL
	CREATE USER Auditor_S13 WITHOUT LOGIN;

-- Comprobar su tipo

SELECT NAME, TYPE_DESC, Authentication_Type_Desc
FROM sys.database_principals
WHERE NAME IN ('Lector_S13','Auditor_S13')
ORDER BY NAME;