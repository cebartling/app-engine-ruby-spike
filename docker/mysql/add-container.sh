#!/bin/sh

COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_OFF='\033[0m'

CONTAINER_NAME='app_engine_ruby_spike_mysql'
IMAGE_NAME='cebartling/app_engine_ruby_spike_mysql'
MAPPED_PORT=53307


printf "\n${COLOR_LIGHT_GREEN}=====> Creating the Docker container: '$CONTAINER_NAME' from image: '$IMAGE_NAME'...${COLOR_OFF}\n"

docker create -p $MAPPED_PORT:3306 -P --name $CONTAINER_NAME $IMAGE_NAME

printf "\n${COLOR_LIGHT_GREEN}=====> Docker container '$CONTAINER_NAME' listening on port $MAPPED_PORT.${COLOR_OFF}\n"
