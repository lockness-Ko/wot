# set alpine as the base image of the Dockerfile
FROM alpine:latest

# update the package repository and install Tor
RUN apk update && apk add tor

# Copy over the torrc created above and set the owner to `tor`
COPY torrc /etc/tor/torrc
RUN chown -R tor /etc/tor

# Set `tor` as the default user during the container runtime
USER tor

# Set `tor` as the entrypoint for the image
ENTRYPOINT ["tor"]

# Set the default container command
# This can be overridden later when running a container
CMD ["-f", "/etc/tor/torrc"]