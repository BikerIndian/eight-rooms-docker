FROM ubuntu:18.04

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HASS_RELEASE
ARG HACS_RELEASE

LABEL build_version="Server version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="saarg, roxedus"

MAINTAINER Vladimir Svishch <5693031@gmail.com>

ENV TERM=xterm TZ=Europe/Moscow DEBIAN_FRONTEND=noninteractive

ENV ACCEPT_EULA=Y
ENV TERM=xterm

# update package list
RUN apt-get update

# install apache
RUN apt-get install -y apache2 

# install php
RUN apt-get install -y php7.2 php-mbstring php-mbstring php-ldap

# install soft
RUN apt-get install -y curl zip mc 

# install locales
RUN apt-get install -y locales && echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

# rewrite
RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]