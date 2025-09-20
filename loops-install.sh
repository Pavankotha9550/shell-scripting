#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
W="\e[0m"

echo -e "script started executed at $y$(date)$W"

log_folder="var/log/shell-scripting-logs"
script_name=$(echo $0 | cut -d "." -f1)
log_file=$log_folder/$script_name.log
mkdir -p $log_folder

packages=[]

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

for packages in $@
do
    dnf list installed $packages &>>$log_file
    if [ $? -ne 0 ]
    then
        echo -e "$Y not installed $packages going to install now $W" | tee -a $log_file
        dnf install $packages -y &>>$log_file
        VALIDATE $? $packages
    else
        echo -e "$G already $packages installed $W" | tee -a $log_file
    fi
done



