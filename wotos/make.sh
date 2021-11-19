#! /bin/bash

pacman -Syy squashfs-tools dosfstools mtools arch-install-scripts xorriso
./mkarchiso -v -w ~/wdir -o ~/odir ~/profile
