#!/bin/bash
read -p "Enter hostname: " hostname
echo -e "LANG=en_US.UTF-8\nLANGUAGE=en_US\nLC_ALL=C" > /etc/locale.conf && \
echo "$hostname" > /etc/hostname && \
echo -e "127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.1.1\t$hostname" >> /etc/hosts  && \
sed -i "/en_US.UTF-8 UTF-8/s/^#//g" /etc/locale.gen && \
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime && \
hwclock --systohc && \
locale-gen && \
sed -i "/%wheel ALL=(ALL) ALL/s/^#//g" /etc/sudoers && \
sed -i "/%wheel ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers && \
echo "success"
