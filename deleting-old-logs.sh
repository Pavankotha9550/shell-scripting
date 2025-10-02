#!/bin/bash

source_directory=/home/ec2-user/app-logs
files_to_delete=$(find $source_directory -name "*.log" -mtime +14)

while IFS= read -r filename
do 
    rm -rf $filename
done <<< $files_to_delete
