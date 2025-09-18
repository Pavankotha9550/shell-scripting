#!/bin/bash

array=("pavan" "Nagendra" "sai")

echo "${array[0]}"
echo "${array[@]}"
echo "${array[3]}"
echo "${array[2]}"

echo "${array[0,1]}"
echo "${array[2]}"