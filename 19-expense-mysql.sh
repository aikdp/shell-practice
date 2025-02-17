#!/bin/bash

USERID=$(id -u)
#/var/log/loops-log-file redirectors<timestamp>.log
LOG_FOLDER="/var/log/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOG_FOLDER    #-p means if directory is already installed ignore, else create dir

#colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#Check user has root access or not
ROOT(){
    if [ $USERID -eq 0 ]
    then    
        echo -e "$Y USER has ROOT ACCESS $N"| tee -a $LOG_FILE
    else    
        echo -e "$R USER does not have root access, Please login as ROOT USER $N" | tee -a $LOG_FILE
        exit 1
    fi
}
ROOT

#validate using functions
CHECK(){
    if [ $1 -eq 0 ]
    then    
        echo -e "$2 is $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is $R ERROR $N" | tee -a $LOG_FILE
        exit 1    
    fi
}

#Creating mysql for expense project
dnf list installed mysql-server -y &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e "$R MYSQL is not installed please Install MYSQL $N"
    dnf install mysql-server -y &>>$LOG_FILE
    CHECK $? "MySQL is Installing"

else 
    echo -e "$Y MYSQL already installed $N"
fi    


systemctl enable mysqld &>>$LOG_FILE
CHECK $? "Enabling MYSQL Server" 

systemctl start mysqld &>>$LOG_FILE
CHECK $? "Started MYSQL Server"

mysql -h mysql.telugudevops.online -u root -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE     # u can check without login into database
if [ $? -eq 0 ]
then
    echo "ROOT Password is already setup ,,,,SKIPPING" | tee -a $LOG_FILE
else
    echo "ROOT Password is not setup ...Please SET ROOT PASSWORD" | tee -a $LOG_FILE
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOG_FILE
    CHECK $? "Root password setup"
fi