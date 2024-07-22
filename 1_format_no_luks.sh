#!/bin/bash
dev=$(cat ./partition_device)
[ -z "$dev" ] && { echo "No device specified"; exit 1; }
part1=$(ls ${dev}* | grep -E "${dev}p?1$")
part2=$(ls ${dev}* | grep -E "${dev}p?2$")
[ -z "$part1" ] || [ -z "$part2" ] && { echo "Partitions not found"; exit 1; }
mkfs.fat -F32 "$part1" && \
mkfs.ext4 "$part2"
mount "$part2" /mnt && \
mkdir -p /mnt/boot && \
mount "$part1" /mnt/boot
