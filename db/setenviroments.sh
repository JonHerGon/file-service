#!/bin/bash

# Variables de entorno para la base de datos
RDS_HOST=your-rds-endpoint  # Aquí va el host de tu RDS
SIGESIN_DB_NAME=MTD_SIGESIN
SIGESIN_DB_USER=mtd_sgn_admin
SIGESIN_DB_PASSWORD=Jona_h9729286364
DB_ADMIN=your_rds_admin  # Este sería el usuario administrador de tu RDS
DB_PASS=your_rds_admin_password  # Contraseña del administrador de RDS

# Ruta al archivo ~/.bashrc del usuario actual
BASHRC_FILE="$HOME/.bashrc"

# Crear una copia de seguridad del archivo ~/.bashrc
cp $BASHRC_FILE $BASHRC_FILE.bak

# Agregar una función para agregar una variable al bashrc si no existe
add_variable_if_not_exists() {
    local var_name=$1
    local var_value=$2

    # Verifica si la variable ya está presente
    if ! grep -q "^export $var_name=" $BASHRC_FILE; then
        echo "export $var_name=\"$var_value\"" >> $BASHRC_FILE
        echo "Variable $var_name agregada a $BASHRC_FILE"
    else
        echo "La variable $var_name ya está configurada en $BASHRC_FILE."
    fi
}

# Agregar todas las variables de entorno relacionadas con la base de datos
add_variable_if_not_exists "RDS_HOST" "$RDS_HOST"
add_variable_if_not_exists "SIGESIN_DB_NAME" "$SIGESIN_DB_NAME"
add_variable_if_not_exists "SIGESIN_DB_USER" "$SIGESIN_DB_USER"
add_variable_if_not_exists "SIGESIN_DB_PASSWORD" "$SIGESIN_DB_PASSWORD"
add_variable_if_not_exists "DB_ADMIN" "$DB_ADMIN"
add_variable_if_not_exists "DB_PASS" "$DB_PASS"

# Verificar si las variables fueron aplicadas correctamente
echo "Variables configuradas para la base de datos:"
echo "RDS_HOST = $RDS_HOST"
echo "SIGESIN_DB_NAME = $SIGESIN_DB_NAME"
echo "SIGESIN_DB_USER = $SIGESIN_DB_USER"
echo "SIGESIN_DB_PASSWORD = $SIGESIN_DB_PASSWORD"
echo "DB_ADMIN = $DB_ADMIN"
echo "DB_PASS = $DB_PASS"

# Aplicar los cambios a la sesión actual
echo "Aplicando los cambios..."
source $BASHRC_FILE
echo "Las variables de entorno para la base de datos se han configurado correctamente."