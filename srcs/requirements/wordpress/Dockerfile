FROM alpine:3.18

ENV PHP_VERSRION=82

# Install essential packages for wordpress
# setup to listen to port 9000
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

# Copy the configuration script
COPY ./tools/wordpress_init.sh /tmp/wordpress_init.sh

# Download and install Wordpress
RUN chmod +x /tmp/wordpress_init.sh && \
  wget https://wordpress.org/latest.zip && \
  unzip latest.zip && \
  mkdir -p /var/www/wordpress && \
  cp -rf wordpress/* /var/www/wordpress && \
  rm -rf wordpress latest.zip

# Expose the port 9000
EXPOSE 9000

# Set the working directory
WORKDIR /var/www/wordpress

# Command to run the script
ENTRYPOINT ["/tmp/wordpress_init.sh"]
