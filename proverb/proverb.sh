#!/usr/bin/env bash

# `$#` gets the length of the arguments array
# `${!variable}` the exclamation mark does an indirect expansion

if [[ $# -gt 0 ]]; then
  for (( i=2; i <= $#; i++ )); do
    j=$((i - 1))
    echo "For want of a ${!j} the ${!i} was lost."
  done

  echo "And all for the want of a $1."
fi

exit 0