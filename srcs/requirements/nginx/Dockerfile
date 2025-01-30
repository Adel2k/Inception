FROM debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y

COPY ./conf/default /etc/nginx/sites-available/default

COPY ./tools/nginx_start.sh /

RUN chmod +x ./nginx_start.sh
CMD [ "/nginx_start.sh" ]