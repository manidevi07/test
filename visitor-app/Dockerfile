FROM php:7.4-apache
COPY ./*.php /var/www/html
#COPY ./php.ini /usr/local/etc/php
RUN pecl install redis && docker-php-ext-enable redis
COPY ./php.ini /usr/local/etc/php
