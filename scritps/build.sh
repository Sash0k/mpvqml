#sfdk tools clone AuroraOS-5.1.2.10-base-aarch64 AuroraOS-5.1.2.10-base-aarch64.mpv
mypath=`pwd`
sfdk="sfdk"
target="AuroraOS-5.1.2.10-base-aarch64.mpv"
sfdk config --push target $target
#sfdk  tools exec $target zypper --help
sfdk  tools exec $target zypper -n install bzip2-devel expat-devel fontconfig-devel fribidi-devel graphite2-devel harfbuzz-devel libogg-devel libpng-devel libtheora-devel libvorbis-devel libvpx-devel libwebp-devel libxkbcommon-devel openjpeg-devel opus-devel speex-devel pulseaudio-devel SDL2-devel libopenssl-devel ccache gcc wayland-egl-devel wayland-protocols-devel libdrm-devel freetype-devel pcre-static zlib-static
sfdk  tools exec $target  rpm -ihv $mypath/graphite2-devel-static-1.3.14-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/fontconfig-devel-static-2.13.96-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/fribidi-devel-static-1.0.12-1.aarch64.rpm
#sfdk  tools exec $target  rpm -ihv $mypath/harfbuzz-8.1.1-1.aarch64.rpm
#sfdk  tools exec $target  rpm -ihv $mypath/harfbuzz-devel-8.1.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/harfbuzz-devel-static-8.1.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libass-0.17.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libass-devel-0.17.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libass-devel-static-0.17.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libogg-devel-static-1.3.5-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libpng-devel-static-1.6.40-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libvorbis-devel-static-1.3.7-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libtheora-devel-static-1.2.0-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libvpx-devel-static-1.14.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/opus-devel-static-1.5.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libwebp-devel-static-1.2.0-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/liblua-5.1.5-6.aarch64.rpm --force
sfdk  tools exec $target  rpm -ihv $mypath/lua-5.1.5-6.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/lua-devel-5.1.5-6.aarch64.rpm 
sfdk  tools exec $target  rpm -ihv $mypath/lua-static-5.1.5-6.aarch64.rpm 
sfdk  tools exec $target  rpm -ihv $mypath/openjpeg-devel-static-2.5.0-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/speex-devel-static-1.2.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/ffmpeg-5.1.6-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/ffmpeg-devel-5.1.6-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/ffmpeg-devel-static-5.1.6-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/expat-devel-static-2.6.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libxkbcommon-devel-static-1.3.1-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/libdrm-devel-static-2.4.122-1.aarch64.rpm
sfdk  tools exec $target  rpm -ihv $mypath/freetype-devel-static-2.13.1-1.aarch64.rpm
#sfdk  tools exec $target  rpm -ihv $mypath/org.meecast.mpv-libs-static-0.35.1-2+sdl.aarch64.rpm


