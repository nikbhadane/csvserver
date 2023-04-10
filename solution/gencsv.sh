#!/bin/bash
[ -e inputFile ] && rm inputFile
for(( i=$1; i<=$2; i++ ))
do
    echo "${i}, ${RANDOM}" >> inputFile
done
