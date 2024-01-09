#!/bin/bash
arch-chroot /mnt passwd && \
arch-chroot /mnt useradd -m -g users -G wheel,video john && \
arch-chroot /mnt passwd john
