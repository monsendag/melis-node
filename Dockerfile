FROM sander85/rpi-busybox

MAINTAINER Dag Einar Monsen "me@dag.im"

# add qemu
ADD vendor/qemu/qemu-arm-static /usr/bin/

# add ffmpeg
add vendor/ffmpeg/ffmpeg-arm-static /usr/bin/ffmpeg

# add psips
ADD vendor/psips/psips /usr/bin/

# add raspberry pi firmware libraries
ADD vendor/opt/ /opt/

# add library reference to ldconfig
ADD vendor/etc/ld.so.conf.d/00-raspberrypi-firmware.conf /etc/ld.so.conf.d/

# register mmal library with ldd
RUN ldconfig

ADD vendor/python/python2.7-static /usr/bin/python

ADD app /app

# install picamera
RUN cd /app && pip install -r requirements.txt

# export rest port
EXPOSE 5000

# start video server
CMD /app/server.py
