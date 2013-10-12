#!/bin/sh
shopt -s extglob

# this file has ip addresses in it. One ip address per line.
echo ipaddress is $1
IPARRAY[0]=$1
#INFILE=ips.txt
#IPARRAY=( $(<"$INFILE") )

infilename=$2
echo input filename is $infilename
# this is the mpx script file name you will read.
#infilename="server.mpx"



# create a duplicate mpx script file for each ip address.
# each of the duplicate mpx scripts will have the servername
# ipaddress replaced with an ip address from the ip address
# list file.
for (( i=0; i<${#IPARRAY[@]}; i++)); do
	exec <$infilename
	outfilename="${infilename%%.mpx}-${IPARRAY[i]}.mpx"
	exec >$outfilename
	ipaddress=${IPARRAY[i]}
	while read line
	do
		#echo ${line/--servername=+([0-9])\.+([0-9])\.+([0-9])\.+([0-9])/--servername=$ipaddress}
		echo ${line/ServerName=+([0-9])\.+([0-9])\.+([0-9])\.+([0-9])/ServerName=$ipaddress}
	done
done
