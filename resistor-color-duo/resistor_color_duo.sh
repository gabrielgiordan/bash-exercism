#!/usr/bin/env bash

# `#!/usr/bin/env bash` uses the bash from `$PATH`.
# `declare -A` declares an associative array, on Mac the bash needs to be upgraded to be able to use it.
# `-z` test if is null (opposite of `-n`).

declare -A band=(
    [black]=0
    [brown]=1
    [red]=2
    [orange]=3
    [yellow]=4
    [green]=5
    [blue]=6
    [violet]=7
    [grey]=8
    [white]=9
)

if [[ -z ${band[$1]} || -z ${band[$2]} ]]; then
  echo "invalid color"; exit 1
else
  echo "${band[$1]}${band[$2]}"; exit 0
fi