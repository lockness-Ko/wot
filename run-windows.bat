# Windows version :)

# Run the container on the host network to be able to connect to the locally running tor proxy
docker run --rm --net host -it ghcr.io/lockness-ko/wot:coffee
# Using the --rm flag to remove the container once you exit