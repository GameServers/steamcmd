FROM ubuntu:14.04

MAINTAINER Jason Rivers <docker@jasonrivers.co.uk

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update                      &&      \
    apt-get install -y                          \
        curl                                    \
        lib32gcc1

RUN useradd                             \
        -d /home/steamsrv               \
        -m                              \
        -s /bin/bash                    \
        steamsrv

USER steamsrv
# Download and extract SteamCMD
RUN mkdir -p /home/steamsrv/steamcmd            &&\
    cd /home/steamsrv/steamcmd                          &&\
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

WORKDIR /home/steamsrv

RUN /home/steamsrv/steamcmd/steamcmd.sh +login anonymous +quit

