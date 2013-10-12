#!/bin/bash
# John F. Davis
# Tools Group

shopt -s extglob

# parameter one is the interface
interface=$1

if [ -z $interface ]; then
	echo "usage: $0 <eth0|eth1>"
	exit 1
fi

#echo interface is $interface

RxOld=1
TxOld=1

while true; 
do

	sleep 1;
	ctr=0;
	myarray[0]=0;
	myarray[1]=0;
	# find the tokens in the ifconfig output.
	# it will find RX bytes first and then TX bytes
	for mytoken in  $(ifconfig "$interface")
	do
		if [[ $mytoken =~ bytes:+([0-9]) ]]; then
			# find the token which is bytes:xxxxx
			#echo $mytoken
			mybytes=${mytoken##bytes:}
			# extract the byte count
			#echo $mybytes
			myarray[ctr]=$mybytes
			ctr=$ctr+1
		fi
	done
#	echo ${myarray[0]}
#	echo ${myarray[1]}
#	break
	RxNew=${myarray[0]}
	TxNew=${myarray[1]}

	RxBPS=`expr $RxNew - $RxOld`
	TxBPS=`expr $TxNew - $TxOld`
	# if you want to run raw bytes per second
	#echo "Rx Bytes per second" $RxBPS "     Tx Bytes per second" $TxBPS
	echo "Rx Bytes per second" `./mycalc.sh $RxBPS` "     Tx Bytes per second" `./mycalc.sh $TxBPS`
	RxOld=$RxNew
	TxOld=$TxNew
	
done



