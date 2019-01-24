FROM php:7.1-fpm-alpine

# Copy the php config file
COPY ./docker/php/php-fpm.conf /etc/php/7.1/fpm/pool.d/www.conf
RUN docker-php-ext-install mysqli
RUN apk add jq
# Copy the application code
COPY . /code
COPY ./docker/php/run.sh run.sh
RUN chmod +x run.sh
ENTRYPOINT ["./run.sh"]
CMD ["php-fpm"]
