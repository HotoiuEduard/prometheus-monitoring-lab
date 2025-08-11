#!/bin/bash
# fire_all_stable.sh
# This script generates load on CPU, memory, disk, and network for monitoring tests.

PROM_IP="172.31.31.250"

echo "[INFO] Starting stress tests..."

# CPU load (90%) for 15 minutes
stress-ng --cpu 0 --cpu-load 90 --timeout 900s &

# Memory load (95% of RAM) for 15 minutes
stress-ng --vm 2 --vm-bytes 95% --vm-keep --timeout 900s &

# Disk I/O stress (read & write) for 15 minutes
(
  end=$(( $(date +%s) + 900 ))
  while (( $(date +%s) < end )); do
    dd if=/dev/zero of=/tmp/io.bin bs=64M count=64 oflag=direct status=none || true
    sync
    dd if=/tmp/io.bin of=/dev/null bs=64M iflag=direct status=none || true
  done
) &

# Network stress using iperf3 (client mode) for 15 minutes
iperf3 -c $PROM_IP -t 900 -P 8 &

# Continuous small network traffic to keep traffic alert active
while true; do
  dd if=/dev/zero bs=10M count=50 2>/dev/null | nc -q 0 $PROM_IP 9999
done &
