#!/bin/bash
renice -n 20 -p "$$" &>/dev/null

iter=2
delay=0.5

# 0     1       2    3       4          5      6   7       8     9     10
#       user    nice system  idle       iowait irq softirq steal guest guest_nice
# cpu   180288  509  316177  443927540  53229  0   5395    0     0     0

# init
previous_idle=0
previous_total=0
for i in $(seq "${iter}"); do
  cpu=( $(grep '^cpu ' /proc/stat) )
  unset cpu[0]
  idle=$(( ${cpu[4]} + ${cpu[5]} )) # compute idle cpu time
  total=$(( ${cpu[@]/%/+}0 )) # compute total cpu time
  idle_d=$(( idle - previous_idle )) # compute cpu usage since last check
  total_d=$(( total - previous_total ))
  cpu_usage=$(( 100*(total_d-idle_d)/total_d ))
  # remember cpu total and idle for next check
  previous_total="${total}"
  previous_idle="${idle}"
  # wait before next check
  sleep "${delay}"
done
echo "${cpu_usage}" # %

