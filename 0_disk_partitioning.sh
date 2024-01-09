#!/bin/bash
dev=$1
[ -z "$dev" ] && { echo "No device specified"; exit 1; }
echo -e ",+1G,E\n,,-\n" | sfdisk "$dev"
echo "$dev" > /tmp/partition_device
