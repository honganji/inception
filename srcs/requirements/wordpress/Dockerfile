# Use the penultimate version of Alpine Linux
FROM alpine:3.18

# Use the penultimate version of PHP
ENV PHP_VERSRION=82

# Update and upgrade Alpine Linux, install PHP and PHP extensions
# Install wget and unzip to download and extract Wordpress
# Edit the PHP-FPM configuration file to listen on port 9000
# Remove the apk cache
RUN apk update && apk upgrade && \
  apk add --no-cache \
  php${PHP_VERSRION} \
  php${PHP_VERSRION}-phar \
  php${PHP_VERSRION}-mbstring \
  php${PHP_VERSRION}-fpm \
  php${PHP_VERSRION}-mysqli \
  php${PHP_VERSRION}-xml \
  wget \
  unzip \
  mariadb-client && \
  sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
  /etc/php82/php-fpm.d/www.conf && \
  sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
  /etc/php82/php-fpm.d/www.conf && \
  sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
  /etc/php82/php-fpm.d/www.conf && \
  rm -rf /var/cache/apk/*

# Copy the configuration script into the container
COPY ./tools/wordpress_init.sh /tmp/wordpress_init.sh

# Change the permissions of the configuration script
# Download and extract Wordpress
# Create a directory for Wordpress and copy the files
# Remove the downloaded archive
RUN chmod +x /tmp/wordpress_init.sh && \
  wget https://wordpress.org/latest.zip && \
  unzip latest.zip && \
  mkdir -p /var/www/wordpress && \
  cp -rf wordpress/* /var/www/wordpress && \
  rm -rf wordpress latest.zip

# Expose the port 9000 (default PHP-FPM port)
EXPOSE 9000

# Set the working directory
WORKDIR /var/www/wordpress

# Configure and install Wordpress, start php-fpm
ENTRYPOINT ["/tmp/wordpress_init.sh"]
