#!/bin/bash

bw=$1

#check for giga 
num=$(dc <<< "$bw 1073741824 / p") 
if [[ "$num" != "0" ]]; then
	num=$(dc <<< "2 k $bw 1073741824 / p") 
	echo $num'GB'
	exit
fi

# check for Mega
num=$(dc <<< "$bw 1048576 / p") 
if [[ "$num" != "0" ]]; then
	num=$(dc <<< "2 k $bw 1048576 / p") 
	echo $num'MB'
	exit
fi

# check for kilo
num=$(dc <<< "$bw 1024 / p") 
if [[ "$num" != "0" ]]; then
	num=$(dc <<< "2 k $bw 1024 / p") 
	echo $num'KB'
	exit
fi

# not even kilo
echo $bw



