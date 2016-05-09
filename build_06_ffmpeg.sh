#!/bin/bash

# See instructions on these pages
# http://yasm.tortall.net/Download.html
# http://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

NAME_PACKAGE="ffmpeg"

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

    git clone git://source.ffmpeg.org/ffmpeg.git

    cd $NAME_PACKAGE
fi

#################################################

# https://trac.ffmpeg.org/wiki/CompilationGuide/Generic#LD_LIBRARY_PATHandldconfig
# http://ffmpegmac.net/HowTo/

./configure \
  --prefix="$PATH_BUILD" \
  --bindir="$PATH_BIN" \
  --pkg-config-flags="--static" \
  --enable-gpl \
  --enable-nonfree \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libfdk-aac \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libvidstab \
  --enable-static \
  --disable-shared

make
make install
make distclean
hash -r
