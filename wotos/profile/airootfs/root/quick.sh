#! /bin/bash

# This is the quick version of the install script

mount -o remount,size=512M /run/archiso/cowspace
useradd -m wot
echo "wot ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
cd /home/wot
systemctl start tor && systemctl stop tor
chmod +x /root/torctl/torctl
ln -sf /root/torctl/torctl /usr/bin/torctl
torctl start
out=`curl https://check.torproject.org/api/ip`;if [[ $out == *"true"* ]]; then;echo "torctl is working, continuing";else;echo "torctl NOT WORKING! please manually configure before trying again";exit;fi
pacman-key --init
echo -e 'Server = http://mirror.rackspace.com/archlinux/$repo/os/$arch\r\nServer = https://mirror.rackspace.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
echo "hkp://keyserver.pgp.com" >> /etc/pacman.d/gnupg/gpg.conf
pacman -Syyuu
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
wget -O /home/wot/.zshrc https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/zshrc
sudo -u wot /usr/bin/zsh
