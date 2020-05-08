# Android Studio 3.6 preinstalled in Docker image with GUI support

[![N|Solid](https://www.docker.com/sites/default/files/vertical_large.png)](https://hub.docker.com/r/purik/android-studio/)

My personal image that I use for my CI server for android projects. 
Typical usage:
  - Build image by  ```docker build ... ``` command or get ready image ```docker pull purik/android-studio:latest``` from my public repo (https://hub.docker.com/r/purik/android-studio/)
  - Customize container with studio for any specific project by installing necessary build tools, accepting licenses agreements, etc  throug GUI by X11 that preinstalled in base image
  - Use customized container as image for your personal configurations by ```docker commit```
  
### Probability work process (I use this one)
I have CI server with installed docker engine for running containers for separate builders with diffirent configurations. It is comfortable for me localize dependencies inside container, resolving much problems as libraries dependencies, current software configurations for specific build runners, moreover, docker based approach allow me follow modern concept "Infrastructure as application", so different infrastructure configurations have becamed separate projects inside my code. 
  
You have to run Android Studio as GUI application when it is necessity to install new build tools, new SDK version, etc. I have spent much time for proxying X11 protocol stream from docker container through host machine to my local XWindow server, running on my home laptop. 

### My environment: Windows OS + XMing as X11 server application. 
- Establish ssh connection to my CI server with x11 forwarding. I typically use Putty with option Connection/SSH/X11/"Enable X11 forwarding" checkbox checked on.
- Run container by calling ```run.sh``` (you can find this script beside Dockerfile in repo)
- Enjoy 

### Persist data and volumes
If you wish prepare Docker image once and reuse it multiple times later, follow next steps:
 - Run container by calling ```run.sh``` (you can find this script beside Dockerfile in repo)
 - Close docker container
 - Run ```docker ps -a``` to detect stopped android-studio docker container, for exampple you have detected container has id ```xxx```
 - Build image from stopped container as described [here](https://docs.docker.com/engine/reference/commandline/commit/), example: ```docker commit xxx my_studio_image_name``` 
