#!/bin/bash
# A simple script which has a build, not build, abort sequence.
# At the end, it will scp results to target and then
# copy the results to local /tmp as well.

export TARGET=192.168.0.1

# using return true as return 0
# and non zero positive number is false
function mycontinue() {
	while true; do
		read -p "Continue? [Y/n/a]" yn
		case $yn in
			[Yy]* ) echo "Continue on"; return 0; break;;
			[Nn]* ) echo "skipping"; return 1; break;;
			[Aa]* ) echo "Aborting"; exit;;
			* ) "Assuming default of Y. Continue on."; return 0; break;;
		esac

	done
}



echo using target of $TARGET


echo "build foo?"
if mycontinue; then
	echo "do build of foo"
fi


echo "build hotel?"
if mycontinue; then
	echo "do build of hotel"
fi

echo "scp the results?"
if mycontinue; then
	echo scp <longpathname> root@$TARGET:/tmp/.
fi


echo "simply copy these results to local dev /tmp"
	echoscp <longpathname> $TARGET:/tmp/.




