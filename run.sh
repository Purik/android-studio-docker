#!/usr/bin/env bash
adb kill-server
docker run -it --net=host --env="DISPLAY" \
  --privileged -v /dev/bus/usb:/dev/bus/usb \
  -v /tmp/.X11-unix:/tmp/.X11-unix -v "$HOME/.Xauthority:/root/.Xauthority:rw" \
  -v "$HOME/Android/Sdk:/root/Android/Sdk" -v "$HOME/.AndroidStudio3.4:/root/.AndroidStudio3.4" \
  -v "$HOME/workspace/src:/root/src" \
   purik/android-studio:latest \
   /opt/android-studio/bin/studio.sh
