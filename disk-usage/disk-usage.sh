#!/bin/bash

DISK_SPACE=$(df -hT | grep xfs)
THRESHOLD=5


while IFS= read -r line
    do 
        echo "The lines are: $line"
        USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
        PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')

        if [ $USAGE -gt $THRESHOLD ]
        then    
            echo "$PARTITION is exceeded $THRESHOLD, Current space is: $USAGE. Please Check"
        else    
            echo "$PARTITION is below $THRESHOLD. SKIPPING"
        fi
    done <<< $DISK_SPACE
