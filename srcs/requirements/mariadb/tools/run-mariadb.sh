#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql &

sleep 5

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_USER;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root shutdown

exec mysqld
