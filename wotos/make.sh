#! /bin/bash

pacman -Syy squashfs-tools dosfstools mtools arch-install-scripts
./mkarchiso -v -w ~/wdir -o ~/odir ~/profile
