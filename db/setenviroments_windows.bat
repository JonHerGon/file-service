@echo off

REM Definir variables de entorno globales
setx SIGESIN_DB_NAME "2" /M
setx SIGESIN_DB_USER "mtd_sgn_admin" /M
setx SIGESIN_DB_PASSWORD "Jona_h9729286364" /M
setx SIGESIN_DB_URI "jdbc:postgresql://localhost:5432/" /M
echo Variables de entorno agregadas exitosamente.


REM Definir la ruta de PostgreSQL
set "POSTGRESQL_BIN=C:\Program Files\PostgreSQL\15\bin"

REM Verificar si la ruta ya está en el PATH
echo Verificando si PostgreSQL ya está en el PATH...
echo %PATH% | findstr /i /c:"%POSTGRESQL_BIN%" >nul
if %errorlevel%==0 (
    echo PostgreSQL ya está en el PATH.
    goto end
)

REM Obtener el valor actual del PATH del sistema desde el registro
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do (
    set CURRENT_PATH=%%B
)

REM Verificar si CURRENT_PATH ya es mayor de lo permitido (el límite del PATH en Windows es de 2048 caracteres)
setlocal enabledelayedexpansion
if "!CURRENT_PATH!"=="" (
    echo No se pudo recuperar el PATH actual.
    goto end
)

REM Agregar PostgreSQL al PATH existente
echo Agregando PostgreSQL al PATH...
set "NEW_PATH=!CURRENT_PATH!;%POSTGRESQL_BIN%"
setx PATH "!NEW_PATH!" /M

echo PostgreSQL agregado correctamente al PATH.

:end
pause

