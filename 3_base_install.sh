#!/bin/bash
pacstrap /mnt base base-devel linux linux-lts linux-firmware intel-ucode git sudo networkmanager bash-completion && \
genfstab -pU /mnt >> /mnt/etc/fstab && \
arch-chroot /mnt /bin/bash
