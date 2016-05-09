#!/bin/bash

# Not really building stuff.  Just making sure system dependencies are in place.

# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#GettheDependencies

apt-get update

apt-get -y --force-yes install autoconf automake build-essential libass-dev \
    libfreetype6-dev libtheora-dev libtool libvorbis-dev pkg-config texinfo \
    zlib1g-dev cmake

# Note: Server users can omit the ffplay and x11grab dependencies:
#   libsdl1.2-dev libva-dev libvdpau-dev
#   libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev.

# Install these components instead of compiling from source
apt-get -y install libmp3lame-dev libopus-dev
