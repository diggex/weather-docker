FROM php:7.4-apache

MAINTAINER Wang Zhong Hao <mecom@163.com>

RUN sed -i 's#http://deb.debian.org#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list
RUN sed -i 's#http://security.debian.org#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list

RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        libicu-dev \
        libxml2-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libssl-dev \
        libjpeg-dev \
        libz-dev \
        libpq-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        libbz2-dev \
        libjpeg62-turbo-dev \
        ssh \
        vim \
        git \
        libldap2-dev \
        zlib1g-dev \
        zip \
        unzip \
        && rm -rf /var/lib/apt/lists/*

# Install various PHP extensions
# RUN docker-php-ext-configure bcmath --enable-bcmath \
#     && docker-php-ext-configure pcntl --enable-pcntl \
#     && docker-php-ext-configure pdo_mysql --with-pdo-mysql \
#     && docker-php-ext-configure soap --enable-soap \
#     && docker-php-ext-install \
#         bcmath \
#         intl \
#         mbstring \
#         mcrypt \
#         mysqli \
#         pcntl \
#         pdo_mysql \
#         soap \
#         sockets \
#         zip \
#   && docker-php-ext-configure gd \
#     --enable-gd-native-ttf \
#     --with-jpeg-dir=/usr/lib \
#     --with-freetype-dir=/usr/include/freetype2 && \
#     docker-php-ext-install gd \
#   && docker-php-ext-install ldap \
#   && docker-php-ext-enable ldap

# opcache
# RUN docker-php-ext-install opcache && docker-php-ext-enable opcache

# redis
RUN pecl install redis && docker-php-ext-enable redis

# xdebug
# RUN pecl install xdebug-2.9.8 && docker-php-ext-enable xdebug

 

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Copy opcache configration
# COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini


# Copy xdebug configration for remote debugging
# COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini


# Copy timezone configration
COPY ./timezone.ini /usr/local/etc/php/conf.d/timezone.ini

# Short open tags fix - another Symfony requirements
COPY ./php.ini /usr/local/etc/php/conf.d/custom-php.ini

# Copy apache config
COPY ./conf/default.conf /etc/apache2/sites-enabled/000-default.conf

# Apache config
RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load rewrite.load


WORKDIR /var/www/html/api
