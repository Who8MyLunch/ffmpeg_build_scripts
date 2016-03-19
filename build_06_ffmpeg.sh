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
if [ -d "$PATH_PROJECT/$NAME_PACKAGE" ]; then
    # already exists
    cd $NAME_PACKAGE

    # uncomment this to update repository
    # git pull
else
    # Does not exist.  Clone the repo.
    # http://wiki.webmproject.org/ffmpeg/building-with-libvpx

    # git clone git://source.ffmpeg.org/ffmpeg.git

    cd $NAME_PACKAGE
fi

#################################################

# https://trac.ffmpeg.org/wiki/CompilationGuide/Generic#LD_LIBRARY_PATHandldconfig
# http://ffmpegmac.net/HowTo/


./configure \
  --prefix="$PATH_BUILD" \
  --bindir="$PATH_BIN" \
  --enable-gpl \
  --enable-nonfree \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libvidstab \
  --enable-static \
  --disable-shared
  # --enable-runtime-cpudetect \
  # --arch=x86_64
  # --enable-libfdk-aac
  # --enable-libfaac \
  # --extra-cflags="-I$PATH_BUILD/include" \
  # --extra-ldflags="-L$PATH_BUILD/lib" \
  # --enable-libass \
  # --enable-x11grab

make
make install
make distclean
hash -r
