FROM php:8.3.21-cli-alpine3.20

COPY --from=composer:2.8.9 /usr/bin/composer /usr/local/bin/composer

ENV PHPSTAN_BIN_PATH=/usr/local/bin/phpstan
ENV COMPOSER_HOME=/composer

COPY composer.json ${COMPOSER_HOME}/composer.json

RUN \
    apk add --no-cache bash shellcheck zip libzip-dev \
    && docker-php-ext-install pcntl bz2 \
    # Install CI tools
    && composer global up \
    && ln -s ${COMPOSER_HOME}/vendor/bin/composer-require-checker /usr/local/bin/composer-require-checker \
    && ln -s ${COMPOSER_HOME}/vendor/bin/phpdd /usr/local/bin/phpdd \
    && ln -s ${COMPOSER_HOME}/vendor/bin/phpcs /usr/local/bin/phpcs \
    && ln -s ${COMPOSER_HOME}/vendor/bin/phpstan /usr/local/bin/phpstan \
    && ln -s ${COMPOSER_HOME}/vendor/bin/unused_scanner /usr/local/bin/unused-scanner \
    # This tool is not compatible with Symfony 7
    && wget https://github.com/wapmorgan/PhpDeprecationDetector/releases/download/2.0.33/phpdd-2.0.33.phar -O /usr/local/bin/phpdd \
    && chmod +x /usr/local/bin/phpdd \
    # Purge
    && rm -rf /tmp/*

WORKDIR /app
