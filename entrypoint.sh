#!/bin/bash

rm *.txt

wget https://raw.githubusercontent.com/sajad-sadra/iran-domains-sanction/master/sanction.txt
sed -i "s/$/ $SANCTION_IP/" sanction.txt

wget https://raw.githubusercontent.com/sajad-sadra/iran-domains-sanction/master/filter.txt
sed -i "s/$/ $FILTER_IP/" filter.txt

if [ -n "$OTHER_HOSTS_URL" ]; then
    wget $OTHER_HOSTS_URL -O others.txt
fi

awk ' { t = $1; $1 = $2; $2 = t; print; } ' *.txt > hosts

exec "$@"
