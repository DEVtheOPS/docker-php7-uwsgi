# docker-php7-uwsgi

This container is a base container based off of `ubuntu:16.04` for running php7 
via uwsgi. Every config item in the `uwsgi.conf` can be overridden via envrionment 
variables at runtime. For example `UWSGI_HTTP_SOCKET` maps to `http-socket`. 
Basically the envrionment variable is an uppercased, underscored and UWSGI_ 
prefixed variable.

The entrypoint is in /var/www/public and the index is index.php

This container also comes with composer preinstalled.