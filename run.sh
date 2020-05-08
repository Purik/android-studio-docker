#!/usr/bin/env bash
docker run -it --net=host --env="DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix -v="$HOME/.Xauthority:/root/.Xauthority:rw" purik/android-studio:latest /android-studio/bin/studio.sh
