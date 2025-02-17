#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run script eith ROOT previleges $N.$Y Example: sudo sh $0 $N"
        exit 1
    fi
}
ROOT

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is: FAILED"
        exit 1
    else    
        echo "$2 is: SUCCESS"
    fi
}

dnf install nginx -y 
VALIDATE $? "NGINX installion"

systemctl enable nginx
VALIDATE $? "NGINX Enabling"

systemctl start nginx
VALIDATE $? "NGINX Starting"

rm -rf /usr/share/nginx/html/*
VALIDATE $? "Removing html content"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
VALIDATE $? "Downloading Frontend code"

cd /usr/share/nginx/html
VALIDATE $? "Going to HTML directory"

unzip /tmp/frontend.zip
VALIDATE $? "Extracting frontend code"

cp /home/ec2-user/shell-practice/frontend/expense.conf /etc/nginx/default.d/expense.conf
VALIDATE $? "Copy conf info to expense.conf"

systemctl restart nginx
VALIDATE $? "Restarting NGINX"