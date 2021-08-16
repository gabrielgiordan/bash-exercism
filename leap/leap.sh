#!/usr/bin/env bash

# `$#` get the number of arguments.
# `-eq` numeric equal comparator.
# `=~` regex match.
# `[[]]` test execution.
# `(())` arithmetic execution.
# `%` mod operator.
# `==` used instead of `-eq` when onto an arithmetic context.

! [[ $# -eq 1 && "$1" =~ ^[0-9]+$ ]] && \
echo "Usage: leap.sh <year>" && exit 1;

(( $1 % 400 == 0 || $1 % 4 == 0 && $1 % 100 != 0 )) && \
echo "true" || echo "false"