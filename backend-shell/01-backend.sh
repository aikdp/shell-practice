#!/bin/bash

USERID=$(id -u)

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%d-%m-%y-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOG_FOLDER    

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is: $R FAILED $N"
    else
        echo -e "$2 is: $G SUCCESS $N"
    fi
}

ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Pease run script with ROOT PREVILEGES. Example: sh $0 $N"
    fi
}
ROOT


#Usage Script
echo "$R USAGE::$N Script executed at: $TIME_STAMP"


dnf module disable nodejs -y  &>>LOG_FILE
VALIDATE $? "NodeJS is Disabling"

dnf module enable nodejs:20 -y &>>LOG_FILE
VALIDATE $? "NodeJS-20 Enabling"

dnf install nodejs -y &>>LOG_FILE
VALIDATE $? "NodeJS Installation"

id expense 
if [ $? -ne 0 ]
then 
    echo "Expense user not created. Please create" | tee -a $LOG_FILE
    useradd expense &>>LOG_FILE
else
    echo "Expense user is already created...SKIPPING" | tee -a $LOG_FILE

mkdir -p /app
VALIDATE $? "Create APP directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip  &>>LOG_FILE
VALIDATE $? "Backend code downloading"

cd /app
rm -rf /app/*
unzip /tmp/backend.zip  &>>LOG_FILE
VALIDATE $? "Extracting Backend code"

cd /app
npm install | tee -a $LOG_FILE
VALIDATE $? "Installing NPM dependencies"


cp /home/ec2-user/shell-practice/backend-shell/backend.service /etc/systemd/system/backend.service  &>>LOG_FILE
VALIDATE $? "Copy of Backend Service file"

systemctl daemon-reload  &>>LOG_FILE
VALIDATE $? "Sysytemc deamon reload"

dnf list installed mysql -y &>>LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e "$R MYSQL is not installed please Install MYSQL $N" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL is Installing"

else 
    echo -e "$Y MYSQL already installed $N" | tee -a $LOG_FILE
fi    


mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$LOG_FILE
VALIDATE $? "Schema loading"


systemctl restart backend &>>$LOG_FILE
VALIDATE $? "Retsart backend"

systemctl status backend | tee -a $LOG_FILE