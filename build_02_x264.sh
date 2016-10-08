#!/bin/bash

# See instructions on these pages
# http://yasm.tortall.net/Download.html
# http://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

NAME_PACKAGE="x264"

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
    # http://www.videolan.org/developers/x264.html
    git clone git://git.videolan.org/x264.git

    cd $NAME_PACKAGE
fi

#################################################

# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#libx264

# ./autogen.sh --prefix="$PATH_BUILD" --bindir="$PATH_BIN"
./configure --prefix="$PATH_BUILD" --bindir="$PATH_BIN" --enable-static

make
make install
make distclean
