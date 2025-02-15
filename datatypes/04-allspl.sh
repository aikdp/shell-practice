#!/bin/bash

echo "all variables passed to the script: $@"

echo "Number of variables passed: $#"

echo "Script Name: $0"

echo "current working directory is: $PWD"

echo "Home directory of current user: $HOME"

echo "PID Process Instance of the scrpt executing now: $$"

sleep 100 &

echo "PID of last background coommand is: $!"

echo "Exit status of last command or return code of last executed command is: $?"
