#!/bin/bash
read -p "Enter hostname: " hostname
timedatectl set-timezone Europe/Stockholm && \
hwclock --systohc --utc && \
echo "$hostname" > /mnt/etc/hostname && \
sed -i "/en_US.UTF-8 UTF-8/s/^#//g" /mnt/etc/locale.gen && \
arch-chroot /mnt locale-gen && \
echo -e "LANG=en_US.UTF-8\nLANGUAGE=en_US\nLC_ALL=C" > /mnt/etc/locale.conf
