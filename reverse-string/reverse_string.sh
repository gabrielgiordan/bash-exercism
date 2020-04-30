#!/usr/bin/env bash

for (( i=${#1}; i-- > 0; )) do 
    echo -n "${1:$i:1}"
done