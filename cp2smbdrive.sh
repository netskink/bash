#!/bin/sh

#$1 is password

smbclient \\\\10.1.1.136\\commonshare -U davis $1 -c "cd intermediate\davis;prompt; mput *.zip"


smbclient \\\\10.1.1.136\\commonshare -U davis $1 -c "cd intermediate\davis;prompt; mput *.tgz"
