#!/bin/bash


DOCKER_IP=`ip addr show eth0 | grep -m 1 "inet" | awk '{print $2}' | awk -F '/' '{print $1}'`

mkdir -p $WAL_DIRECTORY

exec /usr/bin/beanstalkd -V -l $DOCKER_IP -p 11300 -b $WAL_DIRECTORY
