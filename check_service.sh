#!/bin/bash

theservice=`service $1 status`

if [ $(echo ${theservice} | grep "is running" | wc -l) -gt 0 ];
	then
		echo "OK - $1 is running."
	exit 0
	else
		echo "CRITICAL - $1 is not running."
	exit 2
fi
