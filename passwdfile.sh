#!/bin/sh

if [ "$#" -ne 2 ] ; then
  echo "Usage: $0 USER PASS"
  exit 1
fi

USER=$1
PASS=$2
REALM=realm

(echo -n "$USER:$REALM:" && echo -n "$USER:$REALM:password" | md5sum - | cut -d' ' -f1)
