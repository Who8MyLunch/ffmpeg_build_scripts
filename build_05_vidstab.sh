#!/bin/bash

# See instructions on these pages
# http://yasm.tortall.net/Download.html
# http://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

NAME_PACKAGE="vid.stab"

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

    git clone https://github.com/georgmartius/vid.stab

    cd $NAME_PACKAGE
fi

#################################################

# IMPORTANT:
# Disable shared & enable static by setting BUILD_SHARED_LIBS to OFF.
# Simplest to make this change at command line settings below, but can also make this
# change in CMakeList.txt in the source folder.
# http://stackoverflow.com/questions/18435516/how-to-set-a-cmake-option-at-command-line
# Note: CMake will cache its settings in the file CMakeCache.txt. Clobber that file if it
# looks like changing settings has no impact.

cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX:PATH="$PATH_BUILD"

make
make install
make clean
