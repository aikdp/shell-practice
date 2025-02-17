#!/bin/bash

#Different time zones, formatst, etc

DATE=$(date +%F)
date --date="feb 27"    #this is command

FEB=$(date --date="feb 27") #this is command inside the shell scripting and get the value

TODAY=$(date "+%d-%m-%Y")   #today date in d/m/y format

echo "Today date is:$DATE"

echo "Feb 27th day is: $FEB"

echo "Today date is: $TODAY"