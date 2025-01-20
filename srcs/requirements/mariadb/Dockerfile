# Use the penultimate version of Alpine Linux
FROM alpine:3.18

# Update and upgrade Alpine Linux, install MariaDB
RUN apk update && apk upgrade \
  && apk add --no-cache mariadb mariadb-client

# Make directories for the database and change the owner
RUN mkdir -p var/run/mysqld && chown -R mysql:mysql var/run/mysqld \
  && mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# Copy the configuration script into the container
COPY ./tools/mariadb_init.sh /tmp/mariadb_init.sh

# Change the permissions of the configuration script
RUN chmod +x /tmp/mariadb_init.sh

# Replace the configuration file with a self-written one
COPY ./conf/my.cnf /etc/my.cnf

# Initialize system tables and data directory, perform essential setup
RUN mariadb-install-db

# Expose the port 3306 (default MySQL port)
EXPOSE 3306

# Start the MariaDB server
ENTRYPOINT ["/tmp/mariadb_init.sh"]
