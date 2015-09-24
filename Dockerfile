FROM ubuntu:latest

RUN apt-get update && echo "not stale 1"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y xz-utils firefox

# Set locale (fix the locale warnings)
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

# Copy the files into the container
# bug in docker messes up permissions of directories unless you do this first
ADD . /home/docker

ADD https://www.torproject.org/dist/torbrowser/5.0.3/tor-browser-linux64-5.0.3_en-US.tar.xz /home/docker/tor.tar.xz

RUN useradd -m -d /home/docker docker

RUN cd /home/docker && tar xJf /home/docker/tor.tar.xz 

USER docker

CMD ["/home/docker/tor-browser_en-US/Browser/start-tor-browser"]
