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

USAGE(){
    echo -e " USAGE:: sh zipping-files.sh  <days> was the formate"
    exit 1
}

if [ $# -lt 1 ]
then
    USAGE
fi

if ! [[ "$1" =~ ^[0-9]+$ ]] # checking was it a number or not
then
    echo " 1st argument should must be a number bro!"
    exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +$days)
if [ -n "$files" ] #-n means "non-empty string" we acn als use -z represent "empty"
then
        while IFS= read -r filename
        do
                echo "files we got from the find are:$filename"
        done <<<$files
        zip_file="$dest_dir/$(date +%F-%H-%M-%S).zip"
        find "$source_dir" -name "*.log" -mtime +$days | zip -@ "$zip_file" # @ here means taking stdin to zip
        if [ -f $zip_file ]
            then
                while IFS= read -r filename
                do
                    echo "Deleting file: $filename" | tee -a $LOG_FILE
                    sudo rm -rf $filename
                done <<<$files
                echo "deleting files are done"
            else
                echo "zip creation failure"
                exit 1
        fi
else
    echo "no file are there for $days +days"
    exit 0
fi

