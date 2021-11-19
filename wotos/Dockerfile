FROM archlinux/archlinux:latest

RUN pacman -Syy --noconfirm nano git sudo

RUN useradd deez
RUN echo "deez    ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers
WORKDIR /root

RUN git clone https://gitlab.archlinux.org/archlinux/archiso.git
RUN pacman -S --noconfirm squashfs-tools dosfstools mtools arch-install-scripts xorriso
RUN mkdir /root/wdir
RUN mkdir /root/profile
RUN mkdir /root/odir

CMD ["sudo","-u","deez","bash"]
