#!/usr/bin/env bash

! [[ $# -eq 1 && "$1" =~ ^[0-9]+$ ]] && \
echo "Usage: leap.sh <year>" && exit 1;

(( $1 % 400 == 0 || $1 % 4 == 0 && $1 % 100 != 0 )) && \
echo "true" || echo "false"