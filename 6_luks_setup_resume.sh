
swap_file="/swapfile"
swap_uuid=$(findmnt -no UUID -T "$swap_file")
resume_offset=$(filefrag -v "$swap_file" | awk '$1=="0:" {print $4}' | sed 's/\.//')
echo "options root=UUID=$(blkid -s UUID -o value /dev/$(mount | grep 'on / ' | cut -d' ' -f1)) resume=UUID=$swap_uuid resume_offset=$resume_offset rw" > /boot/loader/entries/arch.conf
sed -i "/^HOOKS=(/s/udev/& resume/" /etc/mkinitcpio.conf

