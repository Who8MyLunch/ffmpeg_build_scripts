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
if [ -d "$PATH_PROJECT/$NAME_PACKAGE" ]; then
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


#
# Note: CMake will cache its settings in the file CMakeCache.txt. Clobber that file if it 
# looks like changing settings has no ipact.

# Note: Disable shared & enable static by setting option in CMakeLists.txt from ON to OFF.
#
cmake -DCMAKE_INSTALL_PREFIX:PATH="$PATH_BUILD"

make
make install
make clean
