#!/bin/bash
dev=$(cat /tmp/partition_device)
[ -z "$dev" ] && { echo "No device specified"; exit 1; }
mount /dev/mapper/cryptroot /mnt && \
mkdir -p /mnt/boot && \
mount "${dev}1" /mnt/boot
