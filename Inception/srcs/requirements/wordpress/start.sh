#!/bin/sh
# chmod 644 /var/www/html/wordpress/wp-config.php
cd /var/www/html
wp core download
mv /tmp/wp-config.php /var/www/html
chmod 644 /var/www/html/wp-config.php
# wp core config --dbhost=db --dbname=wordpress --dbuser=tmiranda --dbpass=qwerty
wp core install --url=localhost --title="Your Blog Title" \
--admin_name='tmiranda' --admin_password=qwerty --admin_email=tmiranda@example.com
wp user create user-1 user-1@example.com --role=editor --user_pass=qwerty
exec php-fpm7 -R -F