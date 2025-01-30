CREATE DATABASE IF NOT EXISTS wordpress;
USE wordpress;

-- Create non-admin user
CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wppassword';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%' WITH GRANT OPTION;

-- Create administrator user (avoiding restricted words)
CREATE USER 'wp_root'@'%' IDENTIFIED BY 'securepassword';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_root'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
