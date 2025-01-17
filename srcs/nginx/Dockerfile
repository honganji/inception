FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y nginx

COPY default /etc/nginx/sites-available

CMD [ "nginx", "-g", "daemon off;" ]
FROM alpine:3.16
RUN apk update && apk upgrade && apk add --no-cache nginx
EXPOSE 443
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
