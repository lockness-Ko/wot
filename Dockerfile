FROM ubuntu:21.04

# Install packages
RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt install -yq proxychains
RUN apt install wget -y
ADD ./tools/proxychains.conf /etc/proxychains.conf
RUN apt install curl -y
RUN DEBIAN_FRONTEND=noninteractive apt install lynx -y
RUN apt install -y netcat-openbsd
RUN DEBIAN_FRONTEND=noninteractive apt install nano -y
RUN DEBIAN_FRONTEND=noninteractive apt install vim -y
RUN DEBIAN_FRONTEND=noninteractive apt install git -y
RUN DEBIAN_FRONTEND=noninteractive apt install python3 -y
RUN DEBIAN_FRONTEND=noninteractive apt install python3-pip -y
RUN DEBIAN_FRONTEND=noninteractive apt install python-is-python3 -y

# Setup lynx alias
RUN wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /usr/bin/ncat

# browsh doest not work currently!

# Install useful OSINT github repositories
RUN cd /root && git clone https://github.com/Datalux/Osintgram.git
RUN cd /root && git clone https://github.com/twintproject/twint.git && cd twint && pip3 install . -r requirements.txt
RUN cd /root && git clone https://github.com/ReFirmLabs/binwalk.git && cd binwalk && python3 setup.py install
# RUN cd /root && git clone https://github.com/VirusTotal/vt-cli && cd vt-cli && make install

# Docker in docker!
RUN DEBIAN_FRONTEND=noninteractive apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# not sure if i need to specify DEBIAN_FRONTEND=noninteractive here, just doing it coz i can
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN DEBIAN_FRONTEND=noninteractive apt update
RUN DEBIAN_FRONTEND=noninteractive apt install docker-ce -y

# This is a cool hosts file (blocks ads and other stuff) and other cool files
ADD ./tools/hosts /etc/hosts
ADD ./tools/bashrc /root/.bashrc
ADD ./tools/motd /etc/motd

RUN echo "#! /bin/bash" > /bin/pbash
RUN echo "/usr/bin/proxychains /bin/bash -i" >> /bin/pbash
RUN chmod +x /bin/pbash

# Run bash with proxychains for anonymity ;)
CMD ["/bin/pbash"]
