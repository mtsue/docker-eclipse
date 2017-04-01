#!/bin/bash

sudo docker run -it --rm \
  --net="host" \
  -e DISPLAY \
  --volume $HOME/.Xauthority:/home/eclipser/.Xauthority \
  --volume $(cd $(dirname $0) && pwd)/workspace:/home/eclipser/workspace \
  docker-eclipse
