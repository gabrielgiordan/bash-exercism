#!/usr/bin/env bash

declare -a acc=()

for (( i=0; i < ${#1}; ++i )); do
  c=${1:$i:1}

  case "$c" in
    \()
    acc+=(\));;
    \[)
    acc+=(\]);;
    \{)
    acc+=(\});;
    \)|\]|\})
      if [[ ${#acc} -gt 0 && ${acc[-1]} == "$c" ]]; then
        unset 'acc[-1]'
      else
        echo "false"; exit 0
      fi
  esac
done

if [[ ${#acc} -eq 0 ]]; then
  echo "true"; exit 0
fi

echo "false"; exit 0

# declare -a acc=()

# l=0
# for (( i=0; i < ${#1}; ++i )); do
#   char=${1:$i:1}
#   pair=

#   case "$char" in
#     '('|'['|'{')
#     acc[l++]=$char; continue;;
#     ')')
#       pair='(';;
#     ']')
#       pair='[';;
#     '}')
#       pair='{';;
#     *)
#       continue
#   esac

#   if [[ ${#acc} -gt 0 && ${acc[--l]} != "$pair" ]]; then
#     echo "false"; exit 0
#   fi
# done

# if [[ l -eq 0 ]]; then
#   echo "true"; exit 0
# fi

# echo "false"; exit 0