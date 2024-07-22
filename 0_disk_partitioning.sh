#!/bin/bash
dev=$1
[ -z "$dev" ] && { echo "No device specified"; exit 1; }

# Start gdisk on the specified device
gdisk "$dev" << EOF
o
Y
w
Y
EOF

# Re-run gdisk to create new partitions
echo -e "o\nY\nn\n\n\n+1G\nEF00\nn\n\n\n\n8300\nw\nY" | gdisk "$dev"
echo "$dev" > ./partition_device
