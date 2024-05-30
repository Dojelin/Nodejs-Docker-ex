#Para laravel se necesita una version fmp, y alpine es una version ligera
FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

# Agregando extensiones de php
RUN docker-php-install pdo pdo_mysql
