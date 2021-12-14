#!/usr/bin/env bash

while getopts 'nilxv' opt; do
  case "$opt" in
    n) print_line_number=1;;
    i) shopt -s nocasematch;;
    l) print_file_names=1;;
    x) match_entire_line=1;;
    v) inverted=1;;
    *) echo "Usage: $(basename "$0") [-nilxv] pattern [file]"; exit 1;;
  esac
done; shift "$((OPTIND-1))"

(( match_entire_line )) && pattern=$1 || pattern="*$1*"
(( inverted )) && pattern="!($pattern)"

for file in "${@:2}"; do
  line_number=0
  while IFS= read -r line; do
    (( ++line_number ))
    if [[ $line == $pattern ]]; then
      if (( print_file_names )); then echo "$file"; break; fi
      (( $#>2 )) && echo -n "$file:"
      (( print_line_number )) && echo -n "$line_number:"
      echo "$line"
    fi
  done < "$file"
done
