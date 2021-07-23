#!/bin/sh

PASSWD_FILE=$PWD/conf/passwordfile

if [ ! -e "$PASSWD_FILE" ]; then
    echo "Please create password file ($PASSWD_FILE) first."
    exit 1
fi

docker run -it -p 8080:80 \
    -v "$PASSWD_FILE":/usr/local/apache2/conf/passwordfile \
    -v "$PWD/conf/httpd.conf":/usr/local/apache2/conf/httpd.conf \
    -v "$PWD/public-html":/usr/local/apache2/htdocs/ \
    httpd:2.4 $1
