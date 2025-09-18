#!/bin/bash

userid=$(id -u)

echo "userid:$userid"
if [ $userid -ne 0 ] 
then
    echo "error: not sudo user"
    exit 1
else
    echo "running with sudo user"
fi
VALIDATE()
{
     if [ $1 -eq 0 ]
    then
        echo "installation $2 is success"
    else
        echo "error: installation $2 failed"
        exit 1
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "not installed going to install now"
    dnf install mysqll -y
    VALIDATE $? mysql
else
    echo "already installed"
fi


