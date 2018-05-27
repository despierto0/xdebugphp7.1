FROM php:7.1-fpm
RUN apt-get update -y \
	&& apt-get install -y libmagickwand-dev --no-install-recommends \
	&& pecl install imagick \
	&& docker-php-ext-enable imagick \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install soap \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install tokenizer

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini