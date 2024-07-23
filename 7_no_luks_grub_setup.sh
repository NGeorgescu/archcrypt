pacman -S --noconfirm grub efibootmgr os-prober mtools && \
grub-install --target=x86_64-efi --bootloader-id=grub_uefi && \
grub-mkconfig -o /boot/grub/grub.cfg && \
echo "success"

