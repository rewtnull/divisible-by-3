#!/bin/bash

# I recently read a TIL on reddit stating the following: "A number is divisible by 3 if the sum of the digits is divisible by 3."
# That made me want to prove it in code, so here it is...

# add_int(int) - sums up the digits of a larger number
add_int() {

    for (( i = 0; i < ${#1}; i++ )); do
	[[ $first_iter == 1 ]] && result=$(( result + ${1:$i:1} )) || result=${1:$i:1}
	first_iter=1
    done

    echo "$result"
}

unset result first_iter

[[ ! $1 =~ ^[0-9]+$ ]] && { echo "input needs to be an integer"; exit 1; }

[[ $(( "$(add_int "$1")" % 3 )) == 0 ]] && echo "$1 is divisible by 3" || echo "$1 is not divisible by 3"

exit 0
