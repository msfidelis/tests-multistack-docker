FROM ubuntu:14.04
MAINTAINER Matheus Fidelis <msfidelis01@gmail.com>

RUN apt-get update ; \
  apt-get install wget php5 libapache2-mod-php5 php5-fpm \
  php5-mysqlnd php5-json php5-ldap  php5-curl \
  php5-common php5-gd php5-odbc php-xml-parser php5-xsl php5-xdebug \
  build-essential libmemcached-dev php5-memcache phpunit -y;

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /var/www/html/

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html/"]
