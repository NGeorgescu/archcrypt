#!/bin/bash

convert_to_mb() {
    local size=$1
    local unit=${size: -1}
    local number=${size%?}
    
    case $unit in
        [gG]) echo $((number * 1024)) ;;
        [mM]) echo $number ;;
        [kK]) echo $((number / 1024)) ;;
        *) 
            if [[ "$size" =~ ^[0-9]+$ ]]; then
                echo $size
            else
                echo "Invalid input"
                return 1
            fi
            ;;
    esac
}

# Get total RAM in MB
total_ram=$(($(grep MemTotal /proc/meminfo | awk '{print $2}') / 1024))

# Calculate recommended swap size for hibernation (RAM + 20%)
recommended_swap=$((total_ram + (total_ram / 5)))

# Convert recommended swap to a more readable format
if [ $recommended_swap -ge 1024 ]; then
    readable_swap="$((recommended_swap / 1024))G"
else
    readable_swap="${recommended_swap}M"
fi

echo "Enter swap file size for hibernation. You can use M for MB or G for GB (e.g., 8G, 8000M)."
read -p "Swap size [recommended $readable_swap]: " user_input
user_input=${user_input:-$readable_swap}
swap_size=$(convert_to_mb $user_input)

if [ "$swap_size" == "Invalid input" ]; then
    echo "Invalid input. Please run the script again with a valid size."
    exit 1
fi

swap_file="/swapfile" && \
dd if=/dev/zero of=$swap_file bs=1M count=$swap_size status=progress && \
chmod 600 $swap_file && \
mkswap $swap_file && \
swapon $swap_file && \
echo "$swap_file none swap defaults 0 0" >> /etc/fstab && \
echo "success"
