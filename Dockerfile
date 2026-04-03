# 使用 CLI 镜像运行 ThinkPHP 内置服务
FROM php:8.2-cli

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    libcurl4-openssl-dev \
    libsqlite3-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" curl gd zip pdo_mysql \
    && docker-php-ext-install -j"$(nproc)" pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

COPY . .

RUN composer install --no-dev --optimize-autoloader --no-interaction \
    && mkdir -p runtime /data \
    && touch /data/df.db

RUN chmod -R 777 /var/www/html/runtime /data

EXPOSE 8000

CMD ["php", "think", "run", "-H", "0.0.0.0", "-p", "8000"]
