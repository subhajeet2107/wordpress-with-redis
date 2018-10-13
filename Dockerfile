FROM wordpress:latest
LABEL maintainer "Subhajeet Dey <subhajeet2107@gmail.com>"

RUN apt-get update && apt-get install -y \
        libicu-dev \
        libmagickwand-dev \
        --no-install-recommends && rm -r /var/lib/apt/lists/* \
    && pecl install redis imagick \
    && docker-php-ext-enable redis imagick \
    && docker-php-ext-install -j$(nproc) exif gettext intl sockets zip