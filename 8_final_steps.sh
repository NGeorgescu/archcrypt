#!/bin/bash
# after exiting
swapoff /mnt/swapfile && \
umount -R /mnt && \
shutdown -r now
