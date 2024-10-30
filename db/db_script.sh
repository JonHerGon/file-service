#!/bin/bash

# Verificar que las variables estén correctamente cargadas
if [ -z "$SIGESIN_DB_NAME" ] || [ -z "$SIGESIN_DB_USER" ] || [ -z "$SIGESIN_DB_PASSWORD" ]; then
    echo "Error: Las variables de entorno no están configuradas correctamente."
    exit 1
fi

echo "Sistema operativo detectado: Linux"

# Crear los directorios para los tablespaces en Linux si no existen
sudo mkdir -p /var/lib/postgresql/tablespaces/SGNLC_CATALOG
sudo mkdir -p /var/lib/postgresql/tablespaces/SGNLT_PUBLIC_CLOUD
sudo mkdir -p /var/lib/postgresql/tablespaces/SGNLT_PRIVATE_CLOUD
sudo mkdir -p /var/lib/postgresql/tablespaces/SGNLH_RECORD
sudo mkdir -p /var/lib/postgresql/tablespaces/SGNLC_REPORT
sudo mkdir -p /var/lib/postgresql/tablespaces/SGNLT_SING

# Cambiar los permisos para que PostgreSQL pueda escribir en los directorios
sudo chown postgres:postgres /var/lib/postgresql/tablespaces/SGNLC_CATALOG
sudo chown postgres:postgres /var/lib/postgresql/tablespaces/SGNLT_PUBLIC_CLOUD
sudo chown postgres:postgres /var/lib/postgresql/tablespaces/SGNLT_PRIVATE_CLOUD
sudo chown postgres:postgres /var/lib/postgresql/tablespaces/SGNLH_RECORD
sudo chown postgres:postgres /var/lib/postgresql/tablespaces/SGNLC_REPORT
sudo chown postgres:postgres /var/lib/postgresql/tablespaces/SGNLT_SING

# Crear la base de datos y el usuario
sudo -u postgres psql -c "CREATE DATABASE \"${SIGESIN_DB_NAME}\";"
sudo -u postgres psql -c "CREATE USER \"$SIGESIN_DB_USER\" WITH PASSWORD '$SIGESIN_DB_PASSWORD';"
ALTER USER \"$SIGESIN_DB_USER\" WITH PASSWORD '$SIGESIN_DB_PASSWORD';


# Otorgar todos los privilegios de la base de datos al usuario
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE \"${SIGESIN_DB_NAME}\" TO \"$SIGESIN_DB_USER\";"

# Crear los tablespaces
sudo -u postgres psql -c "CREATE TABLESPACE sgnlc_catalog LOCATION '/var/lib/postgresql/tablespaces/SGNLC_CATALOG';"
sudo -u postgres psql -c "CREATE TABLESPACE sgnlt_public_cloud LOCATION '/var/lib/postgresql/tablespaces/SGNLT_PUBLIC_CLOUD';"
sudo -u postgres psql -c "CREATE TABLESPACE sgnlt_private_cloud LOCATION '/var/lib/postgresql/tablespaces/SGNLT_PRIVATE_CLOUD';"
sudo -u postgres psql -c "CREATE TABLESPACE sgnlh_record LOCATION '/var/lib/postgresql/tablespaces/SGNLH_RECORD';"
sudo -u postgres psql -c "CREATE TABLESPACE sgnlh_report LOCATION '/var/lib/postgresql/tablespaces/SGNLC_REPORT';"
sudo -u postgres psql -c "CREATE TABLESPACE sgnlt_sing LOCATION '/var/lib/postgresql/tablespaces/SGNLT_SING';"

# Conectar a la base de datos y crear el esquema 'sigesin'
sudo -u postgres psql -d "${SIGESIN_DB_NAME}" -c "CREATE SCHEMA IF NOT EXISTS sigesin AUTHORIZATION \"$SIGESIN_DB_USER\";"

# Cambiar el propietario de todas las tablas, secuencias y vistas a $SIGESIN_DB_USER
sudo -u postgres psql -d "${SIGESIN_DB_NAME}" -c "DO \$\$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT tablename FROM pg_tables WHERE schemaname = 'public'
    LOOP
        EXECUTE 'ALTER TABLE ' || r.tablename || ' OWNER TO \"$SIGESIN_DB_USER\"';
    END LOOP;
END \$\$;"

# Reemplazar <OWNER> en el archivo SQL con el valor de SIGESIN_DB_USER
sed "s/<OWNER>/$SIGESIN_DB_USER/g" mat_sgn_structure.sql > mat_sgn_structure_with_owner.sql

# Ejecutar el archivo SQL con el propietario correcto
sudo -u postgres psql -d "${SIGESIN_DB_NAME}" -f mat_sgn_structure_with_owner.sql

# Eliminar el archivo temporal después de la ejecución
rm mat_sgn_structure_with_owner.sql

# Ejecutar el script de llenado de datos
sudo -u postgres psql -d "${SIGESIN_DB_NAME}" -f mat_sgn_data.sql

echo "Base de datos, usuario, tablespaces, directorios y esquema 'sigesin' creados exitosamente."
