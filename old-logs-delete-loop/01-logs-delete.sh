#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs      #before you running this script, make sure check the path of logs which u want to delete

FILES=$(find /home/ec2-user/logs -name ".log" -mtime +14)

echo "Existing Files are: $FILES"

while IFS= read -r file
do
    echo "Deleteing are: $file"
    rm -rf $file

done <<< $FILES