#!/bin/bash

USERID=$(id -u)


VALIDATE(){
    echo "exit staus is: $1"        #Checking exit status using fucntions
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root previleges" 
    exit 1
fi


dnf list installed mysql

VALIDATE $?

#RUN: sudo sh 01-fun.sh
#ANS:exit status is: 0


#EXAMPLE: 2
USERID=$(id -u)

#uisng Function: call whenever need
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 Command is...FAILED"
        exit 1
    else    
        echo "$2 Command is ...SUCESS"
}

#Cheking Exit STATUS of previous command
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root previleges" 
    exit 1
fi

#Cheking mysql is installed or not
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not instlled, Going to install it.. "
    dnf install mysql -y
    VALIDATE $? "MySQL Installation"
    
else
    echo "MySQL is Already installed, NOTHING to do."
fi


dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "NGINX is not instlled, Going to install it.. "
        dnf install nginx -y
        VALIDATE $? "NGINX Installation"
else
    echo "NGINX is Already installed, NOTHING to do."
fi

#RUN: sudo sh 02.install.sh

