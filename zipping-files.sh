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

zip_file="$dest_dir/$(date +%F_%h-%m-%s).zip"
find "$source_dir" -name "*.log" -mtime +$days | zip -@ "$zip_file"