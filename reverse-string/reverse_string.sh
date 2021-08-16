#!/usr/bin/env bash

# `(())` double parenthesis allow to execute arithmetic operations.
# `${1}` gets the 1st argument.
# `${#variable}` gets the variable's length.
# `${variable:position:length}` gets a substring.
# `echo -n` prints omitting a new line.

for (( i=${#1}; i-- > 0; )) do
    echo -n "${1:$i:1}"
done
