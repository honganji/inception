#!/bin/sh

# If there is no wp-config.php file, create it
if [ ! -f "wp-config.php" ]; then 
	mv wp-config-sample.php wp-config.php
fi

# change the database settings with the environment variables
sed -i "s|define( 'DB_NAME', 'database_name_here' );|define( 'DB_NAME', '"${DB_NAME}"' );|g" \
	wp-config.php && \
sed -i "s|define( 'DB_USER', 'username_here' );|define( 'DB_USER', '"${DB_USER}"' );|g" \
	wp-config.php && \
sed -i "s|define( 'DB_PASSWORD', 'password_here' );|define( 'DB_PASSWORD', '"${DB_PASSWORD}"' );|g" \
	wp-config.php

sed -i -r "s/localhost/${WP_DB_HOST}/1" wp-config.php

// Install WordPress and initialize it with environment variables
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
php82 wp-cli.phar core install \
--url="${DOMAIN_NAME}" --title="Inception" \
--admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PASSWORD}" \
--admin_email="${WP_ADMIN_EMAIL}"

# implement PHP-FPM
/usr/sbin/php-fpm82 -F
