#!/bin/bash

docker volume rm $(docker volume ls) # Deletes all the volumes.
docker rmi -f $(docker images -q)    # Deletes all the images.
docker stop $(docker ps -aq)         # Stops all the containers.
docker rm $(docker ps -aq)           # Deletes all the containers.
