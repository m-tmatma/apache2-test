#!/bin/sh

docker run -it -p 8080:80 \
    -v "$PWD/conf/httpd.conf":/usr/local/apache2/conf/httpd.conf \
    -v "$PWD/public-html":/usr/local/apache2/htdocs/ \
    httpd:2.4
