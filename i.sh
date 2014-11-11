#!/bin/bash

uptime -p
cat /proc/loadavg | awk '{print $1 " " $2 " " $3}'
free -h | grep Mem | awk '{print "RAM: " $3 " used of " $2 " (" $7 " cached)"}'
df -h | grep sda1 | awk '{print "Root: " $3 " used of " $2 " (" $5 ")"}'
df -h | grep Private | awk '{print "Home: " $3 " used of " $2 " (" $5 ")"}'
sensors | grep Core | awk '{print $1 " " $2 " " $3}'
