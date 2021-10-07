FROM ubuntu:21.04

# Install packages
RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt install -yq proxychains
RUN apt install wget -y
RUN wget https://raw.githubusercontent.com/lockness-Ko/wot/main/proxychains.conf -O /etc/proxychains.conf
RUN apt install curl -y
RUN DEBIAN_FRONTEND=noninteractive apt install lynx -y
RUN apt install -y netcat-openbsd

# Setup lynx alias
RUN wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat -O /usr/bin/ncat
RUN echo "alias lynx=\"lynx -anonymous -noredir -nolog -restrictions=exec,bookmark_exec,change_exec_perms,exec_frozen,shell,useragent -useragent='wot' -homepage=https://lite.duckduckgo.com/lite https://check.torproject.org/\"" >> /root/.bashrc

#################################################
## THIS DOES NOT WORK! (yet) due to the fact that it requires low-level kernel modules that are not available
# Encrypted disk setup
#RUN DEBIAN_FRONTEND=noninteractive apt install cryptsetup
#RUN dd if=/dev/random of=/opt/disk bs=1M count=2048
#RUN echo -n "wot" | cryptsetup -y luksFormat /opt/disk -
#################################################

# Run bash with proxychains for anonymity ;)
CMD ["/usr/bin/proxychains", "/bin/bash"]
