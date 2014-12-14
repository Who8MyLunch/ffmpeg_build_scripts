#!/bin/bash

# See instructions from this page.
# http://askubuntu.com/questions/405244/deshaking-videos-using-script

PATH_BUILD="$HOME/Projects/ffmpeg/ffmpeg_build"

PATH="$PATH_BUILD/bin:$PATH"

PKG_CONFIG_PATH="$PATH_BUILD/lib/pkgconfig"

#####################3

cd ffmpeg_sources/vid.stab

cmake -DCMAKE_INSTALL_PREFIX:PATH=~/ffmpeg_build

make
make install
