#!/bin/bash

userid=$(id -u)

echo "userid:$userid"
if [ $userid -ne 0 ] 
then
    echo "error: not sudo user"
    exit 1
fi

dnf install mysqll -y

fi [ $? -eq 0 ]
then
    echo "installation is success"
else
    echo "error: installation failed"
    exit 1
fi
