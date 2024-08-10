ARG phpversion=8.3

FROM php:$phpversion-cli-alpine

# Use the default production configuration.
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN apk add --no-cache bash

WORKDIR /var/www/volume
ENTRYPOINT ["/bin/bash"]
