#!/bin/bash
sed -i "/%wheel ALL=(ALL) ALL/s/^#//g" /etc/sudoers && \
sed -i "/%wheel ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers && \
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
sed -i "/^MODULES=/c\MODULES=(ext4)" /etc/mkinitcpio.conf && \
sed -i "/^HOOKS=/s/filesystems/encrypt filesystems/" /etc/mkinitcpio.conf && \
mkinitcpio -p linux

echo "success"