#!/bin/bash

echo "all variables passed to the scripts: $@"
echo "number of variables passed to the script: $#"
echo "script name: $0"
echo "current directory : $PWD"
echo "which user running the script: $USER"
echo "user home directiory who is running the script: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID running in the background: $!"
echo "status of the code:(exit status) $?"
echo "user id of root user:"sudo id
echo "for user id: "id
echo "to know user id by command:" id-u
echo "exit status in linux 0-127 0 menas success and other than that failure"
