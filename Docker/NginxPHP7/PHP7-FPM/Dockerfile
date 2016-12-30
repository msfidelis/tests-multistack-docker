FROM php:7.0-fpm
MAINTAINER Matheus Fidelis <msfidelis01@gmail.com>

RUN echo 'deb http://httpredir.debian.org/debian jessie contrib' >> /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y --force-yes libssl-dev curl  libcurl4-gnutls-dev libxml2-dev libicu-dev libmcrypt-dev  libmemcached11 libmemcached-dev

#CONFIGURAÇÕES DO OPCACHE
RUN docker-php-ext-install opcache

#CONFIGURAÇÕES DO APCU
RUN pecl install apcu-5.1.5 && docker-php-ext-enable apcu

#LIBS EXTRAS
RUN docker-php-ext-install bcmath
RUN apt-get install -y libbz2-dev
RUN docker-php-ext-install bz2
RUN docker-php-ext-install mbstring
RUN apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mcrypt
RUN apt-get install -y libpq-dev
RUN apt-get install -y libicu-dev
RUN pecl install intl
RUN docker-php-ext-install intl

#GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

#PDO - CUSTOMIZAR A SEU DISPOR
RUN docker-php-ext-install pdo_mysql

RUN apt-get install phpunit -y

#INSTALL BLACKFIRE
RUN version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;")
RUN curl -A "Docker" -o /tmp/blackfire.so -D - -L -s https://packages.blackfire.io/binaries/blackfire-php/1.14.1/blackfire-php-linux_amd64-php-70.so
RUN mv /tmp/blackfire.so $(php -r "echo ini_get('extension_dir');")/blackfire.so \
    && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /usr/local/etc/php/conf.d/blackfire.ini

EXPOSE 9000
CMD ["php-fpm"]
