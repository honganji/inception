FROM alpine:3.18

# Install essential packages for Nginx
RUN apk update && apk upgrade \
  && apk add --no-cache nginx openssl

# Copy the TLS setup script
COPY ./tools/nginx_init.sh /tmp/nginx_init.sh

RUN chmod +x /tmp/nginx_init.sh

# Overwrite the default Nginx configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/conf.d/default.conf /etc/nginx/conf.d/default.conf

# Expose the port 443
EXPOSE 443

# Command to run the script
CMD ["/tmp/nginx_init.sh"]
