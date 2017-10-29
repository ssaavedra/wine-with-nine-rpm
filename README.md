# Compiling Wine

## Prerequisists
Install the following devel packages:
```bash
$ sudo dnf install -y bison flex autoconf desktop-file-utils alsa-lib-devel audiofile-devel freeglut-devel lcms2-devel libieee1284-devel libjpeg-devel libpng-devel librsvg2 librsvg2-devel libstdc++-devel libusb-devel libxml2-devel libxslt-devel ncurses-devel ocl-icd-devel opencl-headers openldap-devel perl-generators unixODBC-devel sane-backends-devel systemd-devel zlib-devel fontforge freetype-devel libgphoto2-devel isdn4k-utils-devel libpcap-devel libX11-devel mesa-libGL-devel mesa-libGLU-devel mesa-libOSMesa-devel libXxf86dga-devel libXxf86vm-devel libXrandr-devel libXrender-devel libXext-devel libXinerama-devel libXcomposite-devel fontconfig-devel giflib-devel cups-devel libXmu-devel libXi-devel libXcursor-devel dbus-devel gnutls-devel pulseaudio-libs-devel gsm-devel libv4l-devel fontpackages-devel libtiff-devel gettext-devel chrpath gstreamer1-devel gstreamer1-plugins-base-devel mpg123-devel gtk3-devel libattr-devel libva-devel openal-soft-devel icoutils
```

## Build
Run the included make file:
```bash
$ make rpm
```

## Install
```bash
$ sudo make install
```
