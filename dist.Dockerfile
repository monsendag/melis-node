FROM cellofellow/rpi-arch

MAINTAINER Dag Einar Monsen "me@dag.im"

# install python
RUN pacman -S python

# add qemu static binary (for executing on x86)
ADD vendor/qemu/qemu-arm-static /usr/bin/

# add ffmpeg (compiled for rpi)
ADD vendor/ffmpeg/ffmpeg-arm-static /usr/bin/ffmpeg

# add psips
ADD vendor/psips/psips /usr/bin/

# add raspberry pi firmware libraries
ADD vendor/opt/ /opt/

# add library reference to ldconfig
ADD vendor/etc/ld.so.conf.d/00-raspberrypi-firmware.conf /etc/ld.so.conf.d/

# register mmal library with ldd
RUN ldconfig

ADD build.tar.gz /app/

# export rest port
EXPOSE 5000

# start video server
ENTRYPOINT /app/server.py
