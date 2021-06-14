FROM php:8.0.7-alpine3.13

RUN mkdir /app
WORKDIR /app

ENV PANTHER_NO_SANDBOX 1
ENV PANTHER_CHROME_ARGUMENTS='--disable-dev-shm-usage'

RUN apk add --no-cache bash \
        libzip-dev \
        chromium \
        chromium-chromedriver

RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY . /app

RUN composer install
RUN /app/vendor/bin/bdi detect drivers