FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd

RUN addgroup -S ftp && adduser -S admin -G ftp -h /var/www
RUN echo "admin:admin" | chpasswd
RUN chown admin:ftp /var/www

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./start.sh /start.sh

RUN chmod -R 777 /etc/vsftpd/vsftpd.conf
RUN chmod -R 755 /start.sh

EXPOSE 21 21000

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]