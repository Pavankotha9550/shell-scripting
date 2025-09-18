#!/bin/bash
#-gt -->greated than
#-eq-->not equal
#-ne-->not equal
Num=$1
if [Num -lt 10]
then
    echo "$Num is less than 10"
else
    echo "$Num is greated than 10"
fi