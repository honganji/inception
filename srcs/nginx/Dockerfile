# Use the penultimate version of Alpine Linux
FROM alpine:3.18

# Update and upgrade Alpine Linux, install Nginx
RUN apk update && apk upgrade \
  && apk add --no-cache nginx openssl

# Copy the TLS setup script into the container
COPY ./tools/nginx_init.sh /tmp/nginx_init.sh

# Change the permissions of the ssl script
RUN chmod +x /tmp/nginx_init.sh

# Replace the configuration file with a self-written one
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/conf.d/default.conf /etc/nginx/conf.d/default.conf

# Expose the port 443 (default HTTPS port)
EXPOSE 443

# Launch Nginx not in daemon mode
CMD ["/tmp/nginx_init.sh"]
