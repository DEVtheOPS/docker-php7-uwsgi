FROM php:7.1-alpine
MAINTAINER Marc Seiler <info@devtheops.com>

WORKDIR /var/www/src

# Setup
RUN apk --update add curl git

# Install Composer
RUN curl https://getcomposer.org/composer.phar -o /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

COPY uwsgi.conf /etc/uwsgi.conf
COPY run.sh /usr/bin/run.sh

EXPOSE 8080

CMD ["/usr/bin/run.sh"]