#!/bin/bash

# See instructions on these pages
# http://yasm.tortall.net/Download.html
# http://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

NAME_PACKAGE="libvpx"

PATH_PROJECT="$HOME/Projects/ffmpeg"

#################################################


PATH_SOURCES="$PATH_PROJECT/sources"
PATH_BUILD="$PATH_PROJECT/build"

PATH_BIN="$HOME/bin"

export PKG_CONFIG_PATH="$PATH_BUILD/lib/pkgconfig"
export PATH="$PATH_BIN:$PATH"

#################################################


cd $PATH_SOURCES

# Package folder.
if [ -d "$PATH_SOURCES/$NAME_PACKAGE" ]; then
    # already exists
    cd $NAME_PACKAGE

    # uncomment this to update repository
    git pull
else
    # Does not exist.  Clone the repo.
    # http://wiki.webmproject.org/ffmpeg/building-with-libvpx
    git clone https://chromium.googlesource.com/webm/libvpx

    cd $NAME_PACKAGE
fi

#################################################

# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#libvpx
# http://wiki.webmproject.org/ffmpeg/building-with-libvpx

./configure --prefix="$PATH_BUILD" --disable-examples --disable-unit-tests \
            --enable-runtime-cpu-detect

make
make install
make distclean
