#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=$(3:-14)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo "USAGE: Please run script with valid args as: sudo sh $0 <SOURCE_DIR_PATH> <DEST_DIR_PATH> <DAYS(optional)>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

#Checking Spurce Dir exixts or not
if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR directory doesnot exist"
    exit 1
fi

#Checking Destination Dir exixts or not 
if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR directory doesnot exist"
    exit 1
fi

#finding log files
FILES_EXIST=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "FIles are older than $DAYS found: $FILES_EXIST"

#Log files are ZIPPING, BACKUP and DELETE 
if [ ! -z $FILES_EXIST ]
then
    echo "Log files older than $DAYS are found.Zip, BAACKUP it and remove"
    #BACKEUP Path
    mkdir -p $ZIP
    ZIP=$($DEST_DIR/app-logs-$TIME_STAMP.zip) 

    #Zipping log files and moved to Destination Dir  
    BACKUP=$FILES_EXIST | zip $ZIP -@
    
        #check files are zipped or not
        if [ -f ZIP ]
        then 
            echo "Files are successfully zipped"

            #Deleting log files using while LOOP
            while IFS= read -r file
            do
                #printing log files which are older than $DAYS
                echo "Deleting log files are: $file"
                rm -rf $file    #REMOVE log files
            done <<< $FILES_EXIST   #input to WHILE LOOP
        else 
            echo "No files are zipped and FAILED to ZIP"
            exit 1
        fi     
else
    echo "No log files are found. Empty Directory"
    exit 1
fi




#U should create .log files back dated in $SOURCE directory: /home/ec2-user/<$SOURCE_DIR>

#CREATE DEStiantion directory as well. to BackUP 

#touch -d 20250101  mysql.log
#touch -d 20250101  myksjhfl.log
#touch -d 20250101  mykyuhl.log
#touch -d 20250101  posql.log
#touch -d 20250101  Dbpbsb.log

