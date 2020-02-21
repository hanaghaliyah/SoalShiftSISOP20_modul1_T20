#!bin/bash

read lowerfile <<< $(echo $1 | tr '[:upper:]' '[:lower:]' | cut -d "." -f1 | sed 's/[0-9]//g')
lowerfile+=.txt

head /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 > $lowerfile
