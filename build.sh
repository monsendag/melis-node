#!/bin/sh

docker build -t monsendag/melis-server-build -f build.Dockerfile . 
docker run monsendag/melis-server-build > build.tar.gz 
docker build -t monsendag/melis-server -f dist.Dockerfile .
