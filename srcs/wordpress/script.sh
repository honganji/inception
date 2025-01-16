#!/bin/bash

cd /var/www/html
echo "Environment variables:"
echo "-----------------------------------"
echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"
echo "DB_PASSWORD: $DB_PASSWORD"
echo "DB_HOST: $DB_HOST"
echo "DOMAIN_NAME: $DOMAIN_NAME"
echo "TITLE: $TITLE"
echo "ADMIN_USER: $ADMIN_USER"
echo "ADMIN_USER_PASSWORD: $ADMIN_USER_PASSWORD"
echo "ADMIN_USER_EMAIL: $ADMIN_USER_EMAIL"
echo "USER: $USER"
echo "USER_ROLE: $USER_ROLE"
echo "USER_EMAIL: $USER_EMAIL"
echo "USER_PASSWORD: $USER_PASSWORD"
echo "-----------------------------------"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --allow-root
./wp-cli.phar core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_USER_PASSWORD} --admin_email=${ADMIN_USER_EMAIL} --allow-root
./wp-cli.phar user create "${USER}" "${USER_EMAIL}" --role=${USER_ROLE} --user_pass=${USER_PASSWORD} --allow-root

php-fpm8.2 -F
