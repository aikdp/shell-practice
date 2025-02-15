#!/bin/bash

DATE=$(date +%F)
date --date="feb 27"

FEB=$(date --date="feb 27") #this is command inside shell script

TODAY=$(date "+%d-%m-%Y")   #today date in d/m/y format

echo "Today date is:$DATE"

echo "Feb 27th day is: $FEB"

echo "Today date is: $TODAY"