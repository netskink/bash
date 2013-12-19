#!/bin/sh



####################
### The read only file system is a loop back file.
###
TESTYRO_MNT=/tmp/testy_ro
TESTYRO_BIN=testy_ro.bin
TESTYRO_LOOPDEV="" # this will be determined based upon losetup -f
###
### The read write file system is a tmpfs
TESTYRW_MNT=/tmp/testy_rw
###
### The union file system is a composite of the read-only and read-write
TESTYU_MNT=/tmp/testy_u


######### Start by testing to see anything exists first


# check if its already mounted. If so remove it.
if mount | grep $TESTYU_MNT > /dev/null; then
        echo "fs is mounted, unmount it"
        umount $TESTYU_MNT
fi

# check if its already mounted. If so remove it.
if mount | grep $TESTYRO_MNT > /dev/null; then
        echo "fs is mounted, unmount it"
        umount $TESTYRO_MNT
fi
# check if its already mounted. If so remove it.
if mount | grep $TESTYRW_MNT > /dev/null; then
        echo "fs is mounted, unmount it"
        umount $TESTYRW_MNT
fi


#### create the read only fs
###############################################################
# determine if loopback device is still mapped. If so remove it.
TESTYRO_LOOPDEV=`losetup -a | grep $TESTYRO_BIN | cut --delimiter=: -f 1`
if [ ! -z $TESTYRO_LOOPDEV ]; then
        echo "loopback device exists"
        losetup -d $TESTYRO_LOOPDEV
fi


# at this point, the loopback mapping is removed
# and the file is not mounted.  The mount point may exist.



#Make a 1 MB file if it does not exist
if [ -f "$TESTYRO_BIN" ]; then
        echo "$TESTYRO_BIN exists"
else
        echo "$TESTYRO_BIN does not exist. Make it."
        dd if=/dev/zero of=$TESTYRO_BIN bs=512 count=2K
fi


# Find the free loopback file
TESTYRO_LOOPDEV=`losetup -f`

# Associate the loopback file with the file
losetup $TESTYRO_LOOPDEV $TESTYRO_BIN

#Format the file with 1% reserved block count
mkfs -t ext2  -m 1 -v $TESTYRO_LOOPDEV


# make the mount mount point
if [ -d "$TESTYRO_MNT" ]; then
        echo "$TESTYRO_MNT exists. OK"
else
        echo "$TESTYRO_MNT does not exist"
        mkdir $TESTYRO_MNT
fi


# mount the read only fs
if [ -d "$TESTYRO_MNT" ]; then
        echo "$TESTYRO_MNT exists. OK. Lets mount it."
        mount -o rw $TESTYRO_LOOPDEV $TESTYRO_MNT
		cat > $TESTYRO_MNT/read-only << EOF
This is a read-only file. 
What does it look like on the readonly file system.
EOF
        umount $TESTYRO_MNT
        mount -o ro $TESTYRO_LOOPDEV $TESTYRO_MNT
        if [ $? -eq 0 ]; then
                echo "All good. FS created and mounted."
        else
                echo "mount failed."
        fi
else
        echo "$TESTYRO_MNT does not exist still"
        echo "remove the loopback mapping and quit"
        losetup -d $TESTYRO_LOOPDEV
        exit 1
fi

#### create the read write fs
###############################################################
######### Start by testing to see anything exists first

# make the mount mount point
if [ -d "$TESTYRW_MNT" ]; then
        echo "$TESTYRW_MNT exists. OK"
else
        echo "$TESTYRW_MNT does not exist"
        mkdir $TESTYRW_MNT
fi


# mount the read write fs
if [ -d "$TESTYRW_MNT" ]; then
        echo "$TESTYRW_MNT exists. OK. Lets mount it."
		mount -t tmpfs -o size=1M,nr_inodes=1k,mode=700 tmpfs $TESTYRW_MNT
        if [ $? -eq 0 ]; then
                echo "All good. FS created and mounted."
				cat > $TESTYRW_MNT/read-write << EOF
This is a read-write file. 
What does it look like on the readonly file system.
EOF
        else
                echo "mount failed."
        fi
else
        echo "$TESTYRW_MNT does not exist still"
        exit 1
fi

#### Create the UnionFS mount
###############################################################

# make the mount mount point
if [ -d "$TESTYU_MNT" ]; then
        echo "$TESTYU_MNT exists. OK"
else
        echo "$TESTYU_MNT does not exist"
        mkdir $TESTYU_MNT
fi


# mount the union fs
if [ -d "$TESTYU_MNT" ]; then
        echo "$TESTYU_MNT exists. OK. Lets mount it."
		mount -t unionfs  -o dirs=/$TESTYRW_MNT=rw:$TESTYRO_MNT=ro  $TESTYU_MNT $TESTYU_MNT 
        if [ $? -eq 0 ]; then
                echo "All good. FS created and mounted."
        else
                echo "mount failed."
        fi
else
        echo "$TESTYU_MNT does not exist still"
        exit 1
fi

####### Final check to see if everything is mounted
############################################################
if mount | grep $TESTYU_MNT > /dev/null; then
        echo "$TESTYU_MNT is mounted. Good."
fi

# check if its already mounted. If so remove it.
if mount | grep $TESTYRO_MNT > /dev/null; then
        echo "$TESTYRO_MNT is mounted. Good."
fi
# check if its already mounted. If so remove it.
if mount | grep $TESTYRW_MNT > /dev/null; then
        echo "$TESTYRW_MNT is mounted. Good."
fi



