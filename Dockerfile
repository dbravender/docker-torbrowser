FROM ubuntu:latest

RUN apt-get update && echo "not stale 3"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y xz-utils firefox

# Set locale (fix the locale warnings)
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

# Copy the files into the container
# bug in docker messes up permissions of directories unless you do this first
ADD . /home/docker

ENV TOR_BROWSER_VERSION 6.0.8

ADD https://www.torproject.org/dist/torbrowser/$TOR_BROWSER_VERSION/tor-browser-linux64-${TOR_BROWSER_VERSION}_en-US.tar.xz /home/docker/tor.tar.xz

RUN useradd -m -d /home/docker docker

RUN cd /home/docker && tar xJf /home/docker/tor.tar.xz

USER docker

CMD ["/home/docker/tor-browser_en-US/Browser/start-tor-browser"]
