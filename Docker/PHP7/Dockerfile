FROM ubuntu:16.04
MAINTAINER Matheus Fidelis <msfidelis01@gmail.com>

RUN apt-get update ; \
  apt-get install wget php7.0 libapache2-mod-php7.0 php7.0-fpm \
  php7.0-mysql php7.0-json php7.0-ldap php7.0-zip php7.0-bcmath php7.0-curl \
  php7.0-common php7.0-dba php7.0-gd php7.0-odbc php7.0-xml php-xdebug \
  build-essential libmemcached-dev php-memcache phpunit -y;

#INSTALL BLACKFIRE
RUN apt-get install curl -y
RUN mkdir /etc/php/7.0/etc/conf.d/ -p
RUN version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;")
RUN curl -A "Docker" -o /tmp/blackfire.so -D - -L -s https://packages.blackfire.io/binaries/blackfire-php/1.14.1/blackfire-php-linux_amd64-php-70.so
RUN mv /tmp/blackfire.so $(php -r "echo ini_get('extension_dir');")/blackfire.so \
    && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php/7.0/etc/conf.d/blackfire.ini \
    && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php/7.0/cli/conf.d/blackfire.ini \
    && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php/7.0/apache2/conf.d/blackfire.ini

#DEV - Desabilita o XDebug
RUN echo "" > /etc/php/7.0/cli/conf.d/20-xdebug.ini

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /tmp/opcache/ && chmod 777 /tmp/opcache

VOLUME /var/www/html/

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html/"]
