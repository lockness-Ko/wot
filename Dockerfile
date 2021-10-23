FROM ubuntu:21.04

# Install packages
RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt install -yq proxychains
RUN apt install wget -y
RUN wget https://raw.githubusercontent.com/lockness-Ko/wot/main/proxychains.conf -O /etc/proxychains.conf
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

# Final setup stuff!
RUN wget https://raw.githubusercontent.com/lockness-Ko/wot/main/bashrc -O /root/.bashrc
RUN wget https://raw.githubusercontent.com/lockness-Ko/wot/main/motd -O /etc/motd

# Install useful OSINT github repositories
RUN cd /root && git clone https://github.com/Datalux/Osintgram.git
RUN cd /root && git clone https://github.com/twintproject/twint.git && cd twint && pip3 install . -r requirements.txt
RUN cd /root && git clone https://github.com/ReFirmLabs/binwalk.git && cd binwalk && python3 setup.py install

RUN echo "#! /bin/bash" > /bin/pbash
RUN echo "/usr/bin/proxychains /bin/bash -i" >> /bin/pbash
RUN chmod +x /bin/pbash

# Run bash with proxychains for anonymity ;)
CMD ["/bin/pbash"]
