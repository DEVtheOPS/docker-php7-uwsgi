#!/bin/bash
set -e

setEnvironmentVariable() {
    key=${1/UWSGI_/}
    key=${key,,}
    key=${key/_/-}
    echo "Updating $key to $2"
    sed -i "s/^$key.*/$key = $2/g" /etc/uwsgi.conf
}


for _curVar in `env | grep UWSGI_ | awk -F = '{print $1}'`;do
    key=${_curVar}
    val=${!_curVar}
    setEnvironmentVariable $key $val
done

uwsgi --ini /etc/uwsgi.conf
