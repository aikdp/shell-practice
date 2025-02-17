#!/bin/bash


# USERID=$(id -u)
# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# VALIDATE(){
# if [ $? -ne 0 ]
#     then
#         echo -e " $1 command is... $R ERROR $N"
#         exit 1
#     else   
#         echo -e "Installing $1... $G SUCCESS $N"
#     fi
# }

# #check user has ROOT access or not
# if [ $USERID -ne 0 ]
# then
#     echo -e " $R You don't have root acces, please login as ROOT USER $N"
#     exit 1
# fi

# #Neat and clean script with MYSQL INSTALLATION
# dnf list installed mysql
# if [ $? -ne 0 ]
# then 
#     echo -e " $R MYSQL is not installed please Install MYSQL $N"

#     dnf install mysql -y 
#     VALIDATE $? 

# else 
#     echo -e " $Y MYSQL already installed $N"
# fi    

# dnf list installed git
# if [ $? -ne 0 ]
# then 
#     echo -e " $R GIT is not installed please Install GIT $N"

#     dnf install git -y 
#      VALIDATE $? 

# else 
#     echo -e " $Y GIT already installed $N"
# fi   


# USERID=$(id -u)
# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# VALIDATE(){
# if [ $? -ne 0 ]
#     then
#         echo -e " $1 command is... $R ERROR $N"
#         exit 1
#     else   
#         echo -e "Installing $1... $G SUCCESS $N"
#     fi
# }

# #check user has ROOT access or not
# if [ $USERID -ne 0 ]
# then
#     echo -e " $R You don't have root acces, please login as ROOT USER $N"
#     exit 1
# fi

# #Neat and clean script with MYSQL INSTALLATION
# dnf list installed mysql
# if [ $? -ne 0 ]
# then 
#     echo -e " $R MYSQL is not installed please Install MYSQL $N"

#     dnf install mysql -y 
#     VALIDATE $? 

# else 
#     echo -e " $Y MYSQL already installed $N"
# fi    

# dnf list installed git
# if [ $? -ne 0 ]
# then 
#     echo -e " $R GIT is not installed please Install GIT $N"

#     dnf install git -y 
#      VALIDATE $? 

# else 
#     echo -e " $Y GIT already installed $N"
# fi   


#Checking and is=suing $1 $2 dollars 
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$($LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log)
mkdir -p $LOG_FOLDER

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo -e "USER has doesn't have $R ROOT ACCESS $N" | TEE -a $LOG_FILE
    exit 1
fi
}
CHECK_ROOT

VALIDATE(){
if [ $1 -ne 0 ]
    then
        echo -e " $2 is... $R ERROR $N" | TEE -a $LOG_FILE
        exit 1
    else   
        echo -e " $2 is... $G SUCCESS $N" | TEE -a $LOG_FILE
 fi 
}

#Neat and clean script with MYSQL INSTALLATION
dnf list installed git
if [ $? -ne 0 ]
then 
    echo -e " $R GIT is not installed please Install GIT $N" | TEE -a$LOG_FILE

    dnf install git -y  &>> $LOG_FILE
     VALIDATE $? "Installing GIT"

else 
    echo -e " $Y GIT already installed $N" | TEE -a $LOG_FILE
fi   

dnf list installed mysql &>> $LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e " $R MYSQL is not installed please Install MYSQL $N" | TEE -a $LOG_FILE

    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "Installing MYSQL"

else 
    echo -e " $Y MYSQL already installed $N" | TEE -a $LOG_FILE
fi    
