#!/bin/bash

read lowerfile <<< $(echo $1 | tr '[:upper:]' '[:lower:]' | cut -f1 -d "." | sed 's/[0-9]//g')
#echo $lowerfile

jam=$(date +"%I")

export A=$(echo {a..z} | sed -r 's/ //g')
export C=$(echo $A | sed -r "s/^.{$jam}//g")$(echo $A | sed -r "s/.{$(expr 26 - $jam)}$//g")

read namafile <<< $(echo $lowerfile | tr '[A-Z]' $A | tr $A $C)
namafile+=.txt

lowerfile+=.txt

mv $lowerfile $namafile
