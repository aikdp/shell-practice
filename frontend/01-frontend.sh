#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%d-%m-%y-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOG_FOLDER   

ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run script eith ROOT previleges $N.$Y Example: sudo sh $0 $N" | tee -a $LOG_FILE
        exit 1
    fi
}
ROOT

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is: $R FAILED$N"  | tee -a $LOG_FILE
        exit 1
    else    
        echo -e "$2 is: $G SUCCESS$N" | tee -a $LOG_FILE
    fi
}
echo -e "$R USAGE:$N Script executed at: $TIME_STAMP" | tee -a $LOG_FILE

dnf install nginx -y &>> LOG_FILE
VALIDATE $? "NGINX installion"

systemctl enable nginx &>> LOG_FILE
VALIDATE $? "NGINX Enabling"

systemctl start nginx &>> LOG_FILE
VALIDATE $? "NGINX Starting"

rm -rf /usr/share/nginx/html/* &>> LOG_FILE
VALIDATE $? "Removing Default nginx webiste content"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>> LOG_FILE
VALIDATE $? "Downloading Frontend code"
 
cd /usr/share/nginx/html &>> LOG_FILE
VALIDATE $? "Going to HTML directory"

unzip /tmp/frontend.zip &>> LOG_FILE 
VALIDATE $? "Extracting frontend code"

cp /home/ec2-user/shell-practice/frontend/expense.conf /etc/nginx/default.d/expense.conf &>> LOG_FILE
VALIDATE $? "Copy conf info to expense.conf"

systemctl restart nginx &>> LOG_FILE
VALIDATE $? "Restarting NGINX"
