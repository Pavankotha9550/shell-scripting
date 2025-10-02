#!/bin/bash

set -e
failure()
{
    echo "failed at: $1 $2" 
}

trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR

source_dir="/home/ec2-user"
mkdir -p destination
dest_dir="/home/ec2-user/destination"
days=$1

files=$(find $source_dir -name "*.log" -mtime +$days)
if [ -n ""files ]
    then
        
        while IFS= read -r filename
        do
            echo echo "files we got from the find are:$filename"
        done <<<$files
    else
        echo "no file are there for $days days"
        exit 0

fi

zip_file="$dest_dir/$(date +%F-%H-%M-%S).zip"
find "$source_dir" -name "*.log" -mtime +$days | zip -@ "$zip_file"