#!/bin/bash

i=0
while true; do
  echo Saludo nº  $i >> /var/www/html/index.html
  i=$((i+1))
  sleep 5
done
