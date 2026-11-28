-- Diferenciar autenticación de Window, SQL y autorización
SELECT 
ORIGINAL_LOGIN() AS LoginOriginal,
SUSER_NAME() AS LoginContexto,
DB_NAME() AS BaseActual,
SERVERPROPERTY('IsIntegratedSecurityOnly') AS SoloAutenticacionWindow

-- Distingo un Login y un Usuario
SELECT
SUSER_NAME() AS LoginInstancia,
USER_NAME() AS UsuarioBD,
DB_NAME() AS BaseActual