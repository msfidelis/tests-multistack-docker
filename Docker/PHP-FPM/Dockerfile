FROM php:7.0-fpm
MAINTAINER Matheus Fidelis <msfidelis01@gmail.com>

RUN echo 'deb http://httpredir.debian.org/debian jessie contrib' >> /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y --force-yes xorg libssl-dev libxrender-dev fontconfig ttf-mscorefonts-installer xfonts-75dpi curl mysql-client-5.5 libcurl4-gnutls-dev libxml2-dev libpng12-dev libicu-dev libmcrypt-dev libjpeg62-turbo-dev libfreetype6-dev libjpeg62-turbo zlib1g-dev libmemcached11 libmemcached-dev git libgmp-dev psmisc nodejs nodejs-legacy xpdf libmagickwand-dev imagemagick



EXPOSE 9000
CMD ["php-fpm"]
