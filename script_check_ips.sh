#!/bin/bash

echo "===== Start script ====="

for i in {1..254}; do 
	ping -c 1 192.168.246.$i >/dev/null && echo "192.168.246.$i is active"; 
done

echo "===== End script ====="

