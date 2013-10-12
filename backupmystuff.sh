#!/bin/bash

# look for all folders in the specified directory and tar them up.
# this way you can be in the current dir and leave the tar file
# there for the subfolders.

# USAGE ./backupmyshit.sh <dir>

if [ $# -ne "1" ] ; then
	echo "USAGE $0 <dir>";
	exit 1;
fi

if [ -d $1 ] ; then
	echo "dir is $1\n";
else
	echo "USAGE $0 <dir>";
	exit 1;
fi




for file in $1/* ; do
	if [ -d $file ] ; then
		subdir=${file/\.\//};
		#echo $subdir;
		tar -cvzf $subdir-`date +%y%m%d`.tgz $subdir
	fi
done;

