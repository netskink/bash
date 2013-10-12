#!/bin/sh
# John F. Davis
# Tools Group

shopt -s extglob

# this file has ip addresses in it. One ip address per line.
INFILE=ips.txt
IPARRAY=( $(<"$INFILE") )

# this is the mpx script file name you will read.
infilename="demo.txt"

# create a duplicate mpx script file for each ip address.
# each of the duplicate mpx scripts will have the servername
# ipaddress replaced with an ip address from the ip address
# list file.
for (( i=0; i<${#IPARRAY[@]}; i++)); do
	exec <$infilename
	outfilename="server-${IPARRAY[i]}.mpx"
	exec >$outfilename
	ipaddress=${IPARRAY[i]}
	while read line
	do
		echo ${line/--servername=+([0-9])\.+([0-9])\.+([0-9])\.+([0-9])/--servername=$ipaddress}
	done
done
