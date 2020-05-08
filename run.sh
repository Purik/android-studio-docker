#!/usr/bin/env bash

DST_IMAGE=$1

if [ -z ${DST_IMAGE} ]; then echo "Destination image should be specified. Example: $0 myrepo/android-studio:x" && exit; else echo "Destination image: $DST_IMAGE"; fi

# clean old containers
docker rm android_studio_container > /dev/null || echo ''

# Run Android-Studio with empty configurations
docker run -it --name=android_studio_container --net=host --env="DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix -v="$HOME/.Xauthority:/root/.Xauthority:rw" purik/android-studio:latest /android-studio/bin/studio.sh ; \
  docker commit android_studio_container $DST_IMAGE
