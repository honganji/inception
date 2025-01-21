FROM alpine:3.18

# Install essential packages for MariaDB
RUN apk update && apk upgrade \
  && apk add --no-cache mariadb mariadb-client

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql var/run/mysqld \
  && mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# Copy the configuration script
COPY ./tools/mariadb_init.sh /tmp/mariadb_init.sh

RUN chmod +x /tmp/mariadb_init.sh

# Overwrite the configuration file with a self-written one
COPY ./conf/my.cnf /etc/my.cnf

# Initialize system tables and data directory, perform essential setup
RUN mariadb-install-db

# Expose the port 3306
EXPOSE 3306

# Command to run the script
ENTRYPOINT ["/tmp/mariadb_init.sh"]
