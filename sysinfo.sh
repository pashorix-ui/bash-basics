#!/bin/bash

echo "===== SYSTEM INFORMATION ====="

echo "Date: $(date +%F)"
echo "Hostname: $(hostname)"
echo "Current user: $(whoami)"
echo "Uptime: $(uptime -p)"

echo ""
echo "===== DISK USAGE ====="
df -h /

echo ""
echo "===== MEMORY ====="
free -h
