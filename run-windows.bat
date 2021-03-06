:: Windows version :)

:: Run the tor proxy using a simple tor docker container, to edit the settings edit the torrc file at wot/tor/torrc
::docker run --rm -dp 5090:5090 --name tor ghcr.io/lockness-ko/wottor:cookie

:: Run the container on the host network to be able to connect to the locally running tor proxy
::docker run --rm --net host -it ghcr.io/lockness-ko/wot:cheese
:: Using the --rm flag to remove the container once you exit

:: Run docker-compose (better way of running it)
docker-compose up -d

:: Spawn an tty into the wot container
docker-compose exec wot pbash

:: Stop and remove the containers
docker-compose down
docker-compose rm
