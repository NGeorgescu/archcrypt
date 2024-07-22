#!/bin/bash

echo "enter root password:"
passwd
read -p "Enter username: " username
useradd -m -g users -G wheel,video "$username"
echo "enter $username password:"
passwd "$username"

echo "success"