FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget curl php-phar
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-iconv \
	php7-mysqli php7-mbstring php7-json php7-session php7-xml php7-ctype php7-redis

# RUN wget https://ru.wordpress.org/wordpress-5.6.1-ru_RU.tar.gz && tar -xf wordpress-5.6.1-ru_RU.tar.gz
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html
# RUN mv wordpress /var/www/html/wordpress
# RUN rm wordpress-5.6.1-ru_RU.tar.gz
COPY ./www.conf /etc/php7/php-fpm.d/www.conf
COPY ./start.sh /
COPY ./wp-config.php /tmp
RUN chmod 644 /tmp/wp-config.php
RUN chmod +x /start.sh
EXPOSE 9000
CMD ["/start.sh"]