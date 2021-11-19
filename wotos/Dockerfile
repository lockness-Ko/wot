FROM archlinux/archlinux:latest

RUN pacman -Syy --noconfirm nano git sudo

RUN useradd deez
RUN echo "deez    ALL=(ALL:ALL) NOPASSWD: ALL"

CMD ["sudo","-u","deez","bash"]
