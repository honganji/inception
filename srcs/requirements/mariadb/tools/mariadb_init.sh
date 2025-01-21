#!/bin/sh

# Create database and setup
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
	mariadbd --user=mysql --bootstrap --console <<EOSQL
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOSQL
else
	mariadbd --user=mysql --console
fi
