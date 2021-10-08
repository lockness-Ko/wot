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

# Setup lynx alias
RUN wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /usr/bin/ncat

# Final setup stuff!
RUN ln -s /dev/null /root/.wget-hsts
RUN wget https://raw.githubusercontent.com/lockness-Ko/wot/main/bashrc -O /root/.bashrc
RUN wget https://raw.githubusercontent.com/lockness-Ko/wot/main/motd -O /etc/motd

# Run bash with proxychains for anonymity ;)
CMD ["/usr/bin/proxychains", "/bin/bash"]
