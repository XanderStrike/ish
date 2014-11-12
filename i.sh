#!/bin/bash

uptime -p
cat /proc/loadavg | awk '{print "Load:\t" $1 " " $2 " " $3}'
free -h | grep Mem | awk '{print "RAM:\t" $3 " used of " $2 " (" $7 " cached)"}'
df -h | grep sda1 | awk '{print "Root:\t" $3 " used of " $2 " (" $5 ")"}'
df -h | grep Private | awk '{print "Home:\t" $3 " used of " $2 " (" $5 ")"}'
sensors | grep Core | awk '{print $1 " " $2 "\t" $3}'
printf "IPs:\t"
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | tr '\n' " "
printf "\n"
acpi -b | awk '{print "Batt:\t" $4 " (" $5 " remaining)"}'
