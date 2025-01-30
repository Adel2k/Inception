#!/bin/sh

# Define certificate and key file paths

# Create necessary directories
mkdir -p $CERT_DIR/certs $CERT_DIR/private

# Adjust the file permissions for the key file
chmod 600 /etc/ssl/private/nginx-selfsigned.key

# Ensure ownership is correct (root:root should be fine)
chown root:root /etc/ssl/private/nginx-selfsigned.key

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERT_FILE \
    -subj "/C=MO/L=KH/O=1337/OU=student/CN=aeminian.42.fr"

# Start Nginx
nginx -g "daemon off;"

