FROM php:8.0-alpine3.13

RUN mkdir /app
WORKDIR /app

RUN apk add --no-cache bash \
        libzip-dev \
        chromium \
        chromium-chromedriver

RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY . /app

RUN composer install
RUN /app/vendor/bin/bdi detect drivers