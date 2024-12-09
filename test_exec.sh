#!/usr/bin/env bash

echo "bash exec test script"

# exec executes a command in the file system and effectively ends the script

echo "this line should be shown"

exec '/bin/ls' # should termintate the script.

echo "this line does not execute"
