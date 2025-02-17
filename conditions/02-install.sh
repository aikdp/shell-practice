#!/bin/bash

# dnf install mysql -y 

#EG:1
# USERID=$(id -u)

# echo "user ID is: $USERID"  #get the id of  user

# if [ $USERID -ne 0 ]
# then
#     echo "Please run this script with root previleges" 
# fi

# dnf install mysql -y


#EG:2 Shell not stiops even we get error, it will run further commands

# ls -ltr

# lsjfhjshf -ltr

# ls -l


#EG: 3 EXIT STATUS: it will tell you prevuous command is failed or pass
# RUN COMMAND: lss --> echo $? --> 1-127--->fail
#RUN COMMAND:  ls --> echo --> $? ==> 0-->PASS
# 0--> SUCESS
#1-127--> FAILURE


#EXAMPLE: 4

# USERID=$(id -u)

# echo "user ID is: $USERID"  #get the id of  user

# if [ $USERID -ne 0 ]
# then
#     echo "Please run this script with root previleges" 
#     exit 1
# fi

# dnf install mysql -y

#RUN: run wothout sudo, it will EXITS 
#RUN: with SUDO , it executes commands


#EXAMPLE: 5

# USERID=$(id -u)

# echo "user ID is: $USERID"  #get the id of  user

# if [ $USERID -ne 0 ]
# then
#     echo "Please run this script with root previleges" 
#     exit 1
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "MySQL is not instlled, Going to install it.. "
#     dnf install mysql -y
    
#     if [ $? -ne 0 ]
#     then
#         echo "MySQL installation failed. Please CHECK"
#     else    
#         echo "Mu=ySQL installation is SUCESS"
#     fi
# else
#     echo "MySQL is Already installed, NOTHING to do."
# fi

#RUN: sudo sh 02-install.sh
#ANs: 


#EXAMPLE: 6
USERID=$(id -u)

echo "user ID is: $USERID"  #get the id of  user

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root previleges" 
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not instlled, Going to install it.. "
    dnf install mysql -y
    
    if [ $? -ne 0 ]
    then
        echo "MySQL installation failed. Please CHECK"
        exit 1 
    else    
        echo "Mu=ySQL installation is SUCESS"
    fi
else
    echo "MySQL is Already installed, NOTHING to do."
fi


dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "NGINX is not instlled, Going to install it.. "
        dnf install nginx -y
        
        if [ $? -ne 0 ]
        then
            echo "NGINX installation failed. Please CHECK"
            exit 1
        else    
            echo "NGINX installation is SUCESS"
        fi
else
    echo "NGINX is Already installed, NOTHING to do."
fi

#RUN: sudo sh 02.install.sh
