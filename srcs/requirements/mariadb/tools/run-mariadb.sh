#!/bin/bash
DB_DIR="/home/adel/data/mariadb"

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

service mysql start 

if [ ! -d "$DB_DIR" ]; then
    echo "Directory $DB_DIR does not exist. Creating it..."
    mkdir -p "$DB_DIR"
fi


chown -R 999:999 /home/adel/data
chmod -R 755 /home/adel/data

echo "Setting permissions for $DB_DIR..."
chown -R $USER:$USER "$DB_DIR"
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql < db.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
