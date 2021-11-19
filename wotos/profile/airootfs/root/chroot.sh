#! /bin/bash

pacman -Sy grub reflector tor lynx git python3 zsh wget curl exa highlight xorg-xrandr xorg-server xorg-xinit terminator i3 numlockx lightdm lightdm-gtk-greeter

echo wot > /etc/hostname

# Install stuff
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /usr/bin/ncat
cd /root && git clone https://github.com/Datalux/Osintgram.git && git clone https://github.com/twintproject/twint.git && git clone https://github.com/ReFirmLabs/binwalk.git
cd /root/twint && pip3 install . -r requirements.txt
cd /root/binwalk && python3 setup.py install
wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/zshrc -O /root/.zshrc
wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/motd -O /etc/motd
wget https://raw.githubusercontent.com/lockness-Ko/wot/main/tools/hosts -O /etc/hosts

# Setup tor and torctl
git clone https://github.com/BlackArch/torctl
cd torcctl
ln -sf /root/torctl/torctl /usr/bin/torctl
systemctl enable --now tor.service
systemctl stop tor.service
torctl start
torctl autostart
torctl autowipe

echo "Enter a strong password!"
passwd

reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --country AU
timedatectl set-timezone Australia/Sydney # CHANGE THIS
ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime
systemctl enable NetworkManager
systemctl enable dhcpcd

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo "Installation Complete!"
echo
echo "Type these commands outside of the chroot to reboot into wot:"
echo
echo "umount -R /mnt"
echo "reboot"
