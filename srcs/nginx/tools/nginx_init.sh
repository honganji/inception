#!/bin/sh

# Generate a self-signed key and certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout ${PATH_SSL_KEY} \
-out ${PATH_SSL_CERTS} \
 -subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/OU=student/CN=${DOMAIN_NAME}"

# Start nginx in the foreground
nginx -g "daemon off;"
