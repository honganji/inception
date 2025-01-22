FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/ssl/private /etc/ssl/certs && \
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -subj "/CN=ytoshihi"

COPY default /etc/nginx/sites-available

CMD [ "nginx", "-g", "daemon off;" ]
