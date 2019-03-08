#!/bin/bash

docker volume rm $(docker volume ls) # Deletes all the volumes.
docker stop $(docker ps -aq)         # Stops all the containers.
docker rm $(docker ps -aq)           # Deletes all the containers.

if [ $# -eq 0 ] ; then
  echo 'No arguments supplied. Skipping images destroy...'
else
  if [ $1 == "--destroy-images" ] ; then
    echo 'Destroying all images...'
    docker rmi -f $(docker images -q)  # Deletes all the images.
  else
    echo 'Argument supplied different than "--destroy-images". Skipping it...'
  fi
fi
