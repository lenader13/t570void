#!/bin/bash
# loadkeys de
# echo DIES NUR NACH KONFIGURATION DER FESTPLATTE STARTEN
fdisk /dev/nvme0n1
mkfs.vfat -F 32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
xgenfstab -L /mnt > /mnt/etc/fstab
sleep 20
# Services, DNS, Locales, elogind, niri, gh, tailscale
mkdir -p /mnt/var/db/xbps/keys
cp /var/db/xbps/keys/* /mnt/var/db/xbps/keys/
REPO=https://repo-default.voidlinux.org/current/musl
ARCH=x86_64-musl
XBPS_ARCH=$ARCH xbps-install -S -r /mnt -R "$REPO" \
base-system linux linux-headers efibootmgr sudo \
coreutils bash sudo man-db man-pages \
git helix micro base-devel lazygit tmux github-cli \
clang clang-tools-extra python3 python3-pip rust cargo openjdk17 bash-completion nerd-fonts-ttf \
fd ripgrep bat lsd fzf yazi \
btop duf aerc \
docker qemu \
rsv NetworkManager bluez openssh tailscale mosh elogind pipewire wireplumber \
firefox niri lidm fprintd libfprintd gtklock swayidle swaybg fuzzel Waybar mako alacritty udiskie

# Config
echo "LANG=de_DE.UTF-8"
# echo "wheel ALL=(ALL) ALL/wheel ALL=(ALL) NOPASSWD:ALL" >> /mnt/etc/sudoers
ln -sf /mnt/usr/share/zoneinfo/Europe/Berlin /mnt/etc/localtime

read -p "Grundinstallation abgeschlossen, wechsle in chroot, dort Step2.sh starten"
cp ./step2 /mnt

