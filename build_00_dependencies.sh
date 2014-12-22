#!/bin/bash

# Not really building stuff.  Just making sure system dependencies are in place.

# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#GettheDependencies

sudo apt-get update

sudo apt-get -y install autoconf automake build-essential pkg-config libtool \
    libfreetype6-dev libgpac-dev libass-dev zlib1g-dev texi2html \
    libtheora-dev libvorbis-dev 

    # libx11-dev libsdl1.2-dev libva-dev libvdpau-dev libxext-dev libxfixes-dev

# Server users can omit the ffplay and x11 dependencies: 
# libsdl1.2-dev libva-dev libvdpau-dev
# libx11-dev libxext-dev libxfixes-dev

