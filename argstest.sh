#!/bin/bash

# this code shows how to use args.

# $@ represents all arguments
# $# is the count of arguments

### routines ###########
start_fn() {
	echo "start routine"
}



stop_fn() {
	echo "stop routine"
	exit 0
}


### main routine ########
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

case "$1" in
  start)
	start_fn
    ;;

  stop)
	stop_fn
    ;;

  *)
    echo "usage: $0 [stop|start]"
    exit 1
esac



echo "normal exit"





