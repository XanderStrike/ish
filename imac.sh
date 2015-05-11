#!/bin/bash

uptime
top -l 1 | head -n 10 | awk '/PhysMem:/ {print "RAM:\t" $2 " used, " $6 " unused"}'
df -h | awk '/disk1/ {print "Root:\t" $3 " used of " $2 " (" $5 ")"}'
printf "IPs:\t"
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | tr '\n' " "
printf "\n"
istats cpu | awk '{print "CPU:\t" $3 " " $4}'
istats battery charge | awk '{print "Batt:\t" $3}'
istats battery temp | awk '{print "Batt:\t" $3}'
