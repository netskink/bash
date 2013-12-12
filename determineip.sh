#!/bin/sh
shopt -s extglob

# parameter one is the interface
interface=$1

if [ -z $interface ]; then
	echo "usage: $0 <eth0|eth1>"
	exit 1
fi

#echo interface is $interface

# find the tokens in the ifconfig output.
for mytoken in  $(ifconfig "$interface")
do
#	if [[ $mytoken =~ ip:+([0-9])\.+([0-9])\.+([0-9])\.+([0-9]) ]]; then
	if [[ $mytoken =~ inet[[:space:]]([0-9])\.+([0-9])\.+([0-9])\.+([0-9]) ]]; then
		# find the token which is addr:xx.xx.xx.xx
		#echo $mytoken
		myip=${mytoken##addr:}
		# extract the ip address
		echo $myip
	fi
done

# desired pattern is
# inet addr:10.1.1.6  


