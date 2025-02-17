#!/bin/bash

echo "All passed arguments ro the shelll script: $@"
echo "total number of arguments in the script: $#"
echo "Script Name: $0"
echo "current working dorctory of user: $PWD"
echo "Home diractory of current user: $HOME"
echo "PID of current shell/process command: $$"
sleep 100 &
echo "PID if last background job: $!" 
echo "Exit status of command or The return code of the last executed command: $?"