#!/bin/bash

uptime
df -h | grep disk1 | awk '{print "Root:\t" $3 " used of " $2 " (" $5 ")"}'
istats cpu | awk '{print "CPU:\t" $3 " " $4}'
istats battery charge | awk '{print "Batt:\t" $3}'
istats battery temp | awk '{print "Batt:\t" $3}'

printf "IPs:\t"
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | tr '\n' " "
printf "\n"
