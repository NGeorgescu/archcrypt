gpg --refresh-keys
pacman-key --init && pacman-key --populate archlinux
pacman-key --refresh-keys
pacman -Sy archlinux-keyring
