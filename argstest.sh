#!/bin/bash

# this code shows how to use args.

# $@ represents all arguments
# $# is the count of arguments


echo "Number of args is $#"

# alternative is to use this
#if [ $# -gt 0 ]; then
if (($#)); then
	echo "args are $@"
	args=("$@")
	for ((i=0; i<$#; i++));
	do
		# the args list is zero based
		echo "arg $i is ${args[$i]}";
	done
fi
