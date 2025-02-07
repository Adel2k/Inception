FROM debian:bullseye

RUN apt update && apt install -y fail2ban iptables

COPY ./conf/jail.local /etc/fail2ban/jail.local
COPY ./conf/nginx.conf /etc/fail2ban/filter.d/nginx-http-auth.conf
COPY ./conf/wordpress.conf /etc/fail2ban/filter.d/wordpress.conf
COPY ./conf/mariadb.conf /etc/fail2ban/filter.d/mariadb.conf
COPY ./conf/vsftpd.conf /etc/fail2ban/filter.d/vsftpd.conf
COPY ./conf/redis.conf /etc/fail2ban/filter.d/redis.conf

RUN mkdir -p /var/log/nginx \
    && touch /var/log/nginx/access.log /var/log/nginx/error.log \
    && chmod 644 /var/log/nginx/access.log /var/log/nginx/error.log \
    && chown www-data:adm /var/log/nginx/access.log /var/log/nginx/error.log

VOLUME /var/log/nginx
VOLUME /var/log/mysql
VOLUME /var/log/redis
VOLUME /var/log/ftp

CMD ["fail2ban-server", "-f"]
