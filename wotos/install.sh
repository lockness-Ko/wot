
#! /bin/bash

pacman -Syy reflector

echo LANG=en_US.UTF-8 > /etc/locale.conf
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

locale-gen

timedatectl set-ntp true

echo n,default,default,default,default,w
fdisk /dev/sda
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware sudo nano vi networkmanager dhcpcd

genfstab -U /mnt >> /mnt/etc/fstab

umount -R /mnt

reboot
