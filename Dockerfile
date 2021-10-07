FROM ubuntu:21.04
RUN apt install proxychains
RUN wget https:// -O /etc/proxychains.conf
RUN proxychains bash
CMD ["/bin/bash", "-i"]
