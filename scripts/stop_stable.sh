#!/bin/bash
# stop_stable.sh
# This script stops all stress-ng, iperf3, and dd processes used for generating load.

echo "[INFO] Stopping all load generators..."

pkill -f stress-ng
pkill -f iperf3
pkill -f "dd if=/dev/zero"
pkill -f "nc -q 0"

rm -f /tmp/io.bin

echo "[OK] All processes stopped and cleaned up."
