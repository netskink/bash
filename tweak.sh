#!/bin/bash
# John F. Davis
# Tools Group

shopt -s extglob

# parameter one is the interface
theFile=$1
theVariable=$2
theValue=$3

if [ -z $theValue ]; then
	echo "usage: $0 file variable value"
	exit 1
fi

echo "the file is $theFile"
echo "the variable is $theVariable"
echo "the value is $theValue"

exec <$theFile
outfilename=$theFile.2
while read line
do
	#echo $line
	# this will find any line with variable=0x00 or variable=000 style assignments
    # and change them to variable=specified-value
	echo ${line/$theVariable=+([0-9]|[xa-fA-F])/$theVariable=$theValue}

done

