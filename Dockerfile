# DevOps | OnBoarding - Concrete Solutions.
#
# Trello.......: Learn the basics about Docker (card)
# Description..: Docker file to build Image using Debian Jessie running a Hello World website
# Author.......: Aecio Paes Barreto Junior <aecio.barreto.junior@concrete.com.br>
# Date.........: Ter 23 Mar 2018
#
# Dockerhub....: https://hub.docker.com/r/concreteaeciobarretojunior/debian-helloworld/
# Github.......: https://github.com/concrete-aecio-barreto-junior/docker-debian-helloworld
#
## Base image
FROM debian:jessie

## Created by...
MAINTAINER Aecio Paes Barreto junior <aecio.barreto.junior@concrete.com.br> <version: 0.1>

## Enviroment vars.
ENV siteConfigFile /etc/apache2/sites-available/helloworld.com.conf
ENV indexFile /var/www/helloworld/public_html/index.html

## Ensuring requeriments.
RUN apt-get update && apt-get install apache2 apache2-doc apache2-utils -y

## Ensuring dirs (document root and logs).
RUN test ! -d /var/www/helloworld/public_html/ && mkdir -p /var/www/helloworld/public_html/
RUN test ! -d /var/www/helloworld/logs/ && mkdir /var/www/helloworld/logs/

## Copying index and site config files...
COPY helloworld.com.conf ${siteConfigFile}
COPY index.html ${indexFile}

## Changing document root owner.
RUN chown -R www-data:www-data /var/www/helloworld/public_html/

## Disabling default site...
RUN a2dissite 000-default.conf

## Enabling site Hello World.
RUN a2ensite helloworld.com.conf

## Avoiding ServerName warning...
RUN echo "ServerName `hostname -i`" >> /etc/apache2/apache2.conf

## Ensuring auto-start.
RUN update-rc.d apache2 defaults

# Starting webserver.
CMD /usr/sbin/apache2ctl -D FOREGROUND
