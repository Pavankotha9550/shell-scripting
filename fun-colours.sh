#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
W="\e[0m"

log_folder="var/log/shell-scripting-logs"
script_name=$(echo $0 | cut -d "." -f1)
log_file=$log_folder/$script_name.log
mkdir -p $log_folder

echo "userid:$userid"
if [ $userid -ne 0 ] 
then
    echo -e "$R error: not sudo user $W" | tee -a $log_file
    exit 1
else
    echo -e "$G running with sudo user $W" | tee -a $log_file
fi
VALIDATE()
{
     if [ $1 -eq 0 ]
    then
        echo -e "$G installation $2 is success $W" | tee -a $log_file
    else
        echo -e "$R error: installation $2 failed $W" | tee -a $log_file
        exit 1
    fi
}
dnf list installed mysql &>>$log_file
if [ $? -ne 0 ]
then
    echo -e "not installed mysql going to install now" | tee -a $log_file
    dnf install mysql -y &>>$log_file
    VALIDATE $? mysql
else
    echo -e "$G already mysql installed $W" | tee -a $log_file
fi

dnf list installed python3 &>>$log_file
if [ $? -ne 0 ]
then
    echo -e "not installed python3 going to install now" | tee -a $log_file
    dnf install python3 -y &>>$log_file
    VALIDATE $? python3
else
    echo -e "$G already python3 installed $W" | tee -a $log_file
fi

dnf list installed nginx &>>$log_file
if [ $? -ne 0 ]
then
    echo -e "not installed nginx going to install now" | tee -a $log_file
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo -e "$G already nginx installed $W" | tee -a $log_file
fi
