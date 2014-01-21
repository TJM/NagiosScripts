#!/bin/bash

CPUS=$(grep -c ^processor /proc/cpuinfo)

# Example...
#	/usr/lib64/nagios/plugins/check_procs -w 300 -c 350

# Let's generate the values we need based upon the number of CPUS.

WARN=$(( CPUS * 25 + 250 ))
CRIT=$(( CPUS * 25 + 350 ))

exec /usr/lib64/nagios/plugins/check_procs -w "${WARN}" -c "${CRIT}"
