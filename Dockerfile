FROM ubuntu:17.10
LABEL maintainer="minikspb@gmail.com"

RUN dpkg --add-architecture i386
RUN apt-get update

# Download specific Android Studio bundle (all packages).
RUN apt-get install -y curl unzip

RUN curl 'https://dl.google.com/dl/android/studio/ide-zips/3.0.0.18/android-studio-ide-171.4408382-linux.zip' > /tmp/studio.zip && unzip -d /opt /tmp/studio.zip && rm /tmp/studio.zip

# Install X11
RUN apt-get install -y xorg


# Install other useful tools
RUN apt-get install -y vim ant

# install Java
RUN apt-get install -y default-jdk

# Install prerequisites
RUN apt-get install -y libz1 libncurses5 libbz2-1.0:i386 libstdc++6 libbz2-1.0 lib32stdc++6 lib32z1


# Clean up
RUN apt-get clean
RUN apt-get purge

