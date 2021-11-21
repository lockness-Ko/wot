#! /bin/bash

# Give 1GB of space to play with on the live system
mount -o remount,size=1G /run/archiso/cowspace

# Make the wot user
useradd -m wot
echo "wot ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
mkdir -p /home/wot/.gnupg
cp -r /root/.gnupg /home/wot/.gnupg/**
chown "wot:wot" /home/wot/**
chown "wot:wot" /home/wot/

# Setup TOR and torctl
cd /home/wot
systemctl start tor && systemctl stop tor
ln -sf /root/torctl/torctl /usr/bin/torctl
torctl start

# Check tor status
out=`curl https://check.torproject.org/api/ip`
if [[ $out == *"true"* ]]; then
  echo "torctl is working, continuing"
else
  echo "torctl NOT WORKING! please manually configure before trying again"
  exit
fi

# Make pacman work (this was annoying for me)
pacman-key --init && pacman-key --populate
echo -e 'Server = http://mirror.rackspace.com/archlinux/$repo/os/$arch\r\nServer = https://mirror.rackspace.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
echo "hkp://keyserver.pgp.com" >> /etc/pacman.d/gnupg/gpg.conf

# Update the system
pacman -Syyuu

# Generate the locales
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

# Set ntp server AFTER activating tor and torctl AND verifying that it is working (to prevent accidental IP leaks)
timedatectl set-ntp true

wget -O /home/wot/.zshrc https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/zshrc

# Go into the wot user
sudo -u wot /usr/bin/zsh
