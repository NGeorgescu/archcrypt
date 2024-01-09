#!/bin/bash
#!/bin/bash
pacstrap /mnt base base-devel linux linux-lts linux-firmware intel-ucode git sudo networkmanager bash-completion z wget vim alsa-tools dosfstools exfat-utils && \
genfstab -pU /mnt >> /mnt/etc/fstab && \
arch-chroot /mnt /bin/bash
pacstrap /mnt base base-devel linux linux-lts linux-firmware intel-ucode git sudo networkmanager bash-completion && \
genfstab -pU /mnt >> /mnt/etc/fstab

# Create the sub-directory
mkdir -p /mnt/root

# Copy all .sh files from the current directory to /mnt/root
cp *.sh /mnt/root/ && \

arch-chroot /mnt /bin/bash

