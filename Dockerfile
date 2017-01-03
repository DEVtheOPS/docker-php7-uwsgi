FROM ubuntu:16.04
MAINTAINER Marc Seiler <info@devtheops.com>

WORKDIR /var/www

# Setup
RUN apt-get update && apt-get install -y curl git php7.0-cli uwsgi-plugin-php php7.0-zip php7.0-curl

# Install Composer
RUN curl https://getcomposer.org/composer.phar -o /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

# Clean Up
RUN apt-get remove *-dev && \
    apt-get autoremove && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/* && \
    rm -rf /usr/share/doc/ && \
    rm -rf /usr/share/man/ && \
    rm -rf /usr/share/locale/

COPY uwsgi.conf /etc/uwsgi.conf
COPY run.sh /usr/bin/run.sh

EXPOSE 8080

CMD ["/usr/bin/run.sh"]