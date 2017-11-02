# Docker image with GUI with preinstalled Android Studio 3.0

[![N|Solid](https://www.docker.com/sites/default/files/vertical_large.png)](https://hub.docker.com/r/purik/android-studio/)

My personal image that I use im my CI server for android projects. 
Typical usage:
  - Build image by  ```docker build ... ``` command or get ready image ```docker pull purik/android-studio:latest``` from my public repo
  - Customize container with studio for any specific project by installing necessary build tools, accepting licenses agreements, etc  througs GUI by X11 that preinstalled in base image
  - Use customized container as image for your personal projects
