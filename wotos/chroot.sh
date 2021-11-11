#! /bin/bash

pacman -Sy grub reflector tor lynx git python3 zsh wget curl exa highlight xorg-xrandr xorg-server xorg-xinit terminator i3 numlockx #nitrogen

echo wot > /etc/hostname

# Install stuff
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /usr/bin/ncat
cd /root && git clone https://github.com/Datalux/Osintgram.git && git clone https://github.com/twintproject/twint.git && git clone https://github.com/ReFirmLabs/binwalk.git
wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/zshrc -O /root/.zshrc
wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/motd -O /etc/motd
wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/hosts -O /etc/hosts

# Setup tor and torctl
git clone https://github.com/BlackArch/torctl
cd torcctl
ln -sf /root/torctl/torctl /usr/bin/torctl
systemctl enable tor.service
torctl start

passwd

reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
timedatectl set-timezone Australia/Sydney # CHANGE THIS
systemctl enable NetworkManager

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
