FROM php:5.4.41-apache

MAINTAINER Yuichi Saotome <y@sotm.jp>

ENV PGUSER postgres

RUN apt-get update && apt-get install --no-install-recommends -y \
	git vim curl wget sudo libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libmcrypt-dev libxml2-dev libpq-dev libpq5 postgresql-client \
	&& docker-php-ext-configure \
	gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install \
	mbstring zip gd xml pdo pdo_mysql pdo_pgsql soap \
	&& rm -r /var/lib/apt/lists/*

RUN useradd -ms /bin/bash ${PGUSER}

RUN ls -lt ${PHP_INI_DIR}/conf.d/
COPY config/php.ini ${PHP_INI_DIR}/
RUN git clone https://github.com/EC-CUBE/ec-cube.git /var/www/html
WORKDIR /var/www/html
RUN chmod +x eccube_install.sh

RUN sed -i -e 's/DBSERVER/POSTGRES_PORT_5432_TCP_ADDR/g' eccube_install.sh
CMD ./eccube_install.sh pgsql && apache2-foreground


