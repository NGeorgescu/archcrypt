#!/bin/bash

echo "setting Root passwd"
passwd
read -p "Enter username: " username
useradd -m -g users -G wheel,video "$username"
echo "setting $username password"
passwd "$username"

echo "success"
