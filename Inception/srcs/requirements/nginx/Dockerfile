FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl busybox-extras

COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY ./start.sh /start.sh
RUN chmod +x ./start.sh && mkdir -p /run/nginx
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=vault/OU=42kazan/CN=tmiranda" \
-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
# RUN sed -i "s/"
ENTRYPOINT [ "nginx", "-g daemon off;" ]