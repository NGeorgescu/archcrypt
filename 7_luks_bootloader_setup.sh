#!/bin/bash
sed -i "/^MODULES=/c\MODULES=(ext4)" /etc/mkinitcpio.conf && \
sed -i "/^HOOKS=/s/filesystems/encrypt filesystems/" /etc/mkinitcpio.conf && \
mkinitcpio -p linux && \
bootctl --path=/boot install && \
echo -e "default arch\ntimeout 5" > /boot/loader/loader.conf && \
partuuid=$(blkid -s PARTUUID -o value "$(findmnt -n -o SOURCE /)") && \
echo -e "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /intel-ucode.img\ninitrd /initramfs-linux.img\noptions cryptdevice=PARTUUID=$partuuid:cryptroot root=/dev/mapper/cryptroot rw" > /boot/loader/entries/arch.conf

echo "success"
