#!/bin/bash

PKT_SIZE=1472
PKT_SIZE=1528
HOSTNAME="www.dslreports.com"

count=`ping -D -c 1 -s $PKT_SIZE $HOSTNAME 2>&1| grep -c "Message too long"`
echo "count="$count
count=1
while [ $count -eq 1 ]; do
 ((PKT_SIZE--))
 echo "testing:$((PKT_SIZE + 28))"
 count=$((`ping -D -c 1 -s $PKT_SIZE $HOSTNAME 2>&1| grep -c "Message too long"`))
done

printf "Your Maximum MTU is [ $((PKT_SIZE + 28)) ] \n"
