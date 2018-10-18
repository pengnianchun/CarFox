#!/bin/bash

cd demo

qmake && make -j`nproc` && make clean
qmake && make -j`nproc` && make distclean

source /opt/davy/1.0/environment-setup-cortexa9hf-vfp-neon-davy-linux-gnueabi
qmake && make -j`nproc` && make clean
qmake && make -j`nproc` && make distclean
