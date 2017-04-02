#!/bin/bash

sudo docker run -it --rm \
  --env DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume $(cd $(dirname $0) && pwd)/workspace:/home/eclipser/workspace \
  docker-eclipse
