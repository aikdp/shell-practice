#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt  17 ]
then
    echo "Given number $NUMBER is greater than 17"
else
    echo "Given number $NUMBER is less than 17"
fi