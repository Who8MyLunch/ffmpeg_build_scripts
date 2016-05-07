ffmpeg_build_scripts
====================

This is a collection of shell scripts I am using to manage the building of a custom ffmpeg package.
This all started when I wanted to use the vid.stab module for video stabilization.  It's
relatively new and required a number of manual steps to make it work.

I found the following links very useful.  The first link below shows how to manually compile ffmpeg
with support for vid.stab, the others were helpful for other reasons:
- http://askubuntu.com/questions/405244/deshaking-videos-using-script
- https://trac.ffmpeg.org/wiki/CompilationGuide/Generic
- https://ffmpeg.org/trac/ffmpeg/wiki/CompilationGuide
- http://wiki.webmproject.org/ffmpeg/building-with-libvpx
- http://stackoverflow.com/questions/8902698/linux-configure-make-prefix

These scripts are *not* fully automatic.  Sub-folders may need to be created by hand.  Some parts
of the scripts may need to uncommented to enable certain features.
