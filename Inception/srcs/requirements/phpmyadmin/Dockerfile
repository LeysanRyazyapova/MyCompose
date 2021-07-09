FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add nginx wget supervisor php7-fpm php7-opcache \
    php7-gd php7-iconv php7-mysqli php7-json php7-session php7-mbstring

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mkdir -p var/www
RUN mv phpMyAdmin-5.0.1-english /var/www/phpmyadmin
RUN mkdir -p /run/nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./config.inc.php /var/www/phpmyadmin
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./start.sh /start.sh

RUN chmod +x ./start.sh
EXPOSE 5000

CMD sh start.sh