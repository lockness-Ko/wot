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

#in the chroot
arch-chroot /mnt pacman -Sy grub reflector torctl tor lynx git python3 python3-pip python-is-pip zsh wget curl exa highlight xorg-xrandr xorg-server xorg-xinit terminator i3 numlockx #nitrogen

arch-chroot /mnt echo wot > /etc/hostname

# Install stuff
arch-chroot /mnt wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /usr/bin/ncat
arch-chroot /mnt cd /root && git clone https://github.com/Datalux/Osintgram.git && git clone https://github.com/twintproject/twint.git && git clone https://github.com/ReFirmLabs/binwalk.git
arch-chroot /mnt wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/zshrc -O /root/.zshrc
arch-chroot /mnt wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/motd -O /etc/motd
arch-chroot /mnt wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/hosts -O /etc/hosts

# Setup tor and torctl
arch-chroot /mnt systemctl enable --now tor.service
arch-chroot /mnt torctl start

arch-chroot /mnt passwd

arch-chroot /mnt reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

arch-chroot /mnt timedatectl set-timezone Australia/Sydney

arch-chroot /mnt systemctl enable NetworkManager

arch-chroot /mnt grub-install /dev/sda

arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

# exit

#out of chroot
umount -R /mnt

reboot

