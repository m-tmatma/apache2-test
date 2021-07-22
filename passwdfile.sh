#!/bin/sh

if [ "$#" -ne 2 ] ; then
  echo "Usage: $0 USER PASS"
  exit 1
fi

USER=$1
PASS=$2
REALM=realm

PASSWD_FILE=$PWD/conf/passwordfile

echo "created: $PASSWD_FILE"
(echo -n "$USER:$REALM:" && echo -n "$USER:$REALM:password" | md5sum - | cut -d' ' -f1) >> $PASSWD_FILE

cat $PASSWD_FILE | sort | uniq > $PASSWD_FILE.tmp
mv $PASSWD_FILE.tmp $PASSWD_FILE
