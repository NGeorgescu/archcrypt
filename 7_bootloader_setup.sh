#!/bin/bash
arch-chroot /mnt bootctl --path=/boot install && \
echo -e "default arch\ntimeout 5" > /mnt/boot/loader/loader.conf && \
partuuid=$(blkid -s PARTUUID -o value "$(cat /tmp/partition_device)2") && \
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /intel-ucode.img\ninitrd /initramfs-linux.img\noptions cryptdevice=PARTUUID=$partuuid:cryptroot root=/dev/mapper/cryptroot rw" > /mnt/boot/loader/entries/arch.conf
