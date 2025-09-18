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
