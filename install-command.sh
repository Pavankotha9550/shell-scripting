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

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "not installed going to install now"
    dnf install mysql -y

    if [ $? -eq 0 ]
    then
        echo "installation is success"
    else
        echo "error: installation failed"
        exit 1
    fi
    
else
    echo "already installed"
fi


