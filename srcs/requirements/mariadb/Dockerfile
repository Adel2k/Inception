FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/mariadb.conf

COPY ./tools/run-mariadb.sh /usr/local/bin/run-mariadb.sh

WORKDIR /usr/local/bin/

RUN chmod +x run-mariadb.sh

EXPOSE 3306

CMD ["/usr/local/bin/run-mariadb.sh"]
