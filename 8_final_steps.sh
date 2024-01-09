#!/bin/bash
arch-chroot /mnt exit && \
umount -R /mnt && \
shutdown -r now
