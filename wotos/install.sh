
#! /bin/bash

# Give 1GB of space to play with on the live system
mount -o remount,size=1G /run/archiso/cowspace
echo "hkp://keyserver.pgp.com" > /etc/
pacman-key --init && pacman-key
pacman -Syyuu

echo LANG=en_US.UTF-8 > /etc/locale.conf
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

locale-gen

timedatectl set-ntp true
