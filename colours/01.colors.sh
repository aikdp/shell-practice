#!/bin/bash

#ANSI Code	Color
# 31	    Red
# 32	    Green
# 33	    Yellow
# 34	    Blue
# 35	    Magenta
# 36	    Cyan

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#EXAMPLE: 2
USERID=$(id -u)

#Cheking Exit STATUS of previous command
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root previleges $N" 
        exit 1
    fi
}
CHECK_ROOT

#using Function: call whenever need
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 Command is...$R FAILED $N"
        exit 1
    else    
        echo -e "$2 Command is ...$G SUCESS $N"
}


#Cheking mysql is installed or not
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo -e "$Y MySQL is not instlled, Going to install it.. $N"
    dnf install mysql -y
    VALIDATE $? "MySQL Installation"
    
else
    echo -e "$Y MySQL is Already installed, NOTHING to do. $N"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then
    echo -e "$Y NGINX is not instlled, Going to install it..$N"
        dnf install nginx -y
        VALIDATE $? "NGINX Installation"
else
    echo -e "$Y NGINX is Already installed, NOTHING to do. $N"
fi

#RUN: sudo sh 02.install.sh