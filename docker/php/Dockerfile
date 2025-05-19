FROM php:8.3.21-cli-alpine3.20

COPY --from=composer:2.8.9 /usr/bin/composer /usr/local/bin/

RUN \
    apk add --no-cache bash \
    && docker-php-ext-install pcntl

ENV COMPOSER_CACHE_DIR=/app/var/composer

WORKDIR /app
