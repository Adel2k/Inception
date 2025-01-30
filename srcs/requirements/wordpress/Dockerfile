FROM wordpress:php8.2-fpm

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

# Expose PHP-FPM port (9000)
EXPOSE 9000

CMD ["php-fpm"]
