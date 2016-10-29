# alpine-more

Alpine Linux image + utils + dropbear ssh server. I mainly created this so I could run fdupes on my Synology NAS. I run the docker container on my nas and ssh to the port 32768 to connect. 

Adds the following binaries to the default alpine:latest image:
    bash
    ncdu
    nano
    dropbear
    mc
    python3
    pip
    git
    fdupes:1.6.1

Using the default Dockerfile, you will get a sshd server running on port 32768.

Usage (non-synology):
docker run -p 32768:32768 -d seals/alpine-more

Docker Hub link: https://hub.docker.com/r/seals/alpine-more/
