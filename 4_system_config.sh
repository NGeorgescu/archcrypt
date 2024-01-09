#!/bin/bash
read -p "Enter hostname: " hostname
echo -e "LANG=en_US.UTF-8\nLANGUAGE=en_US\nLC_ALL=C" > /etc/locale.conf && \
echo "$hostname" > /etc/hostname && \
sed -i "/en_US.UTF-8 UTF-8/s/^#//g" /etc/locale.gen && \
timedatectl set-timezone America/New_York && \
hwclock --systohc --utc && \
locale-gen
