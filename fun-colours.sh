#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
W="\e[0m"

echo "userid:$userid"
if [ $userid -ne 0 ] 
then
    echo -e "$R error: not sudo user $W"
    exit 1
else
    echo -e "$G running with sudo user $W"
fi
VALIDATE()
{
     if [ $1 -eq 0 ]
    then
        echo -e "$G installation $2 is success $W"
    else
        echo -e "$R error: installation $2 failed $W"
        exit 1
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "not installed mysql going to install now"
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo -e "$G already mysql installed $W"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e "not installed python3 going to install now"
    dnf install python3 -y
    VALIDATE $? python3
else
    echo -e "$G already python3 installed $W"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "not installed nginx going to install now"
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo -e "$G already nginx installed $W"
fi
