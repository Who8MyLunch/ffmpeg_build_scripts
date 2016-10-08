#!/bin/bash

# See instructions on these pages
# http://yasm.tortall.net/Download.html
# http://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

NAME_PACKAGE="fdk-aac"

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
    git clone git://github.com/mstorsjo/fdk-aac

    cd $NAME_PACKAGE
fi

#################################################

# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#libx264

autoreconf -fiv

./configure --prefix="$PATH_BUILD" --enable-static --disable-shared

make
make install
make distclean


# If you ever happen to want to link against installed libraries
# in a given directory, LIBDIR, you must either use libtool, and
# specify the full pathname of the library, or use the `-LLIBDIR'
# flag during linking and do at least one of the following:
#    - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
#      during execution
#    - add LIBDIR to the `LD_RUN_PATH' environment variable
#      during linking
#    - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
#    - have your system administrator add LIBDIR to `/etc/ld.so.conf'
