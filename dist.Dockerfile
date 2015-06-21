FROM cellofellow/rpi-arch

MAINTAINER Dag Einar Monsen "me@dag.im"

# add qemu static binary (for executing on x86)
ADD vendor/qemu/qemu-arm-static /usr/bin/

# install python
RUN pacman --noconfirm -Sy

# install python
RUN pacman --noconfirm -S python

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

ADD build.tar.gz /

ENV PYTHONPATH /melis/.pip/lib/python3.4/site-packages

# export rest port
EXPOSE 5000

# start video server
ENTRYPOINT /melis/server.py

