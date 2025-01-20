#!/bin/sh

# Create database and user, set a password, change root password, grant privileges
if [ ! -d "/var/lib/mysql/${WP_DB_NAME}" ]; then
	mariadbd --user=mysql --bootstrap --console <<EOSQL
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE ${WP_DB_NAME};
CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${WP_DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOSQL
else
	mariadbd --user=mysql --console
fi
