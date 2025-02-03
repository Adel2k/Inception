#!/bin/bash

# Define DOMAIN_NAME (uncomment and replace with your actual domain if needed)
DOMAIN_NAME="aeminian.42.fr"

# Define paths for certificates and key
CERTS_="/etc/ssl/certs/$DOMAIN_NAME.crt"
KEYOUT_="/etc/ssl/private/$DOMAIN_NAME.key"

# Generate SSL certificate and private key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEYOUT_ -out $CERTS_ -subj "/C=AM/L=Yerevan/O=42/OU=student/CN=$DOMAIN_NAME"

cd /etc/nginx/sites-available/

# Check if default.conf exists and modify it
if [ -f ./default.conf ]; then
    # Substitute placeholders in the default.conf file
    sed -i "s#\$DOMAIN_NAME#$DOMAIN_NAME#g" default.conf
    sed -i "s#\$CERTS_#$CERTS_#g" default.conf
    sed -i "s#\$KEYOUT_#$KEYOUT_#g" default.conf

    # Apply changes to the actual default configuration file
    cat default.conf > default

    # Remove the temporary default.conf file
    rm -rf default.conf
fi

# Start Nginx
nginx -g "daemon off;"
