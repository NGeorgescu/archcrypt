#!/bin/bash
dev=$(cat /tmp/partition_device)
[ -z "$dev" ] && { echo "No device specified"; exit 1; }
part1=$(ls ${dev}* | grep -E "${dev}p?1$")
part2=$(ls ${dev}* | grep -E "${dev}p?2$")
[ -z "$part1" ] || [ -z "$part2" ] && { echo "Partitions not found"; exit 1; }
mkfs.fat -F32 "$part1" && \
cryptsetup -q -v --use-random luksFormat "$part2" && \
cryptsetup luksDump "$part2" && \
cryptsetup luksHeaderBackup "$part2" --header-backup-file "luks_header_backup_$(date +%Y-%m-%d)" && \
cryptsetup luksOpen "$part2" cryptroot && \
mkfs.ext4 /dev/mapper/cryptroot
