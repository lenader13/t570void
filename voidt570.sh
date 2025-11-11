#!/bin/bash
echo DIES NUR NACH KONFIGURATION DER FESTPLATTE STARTEN
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
clang clang-tools-extra python3 python3-pip rust cargo openjdk17 bash-completion \
fd rpigrep bat lsd fzf yazi \
btop duf aerc \
docker qemu \
rsv NetworkManager bluez openssh tailscale mosh elogind \

# Config
echo "LANG=de_DE.UTF-8"
sed echo "wheel ALL=(ALL) ALL/wheel ALL=(ALL) NOPASSWD:ALL" >> /mnt/etc/sudoers
ln -sf /mnt/usr/share/zoneinfo/<timezone> /mnt/etc/localtime



