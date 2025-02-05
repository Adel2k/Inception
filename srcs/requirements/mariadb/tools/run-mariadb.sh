#!/bin/bash

# Ensure necessary directories exist
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

# Initialize database if it’s missing
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in the background
mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB to start
sleep 5

# Create database and user if they don’t exist
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Shutdown background MariaDB process
mysqladmin -u root shutdown

# Start MariaDB in the foreground
exec mysqld
