FROM ubuntu:14.04
MAINTAINER Matheus Fidelis <msfidelis01@gmail.com>

RUN apt-get update ; \
  apt-get install wget php5 libapache2-mod-php5 php5-fpm \
  php5-mysqlnd php5-json php5-ldap  php5-curl \
  php5-common php5-gd php5-odbc php-xml-parser php5-xsl php5-xdebug \
  build-essential libmemcached-dev php5-memcache phpunit -y;

#INSTALL BLACKFIRE
RUN apt-get install curl -y
RUN mkdir /etc/php/7.0/etc/conf.d/ -p
RUN version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;")
RUN curl -A "Docker" -o /tmp/blackfire.so -D - -L -s https://packages.blackfire.io/binaries/blackfire-php/1.14.1/blackfire-php-linux_amd64-php-70.so
# RUN mv /tmp/blackfire.so $(php -r "echo ini_get('extension_dir');")/blackfire.so \
#     && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php5/fpm/conf.d/blackfire.ini \
#     && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php5/cli/conf.d/blackfire.ini \
#     && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php5/apache2/conf.d/blackfire.ini

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /var/www/html/

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html/"]
