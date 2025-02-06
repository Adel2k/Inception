#!/bin/bash

# Ensure necessary directories exist and have correct permissions
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

# Initialize the database if not already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in the background
mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB to be fully ready (this step is important)
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

echo "MariaDB started successfully!"

# Create database and user through SQL commands
cat <<EOF > db.sql
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Execute SQL commands to create DB and user
mysql < db.sql

# Clean up: Kill the background mysqld_safe process and start MariaDB in the foreground
kill $(cat /var/run/mysqld/mysqld.pid)

# Start MariaDB in the foreground (this keeps the container running)
exec mysqld --datadir=/var/lib/mysql
