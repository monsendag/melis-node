FROM cellofellow/rpi-arch

MAINTAINER Dag Einar Monsen "me@dag.im"

# add qemu static binary (for executing on x86)
ADD vendor/qemu/qemu-arm-static /usr/bin/

# install python and pip
RUN pacman -S python python-pip

# create build dir
RUN mkdir -p /tmp/build 

# add application to build dir
ADD app /tmp/build/

WORKDIR /tmp/build 

# install dependencies
RUN cd /app && pip install -r requirements.txt

# package app to stdout
CMD tar -czf - /app
