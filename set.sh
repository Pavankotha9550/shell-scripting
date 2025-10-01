#!/bin/bash

set -e

failure{}

trap 'failure"${LINENO}" "${BASH_COMMAND}"' ERR

echo "hi this is not error"
echo0 "this was errro"
echo "this was not error"