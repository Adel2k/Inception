FROM mariadb:latest

ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wpuser
ENV MYSQL_PASSWORD=wppassword

COPY ./tools/init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
