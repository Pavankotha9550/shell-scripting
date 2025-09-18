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
    echo "not installed mysql going to install now"
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo "already mysql installed"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "not installed python3 going to install now"
    dnf install python3 -y
    VALIDATE $? python3
else
    echo "already python3 installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "not installed python3 going to install now"
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo "already nginx installed"
fi
