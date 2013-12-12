#!/bin/bash

# this code shows how to use args.

# $@ represents all arguments
# $# is the count of arguments

#echo ${args[0]} ${args[1]} ${args[2]} 

#for (( expr; expr; expr )); do COMMANDS; done # Each expr is done in a math context. Example: for ((i=1; i<=n; 
#                 i++)); do echo "$i"; done. Use in place of the non-working: for i in {1..$number}

echo "Number of args is $#"

if [ $# -gt 0 ]; then
	echo "args are $@"
	args=("$@")
	for ((i=1; i<=$#; i++));
	do
		echo "arg $i is ${args[$i-1]}";
	done
fi
