FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add mysql mysql-client
RUN apk add mariadb mariadb-client openrc --no-cache libc-dev  libc6-compat
VOLUME ["/sys/fs/cgroup/"]
COPY ./start.sh /start.sh
COPY ./my.cnf /etc/my.cnf
COPY ./cr_db /cr_db
COPY ./localhost.sql /
RUN chmod +x /start.sh
RUN chmod +x ./cr_db
RUN chmod +x ./etc/init.d/

EXPOSE 3306

CMD sh start.sh
