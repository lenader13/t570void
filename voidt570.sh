#!/bin/bash
echo DIES NUR NACH KONFIGURATION DER FESTPLATTE STARTEN
sleep 20
# Services, DNS, Locales, elogind, niri, gh
mkdir -p /mnt/var/db/xbps/keys
cp /var/db/xbps/keys/* /mnt/var/db/xbps/keys/
REPO=https://repo-default.voidlinux.org/current/musl
ARCH=x86_64-musl
XBPS_ARCH=$ARCH xbps-install -S -r /mnt -R "$REPO" \

