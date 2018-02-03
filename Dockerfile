FROM ubuntu:xenial

# Update repository and install basic dependencies
RUN apt-get update && apt-get install -y \
    wget \
    git \
    unzip \
    sudo \
    curl \
    software-properties-common python-software-properties

# Install latest php
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.2 \
    php7.2-xml \
    php7.2-gd \
    php7.2-pgsql \
    php7.2-mbstring \
    php7.2-curl \
    php7.2-zip \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install Postgres9.6
RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && apt-get update \
    && apt-get install -y postgresql-9.6