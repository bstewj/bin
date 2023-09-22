#!/bin/bash
## INSTALL BUSYBOX,BC
# get cpu frequency in MHz from /proc/cpuinfo
#freq=$(cat /proc/cpuinfo | grep "cpu MHz" | head -n1 | awk '{print $4}')

# convert MHz to GHz
#freq_ghz=$(echo "$freq/1000" | busybox bc -l)

#echo "CPU Frequency: $freq_ghz GHz"
freq=$(cat /proc/cpuinfo | grep "cpu MHz" | head -n1 | awk '{print $4/1000}')

# Format frequency for human readability
# printf " %.2f \n" $freq
# printf " Freq: %.2f GHz\n" $freq
printf " %.2f GHz\n" $freq
echo ${freq}
