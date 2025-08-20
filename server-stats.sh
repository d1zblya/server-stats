#!/bin/bash

echo

echo "======================= CPU DATA ========================"
cpu_name=$(grep "model name" /proc/cpuinfo | head -n 1 | cut -d ":" -f 2 | sed s/^[[:space:]]*//)
echo "CPU name : $cpu_name"
cpu_usage=$(top -bn1 | grep "%Cpu(s)" | cut -d "," -f 4 | awk '{print 100-$1}')
echo "CPU usage: $cpu_usage%"

echo

echo "===================== MEMORY DATA ======================="
mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
echo "Mem total : $mem_total kB"
mem_free=$(grep MemFree /proc/meminfo | awk '{print $2}')
mem_free_per=$(( (mem_free * 100) / mem_total ))
echo "Mem free  : $mem_free kB, $mem_free_per%"
mem_usage=$(( mem_total - mem_free ))
mem_usage_per=$(( ( (mem_total - mem_free) * 100 ) / mem_total ))
echo "Mem usage : $mem_usage kB, $mem_usage_per%"

echo

echo "====================== DISK DATA ========================"
df -h | grep "/" -w | awk '{print "Total     : " $2 "\nUsed      : " $3 "\nUsed%     : " $5 "\nAvailable : " $4}'

echo

echo "================ Top 5 processes by CPU usage ============"
echo "USER           | PID    | CPU% | COMMAND"
echo "---------------|--------|------|------------------------"

ps aux --sort=-%cpu | head -n 6 | awk 'NR==1 {next}
{ printf "%-14s | %-6s | %-4s | %s\n", $1, $2, $3, $11 }'

echo

echo "================ Top 5 processes by MEMORY usage ================="
echo "USER           | PID    | MEM% | COMMAND"
echo "---------------|--------|------|------------------------"

ps aux --sort=-%mem | head -n 6 | awk 'NR==1 {next} { printf "%-14s | %-6s | %-4s | %s\n", $1, $2, $4, $11 }'

echo