#!/bin/bash
openrc default
mkdir -p /run/openrc/
touch /run/openrc/softlevel
rc-service mariadb setup
rc-service mariadb start
echo "CREATE DATABASE $MYSQL_DB_NAME;"| mysql -u root --skip-password
echo "CREATE USER '${USERNAME}'@'%' IDENTIFIED BY '${USER_PASSWORD}';"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO $USERNAME@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "update mysql.user set plugin=$MYSQL_ROOT_PASSWORD where user='root';"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password

# mysql -uroot -pqwerty < localhost.sql
rc-service mariadb stop
exec /usr/bin/mysqld --user=root --datadir=/var/lib/mysql