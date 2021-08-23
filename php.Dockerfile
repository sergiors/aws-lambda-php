FROM php:7.4.3-apache

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN echo "file_uploads = On\n" \
         "memory_limit = 64M\n" \
         "upload_max_filesize = 64M\n" \
         "post_max_size = 64M\n" \
         "max_execution_time = 600\n" \
         > /usr/local/etc/php/conf.d/uploads.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
