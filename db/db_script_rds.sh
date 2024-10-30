#!/bin/bash

# Verificar que las variables de entorno necesarias estén configuradas
if [ -z "$RDS_HOST" ] || [ -z "$SIGESIN_DB_NAME" ] || [ -z "$SIGESIN_DB_USER" ] || [ -z "$SIGESIN_DB_PASSWORD" ] || [ -z "$DB_ADMIN" ] || [ -z "$DB_PASS" ]; then
    echo "Error: Las variables de entorno no están configuradas correctamente."
    exit 1
fi

# Conectar a la base de datos RDS y crear la base de datos y usuario
psql -h $RDS_HOST -U $DB_ADMIN -c "CREATE DATABASE \"${SIGESIN_DB_NAME}\";"
psql -h $RDS_HOST -U $DB_ADMIN -c "CREATE USER \"$SIGESIN_DB_USER\" WITH PASSWORD '$SIGESIN_DB_PASSWORD';"
psql -h $RDS_HOST -U $DB_ADMIN -c "GRANT ALL PRIVILEGES ON DATABASE \"${SIGESIN_DB_NAME}\" TO \"$SIGESIN_DB_USER\";"

# Crear el esquema 'sigesin'
psql -h $RDS_HOST -U $SIGESIN_DB_USER -d "${SIGESIN_DB_NAME}" -c "CREATE SCHEMA IF NOT EXISTS sigesin AUTHORIZATION \"$SIGESIN_DB_USER\";"

# Cambiar el propietario de todas las tablas en el esquema
psql -h $RDS_HOST -U $SIGESIN_DB_USER -d "${SIGESIN_DB_NAME}" -c "DO \$\$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT tablename FROM pg_tables WHERE schemaname = 'public'
    LOOP
        EXECUTE 'ALTER TABLE ' || r.tablename || ' OWNER TO \"$SIGESIN_DB_USER\"';
    END LOOP;
END \$\$;"

# Reemplazar <OWNER> en el archivo SQL con el valor de SIGESIN_DB_USER
sed "s/<OWNER>/$SIGESIN_DB_USER/g" mat_sgn_structure_rds.sql > mat_sgn_structure_with_owner.sql

# Ejecutar el archivo SQL con el propietario correcto
psql -h $RDS_HOST -U $SIGESIN_DB_USER -d "${SIGESIN_DB_NAME}" -f mat_sgn_structure_with_owner.sql

# Eliminar el archivo temporal después de la ejecución
rm mat_sgn_structure_with_owner.sql

# Ejecutar el script de llenado de datos
psql -h $RDS_HOST -U $SIGESIN_DB_USER -d "${SIGESIN_DB_NAME}" -f mat_sgn_data.sql

echo "Base de datos, usuario, esquema 'sigesin' creados exitosamente."
