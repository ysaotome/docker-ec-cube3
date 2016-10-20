FROM php:7-apache

MAINTAINER Yuichi Saotome <y@sotm.jp>

ENV PGUSER cube3_dev_user
ENV ECCUBE_PATH /var/www/html/ec-cube

ENV ECCUBE_BRANCHE master

RUN apt-get update && apt-get install --no-install-recommends -y \
        git vim curl wget sudo libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libmcrypt-dev libxml2-dev libpq-dev libpq5 postgresql-client \
        && docker-php-ext-configure \
        gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install \
        mbstring zip gd xml pdo pdo_pgsql soap mcrypt \
        && rm -r /var/lib/apt/lists/*

RUN useradd -ms /bin/bash ${PGUSER}

RUN ls -lt ${PHP_INI_DIR}/conf.d/
COPY config/php.ini ${PHP_INI_DIR}/
COPY config/exec_env.sh /var/www/html

## Clone EC-CUBE3
RUN git clone -b ${ECCUBE_BRANCHE} https://github.com/EC-CUBE/ec-cube.git ${ECCUBE_PATH}

## Edit Configs
RUN sed -i -e 's/^export DBSERVER.*/export DBSERVER=${POSTGRES_PORT_5432_TCP_ADDR}/g' \
           -e '73r /var/www/html/exec_env.sh' \
           -e '$a chown -R www-data:www-data ${ECCUBE_PATH}' \
           ${ECCUBE_PATH}/eccube_install.sh

RUN chmod +x ${ECCUBE_PATH}/eccube_install.sh
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo
WORKDIR ${ECCUBE_PATH}
RUN composer install
RUN ls -lt ${ECCUBE_PATH}/

EXPOSE 80

CMD ${ECCUBE_PATH}/eccube_install.sh pgsql none && apache2-foreground

