#!/bin/bash

CPUS=$(grep -c ^processor /proc/cpuinfo)

# Example...
#	/usr/lib64/nagios/plugins/check_load -w 15,10,5 -c 30,25,20

# Let's generate the values we need based upon the number of CPUS.

W1=$(( CPUS * 2 ))
W5=$(( CPUS * 3 / 2 ))
W15=$CPUS
C1=$(( CPUS * 4 ))
C5=$(( CPUS * 3 ))
C15=$(( CPUS * 2 ))

exec /usr/lib64/nagios/plugins/check_load -w "${W1},${W5},${W15}" -c "${C1},${C5},${C15}"
