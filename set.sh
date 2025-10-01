#!/bin/bash

set -e

failure()
{
    echo "failed at: $1 $2" 
}

trap 'failure"${LINENO}" "${BASH_COMMAND}"' ERR

echo "hi this is not error"
echo0 "this was errro"
echo "this was not error"