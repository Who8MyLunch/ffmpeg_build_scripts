#!/bin/bash

# See instructions on this page
# http://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

PATH_BUILD="$HOME/Projects/ffmpeg/ffmpeg_build"

PATH="$PATH_BUILD/bin:$PATH"
PKG_CONFIG_PATH="$PATH_BUILD/lib/pkgconfig"


cd ffmpeg_source/ffmpeg


./configure \
  --prefix="$PATH_BUILD" \
  --extra-cflags="-I$PATH_BUILD/include" \
  --extra-ldflags="-L$PATH_BUILD/lib" \
  --enable-gpl \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree \
  --enable-libvidstab 
  # --bindir="$HOME/bin" \
  # --enable-libass \
  # --enable-x11grab

make
make install
make distclean
hash -r
