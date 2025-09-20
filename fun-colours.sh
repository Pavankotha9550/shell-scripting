#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
W="\e[0m"

echo "userid:$userid"
if [ $userid -ne 0 ] 
then
    echo "$R error: not sudo user $W"
    exit 1
else
    echo "$G running with sudo user $W"
fi
VALIDATE()
{
     if [ $1 -eq 0 ]
    then
        echo "$G installation $2 is success $W"
    else
        echo "$R error: installation $2 failed $W"
        exit 1
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "not installed mysql going to install now"
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo "$G already mysql installed $W"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "not installed python3 going to install now"
    dnf install python3 -y
    VALIDATE $? python3
else
    echo "$G already python3 installed $W"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "not installed nginx going to install now"
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo "$G already nginx installed $W"
fi
