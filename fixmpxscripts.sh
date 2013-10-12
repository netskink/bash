#!/bin/sh

ifconfig eth1 mtu 9000
ifconfig eth2 mtu 9000

# these are local interfaces
interface1=`./determineip.sh eth1`
interface2=`./determineip.sh eth2`

# thse are remote intefaces
echo "remote address 1?"
read rinterface1
echo $rinterface1
echo "remote address 2?"
read rinterface2
echo $rinterface2


#echo $interface1
./rewriteipaddy.sh $interface1 server.mpx
./rewriteipaddy.sh $interface2 server.mpx

#echo remove ip address for client
./rewriteipaddy.sh $rinterface1 client.mpx
./rewriteipaddy.sh $rinterface2 client.mpx

##########################################################

echo "runscript mem1.mpx" > runall2.mpx
echo "runscript server-$interface1.mpx" >> runall2.mpx
echo "runscript server-$interface2.mpx" >> runall2.mpx
echo "pause 30" >> runall2.mpx
echo "runscript client-$rinterface1.mpx" >> runall2.mpx
echo "runscript client-$rinterface2.mpx" >> runall2.mpx
echo "pause 10" >> runall2.mpx
echo "runscript client-$rinterface1.mpx" >> runall2.mpx
echo "runscript client-$rinterface2.mpx" >> runall2.mpx


