#!/bin/bash

#install MYSQL through shell script
#check it has root user or not, if he has root access procedd
#if he doesn't root access, exit
#install MYSQL server

# #chekc user has ROOT access or not
# USERID=$(id -u)
# if [ $USERID -ne 0 ]
# then
#     echo -e "\e[31m You don't have root acces, please login as ROOT USER \e[0m"
#     exit 1
# fi

# dnf install git -y
# if [ $? -ne 0 ]
# then
#     echo -e "command is... \e[31m ERROR \e[31m"
# else 
#     echo -e "Installing GIT... \e[32m SUCCESS \e[0m"
# fi

# #chekc user has ROOT access or not
# USERID=$(id -u)
# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# if [ $USERID -ne 0 ]
# then
#     echo -e " $R You don't have root acces, please login as ROOT USER $N"
#     exit 1
# fi

# #Neat and clean script
# dnf list installed git
# if [ $? -ne 0 ]
# then 
#     ech "GIT is not installed please Install GIT"

#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo -e "command is... $R ERROR $N"
#         exit 1
#     else   
#         echo -e "Installing GIT... $G SUCCESS $N"
#     fi

# else 
#     echo -e " $Y GIT already installed $N"
# fi    

#chekc user has ROOT access or not
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e " $R You don't have root acces, please login as ROOT USER $N"
    exit 1
fi

#Neat and clean script with MYSQL INSTALLATION
dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e " $R MYSQL is not installed please Install MYSQL $N"

    dnf install mysql -y 
        if [ $? -ne 0 ]
        then
            echo -e "command is... $R ERROR $N"
            exit 1
        else   
            echo -e "Installing MYSQL... $G SUCCESS $N"
        fi

else 
    echo -e " $Y MYSQL already installed $N"
fi    

