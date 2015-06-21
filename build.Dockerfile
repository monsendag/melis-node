FROM cellofellow/rpi-arch

MAINTAINER Dag Einar Monsen "me@dag.im"

# add qemu static binary (for executing on x86)
ADD vendor/qemu/qemu-arm-static /usr/bin/

# update pacman repos
RUN pacman --noconfirm -Sy

# install python and pip
RUN pacman --noconfirm -S python python-pip

# create build dir
RUN mkdir -p /tmp/build 


# add application to build dir
ADD melis /tmp/build/melis

WORKDIR /tmp/build/melis

ENV PYTHONUSERBASE /tmp/build/melis/.pip

RUN pip install --user -r requirements.txt

# package app to stdout
CMD tar -czf - -C /tmp/build melis
