#!/bin/bash
bootctl --path=/boot install && \
echo -e "default arch\ntimeout 5" > /boot/loader/loader.conf && \
partuuid=$(blkid -s PARTUUID -o value "$(findmnt -n -o SOURCE /)") && \
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /intel-ucode.img\ninitrd /initramfs-linux.img\noptions cryptdevice=PARTUUID=$partuuid:cryptroot root=/dev/mapper/cryptroot rw" > /boot/loader/entries/arch.conf

echo "success"
