# Tor Browser - Docker Project #

The purpose of this project is to provide an ephemeral image for anonymous web
browsing.

# Build from Dockerfile #

```
git clone https://github.com/dbravender/docker-torbrowser.git
docker build -t torbrowser .
```

## Building a .desktop file to use in desktop environments ###

    ./make-desktop-launcher

## Start Script ##

*Use the start script provided in this repository to start a browser*

    ./start

Pressing CTRL+C or closing the browser window will stop the container.
