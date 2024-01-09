#!/bin/bash
sed -i "/%wheel ALL=(ALL) ALL/s/^#//g" /mnt/etc/sudoers && \
sed -i "/%wheel ALL=(ALL) NOPASSWD: ALL/d" /mnt/etc/sudoers && \
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /mnt/etc/sudoers && \
sed -i "/^MODULES=/c\MODULES=(ext4)" /mnt/etc/mkinitcpio.conf && \
sed -i "/^HOOKS=/s/filesystems/encrypt filesystems/" /mnt/etc/mkinitcpio.conf && \
arch-chroot /mnt mkinitcpio -p linux
