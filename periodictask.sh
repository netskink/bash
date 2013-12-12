#!/bin/sh 

# This code allows you to perform some acton every few seconds
# for an interval.  In between actions it will sleep.

CURR_SECS=`date "+%s"`
echo $CURR_SECS

# How long to perform actions.
TIMER_INTERVAL=10

# How long to sleep between actions
TIMER_DELAY=1

while NOW_SECS=`date "+%s"`
do
	echo $CURR_SECS $NOW_SECS
	if (( "$NOW_SECS" >= ("$CURR_SECS"+"$TIMER_INTERVAL") )); then
		echo "timer expired"
		break
	fi
#	echo "Do something here "
	sleep $TIMER_DELAY
		
done

echo "Periodic Task Complete."
