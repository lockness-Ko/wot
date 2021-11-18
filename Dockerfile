FROM archlinux:latest

# Install packages
RUN pacman -Syyuu --noconfirm
RUN ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime
RUN pacman -S proxychains-ng make wget curl lynx openbsd-netcat nano vi git python3 python-pip zsh exa highlight --noconfirm
WORKDIR /root
ADD ./tools/proxychains.conf /etc/proxychains.conf

# Setup lynx alias
RUN wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /usr/bin/ncat && chmod +x /usr/bin/ncat

# browsh doest not work currently!

# Install useful OSINT github repositories
# RUN git clone https://github.com/Datalux/Osintgram.git
RUN git clone https://github.com/twintproject/twint.git && cd /root/twint && pip3 install . -r requirements.txt
RUN git clone https://github.com/ReFirmLabs/binwalk.git && cd /root/binwalk && python3 setup.py install
# RUN cd /root && git clone https://github.com/VirusTotal/vt-cli && cd vt-cli && make install
# RUN cd /root && git clone https://github.com/radareorg/radare2 && cd radare2 && sys/install.sh

# This is a cool hosts file (blocks ads and other stuff) and other cool files
ADD ./tools/hosts /etc/hosts
ADD ./tools/zshrc /root/.zshrc
ADD ./tools/motd /etc/motd

RUN echo "#! /bin/bash" > /bin/pbash
RUN echo "/usr/bin/proxychains /bin/zsh" >> /bin/pbash
RUN chmod +x /bin/pbash

# Run bash with proxychains for anonymity ;)
CMD ["/bin/pbash"]

LABEL org.opencontainers.image.description Super cool, lightweight, latest donut version!
