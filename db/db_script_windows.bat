@echo off
:: Verificar que las variables de entorno estén configuradas
if "%SIGESIN_DB_NAME%"=="" (
    echo Error: SIGESIN_DB_NAME no está configurada.
    exit /b 1
)
if "%SIGESIN_DB_USER%"=="" (
    echo Error: SIGESIN_DB_USER no está configurada.
    exit /b 1
)
if "%SIGESIN_DB_PASSWORD%"=="" (
    echo Error: SIGESIN_DB_PASSWORD no está configurada.
    exit /b 1
)

echo Sistema operativo detectado: Windows

:: Crear los directorios para los tablespaces si no existen
if not exist "C:\PostgreSQL\Tablespaces\SGNLC_CATALOG" (
    mkdir "C:\PostgreSQL\Tablespaces\SGNLC_CATALOG"
)
if not exist "C:\PostgreSQL\Tablespaces\SGNLT_PUBLIC_CLOUD" (
    mkdir "C:\PostgreSQL\Tablespaces\SGNLT_PUBLIC_CLOUD"
)
if not exist "C:\PostgreSQL\Tablespaces\SGNLT_PRIVATE_CLOUD" (
    mkdir "C:\PostgreSQL\Tablespaces\SGNLT_PRIVATE_CLOUD"
)
if not exist "C:\PostgreSQL\Tablespaces\SGNLH_RECORD" (
    mkdir "C:\PostgreSQL\Tablespaces\SGNLH_RECORD"
)
if not exist "C:\PostgreSQL\Tablespaces\SGNLC_REPORT" (
    mkdir "C:\PostgreSQL\Tablespaces\SGNLC_REPORT"
)
if not exist "C:\PostgreSQL\Tablespaces\SGNLT_SING" (
    mkdir "C:\PostgreSQL\Tablespaces\SGNLT_SING"
)

:: Crear la base de datos y el usuario en PostgreSQL (nombre en mayúsculas)
psql -U postgres -c "CREATE DATABASE \"%SIGESIN_DB_NAME%\";"
psql -U postgres -c "CREATE USER \"%SIGESIN_DB_USER%\" WITH PASSWORD '%SIGESIN_DB_PASSWORD%';"
psql -U postgres -c "ALTER USER \"%SIGESIN_DB_USER%\" WITH PASSWORD '%SIGESIN_DB_PASSWORD%';"

:: Otorgar todos los privilegios de la base de datos al usuario
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE \"%SIGESIN_DB_NAME%\" TO \"%SIGESIN_DB_USER%\";"

:: Crear los tablespaces
psql -U postgres -c "CREATE TABLESPACE sgnlc_catalog LOCATION 'C:/PostgreSQL/Tablespaces/SGNLC_CATALOG';"
psql -U postgres -c "CREATE TABLESPACE sgnlt_public_cloud LOCATION 'C:/PostgreSQL/Tablespaces/SGNLT_PUBLIC_CLOUD';"
psql -U postgres -c "CREATE TABLESPACE sgnlt_private_cloud LOCATION 'C:/PostgreSQL/Tablespaces/SGNLT_PRIVATE_CLOUD';"
psql -U postgres -c "CREATE TABLESPACE sgnlh_record LOCATION 'C:/PostgreSQL/Tablespaces/SGNLH_RECORD';"
psql -U postgres -c "CREATE TABLESPACE sgnlh_report LOCATION 'C:/PostgreSQL/Tablespaces/SGNLC_REPORT';"
psql -U postgres -c "CREATE TABLESPACE sgnlt_sing LOCATION 'C:/PostgreSQL/Tablespaces/SGNLT_SING';"

:: Conectar a la base de datos y crear el esquema 'sigesin'
psql -U postgres -d "%SIGESIN_DB_NAME%" -c "CREATE SCHEMA IF NOT EXISTS sigesin AUTHORIZATION \"%SIGESIN_DB_USER%\";"

:: Cambiar el propietario de todas las tablas, secuencias y vistas a SIGESIN_DB_USER
psql -U postgres -d "%SIGESIN_DB_NAME%" -c "DO $$ DECLARE r RECORD; BEGIN FOR r IN SELECT tablename FROM pg_tables WHERE schemaname = 'public' LOOP EXECUTE 'ALTER TABLE ' || r.tablename || ' OWNER TO \"%SIGESIN_DB_USER%\"'; END LOOP; END $$;"

:: Usar %~dp0 para obtener el directorio del script y trabajar con los archivos en la misma carpeta
set SCRIPT_DIR=%~dp0

:: Reemplazar <OWNER> en el archivo SQL con el valor de SIGESIN_DB_USER
powershell -Command "(Get-Content '%SCRIPT_DIR%mat_sgn_structure.sql') -replace '<OWNER>', '%SIGESIN_DB_USER%' | Set-Content '%SCRIPT_DIR%mat_sgn_structure_with_owner.sql'"

:: Ejecutar el archivo SQL con el propietario correcto
psql -U postgres -d "%SIGESIN_DB_NAME%" -f "%SCRIPT_DIR%mat_sgn_structure_with_owner.sql"

:: Eliminar el archivo temporal después de la ejecución
del "%SCRIPT_DIR%mat_sgn_structure_with_owner.sql"

:: Ejecutar el script de llenado de datos
psql -U postgres -d "%SIGESIN_DB_NAME%" -f "%SCRIPT_DIR%mat_sgn_data.sql"

echo Base de datos, usuario, tablespaces, directorios y esquema 'sigesin' creados exitosamente.
pause
