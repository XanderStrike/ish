#!/bin/bash

uptime -p
cat /proc/loadavg | awk '{print $1 " " $2 " " $3}'
free -h | grep Mem | awk '{print "RAM: " $3 " used of " $2 " (" $7 " cached)"}'
df -h | grep sda1 | awk '{print "Root: " $3 " used of " $2 " (" $5 ")"}'
df -h | grep Private | awk '{print "Home: " $3 " used of " $2 " (" $5 ")"}'
sensors | grep Core | awk '{print $1 " " $2 " " $3}'
printf "IPs: "
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | tr '\n' " "
printf "\n"
acpi -b | awk '{print $1 ": " $4 " (" $5 " remaining)"}'
