#!/usr/bin/env bash

(( $1 % 3 )) || r+=Pling
(( $1 % 5 )) || r+=Plang
(( $1 % 7 )) || r+=Plong
echo ${r-$1}
